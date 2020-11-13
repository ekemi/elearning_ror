class AddUiToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :ui, :string
  end
end
