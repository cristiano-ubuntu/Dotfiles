
#!/bin/bash
mkdir -p ~/.local/share/fonts

cd /tmp
fonts=( 
"CascadiaCode"
"FiraCode"
"Go-Mono"
"Hack"
"Iosevka"
"IosevkaTerm"
"JetBrainsMono"
"Mononoki"
"RobotoMono"
"SourceCodePro"
"UbuntuMono"
"AnonymousPro"

)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$font.zip
	unzip $font.zip -d $HOME/.local/share/fonts/$font/
    rm $font.zip
done
fc-cache
