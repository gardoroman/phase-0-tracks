#Exercise 5.5 Nested Data Structures
artist = {
  "Miles Davis" => {
      
    "Kind of Blue" => {
    released: "August 17, 1959",
    recorded: "03/02/1959 – 04/22/1959",
    label: "Columbia",
    personnel: {
      trumpet: "Miles Davis", 
      piano: "Bill Evans",
      tenor_sax: "John Coltrane",
      alto_sax: "Cannonball Adderley",
      bass: "Paul Chambers",
      drums: "Jimmy Cobb"
    },
    songs: [
      "So What",
      "Freddie Freeloader",
      "Blue in Green",
      "All Blues",
      "Flamenco Sketches"
    ]
    },
    "Miles Davis All Stars, Volume 1" => {
    released: "1955",
    recorded: "12/24/1954",
    label: "Prestige",
    personnel: {
      trumpet: "Miles Davis", 
      piano: "Thelonius Monk",
      vibraphone: "Milt Jackson",
      bass: "Percy Heath",
      drums: "Kenny Clarke"
    },
    songs: [
      "Bag's Groove",
      "Swing Spring"
    ]
    }
    
    
  },
  "Ahmad Jamal" => {
    "At the Pershing" => {
    released: "1958",
    recorded: "01/16/1958",
    label: "Argo",
    personnel: {
      piano: "Ahmad Jamal",
      bass: "Israel Crosby",
      drums: "Vernel Fournier"
    },
    songs: [
      "But Not For Me",
      "Surrey with the Fringe on Top",
      "Moonlight in Vermont",
      "Put Another Nickel in",
      "No Greater Love",
      "Poinciana",
      "Woody N' You",
      "What's New?"
    ]
    }
  }

} 


puts "Showing personnel on the recording of 'Kind of Blue'"
p miles_davis[:personnel]
puts ""
puts "Showing the piano player on the recording"
p miles_davis[:personnel][:piano]
puts ""

puts "Adding an additional piano player"
p miles_davis[:personnel][:piano_alternate] = 'Wynton Kelly'
puts "Showing personnel after the addition"
p miles_davis[:personnel]
puts ""

puts "Displaying track listing"
p miles_davis[:songs]
puts "Displaying the first track"
p miles_davis[:songs].first  
puts "Adding alternate track"
miles_davis[:songs].push('Flamenco Sketches (alternate take)')
puts "Displaying tracks after the addition"
p miles_davis[:songs]


puts "Displaying information on the nested structure"
puts ""
puts "Class of the main data structure 'miles_davis'"
puts miles_davis.class
puts ""

puts "Class of the 'miles_davis[:personnel][:trumpet]'"
puts miles_davis[:personnel][:trumpet].class
puts ""

puts "Class of the 'miles_davis[:songs]'"
puts miles_davis[:songs].class

