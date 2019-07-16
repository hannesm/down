(*---------------------------------------------------------------------------
   Copyright (c) 2017 The down programmers. All rights reserved.
   Distributed under the ISC license, see terms at the end of the file.
  ---------------------------------------------------------------------------*)

module Top = struct
  let readline = Opttoploop.read_interactive_input
  let exec_phrase ~print_result s =
    try
      let lex = Lexing.from_string s in
      let phrase = !(Opttoploop.parse_toplevel_phrase) lex in
      Ok (Opttoploop.execute_phrase print_result Format.std_formatter phrase)
    with exn ->
      (* We are hitting https://github.com/ocaml/ocaml/issues/6704 here *)
      Error exn

  let use_file = Opttoploop.use_file
  let use_silently = Opttoploop.use_silently
end

let () = if !Sys.interactive then (Down.Private.set_top (module Top))

(*---------------------------------------------------------------------------
   Copyright (c) 2017 The down programmers

   Permission to use, copy, modify, and/or distribute this software for any
   purpose with or without fee is hereby granted, provided that the above
   copyright notice and this permission notice appear in all copies.

   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
   MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
   ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  ---------------------------------------------------------------------------*)
