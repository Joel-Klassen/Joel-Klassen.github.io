Note To Future Self:

This site is built using jekyll

here's the instructions for setting it up: 

http://jmcglone.com/guides/github-pages/

https://jekyllrb.com/docs/installation/macos/

run this command in the terminal when you want to run the site locally: 

bundle exec jekyll serve --config  "_config_dev.yml"

bundle exec jekyll serve

Then go to http://localhost:4000

If you put things in the _sites folder, they might get deleted!

-------------------------------------
On windows, 
 (setup: http://jekyllrb.com/docs/installation/windows/)

open the shell
cd to the website directory
>bash
then the above
-------------------------------------
USAGE GUIDE

The _site folder is what Jekyll builds and is what people see
My understanding is that this is automatically built when you upload your stuff to GitHub
So that's why you don't include _site in the commit


main.css stylizes your site

_config.yml gives Jekyll basic info about your site

_layouts tells Jekyll how to lay out information

_includes are files that show up on every page

_posts contains blog posts 



------------------------------------
Extra resources:
https://www.taniarascia.com/make-a-static-website-with-jekyll/
-------------------------------------

Step by step setup on Mac

Xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Brew install ruby

export PATH=/usr/local/opt/ruby/bin:$PATH

[Restart terminal]

gem install --user-install bundler jekyll

[Get your ruby version]

ruby -v
# ruby 2.6.1p33 (2019-01-30 revision 66950) [x86_64-darwin18]

[Then append your path file with the following, replacing the X.X with the first two digits of your Ruby version.]

export PATH=$HOME/.gem/ruby/X.X.0/bin:$PATH

[Ie 2.6 in this case]

sudo gem install bundler
sudo gem install -n /usr/local/bin/ jekyll

----------------------------------
Additional comments and lessons:

Explanation of config_dev : 

https://alexplescan.com/posts/2016/03/28/development-environment-config-overrides-in-jekyll/


[Added the following to _config.yml due to the advice here:https://help.github.com/en/articles/repository-metadata-on-github-pages]
repository: Joel-Klassen/Joel-Klassen.github.io