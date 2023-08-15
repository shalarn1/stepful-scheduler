class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.references :role, polymorphic: true, index: {unique: true}, null: false

      t.timestamps
    end
  end
end
