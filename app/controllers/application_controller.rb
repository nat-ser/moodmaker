class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :views, "app/views"
  end
end
