# == Schema Information
#
# Table name: phone_numbers
#
#  id            :bigint           not null, primary key
#  callable_type :string           not null
#  number        :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  callable_id   :bigint           not null
#
# Indexes
#
#  index_phone_numbers_on_callable  (callable_type,callable_id)
#
class WorkPhoneNumber < PhoneNumber
end
