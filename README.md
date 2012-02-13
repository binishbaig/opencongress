<div class="hideme">
<h2> OpenCongress - a Ruby on Rails application for displaying information about Congress</h2>

<h4><a href="http://participatorypolitics.lighthouseapp.com/projects/35587-opencongress">Lighthouse Project Page</a></h4>
<h4><a href="http://www.opencongress.org/about/code">OpenCongress for Developers</a></h4>
<hr />

</div>
## Getting started with our code

### A. Dependencies

Start by installing all the packages required by OpenCongress.  The main dependencies are postgres and ImageMagick; OpenCongress will not run on mysql or sqlite.  The following commands are suggestions, but ultimately you'll need to get postgres running to be able to run the app.  We are currently running version of postgres 8.4.4 in production.

For Ubuntu:

	sudo apt-get install postgresql postgresql-client postgresql-contrib libpq-dev ruby1.8 ruby1.8-dev rubygems libopenssl-ruby imagemagick libmagick9-dev gcj-4.4-jre

---

For Mac OS X, start by installing [MacPorts](http://www.macports.org/), then run:

	sudo port install postgresql84 postgresql84-doc postgresql84-server ImageMagick md5sha1sum wget

or, if you want to use [Homebrew](http://mxcl.github.com/homebrew/) (this will install version Postgres 8.4.4):
	
	brew install imagemagick
	brew install https://github.com/adamv/homebrew-alt/raw/master/versions/postgresql8.rb
 
Follow the instructions after the packages install for initializing your database

---


Install the bundle:

<pre>
<code>
[sudo] gem install bundler
bundle install
</code>
</pre>

__Note for OS X:__ *You may need to specify additional compile options for your gems. Try: `ARCHFLAGS="-arch x86_64" bundle install`

### B. Database setup

Running the following commands will create an 'opencongress' user and empty databases for the three environments (test, development, production).  The migration command will populate the development database with an empty schema.
<pre>
<code>
rake db:init
rake db:migrate
</code>
</pre>

### C. Data (optional)

We are developing a process to quickly import some real legislative data.  Coming soon.
	
### D. Starting the server
   
OpenCongress uses Solr to store some data.  The following command is not required, but some pages will break if Solr is not running:

	rake solr:start

To start the webserver:

	rails s
	
---

We are actively working to make the install process easier for new volunteers.  Special thanks to Doug Cole for moving us along in this regard.

---

<div class="hideme"> 

<hr />

<p>Copyright (c) 2005-2012 Participatory Politics Foundation</p>

<p>OpenCongress is licensed, as a whole, under AGPLv3. Components added prior to
OpenCongress version 3 (July 27, 2011) were and are licensed under GPLv3. All components added for or after
OpenCongress version 3 are licensed AGPLv3. When you contribute a patch to OpenCongress, it will be licensed under AGPLv3. See LICENSE-AGPLv3 file for details.
</div>
