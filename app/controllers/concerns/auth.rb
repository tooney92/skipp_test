# frozen_string_literal: true

module Auth
  include JsonResponse
  def admin?
    json_error_response('unauthorized', :unauthorized) unless Admin.find_by_user_id(@current_user['user_id'])
  end
end
