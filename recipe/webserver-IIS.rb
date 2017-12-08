powershell_script 'install-IIS' do
  code 'Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServer).State -eq 'Enabled'"
  # https://weblog.west-wind.com/posts/2017/May/25/Automating-IIS-Feature-Installation-with-Powershell =end
end
