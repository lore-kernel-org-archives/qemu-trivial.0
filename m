Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UrD8K-0000l4-8v
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 16:13:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UrD8F-0000g6-R1
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 16:13:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UrD8C-0004ad-Sq
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 16:12:59 -0400
Received: from [216.171.111.232] (port=26107 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UrCKE-0008GR-W8
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 15:21:19 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9cd80
	by freebsd.org (DragonFly Mail Agent 1);
	Mon, 24 Jun 2013 15:21:17 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 15:21:17 -0400
Message-Id: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Mon, 24 Jun 2013 20:13:02 -0000

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
I have had this in a local tree for some time, and it is needed by the
BSD-user work that is now being proposed.

As an aside, an abstraction was recently proposed for Open vSwtich that
can use any of _Thread_local, __thread, or pthread_getspecific() which
may make a convenient reference for someone wishing to implement one of
the TODOs: http://openvswitch.org/pipermail/dev/2013-June/028665.html

 include/qemu/tls.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/tls.h b/include/qemu/tls.h
index b92ea9d..ae7d79d 100644
--- a/include/qemu/tls.h
+++ b/include/qemu/tls.h
@@ -38,7 +38,7 @@
  * TODO: proper implementations via Win32 .tls sections and
  * POSIX pthread_getspecific.
  */
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__)
 #define DECLARE_TLS(type, x) extern DEFINE_TLS(type, x)
 #define DEFINE_TLS(type, x)  __thread __typeof__(type) tls__##x
 #define tls_var(x)           tls__##x
-- 
1.7.11.5


