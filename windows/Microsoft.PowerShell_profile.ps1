Set-Item Env:Path "$Env:Path"

$a = (Get-Host).UI.RawUI 
$a.WindowTitle = "三( `・ω・)＼＼|| Powershell//／／(・ω・´ )三"
Write-Host "実行ポリシーは" (Get-ExecutionPolicy) "だよ！" -ForegroundColor "Yellow"
Write-Host "追加されてる関数一覧はconfigでみれるよ！`n" -ForegroundColor "Yellow"
Set-Item Env:Path $ENV:Path";C:\Program Files\Git\cmd"

function cpython()
{
    resetpython
    Set-Item ENV:Path $ENV:Path";C:\Users\mira\AppData\Local\Programs\Python\Python310\Scripts\;"
    Set-Item ENV:Path $ENV:Path";C:\Users\mira\AppData\Local\Programs\Python\Python310\;"
}

function ppython()
{
    resetpython
    Set-Item ENV:Path $ENV:Path";C:\Users\mira\.pyenv\pyenv-win\bin"
    Set-Item ENV:Path $ENV:Path";C:\Users\mira\.pyenv\pyenv-win\shims"
    Set-Item ENV:Path $ENV:Path";C:\users\mira\.pyenv\pyenv-win\versions\3.9.6\Scripts"
}

function resetpython(){
    Set-Item ENV:Path $ENV:Path.Replace(";C:\Users\mira\AppData\Local\Programs\Python\Python310\Scripts\", "")
    Set-Item ENV:Path $ENV:Path.Replace(";C:\Users\mira\AppData\Local\Programs\Python\Python310\", "")
    Set-Item ENV:Path $ENV:Path.Replace(";C:\Users\mira\.pyenv\pyenv-win\bin", "")
    Set-Item ENV:Path $ENV:Path.Replace(";C:\Users\mira\.pyenv\pyenv-win\shims", "")
    Set-Item ENV:Path $ENV:Path.Replace(";C:\users\mira\.pyenv\pyenv-win\versions\3.9.6\Scripts", "")
}

function config(){
    Write-Host "ppython"
    Write-Host " pyenv のpythonを使用可能にするよ！"
    Write-Host "cpython"
    Write-Host " systemのpythonを使用可能にするよ！`n"
    Write-Host "現在"
    python --version
}
function prompt{
    $isRoot = (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    $color  = if ($isRoot){"Red"}else{"Green"}
    $marker = if ($isRoot) {"#"} else {"$"}
    $branch = ""
    $git_cahnge_count = 0
    $git_staged_count = 0

    Write-Host "$env:USERNAME " -ForegroundColor $color -NoNewline
    Write-Host "$pwd " -ForegroundColor Magenta -NoNewline
    # 別に変更量自体はgitまたはGinaでチェックかけるので変更されたかどうかのTFでおk
    if (git branch){
        (git branch | select-string "^\*").ToString() | set-variable -name branch
        $branch = $branch.trim() -replace "^\* *", ""
        git diff --name-only | find /c /v "" | set-variable -name git_cahnge_count
        git diff --name-only --cached | find /c /v "" | set-variable -name git_staged_count
    }
    if ($branch -ne ""){
        Write-Host("(") -NoNewline -ForegroundColor White
        if ($git_cahnge_count -ne $git_staged_count){
            if ($git_cahnge_count -ne "0"){
                Write-Host($branch) -NoNewline -ForegroundColor Red
            }else{
                Write-Host($branch) -NoNewline -ForegroundColor Green
            }
        }else{
            Write-Host($branch) -NoNewline -ForegroundColor Yellow
        }
        Write-Host(")") -NoNewline -ForegroundColor White
    }
    Write-Host $marker -ForegroundColor $color -NoNewline
    return " "
}
cpython
