Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTI7-0005VD-B9
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:09:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHy-0005E0-U6
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHt-00050q-5e
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTHf-0004wT-Lg; Tue, 24 Jun 2014 12:09:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AFCDD44084;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 92A95674;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: (nullmailer pid 15615 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:09 +0400
Message-Id: <1403626160-15546-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PULL 03/14] configure: Enable TPM by default,
	add --disable-tpm
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
X-List-Received-Date: Tue, 24 Jun 2014 16:09:49 -0000

From: Cole Robinson <crobinso@redhat.com>

I don't see why tpm is disabled by default: it doesn't have any
external dependencies, or change default behavior. Leaving it disabled
is just going to cause it to bit rot.

Enable it by default, and add a --disable-tpm option.

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9c1471e..7102964 100755
--- a/configure
+++ b/configure
@@ -330,7 +330,7 @@ virtio_blk_data_plane=""
 gtk=""
 gtkabi=""
 vte=""
-tpm="no"
+tpm="yes"
 libssh2=""
 vhdx=""
 quorum=""
@@ -1105,6 +1105,8 @@ for opt do
   ;;
   --enable-vte) vte="yes"
   ;;
+  --disable-tpm) tpm="no"
+  ;;
   --enable-tpm) tpm="yes"
   ;;
   --disable-libssh2) libssh2="no"
@@ -1382,6 +1384,7 @@ Advanced options (experts only):
   --disable-glusterfs      disable GlusterFS backend
   --enable-gcov            enable test coverage analysis with gcov
   --gcov=GCOV              use specified gcov [$gcov_tool]
+  --disable-tpm            disable TPM support
   --enable-tpm             enable TPM support
   --disable-libssh2        disable ssh block device support
   --enable-libssh2         enable ssh block device support
-- 
1.7.10.4


