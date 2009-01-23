class CreatePublisherRole < ActiveRecord::Migration
  def self.up
    if Role.create!(:role_name => 'Publisher', :description => 'Publishers are able to create and edit all pages.')
      puts "Publisher role created."
    end
  end
  def self.down
    Role.find_by_role_name('Publisher').destroy
  end
end