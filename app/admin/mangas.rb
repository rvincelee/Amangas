ActiveAdmin.register Manga do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :price, :score, :publish_date, :image, :status, :author_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :price, :score, :publish_date, :image, :status, :author_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
