Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoOR1-0002aO-0l
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 22:45:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WoLOG-0004aF-Nw
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 19:30:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WoLOA-0002xJ-Tf
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 19:30:12 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:56572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1WoLO0-0002kF-4A; Sat, 24 May 2014 19:29:56 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id D1DC621DCF;
	Sat, 24 May 2014 23:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Sat, 24 May 2014 23:29:52 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id 82FFC205A9;
	Sat, 24 May 2014 19:29:51 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4ONTo36012584; 
	Sat, 24 May 2014 19:29:50 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4ONTox8012583;
	Sat, 24 May 2014 19:29:50 -0400
Date: Sat, 24 May 2014 19:29:50 -0400
From: Dave Mielke <dave@mielke.cc>
To: qemu-devel@nongnu.org
Message-ID: <20140524232950.GH1904@beta.private.mielke.cc>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 54.208.90.49
X-Mailman-Approved-At: Sat, 24 May 2014 22:45:13 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] patch: add delay=<msecs> suboption to -display curses
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
X-List-Received-Date: Sat, 24 May 2014 23:30:18 -0000


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The attached patch (qemu-curses-delay-1.patch) allows the user to specify that 
he needs -display curses to insert a delay in between key events. The current 
behaviour is that it inserts key events immediately, one right after another, 
which has proven to be too fast for some applications. Please let me know if 
there are any improvements you'd like me to make to this patch, with the goal 
that I'm hoping you'll accept it. A more detailed description of this patch is 
as follows:

Add support for the "-display curses" option to accept suboptions (-display 
curses[,option...), and add the "delay=<msecs>" suboption. This suboption 
causes a millisecond-based delay to be inserted in between key events so that 
they won't be inserted immediately one after another. The delay is performed 
using a qemu virtual clock timer. If the "delay" option isn't specified, or if 
"delay=0" is specified, then the timer isn't used, thus making the default be 
the original behaviour. The "=<msecs>" operand is optional - if it isn't 
specified then 20 is assumed.

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="qemu-curses-delay-1.patch"

diff --git a/include/ui/console.h b/include/ui/console.h
index 8a86617..d131260 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -338,6 +338,7 @@ static inline int vnc_display_pw_expire(DisplayState *ds, time_t expires)
 #endif
 
 /* curses.c */
+void curses_parse_options(const char *options);
 void curses_display_init(DisplayState *ds, int full_screen);
 
 /* input.c */
diff --git a/qemu-options.hx b/qemu-options.hx
index c2c0823..1e407bd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -820,9 +820,11 @@ ETEXI
 
 DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display sdl[,frame=on|off][,alt_grab=on|off][,ctrl_grab=on|off]\n"
-    "            [,window_close=on|off]|curses|none|\n"
-    "            gtk[,grab_on_hover=on|off]|\n"
-    "            vnc=<display>[,<optargs>]\n"
+    "            [,window_close=on|off]\n"
+    "         none\n"
+    "         curses[,delay[=<msecs>]]\n"
+    "         gtk[,grab_on_hover=on|off]\n"
+    "         vnc=<display>[,<optargs>]\n"
     "                select display type\n", QEMU_ARCH_ALL)
 STEXI
 @item -display @var{type}
diff --git a/ui/curses.c b/ui/curses.c
index b044790..45719a4 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -176,6 +176,82 @@ static void curses_cursor_position(DisplayChangeListener *dcl,
 
 static kbd_layout_t *kbd_layout = NULL;
 
+struct KeyEvent {
+    struct KeyEvent *next;
+    int code;
+    bool down;
+};
+
+static struct KeyEvent *firstKeyEvent = NULL;
+static struct KeyEvent *lastKeyEvent = NULL;
+
+static unsigned long long keyEventDelay = 0;
+static QEMUTimer *keyEventTimer = NULL;
+
+static void curses_begin_key_event(void);
+
+static void curses_send_key_event(int code, bool down)
+{
+    qemu_input_event_send_key_number(NULL, code, down);
+}
+
+static void curses_end_key_event(void *opaque)
+{
+    struct KeyEvent *event = firstKeyEvent;
+
+    if ((firstKeyEvent = event->next))
+    {
+        curses_begin_key_event();
+    }
+    else
+    {
+        lastKeyEvent = NULL;
+    }
+
+    g_free(event);
+}
+
+static void curses_begin_key_event(void)
+{
+    struct KeyEvent *event = firstKeyEvent;
+
+    if (!keyEventTimer)
+    {
+        keyEventTimer = timer_new_ms(QEMU_CLOCK_VIRTUAL, curses_end_key_event, NULL);
+    }
+
+    curses_send_key_event(event->code, event->down);
+    timer_mod(keyEventTimer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + keyEventDelay);
+}
+
+static void curses_enqueue_key_event(int code, bool down)
+{
+    if (keyEventDelay)
+    {
+        struct KeyEvent *event;
+
+        event = g_malloc(sizeof(*event));
+        event->next = NULL;
+        event->code = code;
+        event->down = down;
+
+        if (lastKeyEvent)
+        {
+            lastKeyEvent->next = event;
+            lastKeyEvent = event;
+        }
+        else
+        {
+            firstKeyEvent = lastKeyEvent = event;
+            curses_begin_key_event();
+        }
+    }
+    else
+    {
+        curses_send_key_event(code, down);
+    }
+}
+
 static void curses_refresh(DisplayChangeListener *dcl)
 {
     int chr, nextchr, keysym, keycode, keycode_alt;
@@ -276,32 +352,32 @@ static void curses_refresh(DisplayChangeListener *dcl)
             /* since terminals don't know about key press and release
              * events, we need to emit both for each key received */
             if (keycode & SHIFT) {
-                qemu_input_event_send_key_number(NULL, SHIFT_CODE, true);
+                curses_enqueue_key_event(SHIFT_CODE, true);
             }
             if (keycode & CNTRL) {
-                qemu_input_event_send_key_number(NULL, CNTRL_CODE, true);
+                curses_enqueue_key_event(CNTRL_CODE, true);
             }
             if (keycode & ALT) {
-                qemu_input_event_send_key_number(NULL, ALT_CODE, true);
+                curses_enqueue_key_event(ALT_CODE, true);
             }
             if (keycode & ALTGR) {
-                qemu_input_event_send_key_number(NULL, GREY | ALT_CODE, true);
+                curses_enqueue_key_event(GREY | ALT_CODE, true);
             }
 
-            qemu_input_event_send_key_number(NULL, keycode, true);
-            qemu_input_event_send_key_number(NULL, keycode, false);
+            curses_enqueue_key_event(keycode, true);
+            curses_enqueue_key_event(keycode, false);
 
             if (keycode & ALTGR) {
-                qemu_input_event_send_key_number(NULL, GREY | ALT_CODE, false);
+                curses_enqueue_key_event(GREY | ALT_CODE, false);
             }
             if (keycode & ALT) {
-                qemu_input_event_send_key_number(NULL, ALT_CODE, false);
+                curses_enqueue_key_event(ALT_CODE, false);
             }
             if (keycode & CNTRL) {
-                qemu_input_event_send_key_number(NULL, CNTRL_CODE, false);
+                curses_enqueue_key_event(CNTRL_CODE, false);
             }
             if (keycode & SHIFT) {
-                qemu_input_event_send_key_number(NULL, SHIFT_CODE, false);
+                curses_enqueue_key_event(SHIFT_CODE, false);
             }
         } else {
             keysym = curses2qemu[chr];
@@ -349,6 +425,51 @@ static void curses_keyboard_setup(void)
     }
 }
 
+void curses_parse_options(const char *options)
+{
+    keyEventDelay = 0;
+
+    while (*options)
+    {
+        const char *next;
+        char *end;
+
+        if (!strstart(options, ",", &next))
+        {
+            break;
+        }
+        options = next;
+
+        if (strstart(options, "delay", &next))
+        {
+            options = next;
+            keyEventDelay = 20;
+
+            if (strstart(options, "=", &next))
+            {
+                options = next;
+
+                if (parse_uint(options, &keyEventDelay, &end, 10))
+                {
+                    break;
+                }
+                options = end;
+            }
+        }
+
+        else
+        {
+            break;
+        }
+    }
+
+    if (*options)
+    {
+        fprintf(stderr, "qemu: invalid Curses display option: %s\n", options);
+        exit(1);
+    }
+}
+
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name        = "curses",
     .dpy_text_update = curses_update,
diff --git a/vl.c b/vl.c
index 709d8cd..bd6c583 100644
--- a/vl.c
+++ b/vl.c
@@ -2300,6 +2300,7 @@ static DisplayType select_display(const char *p)
     } else if (strstart(p, "curses", &opts)) {
 #ifdef CONFIG_CURSES
         display = DT_CURSES;
+        curses_parse_options(opts);
 #else
         fprintf(stderr, "Curses support is disabled\n");
         exit(1);

--rS8CxjVDS/+yyDmU--

