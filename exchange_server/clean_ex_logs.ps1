$exservers = get-content -Path '\\server\share\servers.txt'

$ldate = (Get-Date).AddDays(-14)
$cdate = (Get-Date)
echo ==================================
echo "== Clear logs older than 14 days ($ldate) =="
echo ==================================  
foreach ($server in $exservers) {
echo ============================
echo "Cleaning server $server "
echo ============================

Get-ChildItem "\\$server\C$\inetpub\logs\LogFiles" -Recurse -File | Where CreationTime -lt $ldate | Remove-Item -Force
  echo "===     Logs Cleaned at $cdate     ===" > "\\$server\C$\inetpub\logs\LogFiles\cleanlog.log"
  echo "=== Removed logs elder than $ldate ===" >> "\\$server\C$\inetpub\logs\LogFiles\cleanlog.log"
}
