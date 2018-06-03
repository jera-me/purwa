class AddSeriesIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :series_id, :string
  end
end
