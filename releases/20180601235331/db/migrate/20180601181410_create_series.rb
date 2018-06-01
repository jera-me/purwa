class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.string :title
      t.text :content
      t.string :description
      t.string :keywords
      t.string :tags
      t.string :image

      t.timestamps
    end
  end
end
