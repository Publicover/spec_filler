FactoryGirl.define do
	factory :customers do
		# It looks like your primary key isn't the record ID.
		# Don't forget to pass in your primary key when you're creating
		# the test object (e.g., create(:object, primary_key: column_name)).
		broker
		broker_customer_no
		name
		address1
		address2
		city
		state
		zip
		email
		phone
		created_at
		updated_at
		epa_id
		technical_contact
		salesperson
		
		sic_code
		naics_code
		name2
		name1a
		manifest_name
		manifest_address
		manifest_address2
		manifest_city
		manifest_state
		manifest_zip
		contact
		technical_contact_email
		technical_contact_phone
	end
end