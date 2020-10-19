require 'rails_helper'

describe 'Group Event API', type: :request do
  let(:event) { FactoryBot.create(:group_event, name: 'Birthday', description: '18TH  Birthday', startDate: '2020 10 17', endDate: '2020 10 20', published: 'true', location: 'Asokoro') }
  let(:anEvent) { GroupEvent.find(event.id)}

  describe 'GET /group_events' do
    it 'returns all group events with status 200' do
      2.times do
        FactoryBot.create(:group_event, name: 'Birthday', description: '18TH  Birthday', startDate: '2020 10 17', endDate: '2020 10 20', published: 'true', location: 'Asokoro')
      end

      get '/group_events'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eql(2)
    end
  end


  describe 'POST /group_events' do
    it 'posts a new group event' do
      expect {
        post '/group_events', params: {name: 'Posted Event', description: 'Posted test event', startDate: '2020 10 17', endDate: '2020 10 20', published: 'false', location: 'Berlin'}
      }.to change { GroupEvent.count }.from(0).to(1)
      
      expect(response).to have_http_status(:created)
    end
  end


  describe 'DELETE /group_events/:id' do
    it 'sends a successful request' do
      delete "/group_events/#{event.id}"
      expect(response).to have_http_status(:no_content)
    end

    it 'tests that the event isn\'t removed from the db' do
      delete "/group_events/#{event.id}"
      expect(GroupEvent.count).to eql(1)
    end

    it 'tests that the deleted column of the event is set to true' do
      delete "/group_events/#{event.id}"
      expect(anEvent.deleted).to eql(true)
    end
  end
  

  describe 'PATCH /group_events' do
    it 'updates an event and returns status of success' do
      patch "/group_events/#{event.id}", params: {name: 'Patched Event', description: 'Patched test event', startDate: '2020 10 17', endDate: '2020 10 20', published: 'false', location: 'Berlin'}
      
      expect(response).to have_http_status(:success)
      expect(anEvent.name).to eql('Patched Event')
    end
  end
end