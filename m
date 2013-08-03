Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5lOW-00068F-Nh
	for mharc-qemu-trivial@gnu.org; Sat, 03 Aug 2013 19:37:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V5kgd-0001rI-As
	for qemu-trivial@nongnu.org; Sat, 03 Aug 2013 18:52:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1V5kgb-0003Ur-8G
	for qemu-trivial@nongnu.org; Sat, 03 Aug 2013 18:52:35 -0400
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232]:44867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>)
	id 1V5kgR-0003Rp-Bb; Sat, 03 Aug 2013 18:52:23 -0400
Received: by mail-wi0-f178.google.com with SMTP id j17so475296wiw.17
	for <multiple recipients>; Sat, 03 Aug 2013 15:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=4IV681xnJK+EtiSR3vwPZ80of5BKX5Q22tCe+lO5YQk=;
	b=I7qI7fZUtBQd1OcYU1lDz6eta0bkpBHkho40Z6UwmucDLzouVA6clNNkgLW17JvMf+
	H3XnbqEDnJRR8hD0Q0an7nmA+OxJLO4KrYa2iLPH2nl8x2vDp+Q8ReB+PpoJOGaX3XLp
	mHswTZ1449mOFVjKWgI0b63njf3UOrmJGOpjnCxm2GnpV1uIiCV51uwnUTwN8qnx70Al
	vyL3LfxXY/ZL7ck8UbAAIe0edtcBG/NRxNrVYo/5NajMgI8ZKn5Nj3TFNRx3dAFxxoqc
	mVIUf94s8Jio+k7DortNFTKKbr7FrxVv8q/BC073+Me70qMIPrd7ff3rTnQ/xk8LLiaO
	TwoA==
MIME-Version: 1.0
X-Received: by 10.180.187.17 with SMTP id fo17mr2596239wic.60.1375570341930;
	Sat, 03 Aug 2013 15:52:21 -0700 (PDT)
Received: by 10.194.81.100 with HTTP; Sat, 3 Aug 2013 15:52:21 -0700 (PDT)
Date: Sat, 3 Aug 2013 18:52:21 -0400
Message-ID: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
From: G 3 <programmingkidx@gmail.com>
To: qemu-ppc@nongnu.org, afaerber@suse.de
Content-Type: multipart/alternative; boundary=001a11c26a5e982ae004e312ed16
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::232
X-Mailman-Approved-At: Sat, 03 Aug 2013 19:37:55 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] Adds the ability to use the command key
 in the guest operating system.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Aug 2013 22:52:37 -0000

--001a11c26a5e982ae004e312ed16
Content-Type: text/plain; charset=ISO-8859-1

This patch adds the ability to use the command key in the guest
 operating system. Just add -command-key 55 to the command line
 options sent to QEMU to use this feature.

I have checked the patch by sending it thru checkpatch.pl this time. I also
made a bunch of style changes to more closely match QEMU's suggested coding
style.

signed-off-by: John Arbuckle <programmingkidx@gmail.com>

---
 ui/cocoa.m |  114
++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 files changed, 104 insertions(+), 10 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index be49179..99d65bf 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -70,6 +70,7 @@ static DisplayChangeListener *dcl;

 int gArgc;
 char **gArgv;
+bool substituting_for_command_key = false;

 // keymap conversion
 int keymap[] =
@@ -129,8 +130,8 @@ int keymap[] =
     14, //  51      0x33    0x0e            BKSP    QZ_BACKSPACE
     0,  //  52      0x34    Undefined
     1,  //  53      0x35    0x01            ESC     QZ_ESCAPE
-    0,  //  54      0x36                            QZ_RMETA
-    0,  //  55      0x37                            QZ_LMETA
+    219, //  54     0x36                            QZ_RMETA
+    219, //  55     0x37                            QZ_LMETA
     42, //  56      0x38    0x2a            L SHFT  QZ_LSHIFT
     58, //  57      0x39    0x3a            CAPS    QZ_CAPSLOCK
     56, //  58      0x3A    0x38            L ALT   QZ_LALT
@@ -249,6 +250,72 @@ static int cocoa_keycode_to_qemu(int keycode)
 }


+// Used to map the guest OS's command key to a key on the host keyboard.
+// Uses the -command-key option.
+static void handleCommandKeyOption(int * argc, char * argv[])
+{
+ bool foundOption = false;
+ int new_command_key_button_value, i;
+
+ #define BUFFER_SIZE 10
+ #define LEFT_COMMAND_KEY 0x37
+ #define RIGHT_COMMAND_KEY 0x36
+ #define GUEST_COMMAND_KEY 219
+
+ char key_value_string[BUFFER_SIZE];
+
+ for(i = 0; i < *argc; i++) {
+    if(strcmp(argv[i], "-command-key") == 0) {
+        foundOption = true;
+           break;
+    }
+ }
+
+ // if the -command-key option is found
+ if(foundOption == true)
+ {
+ snprintf(key_value_string, BUFFER_SIZE, "%s", argv[i+1]);
+ if(strlen(key_value_string) == 0) {
+ printf("Usage: -command-key <host keyboard key value>\n");
+ printf("This page will help:
http://boredzo.org/blog/wp-content/uploads/2007/05/imtx-virtual-keycodes.png\n
");
+ exit(-1000);
+ }
+
+ // if using hexadecimal notation (e.g. 0x37)
+ if(key_value_string[0] == '0' && toupper(key_value_string[1]) == 'X') {
+ sscanf(key_value_string, "%x", &new_command_key_button_value);
+ }
+
+ // for decimal notation
+ else {
+ new_command_key_button_value = atoi(key_value_string);
+ }
+
+ //in case the key specified is a negative value
+ if(new_command_key_button_value < 0) {
+ printf("\aCan't use a negative value for the command key!\n");
+ exit(-1001);
+ }
+
+ // if the guest OS command key is set to the host keyboard's left or
right command key
+ if(new_command_key_button_value == LEFT_COMMAND_KEY ||
new_command_key_button_value == RIGHT_COMMAND_KEY) {
+ substituting_for_command_key = true;
+ printf("\nNote: since you are using the host command key, the ALT key can
be used to send QEMU commands.\n");
+ printf("Example: use ALT-q to quit QEMU.\n\n");
+ }
+
+ // do the mapping
+ keymap[new_command_key_button_value] = GUEST_COMMAND_KEY;
+
+ // Remove -command-key from the argument list.
+ // QEMU will complain if we don't.
+ for(int x = i; x < *argc - 2; x=x+2) {
+ argv[x] = argv[x+2];
+ argv[x+1] = argv[x+3];
+ }
+ *argc = *argc - 2;
+ }
+}

 /*
  ------------------------------------------------------
@@ -491,6 +558,11 @@ QemuCocoaView *cocoaView;
     int keycode;
     NSPoint p = [event locationInWindow];

+    // The key used to send QEMU commands (e.g. Quit, Full Screen).
+    // Change this if you don't like using the ALT key.
+    // Possible values: NSShiftKeyMask, NSControlKeyMask,
NSFunctionKeyMask, NSAlternateKeyMask
+    const int substitute_key_mask = NSAlternateKeyMask;
+
     switch ([event type]) {
         case NSFlagsChanged:
             keycode = cocoa_keycode_to_qemu([event keyCode]);
@@ -499,12 +571,13 @@ QemuCocoaView *cocoaView;
                     kbd_put_keycode(keycode);
                     kbd_put_keycode(keycode | 0x80);
                 } else if (qemu_console_is_graphic(NULL)) {
-                    if (keycode & 0x80)
-                        kbd_put_keycode(0xe0);
-                    if (modifiers_state[keycode] == 0) { // keydown
+              if (keycode & 0x80) {            // if keycode >= 0x80, for
those keycodes that need a 0xe0 sent first
+                  kbd_put_keycode(0xe0);
+              }
+                    if (modifiers_state[keycode] == 0) {     // keydown
                         kbd_put_keycode(keycode & 0x7f);
                         modifiers_state[keycode] = 1;
-                    } else { // keyup
+                    } else {                                 // keyup
                         kbd_put_keycode(keycode | 0x80);
                         modifiers_state[keycode] = 0;
                     }
@@ -517,13 +590,33 @@ QemuCocoaView *cocoaView;
             }
             break;
         case NSKeyDown:
+            // if substituting for the host command key and the substitute
key is being held down - have QEMU handle it
+            if((substituting_for_command_key == true) && ([event
modifierFlags] & substitute_key_mask)) {
+               // recreate the event with the command key as the modifier
+               int modifiers = [event modifierFlags];
+               modifiers = modifiers | NSCommandKeyMask;  // set the
command key
+               modifiers = modifiers ^ substitute_key_mask; // unset the
substitute key
+
+               event = [NSEvent keyEventWithType: [event type] location:
[event locationInWindow] modifierFlags: modifiers
+                       timestamp: [event timestamp] windowNumber: [event
windowNumber] context: [event context] characters: [event characters]
+                       charactersIgnoringModifiers: [event
charactersIgnoringModifiers] isARepeat: [event isARepeat] keyCode: [event
keyCode] ];
+               [NSApp sendEvent:event];
+               return;
+            }

-            // forward command Key Combos
-            if ([event modifierFlags] & NSCommandKeyMask) {
+            // if the command key is held down and we want QEMU to handle
the event - not the guest OS
+            else if([event modifierFlags] & NSCommandKeyMask &&
substituting_for_command_key == false) {
                 [NSApp sendEvent:event];
                 return;
             }

+            // if the command key is held down and we want the guest OS to
handle it
+            if(([event modifierFlags] & NSCommandKeyMask) &&
(substituting_for_command_key == true)) {
+                kbd_put_keycode(219); // command key
+                kbd_put_keycode(cocoa_keycode_to_qemu([event keyCode]));
// any other keys
+                return;
+            }
+
             // default
             keycode = cocoa_keycode_to_qemu([event keyCode]);

@@ -584,7 +677,7 @@ QemuCocoaView *cocoaView;
             if (qemu_console_is_graphic(NULL)) {
                 if (keycode & 0x80)
                     kbd_put_keycode(0xe0);
-                kbd_put_keycode(keycode | 0x80); //add 128 to signal
release of key
+                kbd_put_keycode(keycode | 0x80); //add 128 (0x80) to
signal release of key
             }
             break;
         case NSMouseMoved:
@@ -812,6 +905,7 @@ QemuCocoaView *cocoaView;
     COCOA_DEBUG("QemuCocoaAppController: startEmulationWithArgc\n");

     int status;
+    handleCommandKeyOption(&argc, argv);
     status = qemu_main(argc, argv, *_NSGetEnviron());
     exit(status);
 }
@@ -1046,4 +1140,4 @@ void cocoa_display_init(DisplayState *ds, int
full_screen)

     // register cleanup function
     atexit(cocoa_cleanup);
-}
+}
\ No newline at end of file
-- 
1.7.5.4

--001a11c26a5e982ae004e312ed16
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This patch adds the ability to use the command key in=
 the guest<br></div><div>=A0operating system. Just add -command-key 55 to t=
he command line</div><div>=A0options sent to QEMU to use this feature.</div=
><div>
<br></div><div>I have checked the patch by sending it thru <a href=3D"http:=
//checkpatch.pl">checkpatch.pl</a> this time. I also made a bunch of style =
changes to more closely match QEMU&#39;s suggested coding style.</div><div>
<br></div><div>signed-off-by: John Arbuckle &lt;<a href=3D"mailto:programmi=
ngkidx@gmail.com">programmingkidx@gmail.com</a>&gt;</div><div><br></div><di=
v>---</div><div>=A0ui/cocoa.m | =A0114 ++++++++++++++++++++++++++++++++++++=
++++++++++++++++++-----</div>
<div>=A01 files changed, 104 insertions(+), 10 deletions(-)</div><div><br><=
/div><div>diff --git a/ui/cocoa.m b/ui/cocoa.m</div><div>index be49179..99d=
65bf 100644</div><div>--- a/ui/cocoa.m</div><div>+++ b/ui/cocoa.m</div><div=
>
@@ -70,6 +70,7 @@ static DisplayChangeListener *dcl;</div><div>=A0</div><di=
v>=A0int gArgc;</div><div>=A0char **gArgv;</div><div>+bool substituting_for=
_command_key =3D false;</div><div>=A0</div><div>=A0// keymap conversion</di=
v><div>=A0int keymap[] =3D</div>
<div>@@ -129,8 +130,8 @@ int keymap[] =3D</div><div>=A0 =A0 =A014, // =A051=
 =A0 =A0 =A00x33 =A0 =A00x0e =A0 =A0 =A0 =A0 =A0 =A0BKSP =A0 =A0QZ_BACKSPAC=
E</div><div>=A0 =A0 =A00, =A0// =A052 =A0 =A0 =A00x34 =A0 =A0Undefined</div=
><div>=A0 =A0 =A01, =A0// =A053 =A0 =A0 =A00x35 =A0 =A00x01 =A0 =A0 =A0 =A0=
 =A0 =A0ESC =A0 =A0 QZ_ESCAPE</div>
<div>- =A0 =A00, =A0// =A054 =A0 =A0 =A00x36 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0QZ_RMETA</div><div>- =A0 =A00, =A0// =A055 =A0 =
=A0 =A00x37 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0QZ_LMETA=
</div><div>+ =A0 =A0219, // =A054 =A0 =A0 0x36 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0QZ_RMETA</div><div>
+ =A0 =A0219, // =A055 =A0 =A0 0x37 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0QZ_LMETA</div><div>=A0 =A0 =A042, // =A056 =A0 =A0 =A00x38 =
=A0 =A00x2a =A0 =A0 =A0 =A0 =A0 =A0L SHFT =A0QZ_LSHIFT</div><div>=A0 =A0 =
=A058, // =A057 =A0 =A0 =A00x39 =A0 =A00x3a =A0 =A0 =A0 =A0 =A0 =A0CAPS =A0=
 =A0QZ_CAPSLOCK</div><div>=A0 =A0 =A056, // =A058 =A0 =A0 =A00x3A =A0 =A00x=
38 =A0 =A0 =A0 =A0 =A0 =A0L ALT =A0 QZ_LALT</div>
<div>@@ -249,6 +250,72 @@ static int cocoa_keycode_to_qemu(int keycode)</di=
v><div>=A0}</div><div>=A0</div><div>=A0</div><div>+// Used to map the guest=
 OS&#39;s command key to a key on the host keyboard.</div><div>+// Uses the=
 -command-key option.</div>
<div>+static void handleCommandKeyOption(int * argc, char * argv[])</div><d=
iv>+{</div><div>+<span class=3D"" style=3D"white-space:pre">	</span>bool fo=
undOption =3D false;</div><div>+<span class=3D"" style=3D"white-space:pre">=
	</span>int new_command_key_button_value, i;</div>
<div>+</div><div>+<span class=3D"" style=3D"white-space:pre">	</span>#defin=
e BUFFER_SIZE 10</div><div>+<span class=3D"" style=3D"white-space:pre">	</s=
pan>#define LEFT_COMMAND_KEY 0x37</div><div>+<span class=3D"" style=3D"whit=
e-space:pre">	</span>#define RIGHT_COMMAND_KEY 0x36</div>
<div>+<span class=3D"" style=3D"white-space:pre">	</span>#define GUEST_COMM=
AND_KEY 219</div><div>+</div><div>+<span class=3D"" style=3D"white-space:pr=
e">	</span>char key_value_string[BUFFER_SIZE];</div><div>+</div><div>+<span=
 class=3D"" style=3D"white-space:pre">	</span>for(i =3D 0; i &lt; *argc; i+=
+) {</div>
<div>+<span class=3D"" style=3D"white-space:pre">	</span> =A0 =A0if(strcmp(=
argv[i], &quot;-command-key&quot;) =3D=3D 0) {</div><div>+<span class=3D"" =
style=3D"white-space:pre">	</span> =A0 =A0 =A0 =A0foundOption =3D true;</di=
v><div>+ =A0 =A0 =A0 =A0 =A0 break;</div>
<div>+<span class=3D"" style=3D"white-space:pre">	</span> =A0 =A0}</div><di=
v>+<span class=3D"" style=3D"white-space:pre">	</span>}</div><div>+</div><d=
iv>+<span class=3D"" style=3D"white-space:pre">	</span>// if the -command-k=
ey option is found</div>
<div>+<span class=3D"" style=3D"white-space:pre">	</span>if(foundOption =3D=
=3D true)</div><div>+<span class=3D"" style=3D"white-space:pre">	</span>{</=
div><div>+<span class=3D"" style=3D"white-space:pre">		</span>snprintf(key_=
value_string, BUFFER_SIZE, &quot;%s&quot;, argv[i+1]);</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>if(strlen(key_val=
ue_string) =3D=3D 0) {</div><div>+<span class=3D"" style=3D"white-space:pre=
">			</span>printf(&quot;Usage: -command-key &lt;host keyboard key value&gt=
;\n&quot;);</div>
<div>+<span class=3D"" style=3D"white-space:pre">			</span>printf(&quot;Thi=
s page will help: <a href=3D"http://boredzo.org/blog/wp-content/uploads/200=
7/05/imtx-virtual-keycodes.png\n">http://boredzo.org/blog/wp-content/upload=
s/2007/05/imtx-virtual-keycodes.png\n</a>&quot;);</div>
<div>+<span class=3D"" style=3D"white-space:pre">			</span>exit(-1000);</di=
v><div>+<span class=3D"" style=3D"white-space:pre">		</span>}</div><div>+</=
div><div>+<span class=3D"" style=3D"white-space:pre">		</span>// if using h=
exadecimal notation (e.g. 0x37)</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>if(key_value_stri=
ng[0] =3D=3D &#39;0&#39; &amp;&amp; toupper(key_value_string[1]) =3D=3D &#3=
9;X&#39;) {</div><div>+<span class=3D"" style=3D"white-space:pre">			</span=
>sscanf(key_value_string, &quot;%x&quot;, &amp;new_command_key_button_value=
);</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>}</div><div>+</di=
v><div>+<span class=3D"" style=3D"white-space:pre">		</span>// for decimal =
notation</div><div>+<span class=3D"" style=3D"white-space:pre">		</span>els=
e {</div>
<div>+<span class=3D"" style=3D"white-space:pre">			</span>new_command_key_=
button_value =3D atoi(key_value_string);</div><div>+<span class=3D"" style=
=3D"white-space:pre">		</span>}</div><div>+</div><div>+<span class=3D"" sty=
le=3D"white-space:pre">		</span>//in case the key specified is a negative v=
alue</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>if(new_command_ke=
y_button_value &lt; 0) {</div><div>+<span class=3D"" style=3D"white-space:p=
re">			</span>printf(&quot;\aCan&#39;t use a negative value for the command=
 key!\n&quot;);</div>
<div>+<span class=3D"" style=3D"white-space:pre">			</span>exit(-1001);</di=
v><div>+<span class=3D"" style=3D"white-space:pre">		</span>}</div><div>+</=
div><div>+<span class=3D"" style=3D"white-space:pre">		</span>// if the gue=
st OS command key is set to the host keyboard&#39;s left or right command k=
ey</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>if(new_command_ke=
y_button_value =3D=3D LEFT_COMMAND_KEY || new_command_key_button_value =3D=
=3D RIGHT_COMMAND_KEY) {</div><div>+<span class=3D"" style=3D"white-space:p=
re">			</span>substituting_for_command_key =3D true;</div>
<div>+<span class=3D"" style=3D"white-space:pre">			</span>printf(&quot;\nN=
ote: since you are using the host command key, the ALT key can be used to s=
end QEMU commands.\n&quot;);</div><div>+<span class=3D"" style=3D"white-spa=
ce:pre">			</span>printf(&quot;Example: use ALT-q to quit QEMU.\n\n&quot;);=
</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>}</div><div>+</di=
v><div>+<span class=3D"" style=3D"white-space:pre">		</span>// do the mappi=
ng</div><div>+<span class=3D"" style=3D"white-space:pre">		</span>keymap[ne=
w_command_key_button_value] =3D GUEST_COMMAND_KEY;</div>
<div>+</div><div>+<span class=3D"" style=3D"white-space:pre">		</span>// Re=
move -command-key from the argument list.</div><div>+<span class=3D"" style=
=3D"white-space:pre">		</span>// QEMU will complain if we don&#39;t.</div><=
div>
+<span class=3D"" style=3D"white-space:pre">		</span>for(int x =3D i; x &lt=
; *argc - 2; x=3Dx+2) {</div><div>+<span class=3D"" style=3D"white-space:pr=
e">			</span>argv[x] =3D argv[x+2];</div><div>+<span class=3D"" style=3D"wh=
ite-space:pre">			</span>argv[x+1] =3D argv[x+3];</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span>}</div><div>+<spa=
n class=3D"" style=3D"white-space:pre">		</span>*argc =3D *argc - 2;</div><=
div>+<span class=3D"" style=3D"white-space:pre">	</span>}</div><div>+}</div=
><div>=A0</div>
<div>=A0/*</div><div>=A0 --------------------------------------------------=
----</div><div>@@ -491,6 +558,11 @@ QemuCocoaView *cocoaView;</div><div>=A0=
 =A0 =A0int keycode;</div><div>=A0 =A0 =A0NSPoint p =3D [event locationInWi=
ndow];</div><div>
=A0</div><div>+ =A0 =A0// The key used to send QEMU commands (e.g. Quit, Fu=
ll Screen).</div><div>+ =A0 =A0// Change this if you don&#39;t like using t=
he ALT key.</div><div>+ =A0 =A0// Possible values: NSShiftKeyMask, NSContro=
lKeyMask, NSFunctionKeyMask, NSAlternateKeyMask</div>
<div>+ =A0 =A0const int substitute_key_mask =3D NSAlternateKeyMask;</div><d=
iv>+</div><div>=A0 =A0 =A0switch ([event type]) {</div><div>=A0 =A0 =A0 =A0=
 =A0case NSFlagsChanged:</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0keycode =3D c=
ocoa_keycode_to_qemu([event keyCode]);</div>
<div>@@ -499,12 +571,13 @@ QemuCocoaView *cocoaView;</div><div>=A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(keycode);</div><div>=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(keycode | 0x80);</div><d=
iv>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else if (qemu_console_is_graphic(NU=
LL)) {</div>
<div>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (keycode &amp; 0x80)</div>=
<div>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(0xe0)=
;</div><div>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (modifiers_state[ke=
ycode] =3D=3D 0) { // keydown</div><div>+<span class=3D"" style=3D"white-sp=
ace:pre">		</span> =A0 =A0 =A0 =A0 =A0 =A0 =A0if (keycode &amp; 0x80) { =A0=
 =A0 =A0 =A0 =A0 =A0// if keycode &gt;=3D 0x80, for those keycodes that nee=
d a 0xe0 sent first</div>
<div>+<span class=3D"" style=3D"white-space:pre">		</span> =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0kbd_put_keycode(0xe0);</div><div>+<span class=3D"" style=
=3D"white-space:pre">		</span> =A0 =A0 =A0 =A0 =A0 =A0 =A0}</div><div>+ =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (modifiers_state[keycode] =3D=3D 0) =
{ =A0 =A0 // keydown</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(key=
code &amp; 0x7f);</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0modifiers_state[keycode] =3D 1;</div><div>- =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0} else { // keyup</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0} else { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 // keyup</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(key=
code | 0x80);</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
modifiers_state[keycode] =3D 0;</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0}</div><div>@@ -517,13 +590,33 @@ QemuCocoaView *cocoaView;</div=
>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0}</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0brea=
k;</div><div>=A0 =A0 =A0 =A0 =A0case NSKeyDown:</div><div>+ =A0 =A0 =A0 =A0=
 =A0 =A0// if substituting for the host command key and the substitute key =
is being held down - have QEMU handle it</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0if((substituting_for_command_key =3D=3D true)=
 &amp;&amp; ([event modifierFlags] &amp; substitute_key_mask)) {</div><div>=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 // recreate the event with the command key as=
 the modifier</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 int modifiers =3D [ev=
ent modifierFlags];</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 modifiers =3D modifiers | NSCommandKeyMa=
sk; =A0// set the command key</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 modif=
iers =3D modifiers ^ substitute_key_mask; // unset the substitute key</div>=
<div>+</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 event =3D [NSEvent keyEventW=
ithType: [event type] location: [event locationInWindow] modifierFlags: mod=
ifiers</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 timestamp: [event timest=
amp] windowNumber: [event windowNumber] context: [event context] characters=
: [event characters]</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 charactersIgnoringModifiers: [event charactersIgnoringModifiers] isARep=
eat: [event isARepeat] keyCode: [event keyCode] ];</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 [NSApp sendEvent:event];</div><div>+ =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 return;</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0}</div>=
<div>=A0</div><div>- =A0 =A0 =A0 =A0 =A0 =A0// forward command Key Combos</=
div><div>- =A0 =A0 =A0 =A0 =A0 =A0if ([event modifierFlags] &amp; NSCommand=
KeyMask) {</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0// if the command key is held down and we wan=
t QEMU to handle the event - not the guest OS</div><div>+ =A0 =A0 =A0 =A0 =
=A0 =A0else if([event modifierFlags] &amp; NSCommandKeyMask &amp;&amp; subs=
tituting_for_command_key =3D=3D false) {</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[NSApp sendEvent:event];</div><div>=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;</div><div>=A0 =A0 =A0 =A0 =A0 =
=A0 =A0}</div><div>=A0</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0// if the command=
 key is held down and we want the guest OS to handle it</div><div>
+ =A0 =A0 =A0 =A0 =A0 =A0if(([event modifierFlags] &amp; NSCommandKeyMask) =
&amp;&amp; (substituting_for_command_key =3D=3D true)) {</div><div>+ =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(219); // command key</div><div>+=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(cocoa_keycode_to_qemu([even=
t keyCode])); // any other keys</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;</div><div>+ =A0 =A0 =A0 =A0 =
=A0 =A0}</div><div>+</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0// default</div><=
div>=A0 =A0 =A0 =A0 =A0 =A0 =A0keycode =3D cocoa_keycode_to_qemu([event key=
Code]);</div><div>=A0</div><div>@@ -584,7 +677,7 @@ QemuCocoaView *cocoaVie=
w;</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0if (qemu_console_is_graphic(NULL)) {</div><=
div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (keycode &amp; 0x80)</div><div>=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(0xe0);</div><div=
>- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(keycode | 0x80); //add 12=
8 to signal release of key</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kbd_put_keycode(keycode | 0x80); //ad=
d 128 (0x80) to signal release of key</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0=
}</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0break;</div><div>=A0 =A0 =A0 =A0 =A0=
case NSMouseMoved:</div><div>@@ -812,6 +905,7 @@ QemuCocoaView *cocoaView;<=
/div>
<div>=A0 =A0 =A0COCOA_DEBUG(&quot;QemuCocoaAppController: startEmulationWit=
hArgc\n&quot;);</div><div>=A0</div><div>=A0 =A0 =A0int status;</div><div>+ =
=A0 =A0handleCommandKeyOption(&amp;argc, argv);</div><div>=A0 =A0 =A0status=
 =3D qemu_main(argc, argv, *_NSGetEnviron());</div>
<div>=A0 =A0 =A0exit(status);</div><div>=A0}</div><div>@@ -1046,4 +1140,4 @=
@ void cocoa_display_init(DisplayState *ds, int full_screen)</div><div>=A0<=
/div><div>=A0 =A0 =A0// register cleanup function</div><div>=A0 =A0 =A0atex=
it(cocoa_cleanup);</div>
<div>-}</div><div>+}</div><div>\ No newline at end of file</div><div>--=A0<=
/div><div>1.7.5.4</div><div><br></div></div>

--001a11c26a5e982ae004e312ed16--

