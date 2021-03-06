include module type of Mir
open Core_kernel

val string_of_location : location -> string
val string_of_location_span : location_span -> string
val operator_of_string : string -> operator option
val string_of_operator : operator -> string
val string_of_internal_fn : internal_fn -> string
val internal_fn_of_string : string -> internal_fn option
val internal_funapp : internal_fn -> 'a with_expr list -> 'a -> 'a with_expr
val no_loc : location
val no_span : location_span
val merge_spans : location_span -> location_span -> location_span
val internal_meta : mtype_loc_ad
val loop_bottom : mtype_loc_ad with_expr
val zero : mtype_loc_ad with_expr
val pp_indexed : 'a Fmt.t -> Format.formatter -> string * 'a index list -> unit
val pp_expr_typed_located : Format.formatter -> mtype_loc_ad with_expr -> unit
val remove_size : 'a sizedtype -> unsizedtype

val pp_typed_prog :
  Format.formatter -> ('a with_expr, ('b, 'c) stmt_with) prog -> unit

val sexp_of_expr_typed_located : 'a with_expr -> Sexp.t
val gensym : unit -> string
val gensym_enter : unit -> string * (unit -> unit)

val check_compatible_arguments_mod_conv :
     string
  -> (Mir.autodifftype * Mir.unsizedtype) list
  -> (Mir.autodifftype * Mir.unsizedtype) list
  -> bool
(** Check that the rhs list of function argument types can be converted to the
    lhs *)

val check_of_same_type_mod_array_conv :
  string -> Mir.unsizedtype -> Mir.unsizedtype -> bool
(** Check that the rhs type can be converted to the lhs, where we allow
    conversion inside an array constructor *)

val stan_math_returntype :
  string -> (Mir.autodifftype * Mir.unsizedtype) list -> Mir.returntype option
(** Get an optional return type for a Stan Math library function, given its name and argument types. *)

val is_stan_math_function_name : string -> bool
(** Check whether a string is the name of a Stan Math library function. *)

val list_all_math_lib_fn_sigs : string -> unsizedtype list
(** List all the signatures of a math library function, for the purposes of error messages. *)

val operator_return_type_from_string :
  string -> (autodifftype * unsizedtype) sexp_list -> returntype option

val operator_return_type :
  operator -> (autodifftype * unsizedtype) sexp_list -> returntype option

val string_of_operators : (string, string sexp_list) Map.Poly.t
val ternary_if : string
