require 'socket'
require 'timeout'
require 'net/ftp'

class SocketsController < ApplicationController

  def start
    if tcp_server_available?
      begin 
        settings = Settings.getInstance
        server = TCPSocket.open(settings.ip_address, settings.tcp_port)
        #server = TCPSocket.open("10.0.3.93", 4000)

        server.puts CMD_START
        render json: { message: "Comand START sent successfully" }, status: 200
      rescue
        render json: { message: "Error writing to TCP Server" }, status: 207
      end
    else
      render json: { message: "TCP server not available" }, status: 207
    end
  end

  def setup
    if ftp_server_available?
      if mount_conf_file
        begin 
          write_to_ftp_server
          render json: { message: "File written with success" }, status: 200
        rescue
          render json: { message: "Error writing to FTP Server" }, status: 207
        end
      else
        render json: { message: "Error mounting conf file" }, status: 207
      end
    else
      render json: { message: "FTP server not available" }, status: 207
    end
  end

  def sync_data
  end

  def conection_status
    if tcp_server_available?
      render json: { message: "Conected" }, status: 200
    else
      render json: { message: "Not Conected" }, status: 207
    end
  end

  #######
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
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
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
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
          return false
        end
      end
    rescue Timeout::Error
    end

    return false
  end

  def mount_conf_file
    file_written = false
    begin
      if(params[:settings].present?)
        file = File.open(CONF_FILE_PATH, "w+")
        file.write(params[:settings][:amount_of_rows]) 
      end
        file_written = true 
    rescue IOError => e
      #some error occur, dir not writable etc.
    ensure
      file.close unless file.nil?
    end
    return file_written
  end

  def write_to_ftp_server
  end

  def fetch_data
  end
end
