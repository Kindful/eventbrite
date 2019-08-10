module Eventbrite
  class Organization < APIArrayResource
    def self.events(params = {}, token = nil)
      unless organization_id = params.delete(:organization_id)
        raise InvalidRequestError.new("No organization_id provided.")
      end
      response, token = Eventbrite.request(:get, self.events_url(organization_id), token, params)
      Util.convert_to_eventbrite_object(response, token)
    end

    private

    def self.events_url(organization_id)
      "/organizations/#{CGI.escape(organization_id)}/events"
    end
  end
end
