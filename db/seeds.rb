require 'faker'

25.times do
  User.create!(
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    hashed_password: "dog")
end

25.times do
  question = Question.create!(
    title: Faker::Company.catch_phrase + " " + Faker::Company.catch_phrase,
    content: "Spicy jalapeno bacon ipsum dolor amet brisket picanha pig biltong hamburger frankfurter capicola kevin pancetta strip steak. Venison turkey andouille, ribeye tongue tenderloin pastrami swine shankle meatball pig leberkas. Pastrami tongue pig bacon jerky porchetta, doner swine short loin burgdoggen ball tip filet mignon leberkas jowl turducken. Short ribs kielbasa pastrami pork turducken doner. Short loin meatball picanha landjaeger shoulder bacon porchetta alcatra frankfurter shankle pork chop. Jowl ball tip meatball, strip steak doner pancetta rump tenderloin pork belly pork brisket biltong venison. Ham jowl spare ribs, shankle chuck meatball pork chop ball tip ground round t-bone.

      Pork chop ball tip bacon, ham hock pig kielbasa fatback short loin burgdoggen hamburger sausage. T-bone drumstick landjaeger, pig fatback flank cow shankle filet mignon. Jerky strip steak porchetta, biltong t-bone sausage pork jowl kevin pork chop shoulder turducken frankfurter bresaola. Pancetta shoulder kielbasa tri-tip tail picanha corned beef. Filet mignon biltong chuck tenderloin pork belly. Strip steak sirloin short loin meatball andouille tri-tip spare ribs.",
    author_id: rand(22) + 1
    )
    question.comments.create!(content: Faker::TwinPeaks.quote, author_id: rand(22) + 1)
    question.votes.create!(value: 1, user_id: rand(22) + 1)
end

  25.times do
    answer = Answer.create!(
      content: "Pig turducken strip steak alcatra chicken brisket t-bone kielbasa porchetta ball tip, andouille rump. Short loin cupim ball tip bresaola beef pork belly burgdoggen cow. Cupim tail beef kevin jerky prosciutto, fatback t-bone spare ribs hamburger bresaola salami pork chop. Pork boudin jerky prosciutto tri-tip turkey meatloaf pastrami. Alcatra ground round flank, ham hock spare ribs drumstick pork chop meatball turkey kevin capicola turducken tongue. Brisket drumstick meatball, spare ribs sausage tongue beef ribs tail corned beef. Pork loin porchetta tail short ribs corned beef ham hock jowl tri-tip pork belly filet mignon burgdoggen. Does your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!

        ",
        author_id: rand(22) + 1,
        question_id: rand(22) + 1
      )
    answer.comments.create!(content: Faker::TwinPeaks.quote, author_id: rand(22) + 1)
    answer.votes.create!(value: 1, user_id: rand(22) + 1)

  end
