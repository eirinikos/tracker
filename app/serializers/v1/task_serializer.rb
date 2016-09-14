module V1
  class TaskSerializer < ActiveModel::Serializer
    attributes :project_name, :name, :description, :state, :id

    def project_name
      object.project_name
    end
  end
end
