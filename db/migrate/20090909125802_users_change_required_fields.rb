class UsersChangeRequiredFields < ActiveRecord::Migration
  def self.up
    User.all.each_with_index do |u, i|
      u.first_name.nil? && u.first_name = "first_name#{i}"
      u.last_name.nil? && u.last_name = "last_name#{i}"
      u.address.nil? && u.address = "address#{i}"      
      u.save
    end
    
    change_column :users, :email, :string
    change_column :users, :first_name, :string, :null => false
    change_column :users, :last_name, :string, :null => false
    change_column :users, :address, :string, :null => false
    add_column :users, :home_phone, :string, :null => false, :default => 'home phone'
    add_column :users, :cell_phone, :string, :null => false, :default => 'cell phone'
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
    change_column :users, :crypted_password, :string, :null => true
    change_column :users, :persistence_token, :string, :null => true
    change_column :users, :password_salt, :string, :null => true
  end

  def self.down
    change_column :users, :password_salt, :string, :null => false
    change_column :users, :persistence_token, :string, :null => false
    change_column :users, :crypted_password, :string, :null => false
    add_column :users, :zip, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    remove_column :users, :home_phone
    remove_column :users, :cell_phone
    change_column :users, :address, :string
    change_column :users, :last_name, :string
    change_column :users, :first_name, :string
    change_column :users, :email, :string, :null => false
  end
end
