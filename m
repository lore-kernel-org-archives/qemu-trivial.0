Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXpc-0006wr-43
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:52:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpY-0006sa-Ls
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpX-0005BO-Rc
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXpS-0004yG-6z; Sun, 04 Jun 2017 11:52:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6AB8F404E5;
	Sun,  4 Jun 2017 18:52:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B9DD95E7;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: (nullmailer pid 16356 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:05 +0300
Message-Id: <3f2ce724f1f10065169e2c79a68e0d7d7fa2a21c.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/22] qemu-doc: Move the qemu-ga description
 into a separate chapter
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
X-List-Received-Date: Sun, 04 Jun 2017 15:52:41 -0000

From: Thomas Huth <thuth@redhat.com>

The qemu-ga description is currently a subsection of the Disk Images
chapter - which does not make much sense since the qemu-ga is not
directly related to disk images. So let's move this information
into a separate chapter instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index de0cc30790..3f4ed0aa9a 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -34,6 +34,7 @@
 * Introduction::
 * QEMU PC System emulator::
 * QEMU System emulator for non PC targets::
+* QEMU Guest Agent::
 * QEMU User space emulator::
 * Implementation notes::
 * License::
@@ -396,7 +397,6 @@ snapshots.
 * vm_snapshots::              VM snapshots
 * qemu_img_invocation::       qemu-img Invocation
 * qemu_nbd_invocation::       qemu-nbd Invocation
-* qemu_ga_invocation::        qemu-ga Invocation
 * disk_images_formats::       Disk image file formats
 * host_drives::               Using host drives
 * disk_images_fat_images::    Virtual FAT disk images
@@ -490,11 +490,6 @@ state is not saved or restored properly (in particular USB).
 
 @include qemu-nbd.texi
 
-@node qemu_ga_invocation
-@subsection @code{qemu-ga} Invocation
-
-@include qemu-ga.texi
-
 @node disk_images_formats
 @subsection Disk image file formats
 
@@ -2685,6 +2680,12 @@ Note that this allows guest direct access to the host filesystem,
 so should only be used with trusted guest OS.
 
 @end table
+
+@node QEMU Guest Agent
+@chapter QEMU Guest Agent invocation
+
+@include qemu-ga.texi
+
 @node QEMU User space emulator
 @chapter QEMU User space emulator
 
-- 
2.11.0


