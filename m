Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyqP-0003Ur-Ub
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:19:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqJ-0003HM-9O
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqA-0000ae-CZ
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVypy-0000U2-Jf; Mon, 22 Sep 2014 04:19:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 73BAF45D0F;
	Mon, 22 Sep 2014 12:19:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 97EE8709;
	Mon, 22 Sep 2014 12:11:19 +0400 (MSK)
Received: (nullmailer pid 16996 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:13 +0400
Message-Id: <1411373477-16938-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 5/9] configure: trivial fixes
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
X-List-Received-Date: Mon, 22 Sep 2014 08:19:35 -0000

From: Gonglei <arei.gonglei@huawei.com>

Make them consistent with the others.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 6c3d6cd..eb9cbcd 100755
--- a/configure
+++ b/configure
@@ -1350,7 +1350,7 @@ Advanced options (experts only):
   --enable-linux-aio       enable Linux AIO support
   --disable-cap-ng         disable libcap-ng support
   --enable-cap-ng          enable libcap-ng support
-  --disable-attr           disables attr and xattr support
+  --disable-attr           disable attr and xattr support
   --enable-attr            enable attr and xattr support
   --disable-blobs          disable installing provided firmware blobs
   --enable-docs            enable documentation build
@@ -1381,7 +1381,7 @@ Advanced options (experts only):
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
   --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --disable-seccomp        disable seccomp support
-  --enable-seccomp         enables seccomp support
+  --enable-seccomp         enable seccomp support
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            gthread, ucontext, sigaltstack, windows
   --disable-coroutine-pool disable coroutine freelist (worse performance)
@@ -1396,7 +1396,7 @@ Advanced options (experts only):
   --enable-tpm             enable TPM support
   --disable-libssh2        disable ssh block device support
   --enable-libssh2         enable ssh block device support
-  --disable-vhdx           disables support for the Microsoft VHDX image format
+  --disable-vhdx           disable support for the Microsoft VHDX image format
   --enable-vhdx            enable support for the Microsoft VHDX image format
   --disable-quorum         disable quorum block filter support
   --enable-quorum          enable quorum block filter support
-- 
1.7.10.4


