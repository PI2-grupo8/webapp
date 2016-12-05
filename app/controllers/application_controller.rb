class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  ActionController::Parameters.permit_all_parameters = true

  CMD_START       = 10
  CMD_CLOSE       = 11
  CMD_SYNC        = 20
  CMD_WRITE_CONF  = 30
  CMD_KILL        = 40
  FTP_SERVER_PORT = 5005
  CONF_FILE_PATH  = Rails.root.join('public', 'meansure.conf')

  def index
    render :file => 'index'
 end
end
