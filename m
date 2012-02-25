Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1H2J-0004JR-C4
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 07:47:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1H29-0003hF-WC
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:47:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1H24-0004Lr-Um
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:47:29 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:36773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1H1t-0004Jc-Li; Sat, 25 Feb 2012 07:47:13 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	3BE657280099; Sat, 25 Feb 2012 13:47:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id uLkJCDpMvAMr; Sat, 25 Feb 2012 13:47:11 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E6676728009B; Sat, 25 Feb 2012 13:47:11 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 13:47:10 +0100
Message-Id: <1330174030-21373-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1330174030-21373-1-git-send-email-sw@weilnetz.de>
References: <1330174030-21373-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qmp: Fix spelling fourty -> forty
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
X-List-Received-Date: Sat, 25 Feb 2012 12:47:36 -0000

This was found by codespell.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 test-qmp-output-visitor.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/test-qmp-output-visitor.c b/test-qmp-output-visitor.c
index c94c208..5452cd4 100644
--- a/test-qmp-output-visitor.c
+++ b/test-qmp-output-visitor.c
@@ -221,8 +221,8 @@ static void test_visitor_out_struct_nested(TestOutputVisitorData *data,
     QObject *obj;
     QDict *qdict, *dict1, *dict2, *dict3, *userdef;
     const char *string = "user def string";
-    const char *strings[] = { "fourty two", "fourty three", "fourty four",
-                              "fourty five" };
+    const char *strings[] = { "forty two", "forty three", "forty four",
+                              "forty five" };
 
     ud2 = g_malloc0(sizeof(*ud2));
     ud2->string0 = g_strdup(strings[0]);
-- 
1.7.9


