class Sport < ActiveRecord::Base
    has_many :rssfeeds
    has_many :stories
    has_many :social_tags
end
