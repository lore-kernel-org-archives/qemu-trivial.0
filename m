Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEfwY-00078K-RF
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 09:37:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VEQuZ-0002ru-0v
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 17:34:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VEQuQ-0004wT-27
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 17:34:50 -0400
Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b]:35177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VEQuP-0004wI-Px
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 17:34:41 -0400
Received: by mail-la0-f43.google.com with SMTP id ep20so3977341lab.2
	for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2013 14:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Wv8MDoiAcdZj9FDvi/rJjBKv9qr+SvX5Ci93bLRpvzo=;
	b=KyrFDuwys0gRDSthrTUKq+4tZxCW8Uy4eeqoflZFcD1X5jmtoInZWeWwGP631yIYWq
	BqhFlhOcN70uKNlFTS49pe57GtlPRbJr6wngIi/o8UZJMWah1+oVWql/Es1m0Nlqn/K+
	KYLISZlEiMezqAcAV9D4g3ujZb3EsmBCnDdTUQMwri/IigHce5zsKWQRFZUG+UX+fdUX
	Op1CUeHoYAT+O4IUEFDVDGY5E7meXsXFFEQaUiy+0nteqBrtCLD8JCHhWrCRE/m5TMco
	Gk+0DMocUNvkuNkZnNAmgXs1AarStE70SHsFV2jBzEiVuckoPFlUSo0UJwbGZ0wq3siX
	fCCw==
X-Received: by 10.152.121.65 with SMTP id li1mr3897618lab.31.1377639280411;
	Tue, 27 Aug 2013 14:34:40 -0700 (PDT)
Received: from localhost.localdomain (ppp37-190-57-26.pppoe.spdop.ru.
	[37.190.57.26])
	by mx.google.com with ESMTPSA id ua4sm7924705lbb.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 14:34:39 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-trivial@nongnu.org
Date: Wed, 28 Aug 2013 01:32:14 +0400
Message-Id: <1377639134-22804-1-git-send-email-antonynpavlov@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22b
X-Mailman-Approved-At: Wed, 28 Aug 2013 09:37:52 -0400
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [Qemu-trivial] [PATCH] pflash_cfi02.c: fix debug macro
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
X-List-Received-Date: Tue, 27 Aug 2013 21:34:59 -0000

If PFLASH_DEBUG is enabled then we have some build errors:

hw/block/pflash_cfi02.c: In function ‘pflash_timer’:
hw/block/pflash_cfi02.c:128:5: error: expected ‘)’ before string constant
hw/block/pflash_cfi02.c:128:5: error: too few arguments to function ‘fprintf’

This patch fixes the problem.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 hw/block/pflash_cfi02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 99445b0..8d4b828 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -47,7 +47,7 @@
 #ifdef PFLASH_DEBUG
 #define DPRINTF(fmt, ...)                                  \
 do {                                                       \
-    fprintf(stderr "PFLASH: " fmt , ## __VA_ARGS__);       \
+    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
 } while (0)
 #else
 #define DPRINTF(fmt, ...) do { } while (0)
-- 
1.8.4.rc3


