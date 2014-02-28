# RailsAdmin config file. Generated on November 26, 2013 18:02
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
   require 'i18n'
   I18n.default_locale = :fr

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Valentin Rota', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

   config.excluded_models << 'Contact'
   #config.excluded_models << 'Ckeditor::Asset'
   #config.excluded_models << 'Ckeditor::AttachmentFile'
   #config.excluded_models << 'Ckeditor::Picture'
   Rails.application.eager_load!
   config.included_models = ActiveRecord::Base.descendants.map!(&:name)

   config.model Post do
     edit do
       field :title
       field :body, :wysihtml5
       field :test_image
       field :video
       field :published
       field :to_front
       field :user_id, :hidden do
         default_value do
           bindings[:view]._current_user.id
         end
       end
     end

     list do
       field :title
       field :test_image
       field :body
       field :published
     end
   end

  config.model Event do
    edit do
      field :title
      field :description
      field :place
      field :starting_at
      field :ending_at
      field :image
      field :to_front
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  config.model Portfolio do
    edit do
      field :image
      field :description, :ck_editor
      field :published
    end
  end

  config.model Image do
    configure :asset, :jcrop
    edit do
      field :title
      field :asset do
      jcrop_options aspectRatio: 700.0/400.0
        fit_image true
      end
      field :legend
      field :to_cover
    end

    list do
      field :title
      field :asset
      field :legend
      field :post
      field :portfolio
      field :event
    end
  end

   config.model ObjectiveList do
     edit do
       field :main, :ck_editor
       field :image
       field :objectives
     end
   end

   config.model Video do
     edit do
       field :url
       field :title
       field :description
       field :to_gallery
     end
   end

   def image_label_method
    "<img src=\"#{self.asset.mini.url}\"/>".html_safe
   end
end
