# https://weblog.west-wind.com/posts/2017/May/25/Automating-IIS-Feature-Installation-with-Powershell
powershell_script 'install-WebRole' do
  code 'Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole).State -eq 'Enabled'"
end

powershell_script 'install-IIS' do
  code 'Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServer).State -eq 'Enabled'"
end

service 'w3svc' do
  action [:enable, :start]
end

file 'c:\inetpub\wwwroot\Default.htm' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end
#file ended
