class CreateReviewerRole < ActiveRecord::Migration
  def self.up
    if Role.create!(:role_name => 'Reviewer', :description => 'Reviewers are able to move pages from Draft to Reviewed status.')
      puts "Reviewer role created."
    end
  end
  def self.down
    Role.find_by_role_name('Reviewer').destroy
  end
end