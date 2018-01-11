node[:deploy].each do |app_name, deploy|
  script "change_permission" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
      chmod -R 777 storage
      chmod -R 777 bootstrap
    EOH
  end
end