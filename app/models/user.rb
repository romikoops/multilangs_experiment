class User < ActiveRecord::Base
  attr_accessible :locale, :session_id
end
