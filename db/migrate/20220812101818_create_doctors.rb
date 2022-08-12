class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.decimal :fee
      t.string :details
      t.string :image

      t.timestamps
    end
  end
end
