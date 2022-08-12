class RemoveFeeFromDoctor < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :fee, :decimal
  end
end
