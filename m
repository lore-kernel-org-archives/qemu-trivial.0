Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THJHl-0000Wd-4Z
	for mharc-qemu-trivial@gnu.org; Thu, 27 Sep 2012 14:58:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1THJHd-000098-HO
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 14:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1THJHU-0003SN-34
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2012 14:58:01 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47179)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1THJHI-0003QZ-Cf; Thu, 27 Sep 2012 14:57:40 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A6814728003C; Thu, 27 Sep 2012 20:57:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id PCzLTOiumVlq; Thu, 27 Sep 2012 20:57:39 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 319E2728003D; Thu, 27 Sep 2012 20:57:39 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Thu, 27 Sep 2012 20:57:38 +0200
Message-Id: <1348772258-31168-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] slirp: Fix spelling in comment (enought ->
	enough, insure -> ensure)
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
X-List-Received-Date: Thu, 27 Sep 2012 18:58:07 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

As a non native speaker, I feel that 'ensure' is better here than 'insure'.
Could a native speaker please confirm that?

Thanks,

Stefan

 slirp/ip_icmp.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/slirp/ip_icmp.h b/slirp/ip_icmp.h
index 1a1af91..be4426b 100644
--- a/slirp/ip_icmp.h
+++ b/slirp/ip_icmp.h
@@ -92,8 +92,8 @@ struct icmp {
 
 /*
  * Lower bounds on packet lengths for various types.
- * For the error advice packets must first insure that the
- * packet is large enought to contain the returned ip header.
+ * For the error advice packets must first ensure that the
+ * packet is large enough to contain the returned ip header.
  * Only then can we do the check to see if 64 bits of packet
  * data have been returned, since we need to check the returned
  * ip header length.
-- 
1.7.10


