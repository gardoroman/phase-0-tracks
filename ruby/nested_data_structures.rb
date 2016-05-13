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

puts "Personnel on Kind of Blue"
puts artist["Miles Davis"]["Kind of Blue"][:personnel]
puts "Piano player on Kind of Blue"
puts artist["Miles Davis"]["Kind of Blue"][:personnel][:piano]
puts ""
puts "Adding an additional piano player on Kind of Blue"
p artist["Miles Davis"]["Kind of Blue"][:personnel][:piano_alternate] = 'Wynton Kelly'
puts "Showing personnel after the addition"
p artist["Miles Davis"]["Kind of Blue"][:personnel]
puts ""
puts "Personnel on Miles Davis All Stars, Volume 1"
puts artist["Miles Davis"]["Miles Davis All Stars, Volume 1"][:personnel]
puts "Vibraphone player on Miles Davis All Stars"
puts artist["Miles Davis"]["Miles Davis All Stars, Volume 1"][:personnel][:vibraphone]
puts ""
puts "Personnel on At the Pershing"
puts artist["Ahmad Jamal"]["At the Pershing"][:personnel]
puts "Piano player on At the Pershing"
puts artist["Ahmad Jamal"]["At the Pershing"][:personnel][:piano]
puts ""



puts "Displaying track listing of Kind of blue"
p artist["Miles Davis"]["Kind of Blue"][:songs]
puts "Displaying the first track"
puts artist["Miles Davis"]["Kind of Blue"][:songs].first  
puts ""
puts "Adding alternate track"
artist["Miles Davis"]["Kind of Blue"][:songs].push('Flamenco Sketches (alternate take)')
puts "Displaying tracks after the addition"
p artist["Miles Davis"]["Kind of Blue"][:songs]