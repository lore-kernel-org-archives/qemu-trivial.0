Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHYIj-00029d-SK
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:22:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHYId-00023G-14
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:22:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHYIc-0004XO-1H
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:22:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHYIW-0004O7-DT; Sun, 04 Jun 2017 12:22:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 687C2404E6;
	Sun,  4 Jun 2017 19:22:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1CBA75F5;
	Sun,  4 Jun 2017 18:45:30 +0300 (MSK)
Received: (nullmailer pid 16397 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:25 +0300
Message-Id: <9d2c9031af6edb352eb83e58fe46cdd99333e7b6.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/22] ivshmem-server: ivshmem-client: Build
 when eventfd() is available
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
X-List-Received-Date: Sun, 04 Jun 2017 16:22:44 -0000

From: Kamil Rytarowski <n54@gmx.com>

Currently ivshmem requires eventfd() which is Linux specific.
Do not and build it unconditionally on every Linux/BSD/Solaris.

This patch indirectly fixes build failure on NetBSD, where these tools
additionally require -lrt for shm_open(3). In future there should be
added support for NetBSD and the linking addressed appropriately.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure                            | 2 ++
 contrib/ivshmem-client/Makefile.objs | 2 +-
 contrib/ivshmem-server/Makefile.objs | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index fbb6a93c99..965727bca8 100755
--- a/configure
+++ b/configure
@@ -4910,6 +4910,8 @@ if test "$want_tools" = "yes" ; then
   tools="qemu-img\$(EXESUF) qemu-io\$(EXESUF) $tools"
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
     tools="qemu-nbd\$(EXESUF) $tools"
+  fi
+  if [ "$eventfd" = "yes" ]; then
     tools="ivshmem-client\$(EXESUF) ivshmem-server\$(EXESUF) $tools"
   fi
 fi
diff --git a/contrib/ivshmem-client/Makefile.objs b/contrib/ivshmem-client/Makefile.objs
index bfab2d20dd..13d864082d 100644
--- a/contrib/ivshmem-client/Makefile.objs
+++ b/contrib/ivshmem-client/Makefile.objs
@@ -1 +1 @@
-ivshmem-client-obj-y = ivshmem-client.o main.o
+ivshmem-client-obj-$(CONFIG_IVSHMEM) = ivshmem-client.o main.o
diff --git a/contrib/ivshmem-server/Makefile.objs b/contrib/ivshmem-server/Makefile.objs
index c060dd3698..d9469fd777 100644
--- a/contrib/ivshmem-server/Makefile.objs
+++ b/contrib/ivshmem-server/Makefile.objs
@@ -1 +1 @@
-ivshmem-server-obj-y = ivshmem-server.o main.o
+ivshmem-server-obj-$(CONFIG_IVSHMEM) = ivshmem-server.o main.o
-- 
2.11.0


