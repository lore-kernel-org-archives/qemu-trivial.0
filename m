Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RDgND-0005ev-1H
	for mharc-qemu-trivial@gnu.org; Tue, 11 Oct 2011 13:44:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RDgNA-0005Uu-Gp
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2011 13:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RDgN9-0003k7-My
	for qemu-trivial@nongnu.org; Tue, 11 Oct 2011 13:44:12 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RDgN7-0003gH-OS; Tue, 11 Oct 2011 13:44:09 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	065AD72834E1; Tue, 11 Oct 2011 19:43:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id UPbrqksMCIrM; Tue, 11 Oct 2011 19:43:27 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9FF6372834E2; Tue, 11 Oct 2011 19:43:27 +0200 (CEST)
From: sw@weilnetz.de
To: qemu-devel@nongnu.org
Date: Tue, 11 Oct 2011 19:43:15 +0200
Message-Id: <1318354995-20905-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] tcg: Fix spelling in comment (varables ->
	variables)
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
X-List-Received-Date: Tue, 11 Oct 2011 17:44:13 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/tcg.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index de8a1d5..015f88a 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -175,7 +175,7 @@ typedef enum TCGType {
 
 typedef tcg_target_ulong TCGArg;
 
-/* Define a type and accessor macros for varables.  Using a struct is
+/* Define a type and accessor macros for variables.  Using a struct is
    nice because it gives some level of type safely.  Ideally the compiler
    be able to see through all this.  However in practice this is not true,
    expecially on targets with braindamaged ABIs (e.g. i386).
-- 
1.7.2.5


