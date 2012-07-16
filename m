Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sqsyi-0005rS-6r
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2012 17:37:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Sqsyf-0005l9-Od
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2012 17:37:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Sqsyf-0000K1-0c
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2012 17:37:13 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Sqsyc-0000Hl-3r; Mon, 16 Jul 2012 17:37:10 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7A5EF728001A; Mon, 16 Jul 2012 23:37:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id mFUIvomLQMTc; Mon, 16 Jul 2012 23:37:07 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E140C72800C1; Mon, 16 Jul 2012 23:37:07 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Mon, 16 Jul 2012 23:37:07 +0200
Message-Id: <1342474627-27738-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] doc: Fix indefinite article an -> a before
	nouns that begin with 'h'
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
X-List-Received-Date: Mon, 16 Jul 2012 21:37:14 -0000

Although the rule also allows 'an' for historical reasons,
'a' is more common because 'h' is pronounced.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-doc.texi  |    2 +-
 qemu-tech.texi |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 1f20621..4416043 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -78,7 +78,7 @@ to ease cross-compilation and cross-debugging.
 
 @end itemize
 
-QEMU can run without an host kernel driver and yet gives acceptable
+QEMU can run without a host kernel driver and yet gives acceptable
 performance.
 
 For system emulation, the following hardware targets are supported:
diff --git a/qemu-tech.texi b/qemu-tech.texi
index b51a58a..d73dda8 100644
--- a/qemu-tech.texi
+++ b/qemu-tech.texi
@@ -536,7 +536,7 @@ timers, especially together with the use of bottom halves (BHs).
 @node Hardware interrupts
 @section Hardware interrupts
 
-In order to be faster, QEMU does not check at every basic block if an
+In order to be faster, QEMU does not check at every basic block if a
 hardware interrupt is pending. Instead, the user must asynchronously
 call a specific function to tell that an interrupt is pending. This
 function resets the chaining of the currently executing basic
-- 
1.7.10


