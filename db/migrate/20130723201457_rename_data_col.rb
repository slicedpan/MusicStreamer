class RenameDataCol < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :data, :json_data
    end
  end
end
