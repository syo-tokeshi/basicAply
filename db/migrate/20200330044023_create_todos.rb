class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :date
      t.text :today
      t.text :tommorow
      t.text :week
      t.boolean :check,default:false
      t.integer :user_id

      t.timestamps
    end
  end
end
