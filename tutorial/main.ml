let count = ref 0
let () = Random.self_init ()

module Middleware = struct
  let count_requests inner_handler request =
    count := !count + 1;
    inner_handler request
end

let () =
  Dream.run @@ Dream.logger @@ Middleware.count_requests
  @@ Dream.router
       [
         Dream.get "/" (fun _ ->
             Dream.html (Printf.sprintf "Saw %i requests" !count));
         Dream.get "/echo/:word" (fun request ->
             Dream.html (Dream.param request "word"));
         Dream.get "/hanzi" (fun _ ->
             Dream.html ("早上好，世界！<br><h1>" ^ Hanzi.get_random_hanzi () ^ "</h1>"));
       ]
