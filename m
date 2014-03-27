Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCEe-0001QY-Kk
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:28:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCEY-0001ED-5Y
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCET-0002eI-Np
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:28:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53447)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCEJ-0002bQ-TQ; Thu, 27 Mar 2014 11:28:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 48C8543720;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1A76F671;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: (nullmailer pid 1779 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:12 +0400
Message-Id: <1395934108-1694-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [Qemu-trivial] [PULL 07/23] doc: update sun4m documentation
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
X-List-Received-Date: Thu, 27 Mar 2014 15:28:50 -0000

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

A few minor tidy-ups, plus add reference to the new -vga tcx and cg3 options.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi   |    9 +++++----
 qemu-options.hx |   10 +++++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index ad31f2d..6d684e2 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1996,7 +1996,7 @@ QEMU emulates the following sun4m peripherals:
 @item
 IOMMU
 @item
-TCX Frame buffer
+TCX or cgthree Frame buffer
 @item
 Lance (Am7990) Ethernet
 @item
@@ -2023,7 +2023,7 @@ firmware implementation. The goal is to implement a 100% IEEE
 
 A sample Linux 2.6 series kernel and ram disk image are available on
 the QEMU web site. There are still issues with NetBSD and OpenBSD, but
-some kernel versions work. Please note that currently Solaris kernels
+some kernel versions work. Please note that currently older Solaris kernels
 don't work probably due to interface issues between OpenBIOS and
 Solaris.
 
@@ -2035,8 +2035,9 @@ The following options are specific to the Sparc32 emulation:
 
 @item -g @var{W}x@var{H}x[x@var{DEPTH}]
 
-Set the initial TCX graphic mode. The default is 1024x768x8, currently
-the only other possible mode is 1024x768x24.
+Set the initial graphics mode. For TCX, the default is 1024x768x8 with the
+option of 1024x768x24. For cgthree, the default is 1024x768x8 with the option
+of 1152x900x8 for people who wish to use OBP.
 
 @item -prom-env @var{string}
 
diff --git a/qemu-options.hx b/qemu-options.hx
index ee5437b..2d33815 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1043,7 +1043,7 @@ Rotate graphical output some deg left (only PXA LCD).
 ETEXI
 
 DEF("vga", HAS_ARG, QEMU_OPTION_vga,
-    "-vga [std|cirrus|vmware|qxl|xenfb|none]\n"
+    "-vga [std|cirrus|vmware|qxl|xenfb|tcx|cg3|none]\n"
     "                select video card type\n", QEMU_ARCH_ALL)
 STEXI
 @item -vga @var{type}
@@ -1068,6 +1068,14 @@ card.
 QXL paravirtual graphic card.  It is VGA compatible (including VESA
 2.0 VBE support).  Works best with qxl guest drivers installed though.
 Recommended choice when using the spice protocol.
+@item tcx
+(sun4m only) Sun TCX framebuffer. This is the default framebuffer for
+sun4m machines and offers both 8-bit and 24-bit colour depths at a
+fixed resolution of 1024x768.
+@item cg3
+(sun4m only) Sun cgthree framebuffer. This is a simple 8-bit framebuffer
+for sun4m machines available in both 1024x768 (OpenBIOS) and 1152x900 (OBP)
+resolutions aimed at people wishing to run older Solaris versions.
 @item none
 Disable VGA card.
 @end table
-- 
1.7.10.4


