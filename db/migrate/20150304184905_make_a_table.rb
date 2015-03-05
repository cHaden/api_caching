class MakeATable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.column :username, :string
      t.column :avatar_url, :string
      t.column :location, :string
      t.column :company_name, :string
      t.column :number_of_followers, :string
      t.column :number_following, :string
    end

    create_table :repositories do |t|
      t.column :name, :string
      t.column :url, :string
      t.column :forks_count, :integer
      t.column :stargazers_count, :integer
      t.column :updated_at, :date
      t.column :language, :string
      t.column :profile_id, :integer
    end
  end
end
