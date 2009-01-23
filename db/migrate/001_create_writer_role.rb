class CreateWriterRole < ActiveRecord::Migration
  def self.up
    if Role.create!(:role_name => 'Writer', :description => 'Writers are able to create Draft pages.')
      puts "Writer role created."
    end
  end
  def self.down
    Role.find_by_role_name('Writer').destroy
  end
end