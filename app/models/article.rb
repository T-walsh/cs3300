class Article < ActiveRecord::Base
    validates_presence_of :current_user
end