class AddActivityCheerJeerScores < ActiveRecord::Migration
  def self.up
    add_column :votes, :total_cheers, :integer
    add_column :votes, :total_jeers, :integer
    add_column :votes, :total_activity, :integer
    
  end

  def self.down
    remove_column :votes, :total_cheers
    remove_column :votes, :total_jeers
    remove_column :votes, :total_activity
    
  end
end
