��    �                    
  �   
  �  �
  �   S    O  �   T  �   �    �  �   �  �   �  �   v  �   5  V   �  k   2  Z   �  �   �    �  �   �  �   �  �   t  *  `    �  x   �  �     �   �  �   �  F   m  �   �  �   y  �        �"     �"     �"     �"  -   #  =   5#  I   s#  M   �#  9   $  A   E$  D   �$  	   �$     �$     �$     �$     �$  =   %  
   L%  #   W%     {%     %     �%     �%  .   �%     �%     �%  l   �%  	   g&     q&     &     �&  7   �&  <   �&  K   '     ]'     t'     �'  b   �'  @   �'     *(     /(     ?(     C(     T(  
   \(     g(     y(     ~(  	   �(     �(  %   �(     �(     �(     �(  
   �(     �(  '   )     -)     5)     H)     _)  A   ~)     �)     �)  ?   �)     ,*     A*  5   Z*  E   �*     �*     �*     �*  #   +     *+     /+     6+     H+     Z+  "   i+     �+     �+     �+      �+     �+     �+  *   �+     ,     &,     5,     =,     E,     J,     \,     s,     v,     },     �,     �,  $   �,     �,     �,      -     -     -     -     -     /-     A-     X-     \-     b-     u-     �-  	   �-     �-     �-  "   �-     �-     .     5.     E.  
   U.  *   `.  k   �.  +   �.     #/     7/     >/     M/  ?   f/  �  �/  �   .1  v  �1    n3    z4  �   �5  �   6    �6  �   8  �   �8  �   �9  �   r:  V   ;  X   o;  Z   �;  �   #<    =  �   !>  �   �>  �   �?  *  �@    �A  x   �B  �   0C  �   D  �   �D  F   �E  �   �E  �   �F  �  DG  '   �I     �I     J     J  -   9J  B   gJ  N   �J  N   �J  ;   HK  B   �K  N   �K  	   L      L     2L     8L     FL  =   \L     �L  #   �L     �L     �L     �L     �L  D   �L     AM     UM  l   aM     �M     �M     �M  
   N  7   N  <   ON  K   �N     �N     �N     �N  b   O  @   dO     �O     �O     �O     �O     �O     �O     �O     �O      P     P     P  %   &P     LP     aP     oP  
   �P     �P  3   �P     �P     �P     �P     Q  A   #Q     eQ  %   wQ  R   �Q     �Q     R  5   R  E   TR     �R     �R     �R  #   �R     �R     �R     �R     S     %S  6   4S     kS     sS  
   �S  /   �S     �S     �S  -   �S     T     $T     8T     @T     HT     MT     fT     �T     �T     �T     �T     �T  $   �T     �T  &   �T     U     "U     /U     2U     8U     PU     nU     �U     �U     �U  "   �U     �U  	   �U     �U     V  "   +V     NV     kV     �V     �V  
   �V  1   �V  r   �V     VW     rW     �W     �W     �W  =   �W   
      A language is missing in the list? File a ticket in the
      <a href="http://dev.pocoo.org/projects/pygments">Pygments trac</a> and we add that as soon
      as possible. 
      Good question. Basically the world doesn't need another pastebin.
      There is <a href="http://pastie.caboo.se/">pastie</a> and
      <a href="http://dpaste.com/">dpaste.com</a> which
      both use kick-ass highlighting libraries for highlighting the
      code and both have an	intuitive user interface. Nevertheless there
      are some features which are unique to LodgeIt. 
      This paste was founded by <a href="http://lucumr.pocoo.org/">Armin Ronacher</a>
      from the Pocoo team and is now maintained by
      <a href="http://webshox.org">Christopher Grebs</a>.  Pygments is a Pocoo project
      led by Georg Brandl. 
      You have selected the multi-file highlighter.  This highlighter allows
      you to paste multiple different files that belong together.  For more
      information have a look at <a href="/help/advanced/">the advanced
      features help page</a>.
     
    A new editor window will open with the contents of the old paste. Just
    do your changes and click "paste" to submit them. 
    All you have to do to paste the current range or whole buffer to lodgeit
    is executing <tt>:Lodgeit</tt>. If you want you can map this command to
    a mapping like ctrl+p by adding this to your vimrc: 
    Alternatively you can use the JSON API.  Basically what you do is sending
    the function arguments as a serialized JSON object or array to the JSON URL
    from above with the method name as URL parameter.  You can do this for
    example by using the curl command line tool:
   
    Another way of creating a new paste is to reply to an existing paste.
    When looking at a paste click on the "Paste Details" link to open the
    paste menu. From there select the "reply to this paste" link. 
    Both the filename and the formatter key is optional.  If no formatter
    key is provided the formatter is guessed from the filename.  If the
    filename is given it will be used as headline for the section.
   
    Even if someone copied over the paste by hand to make changes you can
    still compare those two pastes if you enter the id of the other paste
    into the textfield and click compare. 
    For some popular editors lodgeit integration scripts/plugins exist.
    Additionally there is also a small script that allows pasting from the
    command line. 
    Here you can read about the features of LodgeIt and how to use them
    properly. 
    Here you can see the requested tree of paste replies. The paste you're
    coming from is highlighted. 
    If Vim is your editor you can paste and download pastes directly from
    within Vim. 
    If someone replies to one of your pastes you will get a notification the
    next time you visit the pastebin. This however doesn't work for pastes
    older than 31 days because after that time you get a new cookie for
    privacy reasons. 
    If the paste you're looking at is a reply to another paste you can
    compare it with the parent paste by clicking on the "compare it with
    parent paste" link. If this paste has pastes that replied to you will
    see a list of replies in the detail box. 
    If you are looking at a paste you can toggle the paste detail
    box by clicking on "paste detail". From there you have (depending on
    the type of paste) a couple of options: 
    If you select the "Multi-File" formatter from the list you can combine
    multiple files into one paste.  Each file has to be introduced with a
    formatter line of the following format:
   
    If you use the reply feature a link to the parent paste is created
    automatically. This allows you to compare those two pastes with one
    click to find changes easily. For information about the diff view
    head over to the  
    If you use the web interface to create new pastes the process is
    straightforward. All you have to do is to click on the <a href="/">new</a>
    tab and fill in the text field. Additionally you should select a proper
    highlighter from the list below to make it easier to read your paste. 
    If you want to reply to a paste from within Vim you can call
    <tt>:Lodgeit PASTE_URL</tt> or <tt>:Lodgeit #PASTE_ID</tt> and load the
    paste into a new tab. After modifing it you can push the new version to
    the server using <tt>:Lodgeit</tt>. 
    If you want to see all pastes that are somehow related to the current
    one, click on the "show paste tree" link: 
    If you want to use lodgeit on your project's IRC channel you can add
    <code>+FORMATTER</code> to the URL where <code>FORMATTER</code> is the
    name of the formatter to select from the list below:
   
    In any case you can reply to that paste by clicking on the
    "reply to this paste" link. Also always possible is downloading the
    paste, changing the color scheme and toggeling the line numbers. 
    In the diff view you can see the differences between two pastes. Deleted
    lines have a redish background, added lines a bright green one. You can
    also download the changes as unified diff. 
    LodgeIt supports currently two APIs: XMLRPC and good old JSON.
   
    This will use various guessing methods to get the correct language of
    the file. If all guessing fails it falls back to a normal text paste.
    You can also provide the language yourself. 
    You can connect to the XMLRPC interface with any XMLRPC library. If you're
    using Python the following piece of code connects you to the XMLRPC service: 
    You need a working installation of <a href="http://pymacs.progiciels-bpi.ca/">Pymacs</a>.
    For Linux users, many distributions already include a package; otherwise, refer to the
    <a href="http://pymacs.progiciels-bpi.ca/manual/Installation.html#Installation">Pymacs documentation</a>
    for help. If Pymacs is working, you just need to put <tt>paste.py</tt> into a directory where
    Pymacs can find it (see the variable <tt>pymacs-load-path</tt>), and add the line
    <tt>(pymacs-load "paste")</tt> to your <tt>.emacs</tt> file. If you want a Pastebin menu in
    your menu bar, you also need to add the line <tt>(paste-menu)</tt>.  Why the hell another pastebin?  page. Have fun :-)  to add a new paste. ### filename [formatter key] (^P is entered using ctrl + v, ctrl + in vim) <a href="http://jinja.pocoo.org/2">Jinja 2</a> for templating <a href="http://pygments.pocoo.org/">Pygments</a> for syntax highlighting <a href="http://werkzeug.pocoo.org/">Werkzeug</a> for the WSGI implementation <a href="http://www.jquery.com/">jQuery</a> for scripting <a href="http://www.python.org/">Python</a> as scripting language <a href="http://www.sqlalchemy.org">SQLAlchemy</a> as database layer API URLs: API documentation About About LodgeIt Advanced Features After you have finished just hit "paste" to submit the paste. All Pastes Alternatively you can also use the  CSV Click  Command Line Script Comparing Pastes Could not submit your paste because %(error)s. Creating New Pastes Creole Wiki Detailed usage instructions are located at <a href="http://lunaryorn.de/projects/paste/">on the project page Download: Emacs Support Error While Pasting Features For a list of all supported methods see the list below. For a list of supported languages use the following command: For example if you want to fetch one paste from the server you can do this: Formatter Preselection GCC Messages Help If multiple files are given, they will be put into one paste using the
    "multi-file" formatter. If no file is given it will read from the standard input stream. JSON JSON Quickstart Key LodgeIt version: Methods Multi-File Multi-File Pastes Name New New Paste No pastes found Note the trailing slash in both URLs! Page Not Found Paste Details Paste Notifications Paste Tree Paste! Please fill out the CAPTCHA to proceed: Privacy Replying to Pastes Request More Languages Scripts and Editor Integration Select the topic you're interested in from the list on the right. Software Used Someone Replied To Your Paste Sorry, but the page you requested was not found on this server. Supported Formatters Tab-key inserts tabstops The list of formatters is on the bottom of this page. The usage is pretty simple, to paste a file use the following command Unified Diff Using the LodegeIt API Vim Support Welcome to the LodgeIt Help Section Who? XMLRPC XMLRPC Entrypoint XMLRPC Quickstart XMLRPC support a captcha you can't see.  Sorry :( change clean user interface compare compare it with the parent paste compare with paste contains different color schemes for the sourcecode documentation download paste earlier greater here hide this message hide this notification is is not javac Messages later lodgeit.py --languages lodgeit.py -l LANGUAGE /path/to/file lodgeit.py /path/to/file look at the parent paste lower new filter:  ok page. pasted on %(date)s persistent pastes posted on %(pub_date)s raw reply reply notification reply to pastes reply to this paste same date screenshot of the diff viewer screenshot of the form screenshot of the paste detail box screenshot of the paste tree select different colorscheme service.
       show paste tree startswith support for many python template languages support for many scripting languages like Python and Ruby, even with
           weird syntax (ruby *cough*) the following pastes replied to this paste: toggle line numbers update valid HTML 4.0 your paste contains spam your paste contains spam and the CAPTCHA solution was incorrect Project-Id-Version: PROJECT VERSION
Report-Msgid-Bugs-To: EMAIL@ADDRESS
POT-Creation-Date: 2016-04-19 17:01+0900
PO-Revision-Date: 2015-10-09 19:00+0200
Last-Translator: Christopher Grebs <cg@webshox.org>
Language-Team: de <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 1.3
 
      Eine Sprache steht nicht in der Liste? Erstelle einfach ein Ticket im
      <a href="http://dev.pocoo.org/projects/pygments">Pygments Trac</a> und wir fügen sie so schnell wie möglich hinzu.
 
    Gute Frage, die Welt braucht eigentlich keinen weiteren Pastebin.
    Es gibt <a href="http://pastie.caboo.se/">pastie</a> und 
    <a href="http://dpaste.com/">dpaste.com</a>, welche beide
    fantastische Bibliotheken zum hervorheben des Codes nutzen, und beide
    ein intuitives Interface haben.
    Dennoch gibt es einige Funktionen die LodgeIt einzigartig machen. 
      Dieses Pastebin wurde von <a href="http://lucumr.pocoo.org/">Armin Ronacher</a>
      vom Pocoo Team gegründet und wird nun von
      <a href="http://webshox.org">Christopher Grebs</a> verwaltet.
      Pygments ist ein Pocoo Projekt geleitet von Georg Brandl. 
      Du hast die Mehrere-Dateien Formattierung ausgewählt.  Mit Hilfe
      dieser Funktion kannst du mehrere verschiedene Dateien, die
      zusammen gehören in ein Paste packen.  Für mehr Informationen
      darüber schau in <a href="/help/advanced/">die Hilfe</a>.
     
    A new editor window will open with the contents of the old paste. Just
    do your changes and click "paste" to submit them. 
    All you have to do to paste the current range or whole buffer to lodgeit
    is executing <tt>:Lodgeit</tt>. If you want you can map this command to
    a mapping like ctrl+p by adding this to your vimrc: 
    Alternatively you can use the JSON API.  Basically what you do is sending
    the function arguments as a serialized JSON object or array to the JSON URL
    from above with the method name as URL parameter.  You can do this for
    example by using the curl command line tool:
   
    Another way of creating a new paste is to reply to an existing paste.
    When looking at a paste click on the "Paste Details" link to open the
    paste menu. From there select the "reply to this paste" link. 
    Both the filename and the formatter key is optional.  If no formatter
    key is provided the formatter is guessed from the filename.  If the
    filename is given it will be used as headline for the section.
   
    Even if someone copied over the paste by hand to make changes you can
    still compare those two pastes if you enter the id of the other paste
    into the textfield and click compare. 
    For some popular editors lodgeit integration scripts/plugins exist.
    Additionally there is also a small script that allows pasting from the
    command line. 
    Here you can read about the features of LodgeIt and how to use them
    properly. 
    Hier siehst du den Paste-Baum dem der Paste angehört von dem du
    gekommen bist. 
    If Vim is your editor you can paste and download pastes directly from
    within Vim. 
    If someone replies to one of your pastes you will get a notification the
    next time you visit the pastebin. This however doesn't work for pastes
    older than 31 days because after that time you get a new cookie for
    privacy reasons. 
    If the paste you're looking at is a reply to another paste you can
    compare it with the parent paste by clicking on the "compare it with
    parent paste" link. If this paste has pastes that replied to you will
    see a list of replies in the detail box. 
    If you are looking at a paste you can toggle the paste detail
    box by clicking on "paste detail". From there you have (depending on
    the type of paste) a couple of options: 
    If you select the "Multi-File" formatter from the list you can combine
    multiple files into one paste.  Each file has to be introduced with a
    formatter line of the following format:
   
    If you use the reply feature a link to the parent paste is created
    automatically. This allows you to compare those two pastes with one
    click to find changes easily. For information about the diff view
    head over to the  
    If you use the web interface to create new pastes the process is
    straightforward. All you have to do is to click on the <a href="/">new</a>
    tab and fill in the text field. Additionally you should select a proper
    highlighter from the list below to make it easier to read your paste. 
    If you want to reply to a paste from within Vim you can call
    <tt>:Lodgeit PASTE_URL</tt> or <tt>:Lodgeit #PASTE_ID</tt> and load the
    paste into a new tab. After modifing it you can push the new version to
    the server using <tt>:Lodgeit</tt>. 
    If you want to see all pastes that are somehow related to the current
    one, click on the "show paste tree" link: 
    If you want to use lodgeit on your project's IRC channel you can add
    <code>+FORMATTER</code> to the URL where <code>FORMATTER</code> is the
    name of the formatter to select from the list below:
   
    In any case you can reply to that paste by clicking on the
    "reply to this paste" link. Also always possible is downloading the
    paste, changing the color scheme and toggeling the line numbers. 
    In the diff view you can see the differences between two pastes. Deleted
    lines have a redish background, added lines a bright green one. You can
    also download the changes as unified diff. 
    LodgeIt supports currently two APIs: XMLRPC and good old JSON.
   
    This will use various guessing methods to get the correct language of
    the file. If all guessing fails it falls back to a normal text paste.
    You can also provide the language yourself. 
    You can connect to the XMLRPC interface with any XMLRPC library. If you're
    using Python the following piece of code connects you to the XMLRPC service: 
    You need a working installation of <a href="http://pymacs.progiciels-bpi.ca/">Pymacs</a>.
    For Linux users, many distributions already include a package; otherwise, refer to the
    <a href="http://pymacs.progiciels-bpi.ca/manual/Installation.html#Installation">Pymacs documentation</a>
    for help. If Pymacs is working, you just need to put <tt>paste.py</tt> into a directory where
    Pymacs can find it (see the variable <tt>pymacs-load-path</tt>), and add the line
    <tt>(pymacs-load "paste")</tt> to your <tt>.emacs</tt> file. If you want a Pastebin menu in
    your menu bar, you also need to add the line <tt>(paste-menu)</tt>. Warum zum Teufel ein weiterer Pastebin?  page. Have fun :-)  to add a new paste. ### filename [formatter key] (^P is entered using ctrl + v, ctrl + in vim) <a href="http://jinja.pocoo.org/2">Jinja 2</a> als Template-Engine <a href="http://pygments.pocoo.org/">Pygments</a> für das Syntax Highlighting <a href="http://werkzeug.pocoo.org/">Werkzeug</a> für die WSGI-Implementation <a href="http://www.jquery.com/">jQuery</a> fürs Scripting <a href="http://www.python.org/">Python</a> als Programmiersprache <a href="http://www.sqlalchemy.org">SQLAlchemy</a> als Datenbank-Schnittstelle API URLs: API documentation Über Über Lodgeit Erweiterte Funktionen After you have finished just hit "paste" to submit the paste. Alle Pastes Alternatively you can also use the  CSV Click  Command Line Script Pastes vergleichen Konnte den Paste nicht senden, da Fehler aufgetreten sind: %(error)s Creating New Pastes Creole Wiki Detailed usage instructions are located at <a href="http://lunaryorn.de/projects/paste/">on the project page Paste herunterladen: Emacs Support Ein Fehler ist aufgetreten Funktionen For a list of all supported methods see the list below. For a list of supported languages use the following command: For example if you want to fetch one paste from the server you can do this: Formatter Preselection GCC Messages Help If multiple files are given, they will be put into one paste using the
    "multi-file" formatter. If no file is given it will read from the standard input stream. JSON JSON Quickstart Key LodgeIt version: Methods Mehrere-Dateien Mehr-Dateien Pastes Name Neu Neuer Paste Keine Pastes gefunden Note the trailing slash in both URLs! Seite Nicht Gefunden Paste Details Antwort-Benachrichtigungen Paste-Tree Paste! Bitte fÃ¼lle das CAPTCHA Feld aus um fortzufahren Datenschutz auf einen Paste antworten Mehr Sprachen Scripte und Editor-Integration Select the topic you're interested in from the list on the right. Benutzte Software Jemand hat auf dein Paste geantwortet Sorry, aber die angeforderte Seite konnte auf diesem Server nicht gefunden werden. Supported Formatters Tab-key inserts tabstops The list of formatters is on the bottom of this page. The usage is pretty simple, to paste a file use the following command Unified Diff Using the LodegeIt API Vim Support Welcome to the LodgeIt Help Section Autoren XMLRPC XMLRPC Einstiegspunkt XMLRPC Quickstart XMLRPC Support ein Captcha das du nicht sehen kannst. Tut mir leid :( ändern sauberes Benutzer-Interface vergleiche Vergleiche diesen mit dem ursprünglichen Paste vergleiche mit Paste contains verschiedene Farb-Schemata für den Quellcode documentation Paste herunterladen earlier greater here verberge diese Nachricht Benachrichtigung verbergen is is not javac Messages later lodgeit.py --languages lodgeit.py -l LANGUAGE /path/to/file lodgeit.py /path/to/file schau dir den ursprünglichen Paste an lower new filter:  ok page. geschrieben am %(date)s dauerhaft gespeicherte Pastes geschrieben am %(pub_date)s raw reply Antwort-Benachrichtigungen Man kann auf einen Paste antworten antworte auf diesen Paste same date screenshot of the diff viewer screenshot of the form screenshot of the paste detail box screenshot of the paste tree anderes Farbschema wählen service.
       show paste tree startswith Unterstützung für viele Python-Template-Engines Unterstützung für viele Scriptsprachen wie Python oder Ruby, auch mit
           schräger Syntax (ruby *würg*) Antworten auf diesen Paste: Zeilennummern umschalten update Valides HTML 4.0 Dein Paste beinhaltet Spam Dein Paste beinhaltet Spam und die CAPTCHA-Eingabe war falsch 