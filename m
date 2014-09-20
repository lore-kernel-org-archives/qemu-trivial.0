Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVFBU-0006jk-O1
	for mharc-qemu-trivial@gnu.org; Sat, 20 Sep 2014 03:34:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XVFBP-0006dX-EP
	for qemu-trivial@nongnu.org; Sat, 20 Sep 2014 03:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XVFBL-0001fI-0T
	for qemu-trivial@nongnu.org; Sat, 20 Sep 2014 03:34:15 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:23802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XVFBA-0001Qz-Bx; Sat, 20 Sep 2014 03:34:02 -0400
Received: from 172.24.2.119 (EHLO szxeml449-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBX58759; Sat, 20 Sep 2014 15:33:40 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml449-hub.china.huawei.com
	(10.82.67.192) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 20 Sep 2014 15:33:29 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 20 Sep 2014 15:33:18 +0800
Message-ID: <1411198398-2140-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, Gonglei <arei.gonglei@huawei.com>, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] configure: trivial fixes
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
X-List-Received-Date: Sat, 20 Sep 2014 07:34:20 -0000

From: Gonglei <arei.gonglei@huawei.com>

Make them consistent with the others.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index fb194fd..8ea93fc 100755
--- a/configure
+++ b/configure
@@ -1349,7 +1349,7 @@ Advanced options (experts only):
   --enable-linux-aio       enable Linux AIO support
   --disable-cap-ng         disable libcap-ng support
   --enable-cap-ng          enable libcap-ng support
-  --disable-attr           disables attr and xattr support
+  --disable-attr           disable attr and xattr support
   --enable-attr            enable attr and xattr support
   --disable-blobs          disable installing provided firmware blobs
   --enable-docs            enable documentation build
@@ -1380,7 +1380,7 @@ Advanced options (experts only):
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
   --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --disable-seccomp        disable seccomp support
-  --enable-seccomp         enables seccomp support
+  --enable-seccomp         enable seccomp support
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            gthread, ucontext, sigaltstack, windows
   --disable-coroutine-pool disable coroutine freelist (worse performance)
@@ -1395,7 +1395,7 @@ Advanced options (experts only):
   --enable-tpm             enable TPM support
   --disable-libssh2        disable ssh block device support
   --enable-libssh2         enable ssh block device support
-  --disable-vhdx           disables support for the Microsoft VHDX image format
+  --disable-vhdx           disable support for the Microsoft VHDX image format
   --enable-vhdx            enable support for the Microsoft VHDX image format
   --disable-quorum         disable quorum block filter support
   --enable-quorum          enable quorum block filter support
-- 
1.7.12.4



