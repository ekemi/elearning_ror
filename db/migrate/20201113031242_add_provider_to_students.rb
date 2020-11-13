class AddProviderToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :provider, :string
  end
end
