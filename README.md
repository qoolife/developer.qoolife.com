# developer.Qoolife.com

This is the developer documentation site for the [Qoolife Developer Portal](http://developer.Qoolife.com).

It's powered by [nanoc](http://nanoc.stoneship.org/) and ready for deployment on [heroku](http://heroku.com). And it's open source, you're encouraged to fork it and use it to document your API.

## Setup

Ruby 1.9 is required to build the site.

Clone the repo, run `bundle install` to install the required gems, and launch nanoc with `nanoc autocompile`. You'll have your site running at http://localhost:3000

## Changing content

Some basic understanding of nanoc is required, but the thing is: put your content on the _content_ folder and run `nanoc compile` to generate the site on the _output_ folder.

## Deployment on Heroku

After updating your content and compiling the site, add the changes to your git repo and just `git push heroku master` will work on the Heroku cedar stack.

If you need to tweak something, take a look at the _Gemfile_, _config.ru_ and _Procfile_ files.
