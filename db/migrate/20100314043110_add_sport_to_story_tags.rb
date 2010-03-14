class AddSportToStoryTags < ActiveRecord::Migration
  def self.up
    add_column :story_tags, :sport_id, :integer
  end

  def self.down
    remove_column :story_tags, :sport_id
  end
end
