Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPm5v-0003vy-Pm
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 00:57:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1WPfPV-0007ax-H6
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 17:49:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1WPfPP-0000bn-54
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 17:49:29 -0400
Received: from s16892447.onlinehome-server.info ([82.165.15.123]:53802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1WPfP9-0000YQ-SF; Mon, 17 Mar 2014 17:49:07 -0400
Received: from [149.241.50.80] (helo=kentang.lan)
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1WPfOv-0000rn-5Z; Mon, 17 Mar 2014 21:49:01 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon, 17 Mar 2014 21:46:25 +0000
Message-Id: <1395092786-12641-2-git-send-email-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395092786-12641-1-git-send-email-mark.cave-ayland@ilande.co.uk>
References: <1395092786-12641-1-git-send-email-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 149.241.50.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
X-Mailman-Approved-At: Tue, 18 Mar 2014 00:57:42 -0400
Subject: [Qemu-trivial] [PATCH 1/2] doc: update sun4m documentation
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
X-List-Received-Date: Mon, 17 Mar 2014 21:49:35 -0000

A few minor tidy-ups, plus add reference to the new -vga tcx and cg3 options.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


