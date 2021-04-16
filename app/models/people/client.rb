# == Schema Information
#
# Table name: people
#
#  id          :bigint           not null, primary key
#  first_name  :string
#  last_name   :string
#  middle_name :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Client < Person
end
