(******************************************************************
 JStar: Separation logic verification tool for Java.  
 Copyright (c) 2007-2008,
    Dino Distefano <ddino@dcs.qmul.ac.uk>
    Matthew Parkinson <Matthew.Parkinson@cl.cam.ac.uk>
 All rights reserved. 
*******************************************************************)

open Jparsetree

let  print_spec cname memb =
  match memb with
  |  Method (modl, jty,n, pars, tc, body) -> Printf.printf "\n%s\n" 
       ("static "^(Pprinter.signature2str (Method_signature (cname,jty,n,pars)))^" : { | } { | };")
  | _ -> ()


let rec print_specs_template program =
  match program with 
  | JFile ( _, _ , cname, _,_ ,ml) -> 
      Printf.printf "\n\n\nclass %s\n{" (Pprinter.class_name2str cname);  
      List.iter (print_spec cname) ml;
      Printf.printf "\n}\n\n\n"

