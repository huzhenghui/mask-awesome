* [pastel](#pastel)
* [Mask SubCommands](#mask-subcommands)
  * [pastel-help](#pastel-help)
    * [pastel-help-output](#pastel-help-output)
  * [pastel-list](#pastel-list)
    * [pastel-list-screenshot](#pastel-list-screenshot)
  * [pastel-list-rgb](#pastel-list-rgb)
    * [pastel-list-rgb-screenshot](#pastel-list-rgb-screenshot)
  * [pastel-random](#pastel-random)
    * [pastel-random-screenshot](#pastel-random-screenshot)
  * [pastel-distinct](#pastel-distinct)
    * [pastel-distinct-screenshot](#pastel-distinct-screenshot)
  * [pastel-pick-0](#pastel-pick-0)
    * [pastel-pick-0-screenshot](#pastel-pick-0-screenshot)
  * [begin: mask task in template](#begin-mask-task-in-template)
  * [readme](#readme)
    * [build.ninja](#buildninja)
    * [ninja custom-rule](#ninja-custom-rule)
      * [File for saving screen output log](#file-for-saving-screen-output-log)
      * [Remove screen output log file if generated before](#remove-screen-output-log-file-if-generated-before)
      * [Generate screen output log file until success](#generate-screen-output-log-file-until-success)
        * [Check if screen output log have generated and received data](#check-if-screen-output-log-have-generated-and-received-data)
        * [Set a file name which will be a FIFO for retrieve screen output log](#set-a-file-name-which-will-be-a-fifo-for-retrieve-screen-output-log)
        * [Output the file name for debug](#output-the-file-name-for-debug)
        * [Make FIFO file on the file name](#make-fifo-file-on-the-file-name)
        * [Execute mask subcommand in screen from retrieve log](#execute-mask-subcommand-in-screen-from-retrieve-log)
          * [Use log in screen and specific log file name](#use-log-in-screen-and-specific-log-file-name)
          * [Start screen in detached mode and set the name of the new session to sessionname](#start-screen-in-detached-mode-and-set-the-name-of-the-new-session-to-sessionname)
          * [The commands which execute in screen](#the-commands-which-execute-in-screen)
          * [Execute mask subcommand by stdbuf](#execute-mask-subcommand-by-stdbuf)
          * [Output watermark with date colored by lolcat](#output-watermark-with-date-colored-by-lolcat)
        * [Retrieve screen output log to save to screen output log file](#retrieve-screen-output-log-to-save-to-screen-output-log-file)
      * [Convert screen output log file to image by a series converter](#convert-screen-output-log-file-to-image-by-a-series-converter)
        * [Convert screen output log file which is embedded by ANSI codes to HTML](#convert-screen-output-log-file-which-is-embedded-by-ansi-codes-to-html)
        * [Save HTML to temp file for debug](#save-html-to-temp-file-for-debug)
        * [Convert HTML format to image](#convert-html-format-to-image)
    * [ninja custom-build](#ninja-custom-build)
  * [readme-graph-dot](#readme-graph-dot)
    * [readme-graph-dot-output](#readme-graph-dot-output)
  * [readme-graph-dot-xdot](#readme-graph-dot-xdot)
  * [readme-graph-png](#readme-graph-png)
  * [end: mask task in template](#end-mask-task-in-template)
