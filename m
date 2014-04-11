Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WYjrC-00083s-4g
	for mharc-qemu-trivial@gnu.org; Fri, 11 Apr 2014 18:23:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WYjr5-0007vC-U1
	for qemu-trivial@nongnu.org; Fri, 11 Apr 2014 18:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WYjr1-0002RO-45
	for qemu-trivial@nongnu.org; Fri, 11 Apr 2014 18:23:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1WYjqr-0002Q2-68; Fri, 11 Apr 2014 18:23:13 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3BMNC7I031887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 11 Apr 2014 18:23:12 -0400
Received: from colepc.home.com (ovpn-113-175.phx2.redhat.com [10.3.113.175])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3BMNAgX005398; Fri, 11 Apr 2014 18:23:11 -0400
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Apr 2014 18:23:01 -0400
Message-Id: <3caf3e0c72bb14174e254547ebdc9e0e57fd5378.1397254448.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Laszlo Ersek <lersek@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH v2 1/2] move test-* from .gitignore to
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
X-List-Received-Date: Fri, 11 Apr 2014 22:23:32 -0000

From: Laszlo Ersek <lersek@redhat.com>

Also sort the test-* entries in the latter.

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
From: https://lists.gnu.org/archive/html/qemu-devel/2013-10/msg01998.html

v2:
    Rebased to master

 .gitignore       |  9 ---------
 tests/.gitignore | 11 +++++++++--
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
1.9.0


