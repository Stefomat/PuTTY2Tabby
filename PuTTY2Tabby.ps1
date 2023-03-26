$output = "C:\Users\USERNAME_HERE\Downloads\Sessions.yml"
$putty = Get-ItemProperty "HKCU:\SOFTWARE\SimonTatham\PuTTY\Sessions\*"

foreach($p in $putty.where({$_.pschildname -ne "Default%20Settings"}) ) {
    $v_name = $p.PSChildName
    $v_host = $p.HostName
    $v_port = $p.PortNumber
    $v_user = $p.UserName
    $v_command = $p.RemoteCommand
    
    echo "  - name: $v_name
    icon: fas fa-desktop
    options:
      host: $v_host
      user: $v_user
      algorithms: {}
      port: $v_port
      privateKeys: []
    weight: -1
    group: SSH
    type: ssh" >> $output
}

echo "Press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
