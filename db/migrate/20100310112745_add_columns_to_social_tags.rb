class AddColumnsToSocialTags < ActiveRecord::Migration
  def self.up
    add_column :social_tags, :sport_id, :integer
    add_column :social_tags, :name, :text
  end

  def self.down
    remove_column :social_tags, :sport_id
    remove_column :social_tags, :name
  end
end
