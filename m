Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QjzCy-0007Aw-8W
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jul 2011 15:46:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QjzCv-00073B-UO
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2011 15:46:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QjzCv-0006pE-3d
	for qemu-trivial@nongnu.org; Thu, 21 Jul 2011 15:46:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QjzCs-0006od-Mz; Thu, 21 Jul 2011 15:46:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	437D27282F8C; Thu, 21 Jul 2011 21:46:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ZfMj5A44X9Eu; Thu, 21 Jul 2011 21:46:47 +0200 (CEST)
Received: from flocke.weilnetz.de (p54AD9FDE.dip.t-dialin.net [84.173.159.222])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A856B7282F8B; Thu, 21 Jul 2011 21:46:47 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QjzCo-0001my-F8; Thu, 21 Jul 2011 21:46:46 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 21 Jul 2011 21:46:45 +0200
Message-Id: <1311277605-6848-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] slirp: Fix unusual "comments" in unused code
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
X-List-Received-Date: Thu, 21 Jul 2011 19:46:55 -0000

cppcheck detected two rather strange comments which were not
correctly written as C comments.

They did not cause any harm because they were framed by
#ifdef notdef ... #endif, so they were never compiled.

Fix them nevertheless (we could also remove the unused code).

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 slirp/ip_input.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/slirp/ip_input.c b/slirp/ip_input.c
index 768ab0c..53871c2 100644
--- a/slirp/ip_input.c
+++ b/slirp/ip_input.c
@@ -531,7 +531,7 @@ typedef uint32_t n_time;
 				 */
 				break;
 			}
-			off--;			/ * 0 origin *  /
+                        off--; /* 0 origin */
 			if (off > optlen - sizeof(struct in_addr)) {
 				/*
 				 * End of source route.  Should be for us.
@@ -574,7 +574,7 @@ typedef uint32_t n_time;
 			/*
 			 * If no space remains, ignore.
 			 */
-			off--;			 * 0 origin *
+                        off--; /* 0 origin */
 			if (off > optlen - sizeof(struct in_addr))
 				break;
 			bcopy((caddr_t)(&ip->ip_dst), (caddr_t)&ipaddr.sin_addr,
-- 
1.7.2.5


