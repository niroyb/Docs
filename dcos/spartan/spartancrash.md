      C:\Users\azureuser>type C:\DCOS\spartan\service\environment-file
      MASTER_SOURCE=exhibitor
      EXHIBITOR_ADDRESS=192.168.255.5

      C:\Users\azureuser>set MASTER_SOURCE=exhibitor

      C:\Users\azureuser>set EXHIBITOR_ADDRESS=192.168.255.5

      C:\Users\azureuser>cd "C:\DCOS\erl8.3\erts-8.3\bin

      C:\DCOS\erl8.3\erts-8.3\bin>erl.exe -noshell -noinput +Bd -mode embedded -rootdir "C:\DCOS\spartan\release\spartan" -boot "C:\DCOS\spartan\release\spartan\releases\0.0.1\spartan" -boot_var ERTS_LIB_DIR "C:\DCOS\spartan\release\lib" -boot_var RELEASE_DIR "C:\DCOS\spartan\release\spartan" -config "C:\DCOS\spartan\sys.spartan.config" -args_file "C:\DCOS\spartan\vm.spartan.args" -pa -- foreground"
      kernel-poll not supported; "K" parameter ignored
      Setup running ...
      Directories verified. Res = {[ok],[]}
      Setup finished processing hooks ...
      [error] <0.958.0> CRASH REPORT Process <0.958.0> with 0 neighbours exited with reason: no match of right hand value {error,eaddrnotavail} in spartan_udp_server:init/1 line 49 in gen_server:init_it/6 line 352
      [error] <0.939.0> Supervisor spartan_sup had child {spartan_udp_server,{169,254,197,216}} started with spartan_udp_server:start_link({169,254,197,216}) at undefined exit with reason no match of right hand value {error,eaddrnotavail} in spartan_udp_server:init/1 line 49 in context start_error
      {"Kernel pid terminated",application_controller,"{application_start_failure,spartan,{bad_return,{{spartan_app,start,[normal,[]]},{'EXIT',{{badmatch,{error,{{shutdown,{failed_to_start_child,ranch_acceptors_sup,{listen_error,{spartan_tcp_listener,{169,254,197,216}},eaddrnotavail}}},{child,undefined,{ranch_listener_sup,{spartan_tcp_listener,{169,254,197,216}}},{ranch_listener_sup,start_link,[{spartan_tcp_listener,{169,254,197,216}},100,ranch_tcp,[{port,53},{ip,{169,254,197,216}},{send_timeout,3000}],spartan_tcp_handler,[]]},permanent,infinity,supervisor,[ranch_listener_sup]}}}},[{spartan_app,start_tcp_listener,1,[{file,\"d:/DCOS/spartan/spartan/_build/default/lib/spartan/src/spartan_app.erl\"},{line,108}]},{lists,foreach,2,[{file,\"lists.erl\"},{line,1338}]},{spartan_app,start,2,[{file,\"d:/DCOS/spartan/spartan/_build/default/lib/spartan/src/spartan_app.erl\"},{line,36}]},{application_master,start_it_old,4,[{file,\"application_master.erl\"},{line,273}]}]}}}}}"}
      Kernel pid terminated (application_controller) ({application_start_failure,spartan,{bad_return,{{spartan_app,start,[normal,[]]},{'EXIT',{{badmatch,{error,{{shutdown,{failed_to_start_child,ranch_accept

      Crash dump is being written to: erl_crash.dump...done

      C:\DCOS\erl8.3\erts-8.3\bin>
