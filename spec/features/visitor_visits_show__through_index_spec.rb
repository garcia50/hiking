require 'rails_helper'    

describe "As a visitor" do
  describe "when I visit the index page and click on a link to a trip" do
    it "takes me to a trip show page with the trip info" do
      trip_1 = Trip.create(name: "Bday", start_date: "2018-02-12", end_date: "2108-02-21")
      trip_2 = Trip.create(name: "Spring Break", start_date: "2018-04-05", end_date: "2018-04-12")
      trip_3 = Trip.create(name: "Winter", start_date: "2018-12-20", end_date: "2018-12-29")

      trip_2.trails.create(name: "OBT", length: 10, address: "123 Orange Blossom Trail Rd" )
      trip_2.trails.create(name: "JY", length: 15, address: "111 John Young pkwy" )
      trip_2.trails.create(name: "SOIANINO", length: 20, address: "987 Hiawasse Rd" )

      visit trips_path
      
      expect(page).to have_content("Bday")
      expect(page).to have_content("Spring Break")
      expect(page).to have_content("Winter")
save_and_open_page
    
      click_on "Spring Break"

      expect(page).to have_content("Spring Break")
      expect(page).to have_content("OBT")
      expect(page).to have_content("JY")
      expect(page).to have_content("987 Hiawasse Rd")

    end
  end
end
