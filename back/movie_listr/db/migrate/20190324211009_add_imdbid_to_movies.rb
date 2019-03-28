class AddImdbidToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :imdbid, :string
  end
end
