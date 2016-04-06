 ActiveAdmin.register Comment, as: "User Comments" do

  permit_params :content, :name, :visible

  config.batch_actions = false

  member_action :publish, method: :get do
    comment = Comment.find_by(id: params[:id])
    comment.update(visible: true)
    redirect_to admin_user_comments_path, notice: "Cenzūruotas!"
  end

  index do
    selectable_column
    id_column
    column "Name" do |comment|
      link_to comment.name, admin_user_comment_path(comment)
    end
    column :content
    column :created_at
    column :visible

    actions do |comment|
      link_to('Publish', publish_admin_user_comment_path(comment))
    end

    # actions
  end

end