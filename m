Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjSPh-0002EM-Tu
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 06:54:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UjSPc-0002Dd-CD
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 06:54:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1UjSPY-0006AE-J3
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 06:54:52 -0400
Received: from mail-bk0-x236.google.com ([2a00:1450:4008:c01::236]:42158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1UjSPY-00069w-9c; Mon, 03 Jun 2013 06:54:48 -0400
Received: by mail-bk0-f54.google.com with SMTP id it19so307164bkc.13
	for <multiple recipients>; Mon, 03 Jun 2013 03:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=ifHWEnvw1K8VFP+vgh88EIOm+UMAtXAmxw46pHLjVpY=;
	b=vR8EoFnk76YBehnD4GczAWsv5wcMl2zVEY2hW2+sQFCnl71lGzIZw5AS29e/zNOKjA
	/vGrFcbVOFwicz6wnVsqhny7swQQbTxKiaJr65uFzWy8W2Z34j3dJnTi7+tuHvD9iFH2
	SyfjfU/V4DZVb7SC4gh2xbx7ZM9+VS+MuQhAFwlMlcEIqHZ/RhJn55JbqKELBm+D3cOD
	lFI512/EmBYxwS+nA/rYfiDmwj9Q9RbpgaoPSbYt/V4RcE3eYmQrDpNazXAKORMQ2g5w
	O0VaSe5K1aOvbocpZ75/ng3RPw51NQmRv/8JWovNLzOuZF/rOAayszB+V8HfcaLHafAC
	ELMQ==
X-Received: by 10.205.75.3 with SMTP id yy3mr6319781bkb.80.1370256886678;
	Mon, 03 Jun 2013 03:54:46 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	j8sm19990575bky.17.2013.06.03.03.54.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 03:54:45 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 03 Jun 2013 12:54:43 +0200
Message-ID: <6745553.ZazUN2dGpZ@al>
User-Agent: KMail/4.10.3 (Linux/3.9.1-1-custom; KDE/4.10.3; x86_64; ; )
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::236
Cc: Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH] qemu-doc,
	help: update options/keys for GTK/SDL
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
X-List-Received-Date: Mon, 03 Jun 2013 10:54:56 -0000

The GTK display type has been introduced in 1.5, replacing SDL as default. Some
options only work with SDL and not GTK. This patch tries to address them.

The `-display` option is updated with the new `gtk` option.

The `-alt-grab` and `-ctrl-alt` options are not possible in GTK according to
commit 5104a1f65088285ddf870aa641b9061064e8757d, this is now mentioned
explicitly. Another related change is that only Ctrl-Alt-G can be used for
(un)grbabing.

Window scaling seems also to be a SDL-specific feature and has been marked as
such.

Signed-off-by: Peter Wu <lekensteyn@gmail.com>
---
 qemu-doc.texi   | 18 ++++++++++++------
 qemu-options.hx | 28 ++++++++++++++++------------
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 8022890..76bb4cd 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -275,9 +275,10 @@ targets do not need a disk image.
 @c man begin OPTIONS
 
 During the graphical emulation, you can use special key combinations to change
-modes. The default key mappings are shown below, but if you use @code{-alt-grab}
-then the modifier is Ctrl-Alt-Shift (instead of Ctrl-Alt) and if you use
-@code{-ctrl-grab} then the modifier is the right Ctrl key (instead of Ctrl-Alt):
+modes. The default key mappings are shown below. If you are using SDL display
+mode instead of GTK, you can use @code{-alt-grab} to change the modifier to
+Ctrl-Alt-Shift (instead of Ctrl-Alt) and @code{-ctrl-grab} to change it to right
+Ctrl key (instead of Ctrl-Alt):
 
 @table @key
 @item Ctrl-Alt-f
@@ -294,7 +295,8 @@ Shrink the screen
 
 @item Ctrl-Alt-u
 @kindex Ctrl-Alt-u
-Restore the screen's un-scaled dimensions
+Restore the screen's un-scaled dimensions (SDL windows only, GTK does not
+feature window scaling)
 
 @item Ctrl-Alt-n
 @kindex Ctrl-Alt-n
@@ -308,16 +310,20 @@ Monitor
 Serial port
 @end table
 
+@item Ctrl-Alt-G
+@kindex Ctrl-Alt-G
+Toggle mouse and keyboard grab in GTK mode.
+
 @item Ctrl-Alt
 @kindex Ctrl-Alt
-Toggle mouse and keyboard grab.
+Toggle mouse and keyboard grab in SDL windows.
 @end table
 
 @kindex Ctrl-Up
 @kindex Ctrl-Down
 @kindex Ctrl-PageUp
 @kindex Ctrl-PageDown
-In the virtual consoles, you can use @key{Ctrl-Up}, @key{Ctrl-Down},
+In the virtual consoles of SDL, you can use @key{Ctrl-Up}, @key{Ctrl-Down},
 @key{Ctrl-PageUp} and @key{Ctrl-PageDown} to move in the back log.
 
 @kindex Ctrl-a h
diff --git a/qemu-options.hx b/qemu-options.hx
index bf94862..f7b0172 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -338,7 +338,7 @@ STEXI
 @item -name @var{name}
 @findex -name
 Sets the @var{name} of the guest.
-This name will be displayed in the SDL window caption.
+This name will be displayed in the SDL and GTK window captions.
 The @var{name} will also be used for the VNC server.
 Also optionally set the top visible process name in Linux.
 ETEXI
@@ -804,7 +804,7 @@ ETEXI
 
 DEF("display", HAS_ARG, QEMU_OPTION_display,
     "-display sdl[,frame=on|off][,alt_grab=on|off][,ctrl_grab=on|off]\n"
-    "            [,window_close=on|off]|curses|none|\n"
+    "            [,window_close=on|off]|gtk|curses|none|\n"
     "            vnc=<display>[,<optargs>]\n"
     "                select display type\n", QEMU_ARCH_ALL)
 STEXI
@@ -813,6 +813,8 @@ STEXI
 Select type of display to use. This option is a replacement for the
 old style -sdl/-curses/... options. Valid values for @var{type} are
 @table @option
+@item gtk
+Display video output via GTK which includes a menu bar.
 @item sdl
 Display video output via SDL (usually in a separate graphics
 window; see the SDL documentation for other possibilities).
@@ -839,7 +841,7 @@ DEF("nographic", 0, QEMU_OPTION_nographic,
 STEXI
 @item -nographic
 @findex -nographic
-Normally, QEMU uses SDL to display the VGA output. With this option,
+Normally, QEMU uses GTK to display the VGA output. With this option,
 you can totally disable graphical output so that QEMU is a simple
 command line application. The emulated serial port is redirected on
 the console. Therefore, you can still use QEMU to debug a Linux kernel
@@ -852,7 +854,7 @@ DEF("curses", 0, QEMU_OPTION_curses,
 STEXI
 @item -curses
 @findex -curses
-Normally, QEMU uses SDL to display the VGA output.  With this option,
+Normally, QEMU uses GTK to display the VGA output.  With this option,
 QEMU can display the VGA output when in text mode using a
 curses/ncurses interface.  Nothing is displayed in graphical mode.
 ETEXI
@@ -869,27 +871,29 @@ workspace more convenient.
 ETEXI
 
 DEF("alt-grab", 0, QEMU_OPTION_alt_grab,
-    "-alt-grab       use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt)\n",
+    "-alt-grab       use Ctrl-Alt-Shift to grab mouse in SDL (instead of Ctrl-Alt)\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -alt-grab
 @findex -alt-grab
-Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt). Note that this also
-affects the special keys (for fullscreen, monitor-mode switching, etc).
+Use Ctrl-Alt-Shift to grab mouse in SDL windows (instead of Ctrl-Alt). Note that
+this also affects the special keys (for fullscreen, monitor-mode switching,
+etc).
 ETEXI
 
 DEF("ctrl-grab", 0, QEMU_OPTION_ctrl_grab,
-    "-ctrl-grab      use Right-Ctrl to grab mouse (instead of Ctrl-Alt)\n",
+    "-ctrl-grab      use Right-Ctrl to grab mouse in SDL (instead of Ctrl-Alt)\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -ctrl-grab
 @findex -ctrl-grab
-Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Note that this also
-affects the special keys (for fullscreen, monitor-mode switching, etc).
+Use Right-Ctrl to grab mouse in SDL windows (instead of Ctrl-Alt). Note that
+this also affects the special keys (for fullscreen, monitor-mode switching,
+etc).
 ETEXI
 
 DEF("no-quit", 0, QEMU_OPTION_no_quit,
-    "-no-quit        disable SDL window close capability\n", QEMU_ARCH_ALL)
+    "-no-quit        disable SDL and GTK window close capability\n", QEMU_ARCH_ALL)
 STEXI
 @item -no-quit
 @findex -no-quit
@@ -1080,7 +1084,7 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
 STEXI
 @item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]
 @findex -vnc
-Normally, QEMU uses SDL to display the VGA output.  With this option,
+Normally, QEMU uses GTK to display the VGA output.  With this option,
 you can have QEMU listen on VNC display @var{display} and redirect the VGA
 display over the VNC session.  It is very useful to enable the usb
 tablet device when using this option (option @option{-usbdevice
-- 
1.8.3


