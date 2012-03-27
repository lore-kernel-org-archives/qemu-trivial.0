Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCZzp-0000ls-V5
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2012 13:15:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SCZzk-0000Ue-Lb
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 13:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SCZzi-000596-Sw
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 13:15:44 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SCZzb-00056L-Pr; Tue, 27 Mar 2012 13:15:35 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	44ABC72800B0; Tue, 27 Mar 2012 19:15:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3b6OGdGGz840; Tue, 27 Mar 2012 19:15:28 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 426BF72800B1; Tue, 27 Mar 2012 19:15:28 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 27 Mar 2012 19:15:27 +0200
Message-Id: <1332868527-11909-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Always set LC_ALL=C for makeinfo
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
X-List-Received-Date: Tue, 27 Mar 2012 17:15:49 -0000

Otherwise the generated file qemu-doc.html will contain "Anhang"
instead of "Appendix" with a German locale (de_DE.UTF-8).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index d8e1f36..b48c019 100644
--- a/Makefile
+++ b/Makefile
@@ -327,7 +327,7 @@ TEXIFLAG=$(if $(V),,--quiet)
 	$(call quiet-command,texi2dvi $(TEXIFLAG) -I . $<,"  GEN   $@")
 
 %.html: %.texi
-	$(call quiet-command,$(MAKEINFO) $(MAKEINFOFLAGS) --html $< -o $@, \
+	$(call quiet-command,LC_ALL=C $(MAKEINFO) $(MAKEINFOFLAGS) --html $< -o $@, \
 	"  GEN   $@")
 
 %.info: %.texi
-- 
1.7.9


