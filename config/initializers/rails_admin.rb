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

  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [User]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [User]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end



   config.model Post do
     edit do
       field :title
       field :body, :wysihtml5
       field :test_image
       field :published
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
      field :description, :wysihtml5
      field :published
    end
  end

  config.model Image do

    object_label_method do
      :image_label_method
    end
    edit do
      field :title
      field :asset
      field :legend
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
       field :main, :wysihtml5
       field :image
       field :objectives
     end
   end

   def image_label_method
    "<img src=\"#{self.asset.mini.url}\"/>".html_safe
   end
end
