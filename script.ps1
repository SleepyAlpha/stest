# WinOptimizer 23.7.1

Write-Host "Setting DNS to anti-malware Cloud Flare for all connections."
            Get-NetAdapter | set-DnsClientServerAddress -ServerAddresses ("1.1.1.1","1.0.0.1")
            Get-NetAdapter | set-DnsClientServerAddress -ServerAddresses ("2606:4700:4700::1111", "2606:4700:4700::1001")

$Services = @(
                "ALG"                                          # Application Layer Gateway Service(Provides support for 3rd party protocol plug-ins for Internet Connection Sharing)
                "AJRouter"                                     # Needed for AllJoyn Router Service
                "BcastDVRUserService_48486de"                  # GameDVR and Broadcast is used for Game Recordings and Live Broadcasts
                "Browser"                                      # Let users browse and locate shared resources in neighboring computers
                "BthAvctpSvc"                                  # AVCTP service (needed for Bluetooth Audio Devices or Wireless Headphones)
                "CaptureService_48486de"                       # Optional screen capture functionality for applications that call the Windows.Graphics.Capture API.
                "cbdhsvc_48486de"                              # Clipboard Service
                "diagnosticshub.standardcollector.service"     # Microsoft (R) Diagnostics Hub Standard Collector Service
                "DiagTrack"                                    # Diagnostics Tracking Service
                "dmwappushservice"                             # WAP Push Message Routing Service
                "DPS"                                          # Diagnostic Policy Service (Detects and Troubleshoots Potential Problems)
                "edgeupdate"                                   # Edge Update Service
                "edgeupdatem"                                  # Another Update Service
                "Fax"                                          # Fax Service
                "fhsvc"                                        # Fax History
                "FontCache"                                    # Windows font cache
                "gupdate"                                      # Google Update
                "gupdatem"                                     # Another Google Update Service
                "lfsvc"                                        # Geolocation Service
                "lmhosts"                                      # TCP/IP NetBIOS Helper
                "MapsBroker"                                   # Downloaded Maps Manager
                "MicrosoftEdgeElevationService"                # Another Edge Update Service
                "MSDTC"                                        # Distributed Transaction Coordinator
                "NahimicService"                               # Nahimic Service
                "NetTcpPortSharing"                            # Net.Tcp Port Sharing Service
                "PcaSvc"                                       # Program Compatibility Assistant Service
                "PerfHost"                                     # Remote users and 64-bit processes to query performance.
                "PhoneSvc"                                     # Phone Service(Manages the telephony state on the device)
                "PrintNotify"                                  # Windows printer notifications and extentions
                "QWAVE"                                        # Quality Windows Audio Video Experience (audio and video might sound worse)
                "RemoteAccess"                                 # Routing and Remote Access
                "RemoteRegistry"                               # Remote Registry
                "RetailDemo"                                   # Demo Mode for Store Display
                "RtkBtManServ"                                 # Realtek Bluetooth Device Manager Service
                "SCardSvr"                                     # Windows Smart Card Service
                "seclogon"                                     # Secondary Logon (Disables other credentials only password will work)
                "SEMgrSvc"                                     # Payments and NFC/SE Manager (Manages payments and Near Field Communication (NFC) based secure elements)
                "SharedAccess"                                 # Internet Connection Sharing (ICS)
                "stisvc"                                       # Windows Image Acquisition (WIA)
                "SysMain"                                      # Analyses System Usage and Improves Performance
                "TrkWks"                                       # Distributed Link Tracking Client
                "WerSvc"                                       # Windows error reporting
                "wisvc"                                        # Windows Insider program(Windows Insider will not work if Disabled)
                "WMPNetworkSvc"                                # Windows Media Player Network Sharing Service
                "WpcMonSvc"                                    # Parental Controls
                "WPDBusEnum"                                   # Portable Device Enumerator Service
                "WpnService"                                   # WpnService (Push Notifications may not work)               
                "WSearch"                                      # Windows Search
                "XblAuthManager"                               # Xbox Live Auth Manager (Disabling Breaks Xbox Live Games)
                "XblGameSave"                                  # Xbox Live Game Save Service (Disabling Breaks Xbox Live Games)
                "XboxNetApiSvc"                                # Xbox Live Networking Service (Disabling Breaks Xbox Live Games)
                "XboxGipSvc"                                   # Xbox Accessory Management Service
                
                # Hp services
                "HPAppHelperCap"
                "HPDiagsCap"
                "HPNetworkCap"
                "HPSysInfoCap"
                "HpTouchpointAnalyticsService"
                
                # Hyper-V services
                "HvHost"
                "vmicguestinterface"
                "vmicheartbeat"
                "vmickvpexchange"
                "vmicrdv"
                "vmicshutdown"
                "vmictimesync"
                "vmicvmsession"
            )
        
            foreach ($Service in $Services) {
                # -ErrorAction SilentlyContinue is so it doesn't write an error to stdout if a service doesn't exist
                Write-Host "Setting $Service StartupType to Manual"
                Get-Service -Name $Service -ErrorAction SilentlyContinue | Set-Service -StartupType Manual
            }

Write-Host "Disabling Telemetry."
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
            
Write-Host "Stopping and disabling Diagnostics Tracking Service."
            Stop-Service "DiagTrack" -WarningAction SilentlyContinue
            Set-Service "DiagTrack" -StartupType Disabled

Write-Host "Changing default Explorer view to This PC."
            Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1


$Bloatware = @(
                "Microsoft.WindowsCamera"
		"Microsoft.549981C3F5F10"
                "Microsoft.3DBuilder"
                "Microsoft.Microsoft3DViewer"
                "Microsoft.AppConnector"
                "Microsoft.BingFinance"
                "Microsoft.BingNews"
                "Microsoft.BingSports"
                "Microsoft.BingTranslator"
                "Microsoft.BingWeather"
                "Microsoft.BingFoodAndDrink"
                "Microsoft.BingHealthAndFitness"
                "Microsoft.BingTravel"
                "Microsoft.MinecraftUWP"
                "Microsoft.WindowsReadingList"
                "Microsoft.GetHelp"
                "Microsoft.Getstarted"
                "Microsoft.Messaging"
                "Microsoft.Microsoft3DViewer"
                "Microsoft.MicrosoftSolitaireCollection"
                "Microsoft.NetworkSpeedTest"
                "Microsoft.News"
                "Microsoft.Office.Lens"
                "Microsoft.Office.Sway"
                "Microsoft.Office.OneNote"
                "Microsoft.OneConnect"
                "Microsoft.People"
                "Microsoft.Print3D"
                "Microsoft.SkypeApp"
                "Microsoft.Wallet"
                "Microsoft.Whiteboard"
                "Microsoft.WindowsAlarms"
                "microsoft.windowscommunicationsapps"
                "Microsoft.WindowsFeedbackHub"
                "Microsoft.WindowsMaps"
                "Microsoft.WindowsPhone"
                "Microsoft.WindowsSoundRecorder"
                "Microsoft.ConnectivityStore"
                "Microsoft.CommsPhone"
                "Microsoft.ScreenSketch"
                "Microsoft.MixedReality.Portal"
                "Microsoft.YourPhone"
                "Microsoft.Getstarted"
                "Microsoft.MicrosoftOfficeHub"
                "*Clipchamp*"
                "*Teams*"
                "*Paint*"
                "*Todos*"
                "*Microsoft.Advertising.Xaml*"
                "*Microsoft.MSPaint*"
                "*Microsoft.MicrosoftStickyNotes*"
		"*MicrosoftCorporationII.QuickAssist*"
		"*Microsoft.PowerAutomateDesktop*"
		"*WebExperience*"
            )

Write-Host "Removing Bloatware."
            foreach ($Bloat in $Bloatware) {
                Get-AppxPackage -Name $Bloat | Remove-AppxPackage
                Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
                Write-Host "Trying to remove $Bloat."
            }

Write-Host "Disabling Extra Telemetry With Firewall."
$IpList = @(
                "207.68.166.254"
                "13.64.90.137"
                "13.69.131.175"
                "13.66.56.243"
                "13.68.82.8"
                "13.68.92.143"
                "13.68.233.9"
                "13.69.109.130"
                "13.69.109.131"
                "13.73.26.107"
                "13.74.169.109"
                "13.78.130.220"
                "13.78.232.226"
                "13.78.233.133"
                "13.88.21.125"
                "13.92.194.212"
                "13.104.215.69"
                "13.105.28.32"
                "13.105.28.48"
                "20.44.86.43"
                "20.49.150.241"
                "20.54.232.160"
                "20.60.20.4"
                "20.69.137.228"
                "20.190.169.24"
                "20.190.169.25"
                "23.99.49.121"
                "23.102.4.253"
                "23.102.5.5"
                "23.102.21.4"
                "23.103.182.126"
                "40.68.222.212"
                "40.69.153.67"
                "40.70.184.83"
                "40.70.220.248"
                "40.77.228.47"
                "40.77.228.87"
                "40.77.228.92"
                "40.77.232.101"
                "40.78.128.150"
                "40.79.85.125"
                "40.88.32.150"
                "40.112.209.200"
                "40.115.3.210"
                "40.115.119.185"
                "40.119.211.203"
                "40.124.34.70"
                "40.126.41.96"
                "40.126.41.160"
                "51.104.136.2"
                "51.140.40.236"
                "51.140.157.153"
                "51.143.53.152"
                "51.143.111.7"
                "51.143.111.81"
                "51.144.227.73"
                "52.147.198.201"
                "52.138.204.217"
                "52.155.94.78"
                "52.157.234.37"
                "52.158.208.111"
                "52.164.241.205"
                "52.169.189.83"
                "52.170.83.19"
                "52.174.22.246"
                "52.178.147.240"
                "52.178.151.212"
                "52.178.223.23"
                "52.182.141.63"
                "52.183.114.173"
                "52.184.221.185"
                "52.229.39.152"
                "52.230.85.180"
                "52.230.222.68"
                "52.236.42.239"
                "52.236.43.202"
                "52.255.188.83"
                "65.52.100.7"
                "65.52.100.9"
                "65.52.100.11"
                "65.52.100.91"
                "65.52.100.92"
                "65.52.100.93"
                "65.52.100.94"
                "65.52.161.64"
                "65.55.29.238"
                "65.55.83.120"
                "65.55.113.11"
                "65.55.113.12"
                "65.55.113.13"
                "65.55.176.90"
                "65.55.252.43"
                "65.55.252.63"
                "65.55.252.70"
                "65.55.252.71"
                "65.55.252.72"
                "65.55.252.93"
                "65.55.252.190"
                "65.55.252.202"
                "66.119.147.131"
                "104.41.207.73"
                "104.42.151.234"
                "104.43.137.66"
                "104.43.139.21"
                "104.43.139.144"
                "104.43.140.223"
                "104.43.193.48"
                "104.43.228.53"
                "104.43.228.202"
                "104.43.237.169"
                "104.45.11.195"
                "104.45.214.112"
                "104.46.1.211"
                "104.46.38.64"
                "104.46.162.224"
                "104.46.162.226"
                "104.210.4.77"
                "104.210.40.87"
                "104.210.212.243"
                "104.214.35.244"
                "104.214.78.152"
                "131.253.6.87"
                "131.253.6.103"
                "131.253.34.230"
                "131.253.34.234"
                "131.253.34.237"
                "131.253.34.243"
                "131.253.34.246"
                "131.253.34.247"
                "131.253.34.249"
                "131.253.34.252"
                "131.253.34.255"
                "131.253.40.37"
                "134.170.30.202"
                "134.170.30.203"
                "134.170.30.204"
                "134.170.30.221"
                "134.170.52.151"
                "134.170.235.16"
                "157.56.74.250"
                "157.56.91.77"
                "157.56.106.184"
                "157.56.106.185"
                "157.56.106.189"
                "157.56.113.217"
                "157.56.121.89"
                "157.56.124.87"
                "157.56.149.250"
                "157.56.194.72"
                "157.56.194.73"
                "157.56.194.74"
                "168.61.24.141"
                "168.61.146.25"
                "168.61.149.17"
                "168.61.161.212"
                "168.61.172.71"
                "168.62.187.13"
                "168.63.100.61"
                "168.63.108.233"
                "191.236.155.80"
                "191.237.218.239"
                "191.239.50.18"
                "191.239.50.77"
                "191.239.52.100"
                "191.239.54.52"
            )

            foreach ($Ip in $IpList) {
                New-NetFirewallRule -DisplayName "TelDisable_$Ip" -Direction Outbound -LocalPort Any -Protocol TCP -Action Block -RemoteAddress $Ip | Out-Null
                Write-Host "Blocking $Ip."
            }


Write-Host "Disabling Multi-Plane Overlay."
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Dwm" -Name "OverlayTestMode" -Type Dword -Value 5