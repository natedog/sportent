class CreateStoryTags < ActiveRecord::Migration
  def self.up
    create_table :story_tags do |t|
      t.integer :story_id
      t.integer :social_tag_id
      t.integer :votes
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :story_tags
  end
end
