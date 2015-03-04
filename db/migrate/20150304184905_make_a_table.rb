class MakeATable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.column :username, :string
      t.column :avatar_url, :string
      t.column :location, :string
      t.column :company_name, :string
      t.column :number_of_followers, :string
      t.column :number_following, :string
      t.column :repository_list, :text
    end
  end
end
