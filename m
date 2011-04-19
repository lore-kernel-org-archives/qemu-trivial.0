Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QC6ko-0007dH-WB
	for mharc-qemu-trivial@gnu.org; Tue, 19 Apr 2011 04:57:51 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QC6kn-0007aR-92
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 04:57:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QC6km-0005Wt-Gh
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 04:57:49 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:34962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QC6kh-0005Vb-IG; Tue, 19 Apr 2011 04:57:43 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QC6kf-00080p-3l; Tue, 19 Apr 2011 09:57:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 19 Apr 2011 09:57:41 +0100
Message-Id: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Make epoll_create1 test work
	around SPARC glibc bug
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2011 08:57:50 -0000

Work around a SPARC glibc bug which caused the epoll_create1 configure
test to wrongly claim that the function was present. Some versions of
SPARC glibc provided the function in the library but didn't declare
it in the include file; the result is that gcc warns about an implicit
declaration but a link succeeds. So we build the configure test with
-Werror to avoid the test passing but then a -Werror qemu build
failing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index da2da04..d9a8fdc 100755
--- a/configure
+++ b/configure
@@ -2229,7 +2229,12 @@ int main(void)
     return 0;
 }
 EOF
-if compile_prog "$ARCH_CFLAGS" "" ; then
+# We need to build this with -Werror to handle a bug in some
+# SPARC glibc where the function is defined but not declared
+# in the header file. Without -Werror gcc warns about an implicit
+# declaration of the function but the link succeeds; however
+# qemu itself will fail to build if it is compiled -Werror.
+if compile_prog "$ARCH_CFLAGS -Werror" "" ; then
   epoll_create1=yes
 fi
 
-- 
1.7.1


