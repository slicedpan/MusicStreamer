json.array!(@songs) do |song|
  json.extract! song, :title, :artist, :album, :path, :length
  json.url song_url(song, format: :json)
end