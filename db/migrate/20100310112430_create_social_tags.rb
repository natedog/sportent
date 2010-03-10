class CreateSocialTags < ActiveRecord::Migration
  def self.up
    create_table :social_tags do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :social_tags
  end
end
