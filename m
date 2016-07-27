Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bSVCo-0003RE-AP
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2016 16:13:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clord@redhat.com>) id 1bSRan-0004bO-4B
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2016 12:22:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clord@redhat.com>) id 1bSRal-0002xH-Vy
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2016 12:21:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clord@redhat.com>)
	id 1bSRag-0002vM-CW; Wed, 27 Jul 2016 12:21:50 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B0C883F47;
	Wed, 27 Jul 2016 16:21:48 +0000 (UTC)
Received: from dhcp-17-138.bos.redhat.com (wlan-196-64.bos.redhat.com
	[10.16.196.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6RGLk9c005247; Wed, 27 Jul 2016 12:21:47 -0400
From: Colin Lord <clord@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org, Colin Lord <clord@redhat.com>
Date: Wed, 27 Jul 2016 12:21:46 -0400
Message-Id: <1469636506-1768-1-git-send-email-clord@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 27 Jul 2016 16:21:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 27 Jul 2016 16:13:24 -0400
Subject: [Qemu-trivial] [PATCH] help: Update help to reflect that GTK is the
 default
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
X-List-Received-Date: Wed, 27 Jul 2016 16:22:01 -0000

Updates the messages displayed in the help option to reflect that GTK is
the default display, not SDL.
---
 qemu-options.hx | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8e0d9a5..5bec1d3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -967,7 +967,7 @@ DEF("nographic", 0, QEMU_OPTION_nographic,
 STEXI
 @item -nographic
 @findex -nographic
-Normally, QEMU uses SDL to display the VGA output. With this option,
+Normally, QEMU uses GTK to display the VGA output. With this option,
 you can totally disable graphical output so that QEMU is a simple
 command line application. The emulated serial port is redirected on
 the console and muxed with the monitor (unless redirected elsewhere
@@ -977,12 +977,12 @@ the console and monitor.
 ETEXI
 
 DEF("curses", 0, QEMU_OPTION_curses,
-    "-curses         use a curses/ncurses interface instead of SDL\n",
+    "-curses         use a curses/ncurses interface instead of GTK\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -curses
 @findex -curses
-Normally, QEMU uses SDL to display the VGA output.  With this option,
+Normally, QEMU uses GTK to display the VGA output.  With this option,
 QEMU can display the VGA output when in text mode using a
 curses/ncurses interface.  Nothing is displayed in graphical mode.
 ETEXI
@@ -1034,6 +1034,14 @@ STEXI
 Enable SDL.
 ETEXI
 
+DEF("gtk", 0, QEMU_OPTION_gtk,
+    "-gtk            enable GTK (default)\n", QEMU_ARCH_ALL)
+STEXI
+@item -gtk
+@findex -gtk
+Enable GTK.
+ETEXI
+
 DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
     "       [,x509-key-file=<file>][,x509-key-password=<file>]\n"
@@ -1228,7 +1236,7 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
 STEXI
 @item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]
 @findex -vnc
-Normally, QEMU uses SDL to display the VGA output.  With this option,
+Normally, QEMU uses GTK to display the VGA output.  With this option,
 you can have QEMU listen on VNC display @var{display} and redirect the VGA
 display over the VNC session.  It is very useful to enable the usb
 tablet device when using this option (option @option{-usbdevice
-- 
2.5.5


