class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    
    create_table :users do |t|

      t.citext :first_name
      t.citext :last_name
      t.string :email
      t.string :cohort
      t.string :uid
      t.string :access_token

      t.timestamps
    end
  end
end
