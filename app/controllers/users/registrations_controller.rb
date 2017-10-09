class Users::RegistrationsController < Devise::RegistrationsController
  # Extend default Devise registration method
  # So that user coming with Pro account (Plan Id 2)
  # Can save with special Stripe subscription function
  # Otherwise use default devise registration (Plan Id 1)
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end