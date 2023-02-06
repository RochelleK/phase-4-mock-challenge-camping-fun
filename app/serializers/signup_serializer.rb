class SignupSerializer < ActiveModel::Serializer
  # attributes :id, :time, :camper_id, :activity_id
  belongs_to :activity, only: [:name, :difficulty]
end
