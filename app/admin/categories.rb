ActiveAdmin.register Category do
  permit_params :name

  filter :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
    end
  end
end
