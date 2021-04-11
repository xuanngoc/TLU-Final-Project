class UserBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :full_name, :code

    field :department do |user|
      user.degree_level.department.name
    end
  end

end
