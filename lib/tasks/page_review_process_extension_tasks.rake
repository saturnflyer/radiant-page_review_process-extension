namespace :radiant do
  namespace :extensions do
    namespace :page_review_process do
      
      desc "Runs the migration of the Page Review Process extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PageReviewProcessExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PageReviewProcessExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Page Review Process to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[PageReviewProcessExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PageReviewProcessExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
