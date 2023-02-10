# burke_wills_adventure
Burke &amp; Wills Bogus Adventure

Get it working on Linux (Tested 31/03/2022)

# Ruby

Tested with ruby version 3.1.1

# Installation

## Dependencies for both C++ and Ruby
sudo apt-get install build-essential libsdl2-dev libgl1-mesa-dev libopenal-dev \
                     libgmp-dev libfontconfig1-dev

## To install Ruby itself - if you are using rvm or rbenv, please skip this step
sudo apt-get install ruby-dev

## If you are using a Ruby version manager (i.e. rvm or rbenv)
gem install gosu chingu
## If you are using system Ruby, you will need "sudo" to install Ruby libraries (gems)
sudo gem install gosu chingu

# Run
./bw.rb
