class AddAggregateColumnsToSocial < ActiveRecord::Migration
  def self.up
    add_column :social_tags, :votes, :integer
    add_column :social_tags, :score, :integer
  end

  def self.down
    remove_column :social_tags, :votes
    remove_column :social_tags, :score
  end
end
