class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :provider
      t.references :user
      # t.hstore :profile_data

      t.timestamps null: false
    end
  end
end
