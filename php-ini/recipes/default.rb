ruby_block 'php_ini' do
  block do
    file = Chef::Util::FileEdit.new('/etc/php5/apache2/php.ini')
    file.search_file_replace_line(/max_execution_time = 30/, 'max_execution_time = 3600')
    file.search_file_replace_line(/max_input_time = 60/, 'max_input_time = 3600')
    file.search_file_replace_line(/upload_max_filesize = 2M/, 'upload_max_filesize = 20M')
    file.search_file_replace_line(/; max_input_vars = 1000/, 'max_input_vars = 20M')
    file.search_file_replace_line(/post_max_size = 8M/, 'post_max_size = 40M')
    file.search_file_replace_line(/memory_limit = 128M/, 'memory_limit = 1024M')
    file.write_file
  end
end

service 'apache2' do
  action :restart
end