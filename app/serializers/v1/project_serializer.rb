module V1
  class ProjectSerializer < ActiveModel::Serializer
    attributes :name, :description, :id, :state, :task_names

    def state
      object.state
    end

    def task_names
      object.task_names
    end
  end
end
