Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLJ96-0006QZ-UY
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2011 14:33:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RLJ94-0006FP-0o
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 14:33:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RLJ8z-0000at-Qt
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 14:33:09 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:33284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RLJ8x-0000Zq-MA; Tue, 01 Nov 2011 14:33:03 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RLJ8p-0007IM-Ep; Tue, 01 Nov 2011 18:32:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  1 Nov 2011 18:32:55 +0000
Message-Id: <1320172375-28019-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Suppress messages from pkg_config
	probe for check
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
X-List-Received-Date: Tue, 01 Nov 2011 18:33:11 -0000

Suppress confusing messages from pkg_config when probing for
'check' by sending them to /dev/null as we do with other
similar probes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We didn't notice this before because we only recently
changed the default for whether configure probed for this.
I think that makes this a regression we should fix for 1.0.

 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 28667fe..9661b0e 100755
--- a/configure
+++ b/configure
@@ -1828,7 +1828,7 @@ if test "$check_utests" != "no" ; then
 #include <check.h>
 int main(void) { suite_create("qemu test"); return 0; }
 EOF
-  check_libs=`$pkg_config --libs check`
+  check_libs=`$pkg_config --libs check 2>/dev/null`
   if compile_prog "" $check_libs ; then
     check_utests=yes
     libs_tools="$check_libs $libs_tools"
-- 
1.7.4.1


