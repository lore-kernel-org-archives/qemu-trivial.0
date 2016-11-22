Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c90NT-00037I-Pm
	for mharc-qemu-trivial@gnu.org; Mon, 21 Nov 2016 21:00:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1c90NQ-000351-6e
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2016 21:00:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1c90NN-0006v5-MI
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2016 21:00:04 -0500
Received: from [198.36.117.245] (port=41271 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1c90NN-0006tN-CO
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2016 21:00:01 -0500
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9d60b
	by freebsd.org (DragonFly Mail Agent v0.10);
	Mon, 21 Nov 2016 20:32:47 -0500
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Ed Maste <emaste@freebsd.org>
Date: Mon, 21 Nov 2016 20:32:45 -0500
Message-Id: <1479778365-11315-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 198.36.117.245
Subject: [Qemu-trivial] [PATCH] Fix FreeBSD (10.x) build after 7dc9ae43
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
X-List-Received-Date: Tue, 22 Nov 2016 02:00:06 -0000

Include sys/user.h for declaration of 'struct kinfo_proc'.
Add -lutil to qemu-ga link for kinfo_getproc.

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 configure          | 2 ++
 util/oslib-posix.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/configure b/configure
index 7d2a34e..5e66828 100755
--- a/configure
+++ b/configure
@@ -582,6 +582,8 @@ FreeBSD)
   audio_possible_drivers="oss sdl pa"
   # needed for kinfo_getvmmap(3) in libutil.h
   LIBS="-lutil $LIBS"
+  # needed for kinfo_getproc
+  libs_qga="-lutil $libs_qga"
   netmap=""  # enable netmap autodetect
   HOST_VARIANT_DIR="freebsd"
 ;;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 67c6589..f631464 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -45,6 +45,7 @@
 
 #ifdef __FreeBSD__
 #include <sys/sysctl.h>
+#include <sys/user.h>
 #include <libutil.h>
 #endif
 
-- 
2.8.1


