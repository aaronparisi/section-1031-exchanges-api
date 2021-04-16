# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  ein        :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Escrow < Company
end
