class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, :access_token, :city
      t.float :latitude, :longitude
      t.text :friends_hash
      t.timestamps
    end
  end
end
