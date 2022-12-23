let () =
  Random.self_init ();

  Dream.run @@ Dream.logger
  @@ Dream.router
       [
         Dream.get "/" (fun _ -> Dream.html "Good morning, world");
         Dream.get "/echo/:word" (fun request ->
             Dream.html (Dream.param request "word"));
         Dream.get "/hanzi" (fun _ ->
             Dream.html ("早上好，世界！<br><h1>" ^ Hanzi.get_random_hanzi () ^ "</h1>"));
       ]
