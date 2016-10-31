Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1Fxx-0006Y8-LI
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2016 13:01:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1c1Fxu-0006Vh-VP
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 13:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1c1Fxt-0000Fg-U5
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 13:01:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1c1Fxs-0000Cy-1v; Mon, 31 Oct 2016 13:01:40 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1c1Fxj-00085Q-Ui; Mon, 31 Oct 2016 17:01:31 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Mon, 31 Oct 2016 17:01:30 +0000
Message-Id: <1477933290-32248-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] README: Add linux to macOS build info
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
X-List-Received-Date: Mon, 31 Oct 2016 17:01:44 -0000

The README lists the URLs for the wiki pages describing
how to build on Linux and Windows; add the equivalent
link for building on macOS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/README b/README
index bd8060a..cb60d05 100644
--- a/README
+++ b/README
@@ -45,6 +45,7 @@ of other UNIX targets. The simple steps to build QEMU are:
 Additional information can also be found online via the QEMU website:
 
   http://qemu-project.org/Hosts/Linux
+  http://qemu-project.org/Hosts/Mac
   http://qemu-project.org/Hosts/W32
 
 
-- 
2.7.4


