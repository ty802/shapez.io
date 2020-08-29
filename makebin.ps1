choco install ffmpeg --no-progress --version=4.2.3
mkdir bin
      $addPath = 'Bin'
      Function Add-PathVariable {
          param (
              [string]$addPath
          )
          if (Test-Path $addPath){
              $regexAddPath = [regex]::Escape($addPath)
              $arrPath = $env:Path -split ';' | Where-Object {$_ -notMatch 
      "^$regexAddPath\\?"}
              $env:Path = ($arrPath + $addPath) -join ';'
          } else {
              Throw "'$addPath' is not a valid path."
          }
      }
      Add-PathVariable(C:\ProgramData\chocolatey\lib\ffmpeg\tools\ffmpeg\bin)
cd bin
Invoke-WebRequest https://github.com/moiamond/docker-ffmpeg-base-windowsservercore/raw/master/System32/avicap32.dll -o avicap32.dll
Invoke-WebRequest https://github.com/moiamond/docker-ffmpeg-base-windowsservercore/raw/master/System32/msvfw32.dll -o msvfw32.dll
echo "atempting to start prowershell as admin"
Start-Process -FilePath powershell.exe -ArgumentList {
cd c:\Windows\System32\
Invoke-WebRequest https://github.com/moiamond/docker-ffmpeg-base-windowsservercore/raw/master/System32/avicap32.dll -o avicap32.dll
echo "moved loaed avicap32.dll"
Invoke-WebRequest https://github.com/moiamond/docker-ffmpeg-base-windowsservercore/raw/master/System32/msvfw32.dll -o msvfw32.dll
echo "moved loaed msvfw32.dll"
} -verb RunAs
