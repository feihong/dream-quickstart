let random_int_inclusive min max =
  let n = max - min + 1 in
  Random.int n + min

let get_hanzi n =
  let buf = Buffer.create 1 in
  Buffer.add_utf_8_uchar buf (Uchar.of_int n);
  Buffer.contents buf

let get_random_hanzi () = get_hanzi (random_int_inclusive 0x4e00 0x9fff + 1)
