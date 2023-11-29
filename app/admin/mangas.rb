ActiveAdmin.register Manga do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :price, :score, :publish_date, :status, :author_id, :image, :description,
                genre_ids: []

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
      f.input :image, as:   :file,
                      hint: f.object.image.present? ? image_tag(f.object.image, size: "113x160") : ""
      f.input :genres, as: :check_boxes, collection: Genre.all
    end
    f.actions
  end
end
