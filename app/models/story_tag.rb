class StoryTag < ActiveRecord::Base
  has_many :stories
  has_many :social_tags
end
