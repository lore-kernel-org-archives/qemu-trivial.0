Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT56C-000492-Vk
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 08:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>) id 1fSwGf-0002dp-Gn
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 23:16:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>) id 1fSwGZ-0006RW-4w
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 23:16:16 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:56388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>)
	id 1fSwGY-0006O5-Ea; Tue, 12 Jun 2018 23:16:11 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
	rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id
	2eeb5b208c69e0b-42031; Wed, 13 Jun 2018 11:15:53 +0800 (CST)
X-RM-TRANSID: 2eeb5b208c69e0b-42031
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from compute2.localdomain (unknown[223.105.0.243])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id
	2ee15b208c679ff-dff0a; Wed, 13 Jun 2018 11:15:52 +0800 (CST)
X-RM-TRANSID: 2ee15b208c679ff-dff0a
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: mjt@tls.msk.ru,
	laurent@vivier.eu
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org,
	Yaowei Bai <baiyaowei@cmss.chinamobile.com>
Date: Tue, 12 Jun 2018 23:15:49 -0400
Message-Id: <1528859749-25286-1-git-send-email-baiyaowei@cmss.chinamobile.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
X-Mailman-Approved-At: Wed, 13 Jun 2018 08:42:03 -0400
Subject: [Qemu-trivial] [PATCH] tracing.txt: add missing '-' for trace option
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
X-List-Received-Date: Wed, 13 Jun 2018 03:16:18 -0000

Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
---
 docs/devel/tracing.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
index 07abbb3..6ab32cc 100644
--- a/docs/devel/tracing.txt
+++ b/docs/devel/tracing.txt
@@ -18,7 +18,7 @@ for debugging, profiling, and observing execution.
 
 3. Run the virtual machine to produce a trace file:
 
-    qemu -trace events=/tmp/events ... # your normal QEMU invocation
+    qemu --trace events=/tmp/events ... # your normal QEMU invocation
 
 4. Pretty-print the binary trace file:
 
-- 
1.8.3.1




