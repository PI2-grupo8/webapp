require 'socket'
require 'timeout'
require 'net/ftp'

class SocketsController < ApplicationController

  def start
    begin
      settings = Settings.getInstance
      server = TCPSocket.open(settings.ip_address, settings.tcp_port)

      server.puts CMD_START
      render json: { message: "Comand START sent successfully" }, status: 200
    rescue
      render json: { message: "Error writing to TCP Server" }, status: 207
    end
  end

  def setup
    if ftp_server_available?
      if mount_conf_file(params)
        write_to_ftp_server
      else
        render json: { message: "Error mounting conf file" }, status: 207
      end
    else
      render json: { message: "FTP server not available" }, status: 207
    end
  end

  def sync_data
    if ftp_server_available?
      if get_csv_from_server
        render json: { message: "Data imported successfully" }, status: 200
      else
        render json: { message: "Error getting files from FTP Server" }, status: 207
      end
    else
      render json: { message: "FTP server not available" }, status: 207
    end
  end

  def conection_status
    if tcp_server_available?
      render json: { message: "Conected" }, status: 200
    else
      render json: { message: "Not Conected" }, status: 207
    end
  end

  ##########################################################################33
  private 

  def tcp_server_available?
    settings = Settings.getInstance
    ip = settings.ip_address
    port = settings.tcp_port
    is_tcp_port_open?(ip, port)
  end

  def ftp_server_available?
    settings = Settings.getInstance
    ip = settings.ip_address
    port = settings.ftp_port
    is_ftp_port_open?(ip, port)
  end

  def is_ftp_port_open?(ip, port)
    begin
      Timeout::timeout(1) do
        begin
          ftp = Net::FTP.new
          ftp.connect(ip, port)
          ftp.close
          return true
        rescue
          return false
        end
      end
    rescue Timeout::Error
    end

    return false
  end

  def is_tcp_port_open?(ip, port)
    begin
      Timeout::timeout(2) do
        begin
          s = TCPSocket.new(ip, port)
          s.close
          return true
        rescue
          return false
        end
      end
    rescue Timeout::Error
    end

    return false
  end

  def mount_conf_file(params)
    file_written = false
    begin
      file = File.open(CONF_FILE_PATH, "w+")
      file.write(params[:amount_of_rows]) 
      file.write(" ") 
      file.write(params[:measurements_distance]) 
      file.write(" ") 
      file.write(params[:amount_of_rows]) 
      file.write(" ") 
      file.write("A") 
      file.write(" ") 
      file.write("B") 
      p "$"*80,params
      file_written = true 
    rescue IOError => e
      #deu ruim
    ensure
      file.close unless file.nil?
    end
    return file_written
  end

  def get_csv_from_server
    settings = Settings.getInstance
    ip = settings.ip_address
    port = settings.ftp_port
    csv_files = []
    begin
      ftp = Net::FTP.new
      ftp.connect(ip, port)
      ftp.login
      ftp.chdir("/measurements")
      all_files = ftp.list
      all_files.each do |f|
        file_name = f.split.last
        csv_files << file_name
      end
      download_files(ftp, csv_files)
      import_data_from_csv
      return true
    rescue
      render json: { message: "Error connecting to FTP Server" }, status: 207
    end
  end

  def download_files(ftp_server, files)
    dest_dir = Rails.root.join('public/measurements/')
    files.each do |f|
      begin
        ftp_server.get(f, [dest_dir,f].join)
        ftp_server.delete(f)
      rescue
        render json: { message: "Error downloading #{f} from FTP Server" }, status: 207
      end
    end
  end

  def import_data_from_csv
    dir = Rails.root.join('public/measurements')
    dir.each_child.each do |entry|
     hash = {}
     hash[:started_at] = entry.basename.to_s.split(".").first.to_datetime
     entry.each_line do |l|
       line = l.split(',') 
       hash[:latitude] = line[0]
       hash[:longitude] = line[1]
       hash[:absolute_humidity] = line[3]
       hash[:air_humidity] = line[4]
       hash[:air_temperature] = line[5]
       p hash
       Measurement.create(hash)
     end
     entry.delete
    end
  end

  def write_to_ftp_server
    settings = Settings.getInstance
    ip = settings.ip_address
    port = settings.ftp_port
    begin
      ftp = Net::FTP.new
      ftp.connect(ip, port)
      ftp.login
      ftp.puttextfile(CONF_FILE_PATH, "settings.conf")
      render json: { message: "File written with success" }, status: 200
    rescue
      render json: { message: "Error connecting to FTP Server" }, status: 207
    end
  end
end
