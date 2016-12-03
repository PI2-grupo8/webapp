require 'socket'
require 'ftpd'
require 'tmpdir'

class SocketsController < ApplicationController

  def start
    begin
      server = TCPSocket.open( "localhost", 4000 )
      #server.puts
      server.close
      #responds with success codoe
    rescue
      #responds with error codoe
    end
  end

  def setup
    mount_conf_file
    write_to_ftp_server
  end


  def sync_data
  end

  def conection_status
  end

  #######
  private 


  def mount_conf_file
    begin
      if(params[:settings].present?
        file = File.open(ONF_FILE_PATH)
        file.write(params[:settings][:amount_of_rows]) 
      end
    rescue IOError => e
      #some error occur, dir not writable etc.
    ensure
      file.close unless file.nil?
    end
  end

  def write_to_ftp_server
  end

  def fetch_data
  end
end
