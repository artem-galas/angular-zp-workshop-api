# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Product.destroy_all

User.create(email: 'test@user.com', password: '123456789')

Product.create(
  [
    {
      title: 'BATMAN: REBIRTH #1',
      price: 2.99,
      description: 'Longtime Batman and Eisner Award-winning writer Scott Snyder co-writes with rising-star writer Tom King!
                    EVIL 365: Gotham City faces the threat of the Calendar Man!',
      image: File.open("#{::Rails.root}/spec/fixtures/BM_REBIRTH_1.jpg")
    },
    {
      title: 'BATMAN #9',
      price: 2.99,
      description: "'I Am Suicide' part one! Batman has always been crazy…but this? This is suicide!
In order to retrieve Psycho-Pirate and save Gotham Girl,
Batman must recruit a team from Amanda Waller to break into the most impenetrable prison in the world and steal from one of the Dark Knight’s greatest foes…Bane.
The next great Batman story begins here!",
      image: File.open("#{::Rails.root}/spec/fixtures/bm9.jpg")
    },
    {
      title: 'BATMAN ANNUAL #1',
      price: 4.99,
      description: "'SILENT NIGHT'! A hush of winter snowfall has fallen over Gotham City…but a quiet night in this place is never truly quiet.
Batman and his allies—and his many foes—stalk the streets in this icy showcase of top talent.",
      image: File.open("#{::Rails.root}/spec/fixtures/BMAnnual_1.jpg")
    },
    {
      title: 'BATMAN: NIGHT OF THE MONSTER MEN',
      price: 24.99,
      description: "The first crossover of the “Rebirth” era is here!
As a huge storm approaches Gotham City, Batman, Batwoman and Nightwing try and prepare for the worst, but nothing can prepare them for enormous monsters rampaging through the streets!
Batman will need all of his allies to unite in order to stop these mad science monsters from tearing their city apart! Will the Dark Knight, Batwoman, Nightwing, Robin, Spoiler, Orphan and Clayface be enough?
And who is the mastermind behind it all? Collects BATMAN #7-8, NIGHTWING #5-6 and DETECTIVE COMICS #941-942.",
      image: File.open("#{::Rails.root}/spec/fixtures/BM_Night_Monstermen.jpg")
    },
    {
      title: 'BATMAN #21',
      price: 2.99,
      description: "“THE BUTTON” part one! The cataclysmic events of DC UNIVERSE: REBIRTH #1 continue here!
The Dark Knight and The Fastest Man Alive, the two greatest detectives on any world, unite to explore the mystery behind a certain blood-stained smiley button embedded in the Batcave wall.
What starts as a simple investigation turns deadly when the secrets of the button prove irresistible to an unwelcome third party—and it’s not who anyone suspects!
It’s a mystery woven through time, and the ticking clock starts here!",
      image: File.open("#{::Rails.root}/spec/fixtures/BM_21_flat_587e6db0d21955.76753223.jpg")
    },
    {
      title: 'SUPERMAN: REBIRTH #1',
      price: 2.99,
      description: "The world needs a Man of Steel, but can Superman protect the world while raising a super-son with his wife, Lois Lane?
IT BEGINS: Now it's Clark's turn to be Pa Kent and teach his son what it means to be super, but who is hunting Superman's son—and why?",
      image: File.open("#{::Rails.root}/spec/fixtures/SM_REBIRTH__56fb09ab6e2546.64497238.jpg")
    },
    {
      title: 'SUPERMAN #2',
      price: 2.99,
      description: "'THE SON OF SUPERMAN' Chapter Two: In #2, Superboy takes flight as he accompanies his father, the Man of Steel, on their first mission together to confront a creature more dangerous than anyone realizes. Will the duo triumph...or will they die when they face the lethal force of the Eradicator?",
      image: File.open("#{::Rails.root}/spec/fixtures/SM_Cv2_R1_572d21f7f2ebc5.73059879.jpg")
    },
    {
      title: 'SUPERMAN #3',
      price: 2.99,
      description: "'THE SON OF SUPERMAN' Chapter Three: In #3, with a touch that means death, the Eradicator proves he’s a match for Superman, but his super-powered offspring may be more than anyone can handle—including the Man of Tomorrow.",
      image: File.open("#{::Rails.root}/spec/fixtures/SM_Cv3_570bdb41d87cd3.02752404.jpg")
    },
    {
      title: 'SUPERMAN #20',
      price: 2.99,
      description: "'Superman black' part one! A “Superman Reborn Aftermath” tie-in! As the smoke clears the Kents are faced with leaving Hamilton to go back to Metropolis, but someone or something doesn’t want them to leave! Batman and Robin discover something is mysteriously wrong with the son of Superman—he’s losing his powers!",
      image: File.open("#{::Rails.root}/spec/fixtures/SM_20_58797010cb1be9.80300104.jpg")
    },
    {
      title: 'JUSTICE LEAGUE: REBIRTH #1',
      price: 2.99,
      description: "Spinning out of the events of DC UNIVERSE: REBIRTH #1, a new day dawns for Earth’s greatest heroes as they welcome three new members to the team, including…Superman? Who is this strange visitor from a dead world—and can he be trusted? Batman and Wonder Woman aren’t so sure.",
      image: File.open("#{::Rails.root}/spec/fixtures/JUSTLREB_Cv1_5707f634992d22.86891146.jpg")
    },
    {
      title: 'JUSTICE LEAGUE #4',
      price: 2.99,
      description: "'THE EXTINCTION MACHINE' part 4! In the center of the Earth, Superman faces three doomsday machines set to tear the world apart, while Earth’s two Green Lanterns discover just what a purged planet is truly like. The Kindred are awake and hold the truth about the beginnings of humanity.",
      image: File.open("#{::Rails.root}/spec/fixtures/JUSTL_Cv4_57c8c8a951b6d8.05487778.jpg")
    }
  ]
)
