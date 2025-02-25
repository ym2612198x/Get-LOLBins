# one-liner
# $Category = Read-Host "Enter Category: ";$loljson = irm -Uri "https://lolbas-project.github.io/api/lolbas.json" -Method Get;foreach ($lol in $loljson){foreach ($lolcategory in $lol.Commands.Category){if ($lolcategory -eq $Category){foreach ($path in $lol.Full_Path){$fullPath = $($path.Path);if (Test-Path $fullPath){Write-Host "";Write-Host "[+] Found:`t$fullPath" -ForegroundColor Red;Write-Host "----------" -ForegroundColor DarkGray;foreach ($command in $lol.Commands) {if ($command.Category -eq $Category) {Write-Host "[*] Command:`t$($command.Command)" -ForegroundColor Yellow;Write-Host "[*] Descrip:`t$($command.Description)" -ForegroundColor Cyan;Write-Host "[*] Usecase:`t$($command.Usecase)" -ForegroundColor Magenta;Write-Host "[*] Category:`t$($command.Category)" -ForegroundColor DarkGray;}}Write-Host "----------" -ForegroundColor DarkGray}}}}}

param (
    [Parameter(Mandatory=$true)]
    [string]$Category
)

$loljson = Invoke-RestMethod -Uri "https://lolbas-project.github.io/api/lolbas.json" -Method Get

foreach ($lol in $loljson)
{
    foreach ($lolcategory in $lol.Commands.Category)
    {
        # if it matches our category
        if ($lolcategory -eq $Category)
        {
            foreach ($path in $lol.Full_Path)
            {
                # test if the file exists on ourn system
                $fullPath = $($path.Path)
                if (Test-Path $fullPath)
                {
                    Write-Host ""
                    Write-Host "[+] Found:`t$fullPath" -ForegroundColor Red
                    Write-Host "----------" -ForegroundColor DarkGray
                    foreach ($command in $lol.Commands) {
                        if ($command.Category -eq $Category) {
                            Write-Host "[*] Command:`t$($command.Command)" -ForegroundColor Yellow
                            Write-Host "[*] Descrip:`t$($command.Description)" -ForegroundColor Cyan
                            Write-Host "[*] Usecase:`t$($command.Usecase)" -ForegroundColor Magenta
                            Write-Host "[*] Category:`t$($command.Category)" -ForegroundColor DarkGray
                        }
                    }
                    Write-Host "----------" -ForegroundColor DarkGray
                }
            }
        }
    }
}


### another ###
# $Category = Read-Host "Enter Category:" 
# $loljson = $loljson = Get-Content -Path "lolbas.json" | ConvertFrom-Json
# $binlist= @()

# foreach ($lol in $loljson)
# {
#     foreach ($lolcategory in $lol.Commands.Category)
#     {
#         if ($lolcategory -eq $Category)
#         {
# 		    $binlist+= $lol.Name
# 	    }
#     }      
# }
# $uniqbin = $binlist | Select-Object -Unique | Sort-Object
# Get-ChildItem -Path C:\ -Force -Recurse -Include $uniqbin -ea 0 | select -exp FullName
