


RailsAdmin.config do |config|
  config.parent_controller = 'ApplicationController'

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # https://github.com/sferik/rails_admin/wiki/Fields
  config.model 'User' do
    # Update which fields are shown for a User listing
    list do
     field :email
     field :current_sign_in_at
     field :sign_in_count
     field :created_at
    end
    # Update which fields are shown when editing a User
    # partials are stored in app/views/rails_admin/main/
    edit do
      configure :roles_mask do
        partial "roles_mask"
      end
    end      
  end

end
