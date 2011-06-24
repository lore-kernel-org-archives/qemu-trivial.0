Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qa3Qi-0003VT-D0
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jun 2011 06:16:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Qa3Qe-0003UW-SY
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 06:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Qa3Qd-000150-AS
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 06:16:00 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Qa3QZ-00014a-L6; Fri, 24 Jun 2011 06:15:55 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9D66A72818A5; Fri, 24 Jun 2011 12:15:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id bo1ZmHVcY4zj; Fri, 24 Jun 2011 12:15:53 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FA80.dip.t-dialin.net [80.134.250.128])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	E959372818A4; Fri, 24 Jun 2011 12:15:52 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1Qa3QW-0001AD-76; Fri, 24 Jun 2011 12:15:52 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Fri, 24 Jun 2011 12:15:49 +0200
Message-Id: <1308910549-4445-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1308896356-17797-1-git-send-email-weil@mail.berlios.de>
References: <1308896356-17797-1-git-send-email-weil@mail.berlios.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] w32: Remove redundant definitions of PRI*64
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
X-List-Received-Date: Fri, 24 Jun 2011 10:16:02 -0000

The PRI*64 macros are defined in MinGW's inttypes.h since 2002,
so they are not needed in qemu-common.h (which includes inttypes.h).

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 qemu-common.h |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/qemu-common.h b/qemu-common.h
index 109498d..abd7a75 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -112,11 +112,6 @@ static inline char *realpath(const char *path, char *resolved_path)
     _fullpath(resolved_path, path, _MAX_PATH);
     return resolved_path;
 }
-
-#define PRId64 "I64d"
-#define PRIx64 "I64x"
-#define PRIu64 "I64u"
-#define PRIo64 "I64o"
 #endif
 
 /* FIXME: Remove NEED_CPU_H.  */
-- 
1.7.0.4


