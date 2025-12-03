$ErrorActionPreference = "SilentlyContinue"
$UserRN = $env:USERNAME
clear-host
function ScannerAltLogoN {
Write-Host @"

                      :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!          Made by Improve Your Skills
               ~?WuxiW*`   `"#$$$$8!!!!??!!!            
             :X- M$$$$       `"T#$T~!8$WUXU~              Beta-Version: 1.1.9
            :%`  ~#$$$m:        ~!~ ?$$$$$$
          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~

"@ -ForegroundColor Red                                                           
    Write-Host -ForegroundColor Blue "     by Miyuze"
    Write-Host ""
}

function Test-Admin { ; $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent()); $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator); }
if (!(Test-Admin)) {
    Write-Warning "Execute o script como Administrador" -ForegroundColor Yellow
    Start-Sleep 5
    Exit
}
function Remove-Targets {
    Write-Host "`n--- Iniciando verificação ---`n"

    # Lista de caminhos a serem verificados
    $caminhos = @(
        "$env:SystemRoot\System32\Scan_Alt.txt",
        "$env:SystemRoot\System32\ASmoothadw.raw",
        "$env:APPDATA\.minecraft\scan_marker.log",
        "$env:TEMP\40009c63-d158-ca66d0dc00b4-nigg-amotha3.tmp",
        "$env:TEMP\HAHAHAHAHAHAHAHAHA.llogamcache"
    )

    foreach ($item in $caminhos) {
        if (Test-Path $item) {

            Write-Host "Arquivo encontrado: $item" -ForegroundColor Yellow
            Write-Host "Excluindo..." -ForegroundColor Cyan

            try {
                Remove-Item $item -Force
                Write-Host "Arquivo excluído: $item" -ForegroundColor Green
            }
            catch {
                Write-Host "Erro ao excluir: $item" -ForegroundColor Red
            }
        }
        else {
            Write-Host "Não encontrado: $item" -ForegroundColor DarkGray
        }
    }
}
