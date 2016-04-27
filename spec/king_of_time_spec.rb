require 'spec_helper'

describe KingOfTime do

  let(:king_of_time) do
    KingOfTime.new(
      {
        name: '松倉 友樹',
        employee_id: 2222222222,
        timerecorder_id: 1111111111,
      }
    )
  end

  let(:method) { :start_break }

  shared_examples 'success' do
    it 'should be respond OK' do
      VCR.use_cassette(method.to_s) do
        response = king_of_time.send(method)
        expect(response.code).to eq 200
        expect(response.body).to include 'OK'
      end
    end
  end

  it_behaves_like 'success' do
    let(:method) { :check_in }
  end
  it_behaves_like 'success' do
    let(:method) { :check_out }
  end
  it_behaves_like 'success' do
    let(:method) { :start_break }
  end
  it_behaves_like 'success' do
    let(:method) { :end_break }
  end
end

