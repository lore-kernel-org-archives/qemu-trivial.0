Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPVtQ-0002zm-07
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jun 2017 11:25:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dPVtO-0002yE-6r
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 11:25:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dPVtK-0000gi-8J
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 11:25:34 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:48257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dPVtK-0000g2-19
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 11:25:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dPVtF-0007tU-JW; Mon, 26 Jun 2017 16:25:25 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Mon, 26 Jun 2017 16:25:24 +0100
Message-Id: <1498490724-20674-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 81.2.115.148
Subject: [Qemu-trivial] [PATCH] configure: Handle having no c++ compiler in
 FORTIFY_SOURCE check
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
X-List-Received-Date: Mon, 26 Jun 2017 15:25:35 -0000

Our FORTIFY_SOURCE check assumes that $cxx refers to a working C++
compiler, with the result that if you don't happen to have one
then configure will spuriously print
  configure: line 4685: c++: command not found

Fix this by adding a 'has $cxx' check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index c571ad1..a435908 100755
--- a/configure
+++ b/configure
@@ -4681,7 +4681,7 @@ fi
 if test "$fortify_source" != "no"; then
   if echo | $cc -dM -E - | grep __clang__ > /dev/null 2>&1 ; then
     fortify_source="no";
-  elif test -n "$cxx" &&
+  elif test -n "$cxx" && has $cxx &&
        echo | $cxx -dM -E - | grep __clang__ >/dev/null 2>&1 ; then
     fortify_source="no";
   else
-- 
2.7.4


