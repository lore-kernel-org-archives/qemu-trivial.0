Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QjcdU-0003Zj-GA
	for mharc-qemu-trivial@gnu.org; Wed, 20 Jul 2011 15:40:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QjcdP-0003YQ-4V
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 15:40:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QjcdL-0003Ux-5v
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 15:40:42 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Qjcd8-0003T6-ET; Wed, 20 Jul 2011 15:40:26 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	60A777282F86; Wed, 20 Jul 2011 21:40:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id SVNixar2XnGB; Wed, 20 Jul 2011 21:40:19 +0200 (CEST)
Received: from flocke.weilnetz.de (p54AD9D65.dip.t-dialin.net [84.173.157.101])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	65ACC7282F85; Wed, 20 Jul 2011 21:40:19 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1Qjcd0-0001Fp-NS; Wed, 20 Jul 2011 21:40:18 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Wed, 20 Jul 2011 21:40:18 +0200
Message-Id: <1311190818-4793-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] darwin-user: Remove two unused variables
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
X-List-Received-Date: Wed, 20 Jul 2011 19:40:47 -0000

cppcheck report:

darwin-user/signal.c:322: style: Unused variable: i
darwin-user/signal.c:322: style:
Variable 'err' is assigned a value that is never used

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 darwin-user/signal.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/darwin-user/signal.c b/darwin-user/signal.c
index e2adca3..c530227 100644
--- a/darwin-user/signal.c
+++ b/darwin-user/signal.c
@@ -319,7 +319,6 @@ static void setup_frame(int sig, struct emulated_sigaction *ka,
 			void *set, CPUState *env)
 {
 	void *frame;
-	int i, err = 0;
 
     fprintf(stderr, "setup_frame %d\n", sig);
 	frame = get_sigframe(ka, env, sizeof(*frame));
-- 
1.7.2.5


