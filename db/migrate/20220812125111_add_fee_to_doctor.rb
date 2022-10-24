class AddFeeToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :fee, :integer
  end
end
