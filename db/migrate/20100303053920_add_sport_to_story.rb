class AddSportToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :sport_id, :integer
  end

  def self.down
    remove_column :stories, :sport_id
  end
end
