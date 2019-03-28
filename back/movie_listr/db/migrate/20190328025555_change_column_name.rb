class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :movies, :imdbid, :omdbid
  end
end
