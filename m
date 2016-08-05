Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bVjSx-0004pz-0N
	for mharc-qemu-trivial@gnu.org; Fri, 05 Aug 2016 14:03:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clord@redhat.com>) id 1bVjSv-0004li-21
	for qemu-trivial@nongnu.org; Fri, 05 Aug 2016 14:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clord@redhat.com>) id 1bVjSt-0000a4-W8
	for qemu-trivial@nongnu.org; Fri, 05 Aug 2016 14:03:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48790)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clord@redhat.com>)
	id 1bVjSp-0000Zh-7T; Fri, 05 Aug 2016 14:03:19 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 277F3285A7;
	Fri,  5 Aug 2016 18:03:18 +0000 (UTC)
Received: from dhcp-17-138.bos.redhat.com (dhcp-17-209.bos.redhat.com
	[10.18.17.209])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u75I3Hua028850; Fri, 5 Aug 2016 14:03:17 -0400
From: Colin Lord <clord@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org, Colin Lord <clord@redhat.com>
Date: Fri,  5 Aug 2016 14:03:15 -0400
Message-Id: <1470420195-32551-1-git-send-email-clord@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 05 Aug 2016 18:03:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] help: Update help to reflect that GTK is
 the default
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
X-List-Received-Date: Fri, 05 Aug 2016 18:03:26 -0000

Updates the help messages to reflect that GTK is the default display (if
enabled), not SDL.

Signed-off-by: Colin Lord <clord@redhat.com>
---
 v2: Update to try to implement Paolo's suggested wordings. It looks to
 me like the subsections get wrapped at 72 lines, which mean there was a
 bit of a ripple effect and the changes look bigger than they are.
 qemu-options.hx | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index a71aaf8..657d083 100644
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
+Normally, QEMU uses GTK or SDL to display the output (such as graphics,
+console, and the QEMU monitor). With this option, you can totally
+disable graphical output so that QEMU is a simple command line
+application. The emulated serial port is redirected on the console and
+muxed with the monitor (unless redirected elsewhere explicitly).
+Therefore, you can still use QEMU to debug a Linux kernel with a serial
+console. Use @key{C-a h} for help on switching between the console and
+monitor.
 ETEXI
 
 DEF("curses", 0, QEMU_OPTION_curses,
@@ -997,9 +998,10 @@ DEF("curses", 0, QEMU_OPTION_curses,
 STEXI
 @item -curses
 @findex -curses
-Normally, QEMU uses SDL to display the VGA output.  With this option,
-QEMU can display the VGA output when in text mode using a
-curses/ncurses interface.  Nothing is displayed in graphical mode.
+Normally, QEMU uses GTK or SDL to display the output (such as graphics,
+console, and the QEMU monitor). With this option, QEMU can display the
+VGA output when in text mode using a curses/ncurses interface. Nothing
+is displayed in graphical mode.
 ETEXI
 
 DEF("no-frame", 0, QEMU_OPTION_no_frame,
@@ -1243,13 +1245,13 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
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
+Normally, QEMU uses GTK or SDL to display the output (such as graphics,
+console, and the QEMU monitor). With this option, you can have QEMU
+listen on VNC display @var{display} and redirect the VGA display over
+the VNC session. It is very useful to enable the usb tablet device when
+using this option (option @option{-usbdevice tablet}). When using the
+VNC display, you must use the @option{-k} parameter to set the keyboard
+layout if you are not using en-us. Valid syntax for the @var{display} is
 
 @table @option
 
-- 
2.5.5


