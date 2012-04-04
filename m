Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SFSgX-0004AU-Gn
	for mharc-qemu-trivial@gnu.org; Wed, 04 Apr 2012 12:03:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SFSgP-0003oj-ML
	for qemu-trivial@nongnu.org; Wed, 04 Apr 2012 12:03:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SFSgD-0005RS-KJ
	for qemu-trivial@nongnu.org; Wed, 04 Apr 2012 12:03:39 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:55264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SFSg2-0005QW-Kq; Wed, 04 Apr 2012 12:03:18 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SFSfz-0003M6-9V; Wed, 04 Apr 2012 17:03:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Apr 2012 17:03:15 +0100
Message-Id: <1333555395-12873-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Remove useless uses of ARCH_CFLAGS
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
X-List-Received-Date: Wed, 04 Apr 2012 16:03:48 -0000

Remove some useless uses of ARCH_CFLAGS -- this variable was never set
so will always be empty. The uses were accidental: in commit 0c439cbf8
Juan Quintela removed ARCH_CFLAGS in favour of CFLAGS (which in turn
became QEMU_CFLAGS). However in commit be17dc90 a use of it was
reintroduced (apparently accidentally) by Michael S. Tsirkin, and then
I subsequently cut-n-pasted that into a number of other configure
feature tests.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 4b3adc9..80a3e8d 100755
--- a/configure
+++ b/configure
@@ -2361,7 +2361,7 @@ int main(void)
     return 0;
 }
 EOF
-if compile_prog "$ARCH_CFLAGS" "" ; then
+if compile_prog "" "" ; then
   fallocate=yes
 fi
 
@@ -2376,7 +2376,7 @@ int main(void)
     return 0;
 }
 EOF
-if compile_prog "$ARCH_CFLAGS" "" ; then
+if compile_prog "" "" ; then
   sync_file_range=yes
 fi
 
@@ -2393,7 +2393,7 @@ int main(void)
     return 0;
 }
 EOF
-if compile_prog "$ARCH_CFLAGS" "" ; then
+if compile_prog "" "" ; then
   fiemap=yes
 fi
 
@@ -2423,7 +2423,7 @@ int main(void)
     return 0;
 }
 EOF
-if compile_prog "$ARCH_CFLAGS" "" ; then
+if compile_prog "" "" ; then
   epoll=yes
 fi
 
@@ -2446,7 +2446,7 @@ int main(void)
     return epoll_create1 == epoll_create1;
 }
 EOF
-if compile_prog "$ARCH_CFLAGS" "" ; then
+if compile_prog "" "" ; then
   epoll_create1=yes
 fi
 
@@ -2460,7 +2460,7 @@ int main(void)
     return 0;
 }
 EOF
-if compile_prog "$ARCH_CFLAGS" "" ; then
+if compile_prog "" "" ; then
   epoll_pwait=yes
 fi
 
-- 
1.7.1


