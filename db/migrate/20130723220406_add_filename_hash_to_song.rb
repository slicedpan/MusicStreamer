class AddFilenameHashToSong < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.string :filename_hash
    end
  end
end
