class AddScoringToStories < ActiveRecord::Migration
  def self.up
     add_column :stories, :votes, :integer
     add_column :stories, :score, :integer
  end

  def self.down
  end
end
