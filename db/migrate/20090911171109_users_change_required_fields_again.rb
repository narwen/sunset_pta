class UsersChangeRequiredFieldsAgain < ActiveRecord::Migration
  def self.up
    change_column :users, :email, :string, :null => true
    change_column :users, :address, :string, :null => true
    change_column :users, :home_phone, :string, :null => true      , :default => nil
    change_column :users, :cell_phone, :string, :null => true      , :default => nil
  end

  def self.down
    change_column :users, :cell_phone, :string, :null => false    , :default => "cell phone"
    change_column :users, :home_phone, :string, :null => false    , :default => "home phone"
    change_column :users, :address, :string, :null => false
    change_column :users, :email, :string, :null => false
  end
end
