
MCollective Puppet Module
-------------------------

Author: Mike Pountney <Mike.Pountney@gmail.com> -  mikepea on IRC, Twitter.

Reasonably comprehensive core module for deploying and managing mcollective.

I've tried to write this so that you should not need to make any changes to
this module code, AT ALL. If you need to make a change it's either a bug or
feature request in my opinion, so please let me know.

Instead, you should write a deployment class - in a separate module - that 
uses the various classes in here to deploy the plugins and features you 
require, plus setting any passwords etc. An example of this is provided
in manifests/example_deployment.pp

Currently this module also includes some plugins from the mcollective-plugins 
module.  These will soon be removed though, to prevent them getting out of date.

They will be replaced with a sub-module to the official mcollective-plugins 
repo at:

  http://github.com/ripienaar/mcollective-plugins

Requirements
------------

The process management plugin requires the sys-proctable RubyGem to be installed,
and as such this module requires a virtual resource to be set up as follows in a 
sensible place in your manifest heirarchy:

   @package { "sys-proctable": ensure => present, provider => gem }

There is a helper class - mcolletive::virtual_resources::sys_proctable -
that can be included to specify this, if you don't use sys-proctable anywhere else.

If there's enough shouting that this is not acceptable, I'll find a better solution.

Suggestions are welcome!

