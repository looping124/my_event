class AddValidateToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :isvalidated, :boolean, default: nil
  end
end
