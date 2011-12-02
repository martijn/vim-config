task :install do
  root = File.expand_path(File.dirname(__FILE__))

  puts 'Installing Bundles'
  system "vim -c BundleInstall! -c q -c q -u bundles.vim"
end

desc 'Update to latest and greatest'
task :update do
  system('git pull origin master') 
  puts 'Updating Bundles'
  system "vim -c BundleInstall! -c BundleClean! -c q -c q"

  puts '*' * 79
  puts
  puts 'Finished'
  puts
  puts '*' * 79
end
