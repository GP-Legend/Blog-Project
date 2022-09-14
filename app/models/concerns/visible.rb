module Visible
  #We can add our status validation to the concern, but this is slightly more
  #complex as validations are methods called at the class level. The
  #ActiveSupport::Concern (API Guide) gives us a simpler way to include them:
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: {in: VALID_STATUSES }
  end

  #Here is an explanation of the 'class_methods' method from the tutorial site:
  #Class methods can also be added to concerns. If we want to display a count of
  #public articles or comments on our main page, we might add a class method to
  #Visible as follows:
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end
  #Then in the view, you can call it like any class method: (go to )

  def archived?
    status == 'archived'
  end
end

#A concern is only responsible for a focused subset of the model's
#responsibility; the methods in our concern will all be related to the
#visibility of a model.
