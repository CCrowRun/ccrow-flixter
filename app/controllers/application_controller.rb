class ApplicationController < ActionController::Base

private
  def not_found
    render plain: "#{status.to_s.titleize} invalid ID", status: :not_found
  end
end
