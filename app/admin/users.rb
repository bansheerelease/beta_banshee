ActiveAdmin.register User do
  index do
    column "Users id", :sortable => :id do|user|
      div :class => "id" do
        user.id
      end
    end
    column :email
    default_actions
  end
end

