class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :string
      t.string :description
      t.string :text
      t.string :year_released
      t.string :integer

      t.timestamps
    end
  end
end
