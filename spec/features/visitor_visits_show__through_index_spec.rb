require 'rails_helper'    

describe "As a visitor" do
  describe "when I visit the index page and click on a link to a trip" do
    before(:each) do
      @trip_1 = Trip.create(name: "Bday", start_date: "2018-02-12", end_date: "2108-02-21")
      @trip_2 = Trip.create(name: "Spring Break", start_date: "2018-04-05", end_date: "2018-04-12")
      @trip_3 = Trip.create(name: "Winter", start_date: "2018-12-20", end_date: "2018-12-29")

      @trip_2.trails.create(name: "OBT", length: 10, address: "123 Orange Blossom Trail Rd" )
      @trip_2.trails.create(name: "JY", length: 15, address: "111 John Young pkwy" )
      @trip_2.trails.create(name: "SOIANINO", length: 20, address: "987 Hiawasse Rd" )
    end

    it "takes me to a trip show page with the trip info" do
      visit trips_path
      
      expect(page).to have_content("Bday")
      expect(page).to have_content("Spring Break")
      expect(page).to have_content("Winter")

      click_on "Spring Break"

      expect(page).to have_content("Spring Break")
      expect(page).to have_content("OBT")
      expect(page).to have_content("JY")
      expect(page).to have_content("987 Hiawasse Rd")
    end

    it "Displays total hiking distance" do
      visit trip_path(@trip_2)

      expect(page).to have_content("Spring Break")     
      expect(page).to have_content("Total Hiking Distance: 45")     
      expect(page).to have_content(45)     
    end

    it "Displays total hiking distance" do
      @trail = Trail.create(name: "OBT", length: 10, address: "123 Orange Blossom Trail Rd" )
      @trip_1 = @trail.trips.create!(name: "My Hike", start_date: "02/22/2017", end_date: "02/22/2017")
      @trip_2 = @trail.trips.create!(name: "Ilana's Hike", start_date: "02/22/2017", end_date: "02/22/2017")
      @trip_3 = @trail.trips.create!(name: "Ali's Hike", start_date: "02/22/2017", end_date: "02/22/2017")

      visit trail_path(@trail)

      expect(page).to have_content("OBT")     
      expect(page).to have_content("123 Orange Blossom Trail Rd")     
      expect(page).to have_content(10)     
      expect(page).to have_content(3)     
    end

  end
end