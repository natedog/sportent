class CreateRssfeeds < ActiveRecord::Migration
  def self.up
    create_table :rssfeeds do |t|
      t.string :url
      t.datetime :last_fetched
      t.string :frequnecy
      t.string :name
      t.integer :sport_id
      

      t.timestamps
    end
  end

  def self.down
    drop_table :rssfeeds
  end
end
