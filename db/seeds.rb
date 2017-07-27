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
    content: ";lkasjnfg kl;adsjng k;lgnds;f gjkln adsflkngm dsfl;kjbn dsl;kgn dflgmv d;'kmds l;knbdfs lkm   glrjdsflig jdsflkvn dfgbjkn dfl;kgv jbn dlfbkn er'lg dfblvkndf blovdfhj lobdknf q'efkl pivhueor; gkjndf
    ;bvlk edgij ogbivn ;obkf gjop'ertojgh iobnj rtpobjrgop[km ;
    lgbfdm lkbnds;fgk
     [gkdfsmlb ndsflkbmn df;lbmvd;fods g;dofgbm gjo;d sbdfo;j hdops[jb dgop[bj dsbo;j topr[wj d;fbovjk eqrgopj ldir gj;dfsbk dpifbvn dslfbmng eopgisdfa[pikveprgmdfslkmvafs;'lgjepqrobjdarlkgnmer;hoksdf
      [vmdlrkgnosjgkjasgrl;kJnbgkjasrjfgl'asehglkqsdjnfv;'ljsak;jdth4r;
        gjal'asknmg v    asgrjg;kljerov;jm",
    author_id: rand(22) + 1
    )
    question.comments.create!(content: Faker::TwinPeaks.quote, author_id: rand(22) + 1)
    question.votes.create!(value: 1, user_id: rand(22) + 1)
end

  25.times do
    answer = Answer.create!(
      content: "lgbfdm lkbnds;fgk
     [gkdfsmlb ndsflkbmn df;lbmvd;fods g;dofgbm gjo;d sbdfo;j hdops[jb dgop[bj dsbo;j topr[wj d;fbovjk eqrgopj ldir gj;dfsbk dpifbvn dslfbmng eopgisdfa[pikveprgmdfslkmvafs;'lgjepqrobjdarlkgnmer;hoksdf
      [vmdlrkgnosjgkjasgrl;kJnbgkjasrjfgl'asehglkqsdjnfv;'ljsak;jdth4r;
        gjal'asknmg v    asgrjg;kljerov;jm",
        author_id: rand(22) + 1,
        question_id: rand(22) + 1
      )
    answer.comments.create!(content: Faker::TwinPeaks.quote, author_id: rand(22) + 1)
    answer.votes.create!(value: 1, user_id: rand(22) + 1)

  end
