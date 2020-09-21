class CreateUserModel < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :api_key
      t.timestamps
    end
  end
end
