class AddTokenUpdatedAt < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.datetime :token_updated_at
    end
  end
end
