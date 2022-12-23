let () =
  Random.self_init ();
  
  Dream.run @@ Dream.logger
  @@ fun _ ->
  Dream.html ("早上好，世界！<br><h1>" ^ Hanzi.get_random_hanzi () ^ "</h1>")
