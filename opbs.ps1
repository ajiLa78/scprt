clear
cd Downloads
Invoke-WebRequest -Uri "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip" -OutFile "ngrok.zip"
unzip ngrok.zip
$CRP = Read-Host "enter your ngrok authtoken"
.\ngrok config add-authtoken $CRP
# Meminta pengguna untuk memasukkan nama pengguna yang baru
$Username = Read-Host -Prompt "Masukkan nama pengguna baru"
# Meminta pengguna untuk memasukkan kata sandi
$Password = Read-Host -Prompt "Masukkan kata sandi baru" -AsSecureString
# Membuat pengguna baru
New-LocalUser -Name $Username -Password $Password -PasswordNeverExpires $true
# Menambahkan pengguna ke grup Administrators
Add-LocalGroupMember -Group "Administrators" -Member $Username
OK!....
clear
Write-Host "---------------------"
Write-Host "User : $Username"
Write-Host "Pass : $Password"
Write-Host "---------------------"
Write-Host "Menjalankan Ngrok, harap tunggu sebentar"
sleep 10
.\ngrok tcp --region ap 3389
