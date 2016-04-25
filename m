Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1auazV-0007Jw-SM
	for mharc-qemu-trivial@gnu.org; Mon, 25 Apr 2016 03:31:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1auXLe-0008Rv-4E
	for qemu-trivial@nongnu.org; Sun, 24 Apr 2016 23:38:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1auXLd-00053O-Ag
	for qemu-trivial@nongnu.org; Sun, 24 Apr 2016 23:38:10 -0400
Received: from [59.151.112.132] (port=30931 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>)
	id 1auXLX-0004zJ-7Z; Sun, 24 Apr 2016 23:38:03 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5910882"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Apr 2016 11:37:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 48458408D263;
	Mon, 25 Apr 2016 11:37:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.45) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 25 Apr 2016 11:37:33 +0800
From: Zhou Jie <zhoujie2011@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <david@gibson.dropbear.id.au>, <qemu-trivial@nongnu.org>, Zhou Jie
	<zhoujie2011@cn.fujitsu.com>
Date: Mon, 25 Apr 2016 11:36:06 -0400
Message-ID: <1461598566-28454-1-git-send-email-zhoujie2011@cn.fujitsu.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.45]
X-yoursite-MailScanner-ID: 48458408D263.A4975
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhoujie2011@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Mon, 25 Apr 2016 03:31:31 -0400
Subject: [Qemu-trivial] [PATCH] Added negative check for get_image_size()
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
X-List-Received-Date: Mon, 25 Apr 2016 03:38:11 -0000

This patch adds check for negative return value from get_image_size(),
where it is missing. It avoids unnecessary two function calls.

Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
---
 hw/ppc/spapr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index feaab08..ccea633 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1842,6 +1842,10 @@ static void ppc_spapr_init(MachineState *machine)
         exit(1);
     }
     spapr->rtas_size = get_image_size(filename);
+    if (spapr->rtas_size < 0) {
+        error_report("Could not get size of LPAR rtas '%s'", filename);
+        exit(1);
+    }
     spapr->rtas_blob = g_malloc(spapr->rtas_size);
     if (load_image_size(filename, spapr->rtas_blob, spapr->rtas_size) < 0) {
         error_report("Could not load LPAR rtas '%s'", filename);
-- 
2.5.5




