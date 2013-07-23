class AddTimestampsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.timestamp :token_created_at
    end
  end
end
