class AddBlockCountToUser < ActiveRecord::Migration
  def change
  	add_column :users, :block_count, :integer, :default => 0
  	add_column :users, :alert_count, :integer, :default => 0
  	add_column :users, :nick_count, :integer, :default => 0
  end
end
