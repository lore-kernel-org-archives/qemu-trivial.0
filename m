Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WedoA-0000Hu-Bw
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:08:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedo3-00004z-Of
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedny-0000ot-S9
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:08:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wednm-0000m7-Ik; Mon, 28 Apr 2014 01:08:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0623243038;
	Mon, 28 Apr 2014 09:08:26 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E60012B7;
	Mon, 28 Apr 2014 09:08:25 +0400 (MSK)
Received: (nullmailer pid 19137 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:51 +0400
Message-Id: <1398661684-19059-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laszlo Ersek <lersek@redhat.com>
Subject: [Qemu-trivial] [PULL 05/18] move test-* from .gitignore to
	tests/.gitignore
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
X-List-Received-Date: Mon, 28 Apr 2014 05:08:49 -0000

From: Laszlo Ersek <lersek@redhat.com>

Also sort the test-* entries in the latter.

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore       |    9 ---------
 tests/.gitignore |   11 +++++++++--
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/.gitignore b/.gitignore
index de90463..2748526 100644
--- a/.gitignore
+++ b/.gitignore
@@ -49,15 +49,6 @@ libuser
 /qemu-monitor.texi
 /qmp-commands.txt
 /vscclient
-/test-bitops
-/test-coroutine
-/test-int128
-/test-opts-visitor
-/test-qmp-input-visitor
-/test-qmp-output-visitor
-/test-string-input-visitor
-/test-string-output-visitor
-/test-visitor-serialization
 /fsdev/virtfs-proxy-helper
 /fsdev/virtfs-proxy-helper.1
 /fsdev/virtfs-proxy-helper.pod
diff --git a/tests/.gitignore b/tests/.gitignore
index 9ba9d96..3aa1e95 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -7,20 +7,27 @@ check-qstring
 check-qom-interface
 test-aio
 test-bitops
-test-throttle
+test-coroutine
 test-cutils
 test-hbitmap
 test-int128
 test-iov
 test-mul64
+test-opts-visitor
 test-qapi-types.[ch]
 test-qapi-visit.[ch]
 test-qdev-global-props
-test-qmp-commands.h
 test-qmp-commands
+test-qmp-commands.h
 test-qmp-input-strict
+test-qmp-input-visitor
 test-qmp-marshal.c
+test-qmp-output-visitor
+test-string-input-visitor
+test-string-output-visitor
 test-thread-pool
+test-throttle
+test-visitor-serialization
 test-vmstate
 test-x86-cpuid
 test-xbzrle
-- 
1.7.10.4


