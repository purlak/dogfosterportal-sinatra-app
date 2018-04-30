class CreateTableDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.integer :age 
      t.string :breed
      t.string :adoption_status 
      t.integer :user_id
    end 
  end
end
