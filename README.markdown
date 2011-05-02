# registrame0.2
registrame0.2 is the second version of this app to register attendees to an expo or trade-show. Originally written in Rails 2.3, this new version updates to Rails 3.

Not only Rails version has been updated, but also the following behavior has been added.

+ Admin user is the only user authorized to configure application via a login/password and Admin namespace.
+ Name Badge includes attendees info in a QRCode.

## What's inside?
+ Rails 3 (3.0.7)
+ Ruby 1.8.7
+ jQuery (1.4.4)
+ Gems
	+ devise (admin authentication/authorization.)
	+ prawn (generates attendee name badge in PDF format ready to be printed.)
	+ rqr (generates QRCode that includes attendee info and is printed in name badge.)
	+ yaml_db (eases DB engine change if required.)


## What's the plan?
The app contains three areas: __admin__ for configuration and report generation; __data__ for data capture during an event; an __public__ for those interested in pre-registering online.

+ Admin area:
	+ Menu to access the app configuration options.
	+ Dashboard to create a report with all collected info in CSV and PDF format.
	
+ Data area:
	+ Access to basic registration operations, attendee info revision and name badge printing.
	+ Dashboard with an overview of total records, total printed name badges, all categorized in registration types (visitor, exhibitor, etc.)
	
+ Public area:
	+ Interested people may pre-register online through this interface.
	+ When registration completes, the app sends a confirmation email to attendee.
	+ By clicking in the email links, attendee is able to view/modify his/her record.
		
## Configuration how-to?
This app is a work in process, this README file will be updated as needed.

Steps:

+ Create config/app_config.yml file based upon config/sample_app_config.yml
+ Don't forget to use bundler to install all required gems.
+ Run
		$ rake db:setup
	(this step will create database and load contents of seed.rb in order to populate database with the minimum set of required info.)
+ Now we may login with the admin user credentials displayed at the end of the rake task (__IMPORTANT__: once logged in, please change admin user credentials to avoid headaches, speccially if the app will be available online to accept pre-registrations.)
+ Populate several models via the following menu entries:

	Config >
	+ Event Info: configures event information used to display to people who pre-register online.
	+ Interests: records attendees interests in the event, example: "Meet providers", "Identify potential business partners", etc.
	+ Registration Types: records registration types, example: Exhibitor, Visitor, Sponsor, Speaker, etc.
	+ Sectors: records business sectors a company may belong to, example: Industry, Government, Business, etc.
	+ NameBadge: records name badge features where attendees info will be printed on.
	
+ Attendees: All attendees info is recorded here.

This is all the procedure to make it work.