require 'find'
require 'mp3info'
require 'rails_config'

task :scan_music => :environment do
  Find.find(Settings.root_path) do |f|
    if f.match(/\.mp3\Z/)
      Mp3Info.open(f) do |mp3|
        orig = Song.where("path = ? OR (artist = ? AND title = ? AND album = ?)", f, mp3.tag.artist, mp3.tag.title, mp3.tag.album).first
        params = {:path => f, :artist => mp3.tag.artist, :title => mp3.tag.title, :album => mp3.tag.album}
        if orig.nil?
          song = Song.new(params)
          song.save 
        else
          orig.update(params)
          orig.save
        end
      end
    end
  end
end
