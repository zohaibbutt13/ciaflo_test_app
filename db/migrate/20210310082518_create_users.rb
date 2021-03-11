class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username,         blank: false
      t.string :email,            blank: false
      t.string :password,         blank: false

      t.timestamps
    end
  end
end
