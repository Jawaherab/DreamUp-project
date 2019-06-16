class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.string :post
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
