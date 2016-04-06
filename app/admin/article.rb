ActiveAdmin.register Article do
  permit_params :content, :title, :alias

  index do
    selectable_column
    id_column
    column :title
    column :alias
    actions
  end

end


