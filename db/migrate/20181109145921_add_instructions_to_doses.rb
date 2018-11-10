class AddInstructionsToDoses < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :instructions, :text
  end
end
