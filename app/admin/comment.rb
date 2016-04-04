 ActiveAdmin.register Comment, as: "User Comments" do
  permit_params :content, :name, :visible

end