Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk6HH-0000x8-9O
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 05:14:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HF-0000u0-1u
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HD-0003mv-Cp
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk6H7-0003iQ-MV; Wed, 14 Sep 2016 05:14:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 250F04185A;
	Wed, 14 Sep 2016 12:14:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 12419AF5;
	Wed, 14 Sep 2016 10:58:59 +0300 (MSK)
Received: (nullmailer pid 17335 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Colin Lord <cdlord2@illinois.edu>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:38 +0300
Message-Id: <3c5c14015af9404108b953c76a05de288326e533.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/27] help: Update help to remove misleading
 display information
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 09:14:46 -0000

From: Colin Lord <cdlord2@illinois.edu>

Updates the help messages to remove misleading information about SDL
being the normal display used.

Signed-off-by: Colin Lord <cdlord2@illinois.edu>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index cde4a05..258a8f6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -982,13 +982,14 @@ DEF("nographic", 0, QEMU_OPTION_nographic,
 STEXI
 @item -nographic
 @findex -nographic
-Normally, QEMU uses SDL to display the VGA output. With this option,
-you can totally disable graphical output so that QEMU is a simple
-command line application. The emulated serial port is redirected on
-the console and muxed with the monitor (unless redirected elsewhere
-explicitly). Therefore, you can still use QEMU to debug a Linux kernel
-with a serial console.  Use @key{C-a h} for help on switching between
-the console and monitor.
+Normally, if QEMU is compiled with graphical window support, it displays
+output such as guest graphics, guest console, and the QEMU monitor in a
+window. With this option, you can totally disable graphical output so
+that QEMU is a simple command line application. The emulated serial port
+is redirected on the console and muxed with the monitor (unless
+redirected elsewhere explicitly). Therefore, you can still use QEMU to
+debug a Linux kernel with a serial console. Use @key{C-a h} for help on
+switching between the console and monitor.
 ETEXI
 
 DEF("curses", 0, QEMU_OPTION_curses,
@@ -997,9 +998,11 @@ DEF("curses", 0, QEMU_OPTION_curses,
 STEXI
 @item -curses
 @findex -curses
-Normally, QEMU uses SDL to display the VGA output.  With this option,
-QEMU can display the VGA output when in text mode using a
-curses/ncurses interface.  Nothing is displayed in graphical mode.
+Normally, if QEMU is compiled with graphical window support, it displays
+output such as guest graphics, guest console, and the QEMU monitor in a
+window. With this option, QEMU can display the VGA output when in text
+mode using a curses/ncurses interface. Nothing is displayed in graphical
+mode.
 ETEXI
 
 DEF("no-frame", 0, QEMU_OPTION_no_frame,
@@ -1243,13 +1246,14 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
 STEXI
 @item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]
 @findex -vnc
-Normally, QEMU uses SDL to display the VGA output.  With this option,
-you can have QEMU listen on VNC display @var{display} and redirect the VGA
-display over the VNC session.  It is very useful to enable the usb
-tablet device when using this option (option @option{-usbdevice
-tablet}). When using the VNC display, you must use the @option{-k}
-parameter to set the keyboard layout if you are not using en-us. Valid
-syntax for the @var{display} is
+Normally, if QEMU is compiled with graphical window support, it displays
+output such as guest graphics, guest console, and the QEMU monitor in a
+window. With this option, you can have QEMU listen on VNC display
+@var{display} and redirect the VGA display over the VNC session. It is
+very useful to enable the usb tablet device when using this option
+(option @option{-usbdevice tablet}). When using the VNC display, you
+must use the @option{-k} parameter to set the keyboard layout if you are
+not using en-us. Valid syntax for the @var{display} is
 
 @table @option
 
-- 
2.1.4


