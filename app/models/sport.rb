class Sport < ActiveRecord::Base
    has_many :rssfeeds
    has_many :stories
end
