ActiveAdmin.register Page do
  permit_params :name, :content

  form do |f|
    f.inputs do
      f.input :name
      f.input :content, as: :text
    end
    f.actions
  end
end
