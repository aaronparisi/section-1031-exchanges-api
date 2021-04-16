# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company_1031_services = Facilitator.create(
  name: "1031 Services, Inc.",
  ein: Faker::Company.ein
)

address_1031_services = Address.create(
  line1: "2001 Western Ave", 
  line2: "Suite 330", 
  city: "Seattle", 
  state: "WA", 
  zip: "98121", 
  addressable_id: company_1031_services.id,
  addressable_type: "Company",
)

phone_1031_services = WorkPhoneNumber.create(
  number: "4256464020",
  callable_id: company_1031_services.id,
  callable_type: "Company"
)
fax_1031_services = Fax.create(
  number: "2067280935",
  faxable_id: company_1031_services.id,
  faxable_type: "Company"
)
email_1031_services = EmailAddress.create(
  email: "info@1031services.com",
  emailable_id: company_1031_services.id,
  emailable_type: "Company"
)

# 3 escrow companies, each with 1 employee
3.times do
  an_escrow = Escrow.create(
    name: Faker::Company.name,
    ein: Faker::Company.ein
  )

  Address.create(
    line1: Faker::Address.street_address,
    line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    addressable_id: an_escrow.id,
    addressable_type: "Company"
  )

  WorkPhoneNumber.create(
    number: Faker::Number.number(digits: 10).to_s,
    callable_id: an_escrow.id,
    callable_type: "Company"
  )

  Fax.create(
    number: Faker::Number.number(digits: 10).to_s,
    faxable_id: an_escrow.id,
    faxable_type: "Company"
  )

  an_escrow_agent = EscrowAgent.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
  )

  Employment.create(
    employee_id: an_escrow_agent.id,
    employerable_id: an_escrow.id,
    employerable_type: "Company"
  )

  Address.create(
    line1: Faker::Address.street_address,
    line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    addressable_id: an_escrow_agent.id,
    addressable_type: "Person"
  )

  WorkPhoneNumber.create(
    number: Faker::Number.number(digits: 10).to_s,
    callable_id: an_escrow_agent.id,
    callable_type: "Person"
  )

  Fax.create(
    number: Faker::Number.number(digits: 10).to_s,
    faxable_id: an_escrow_agent.id,
    faxable_type: "Person"
  )

  EmailAddress.create(
    email: "#{an_escrow_agent.first_name}.#{an_escrow_agent.last_name}@gmail.com",
    emailable_id: an_escrow_agent.id,
    emailable_type: "Person"
  )
end

# 2 banks companies, each with 1 employee
2.times do
  a_bank = Bank.create(
    name: Faker::Company.name,
    ein: Faker::Company.ein
  )

  Address.create(
    line1: Faker::Address.street_address,
    line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    addressable_id: a_bank.id,
    addressable_type: "Company"
  )

  WorkPhoneNumber.create(
    number: Faker::Number.number(digits: 10).to_s,
    callable_id: a_bank.id,
    callable_type: "Company"
  )

  Fax.create(
    number: Faker::Number.number(digits: 10).to_s,
    faxable_id: a_bank.id,
    faxable_type: "Company"
  )

  a_bank_employee = Banker.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
  )

  Employment.create(
    employee_id: a_bank_employee.id,
    employerable_id: a_bank.id,
    employerable_type: "Company"
  )

  Address.create(
    line1: Faker::Address.street_address,
    line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    addressable_id: a_bank_employee.id,
    addressable_type: "Person"
  )

  WorkPhoneNumber.create(
    number: Faker::Number.number(digits: 10).to_s,
    callable_id: a_bank_employee.id,
    callable_type: "Person"
  )

  Fax.create(
    number: Faker::Number.number(digits: 10).to_s,
    faxable_id: a_bank_employee.id,
    faxable_type: "Person"
  )

  EmailAddress.create(
    email: "#{a_bank_employee.first_name}.#{a_bank_employee.last_name}@gmail.com",
    emailable_id: a_bank_employee.id,
    emailable_type: "Person"
  )
end

# 20 clients
20.times do
  puts "before making a client, there are #{Person.count} people in the db..."
  a_client = Client.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name
  )
  puts "... after making a client, there are #{Person.count} people in the db"

  Address.create(
    line1: Faker::Address.street_address,
    line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    addressable_id: a_client.id,
    addressable_type: "Person"
  )

  MobilePhoneNumber.create(
    number: Faker::Number.number(digits: 10).to_s,
    callable_id: a_client.id,
    callable_type: "Person"
  )

  Fax.create(
    number: Faker::Number.number(digits: 10).to_s,
    faxable_id: a_client.id,
    faxable_type: "Person"
  )

  EmailAddress.create(
    email: "#{a_client.first_name}.#{a_client.last_name}@gmail.com",
    emailable_id: a_client.id,
    emailable_type: "Person"
  )
end

# 20 clients who will own property in an LLC
20.times do
  a_company = Company.create(
    name: Faker::Company.name + " LLC",
    ein: Faker::Company.ein
  )
  
  Address.create(
    line1: Faker::Address.street_address,
    line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    addressable_id: a_company.id,
    addressable_type: "Company"
  )

  WorkPhoneNumber.create(
    number: Faker::Number.number(digits: 10).to_s,
    callable_id: a_company.id,
    callable_type: "Company"
  )

  Fax.create(
    number: Faker::Number.number(digits: 10).to_s,
    faxable_id: a_company.id,
    faxable_type: "Company"
  )

  puts "before making an employed client, there are #{Person.count} people in the db..."
  a_client = Client.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name
  )
  puts "... after making an employed client, there are #{Person.count} people in the db"

  Employment.create(
    employee_id: a_client.id,
    employerable_id: a_company.id,
    employerable_type: "Company"
  )

  Address.create(
    line1: Faker::Address.street_address,
    line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    addressable_id: a_client.id,
    addressable_type: "Person"
  )

  MobilePhoneNumber.create(
    number: Faker::Number.number(digits: 10).to_s,
    callable_id: a_client.id,
    callable_type: "Person"
  )

  Fax.create(
    number: Faker::Number.number(digits: 10).to_s,
    faxable_id: a_client.id,
    faxable_type: "Person"
  )

  EmailAddress.create(
    email: "#{a_client.first_name}.#{a_client.last_name}@gmail.com",
    emailable_id: a_client.id,
    emailable_type: "Person"
  )
end