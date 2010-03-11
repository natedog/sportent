class StoryTag < ActiveRecord::Base
  belongs_to :story
  belongs_to :social_tag
end
