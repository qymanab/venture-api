class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include GenreHelper
end
