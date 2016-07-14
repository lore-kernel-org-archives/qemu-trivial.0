Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNgMS-0004wy-0N
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jul 2016 09:07:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNgMM-0004nY-UA
	for qemu-trivial@nongnu.org; Thu, 14 Jul 2016 09:07:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNgMI-0001t9-7x
	for qemu-trivial@nongnu.org; Thu, 14 Jul 2016 09:07:22 -0400
Received: from [59.151.112.132] (port=16921 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bNgM6-0001Vb-Cp; Thu, 14 Jul 2016 09:07:07 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8716265"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Jul 2016 21:03:47 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A2E8842B87C4;
	Thu, 14 Jul 2016 21:03:46 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 14 Jul 2016 21:03:44 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <stefanha@redhat.com>, <famz@redhat.com>, <qemu-block@nongnu.org>,
	<qemu-trivial@nongnu.org>
Date: Thu, 14 Jul 2016 21:10:43 +0800
Message-ID: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: A2E8842B87C4.ABEE1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] aio_ctx_check: follow CODING_STYLE
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
X-List-Received-Date: Thu, 14 Jul 2016 13:07:26 -0000

replace tab with spaces

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 async.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/async.c b/async.c
index 1f9754b..8589017 100644
--- a/async.c
+++ b/async.c
@@ -217,7 +217,7 @@ aio_ctx_check(GSource *source)
     for (bh = ctx->first_bh; bh; bh = bh->next) {
         if (!bh->deleted && bh->scheduled) {
             return true;
-	}
+        }
     }
     return aio_pending(ctx) || (timerlistgroup_deadline_ns(&ctx->tlg) == 0);
 }
-- 
2.1.0




