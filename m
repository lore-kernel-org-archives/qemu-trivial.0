Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNG1a-0001EQ-H9
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jul 2016 05:00:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNG1V-00011X-Te
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 05:00:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNG1V-00023Y-1Z
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 05:00:05 -0400
Received: from [59.151.112.132] (port=64854 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bNG1P-000212-Oj; Wed, 13 Jul 2016 05:00:00 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8663192"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jul 2016 16:59:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0AE9241C0B8A;
	Wed, 13 Jul 2016 16:59:45 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 13 Jul 2016 16:59:43 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Jul 2016 17:06:36 +0800
Message-ID: <1468400796-30474-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 0AE9241C0B8A.AA188
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] qemu-timer: remove unnecessary code
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
X-List-Received-Date: Wed, 13 Jul 2016 09:00:10 -0000

When passed argument 'ns' is 0, macro DIV_ROUND_UP will return 0 also.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 qemu-timer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/qemu-timer.c b/qemu-timer.c
index eb22e92..cfe0893 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -285,12 +285,8 @@ int qemu_timeout_ns_to_ms(int64_t ns)
         return -1;
     }
 
-    if (!ns) {
-        return 0;
-    }
-
     /* Always round up, because it's better to wait too long than to wait too
-     * little and effectively busy-wait
+     * short and effectively busy-wait
      */
     ms = DIV_ROUND_UP(ns, SCALE_MS);
 
-- 
2.1.0




