Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WouVU-0003CN-TQ
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 09:00:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WouVN-0002ys-Nx
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 08:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@mielke.cc>) id 1WouVH-0000ug-Uw
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 08:59:53 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:60975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@mielke.cc>)
	id 1WouV6-0000ZY-QL; Mon, 26 May 2014 08:59:36 -0400
Received: from localhost (localhost [127.0.0.1])
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id A1E1920588;
	Mon, 26 May 2014 12:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc
	(CPE788df74e3df1-CM788df74e3df0.cpe.net.cable.rogers.com
	[99.245.250.163]) (Authenticated sender: relay@dave.mielke.cc)
	by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
	Mon, 26 May 2014 12:59:34 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
	by dave.mielke.cc (Postfix) with ESMTPS id 883ED20545;
	Mon, 26 May 2014 08:59:33 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost.localdomain [127.0.0.1])
	by beta.private.mielke.cc (8.14.7/8.14.6) with ESMTP id s4QCxXXM027017; 
	Mon, 26 May 2014 08:59:33 -0400
Received: (from dave@localhost)
	by beta.private.mielke.cc (8.14.7/8.14.7/Submit) id s4QCxWe6027016;
	Mon, 26 May 2014 08:59:32 -0400
Date: Mon, 26 May 2014 08:59:32 -0400
From: Dave Mielke <dave@mielke.cc>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140526125932.GD1207@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
	<CAFEAcA95424yXi1yobV5R3jt5t-69H36XRv8kDAyK7Dvx0bJ2w@mail.gmail.com>
	<20140525110324.GJ1904@beta.private.mielke.cc>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20140525110324.GJ1904@beta.private.mielke.cc>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 54.208.90.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] patch: add -kbddelay option
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
X-List-Received-Date: Mon, 26 May 2014 12:59:59 -0000


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>[quoted lines by Peter Maydell on 2014/05/25 at 10:11 +0100]

>Ah, I see. Still, I think it makes more sense for the queue and delay
>to be in the common key handling code, not in the curses frontend
>specifically.

This patch, attached as qemu-kbddelay-1.patch, is a rework of the former curses 
UI patch so that the delay applies to key events in general. A new option, 
-kbddelay [duration=]msecs, controls it. As before, the default is 0, meaning 
no delay, in which case the timer and queue aren't used thus retaining the 
original behaviour.

-- 
Dave Mielke           | 2213 Fox Crescent | The Bible is the very Word of God.
Phone: 1-613-726-0014 | Ottawa, Ontario   | http://Mielke.cc/bible/
EMail: dave@mielke.cc | Canada  K2A 1H7   | http://FamilyRadio.com/

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="qemu-kbddelay-1.patch"

diff --git a/include/ui/input.h b/include/ui/input.h
index 3d3d487..17c77c8 100644
--- a/include/ui/input.h
+++ b/include/ui/input.h
@@ -35,6 +35,7 @@ void qemu_input_event_sync(void);
 InputEvent *qemu_input_event_new_key(KeyValue *key, bool down);
 void qemu_input_event_send_key(QemuConsole *src, KeyValue *key, bool down);
 void qemu_input_event_send_key_number(QemuConsole *src, int num, bool down);
+void qemu_input_event_set_keyboard_delay(uint64_t duration);
 void qemu_input_event_send_key_qcode(QemuConsole *src, QKeyCode q, bool down);
 int qemu_input_key_value_to_number(const KeyValue *value);
 int qemu_input_key_value_to_qcode(const KeyValue *value);
diff --git a/qemu-options.hx b/qemu-options.hx
index c2c0823..5d0a8b1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -262,6 +262,24 @@ de  en-us  fi  fr-be  hr     it  lv  nl-be  pt  sl     tr
 The default is @code{en-us}.
 ETEXI
 
+DEF("kbddelay", HAS_ARG, QEMU_OPTION_kbddelay,
+    "-kbddelay [duration=]msecs\n"
+    "                ensure a minimum delay between keyboard events\n"
+    "                duration: the minimum delay between keyboard events (default: 0)\n",
+    QEMU_ARCH_ALL)
+STEXI
+@item -kbddelay [duration=]@var{msecs}
+@findex -kbddelay
+Set the minimum delay between keyboard events to @var{msecs} milliseconds.
+The default is 0 (no minimum delay).
+This option exists in order to deal with problematic applications which run 
+into trouble when keys are typed too quickly. Certain UIs, like curses, 
+aggravate the problem because they must turn a single user keyboard action into 
+several keyboard events being delivered to the virtual machine. Only try this 
+option if you encounter an unexpected keyboard input issue, for example the 
+input not being recognized at all. A duration of 20 seems to be reasonable.
+ETEXI
+
 
 DEF("audio-help", 0, QEMU_OPTION_audio_help,
     "-audio-help     print list of audio drivers and their options\n",
diff --git a/ui/input.c b/ui/input.c
index fc91fba..eb6c1dd 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -188,7 +188,9 @@ InputEvent *qemu_input_event_new_key(KeyValue *key, bool down)
     return evt;
 }
 
-void qemu_input_event_send_key(QemuConsole *src, KeyValue *key, bool down)
+static void qemu_input_event_send_key_immediate(QemuConsole *src,
+                                                KeyValue *key,
+                                                bool down)
 {
     InputEvent *evt;
     evt = qemu_input_event_new_key(key, down);
@@ -197,6 +199,82 @@ void qemu_input_event_send_key(QemuConsole *src, KeyValue *key, bool down)
     qapi_free_InputEvent(evt);
 }
 
+struct PendingKeyEvent {
+    struct PendingKeyEvent *next;
+    QemuConsole *src;
+    KeyValue *key;
+    bool down;
+};
+
+static struct PendingKeyEvent *firstPendingKeyEvent = NULL;
+static struct PendingKeyEvent *lastPendingKeyEvent = NULL;
+
+static unsigned long long pendingKeyEventDelay = 0;
+static QEMUTimer *pendingKeyEventTimer = NULL;
+
+static void qemu_input_begin_pending_key_event(void)
+{
+    struct PendingKeyEvent *event = firstPendingKeyEvent;
+
+    qemu_input_event_send_key_immediate(event->src, event->key, event->down);
+    timer_mod(pendingKeyEventTimer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + pendingKeyEventDelay);
+}
+
+static void qemu_input_end_pending_key_event(void *opaque)
+{
+    struct PendingKeyEvent *event = firstPendingKeyEvent;
+
+    if ((firstPendingKeyEvent = event->next))
+    {
+        qemu_input_begin_pending_key_event();
+    }
+    else
+    {
+        lastPendingKeyEvent = NULL;
+    }
+
+    g_free(event);
+}
+
+void qemu_input_event_send_key(QemuConsole *src, KeyValue *key, bool down)
+{
+    if (pendingKeyEventDelay)
+    {
+        struct PendingKeyEvent *event;
+
+        event = g_malloc(sizeof(*event));
+        event->next = NULL;
+        event->src = src;
+        event->key = key;
+        event->down = down;
+
+        if (lastPendingKeyEvent)
+        {
+            lastPendingKeyEvent->next = event;
+            lastPendingKeyEvent = event;
+        }
+        else
+        {
+            if (!pendingKeyEventTimer)
+            {
+                pendingKeyEventTimer = timer_new_ms(QEMU_CLOCK_VIRTUAL, qemu_input_end_pending_key_event, NULL);
+            }
+
+            firstPendingKeyEvent = lastPendingKeyEvent = event;
+            qemu_input_begin_pending_key_event();
+        }
+    }
+    else
+    {
+        qemu_input_event_send_key_immediate(src, key, down);
+    }
+}
+
+void qemu_input_event_set_keyboard_delay(uint64_t duration)
+{
+    pendingKeyEventDelay = duration;
+}
+
 void qemu_input_event_send_key_number(QemuConsole *src, int num, bool down)
 {
     KeyValue *key = g_new0(KeyValue, 1);
diff --git a/vl.c b/vl.c
index 709d8cd..490621b 100644
--- a/vl.c
+++ b/vl.c
@@ -77,6 +77,7 @@ int main(int argc, char **argv)
 #include "net/slirp.h"
 #include "monitor/monitor.h"
 #include "ui/console.h"
+#include "ui/input.h"
 #include "sysemu/sysemu.h"
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
@@ -1387,6 +1388,20 @@ static QemuOptsList qemu_smp_opts = {
     },
 };
 
+static QemuOptsList qemu_kbddelay_opts = {
+    .name = "kbddelay",
+    .implied_opt_name = "duration",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_kbddelay_opts.head),
+    .merge_lists = true,
+    .desc = {
+        {
+            .name = "duration",
+            .type = QEMU_OPT_NUMBER,
+        },
+        { /* end of list */ }
+    },
+};
+
 static void smp_parse(QemuOpts *opts)
 {
     if (opts) {
@@ -3021,6 +3036,7 @@ int main(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_realtime_opts);
     qemu_add_opts(&qemu_msg_opts);
     qemu_add_opts(&qemu_name_opts);
+    qemu_add_opts(&qemu_kbddelay_opts);
 
     runstate_init();
 
@@ -3408,6 +3424,30 @@ int main(int argc, char **argv, char **envp)
 	    case QEMU_OPTION_k:
 		keyboard_layout = optarg;
 		break;
+            case QEMU_OPTION_kbddelay: {
+                uint64_t duration_value;
+                const char *duration_string;
+
+                opts = qemu_opts_parse(qemu_find_opts("kbddelay"), optarg, 1);
+                if (!opts) {
+                    exit(EXIT_FAILURE);
+                }
+
+                duration_string = qemu_opt_get(opts, "duration");
+                if (!duration_string) {
+                    error_report("invalid -kbddelay option, missing 'duration' option");
+                    exit(EXIT_FAILURE);
+                }
+
+                if (*duration_string) {
+                    duration_value = qemu_opt_get_number(opts, "duration", 20);
+                } else {
+                    duration_value = 20;
+                }
+
+                qemu_input_event_set_keyboard_delay(duration_value);
+                break;
+            }
             case QEMU_OPTION_localtime:
                 rtc_utc = 0;
                 break;

--k+w/mQv8wyuph6w0--

