let () = Random.self_init ()

module Middleware = struct
  let successful = ref 0
  let failed = ref 0

  let count_requests inner_handler request =
    try%lwt
      let%lwt response = inner_handler request in
      successful := !successful + 1;
      Lwt.return response
    with exn ->
      failed := !failed + 1;
      raise exn
end

let () =
  Dream.run @@ Dream.logger @@ Middleware.count_requests
  @@ Dream.router
       [
         Dream.get "/" (fun _ ->
             Dream.html
               (Printf.sprintf
                  "Saw %3i successful requests, %3i failed requests"
                  !Middleware.successful !Middleware.failed));
         Dream.get "/echo/:word" (fun request ->
             Dream.html (Dream.param request "word"));
         Dream.get "/hanzi" (fun _ ->
             Dream.html ("早上好，世界！<br><h1>" ^ Hanzi.get_random_hanzi () ^ "</h1>"));
       ]
