# == Schema Information
#
# Table name: tasks
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  state       :integer
#  project_id  :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#

class Task < ActiveRecord::Base
  belongs_to :project

  validates :project, presence: :true
  validates :name, presence: :true
  validates :description, presence: :true
  validates :state, presence: :true

  after_initialize :set_default_state

  enum state: {
    to_do: -1,
    in_progress: 10,
    done: 20
  }

  def project_name
    project.name
  end

  private

  def set_default_state
    self.state ||= -1
  end
end
