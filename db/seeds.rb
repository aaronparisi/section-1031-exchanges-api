# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_contact(contact, contact_type_string, phone_types, employments)
  # given a ruby object representing a contact,
  # the type of that contact ("Person", "Company")
  # an array of objects representing types of phone numbers to add ([:mobile, :work])
  # and an array of objects representing employments to add ([{employer_id: 1, employer_type_string: "Company"}, {...}]),
  # creates the requested info in the database
  
  employments.each do |employment|
    Employment.create(
      employee_id: contact.id,
      employerable_id: employment[:employer_id],
      employerable_type: employment[:employer_type_string]
    )
  end
  
  Address.create(
    line1: Faker::Address.street_address,
    line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    addressable_id: contact.id,
    addressable_type: contact_type_string
  )

  if phone_types.include?(:mobile)
    MobilePhoneNumber.create(
      number: Faker::Number.number(digits: 10).to_s,
      callable_id: contact.id,
      callable_type: contact_type_string
    )
  end

  if phone_types.include?(:work)
    WorkPhoneNumber.create(
      number: Faker::Number.number(digits: 10).to_s,
      callable_id: contact.id,
      callable_type: contact_type_string
    )
  end
    
  if phone_types.include?(:home)
    HomePhoneNumber.create(
      number: Faker::Number.number(digits: 10).to_s,
      callable_id: contact.id,
      callable_type: contact_type_string
    )
  end

  Fax.create(
    number: Faker::Number.number(digits: 10).to_s,
    faxable_id: contact.id,
    faxable_type: contact_type_string
  )

  if contact.is_a?(Person)
    an_email = "#{contact.first_name}.#{contact.last_name}@gmail.com"
  else
    an_email = "#{contact.name}@gmail.com"
  end

  EmailAddress.create(
    email: an_email,
    emailable_id: contact.id,
    emailable_type: contact_type_string
  )

end


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

# 3 exchange coordinators at 1031 services
3.times do
  an_exchange_coordinator = ExchangeCoordinator.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name
  )

  create_contact(an_exchange_coordinator, "Person", [:mobile, :work], [{ employer_id: company_1031_services.id, employer_type_string: "Company" }])
end

# 3 escrow companies, each with 1 employee
3.times do
  an_escrow = Escrow.create(
    name: Faker::Company.name,
    ein: Faker::Company.ein
  )

  create_contact(an_escrow, "Company", [:mobile, :work], [])

  an_escrow_agent = EscrowAgent.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
  )

  create_contact(an_escrow_agent, "Person", [:mobile, :work], [{ employer_id: an_escrow.id, employer_type_string: "Company" }])
end

# 2 banks companies, each with 2 employee
2.times do
  a_bank = Bank.create(
    name: Faker::Company.name,
    ein: Faker::Company.ein
  )

  create_contact(a_bank, "Company", [:mobile, :work], [])

  2.times do
    a_bank_employee = Banker.create(
      first_name: Faker::Name.first_name,
      middle_name: Faker::Name.middle_name,
      last_name: Faker::Name.last_name,
    )

    create_contact(a_bank_employee, "Person", [:mobile, :work], [{ employer_id: a_bank.id, employer_type_string: "Company" }])
  end
end

# 20 clients
for i in 0...20 do
  a_client = Client.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name
  )

  create_contact(a_client, "Person", [:mobile, :work], [])

  an_exchange_coordinator_id = ExchangeCoordinator.all[i%3].id
  an_exchange = Exchange.create(
    exchange_status: "open",
    exchange_type: "forward",
    coordinator_id: an_exchange_coordinator_id,
    exchangorable_id: a_client.id,
    exchangorable_type: "Person"
  )

  ExchangeContact.create(
    exchange_id: an_exchange.id,
    contact_id: a_client.id,
    main_contact: true
  )

  BankAccount.create(
    account_number: rand.to_s[2..11],
    exchange_id: an_exchange.id,
    bank_id: Bank.all[i%2].id
  )
end

# 20 clients who will own property in an LLC
for i in 0...20 do
  a_company = Company.create(
    name: Faker::Company.name + " LLC",
    ein: Faker::Company.ein
  )

  create_contact(a_company, "Company", [:mobile, :work], [])

  a_client = Client.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name
  )
  
  create_contact(a_client, "Person", [:mobile, :work], [{ employer_id: a_company.id, employer_type_string: "Company" }])

  an_exchange_coordinator_id = ExchangeCoordinator.all[i%3].id
  an_exchange = Exchange.create(
    exchange_status: "open",
    exchange_type: "forward",
    coordinator_id: an_exchange_coordinator_id,
    exchangorable_id: a_company.id,
    exchangorable_type: "Company"
  )

  ExchangeContact.create(
    exchange_id: an_exchange.id,
    contact_id: a_client.id,
    main_contact: true
  )

  BankAccount.create(
    account_number: rand.to_s[2..11],
    exchange_id: an_exchange.id,
    bank_id: Bank.all[i%2].id
  )
end