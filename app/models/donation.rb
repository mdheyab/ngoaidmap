# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  donor_id   :integer
#  project_id :integer
#  amount     :float
#  date       :date
#  office_id  :integer
#

class Donation < ActiveRecord::Base
  belongs_to :project
  belongs_to :donor
  belongs_to :office
end
