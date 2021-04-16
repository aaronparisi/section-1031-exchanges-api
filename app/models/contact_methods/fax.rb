# == Schema Information
#
# Table name: faxes
#
#  id           :bigint           not null, primary key
#  faxable_type :string           not null
#  number       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  faxable_id   :bigint           not null
#
# Indexes
#
#  index_faxes_on_faxable  (faxable_type,faxable_id)
#
class Fax < ApplicationRecord
  belongs_to :faxable, polymorphic: true
end
