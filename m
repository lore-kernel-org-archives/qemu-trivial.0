Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bT1pD-0000Ni-3S
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2016 03:03:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bT1pA-0000MN-VY
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 03:03:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bT1pA-00062C-6g
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 03:03:12 -0400
Received: from [59.151.112.132] (port=36080 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bT1p4-00060m-4R; Fri, 29 Jul 2016 03:03:06 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9293823"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2016 15:02:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C2FAE42B548B;
	Fri, 29 Jul 2016 15:02:54 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 29 Jul 2016 15:02:54 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <amit.shah@redhat.com>, <qemu-trivial@nongnu.org>
Date: Fri, 29 Jul 2016 15:10:31 +0800
Message-ID: <1469776231-23820-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: C2FAE42B548B.AE542
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] migration/ram: fix typo
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
X-List-Received-Date: Fri, 29 Jul 2016 07:03:14 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 migration/ram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 815bc0e..a3d70c4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -375,8 +375,8 @@ void migrate_compress_threads_create(void)
     qemu_cond_init(&comp_done_cond);
     qemu_mutex_init(&comp_done_lock);
     for (i = 0; i < thread_count; i++) {
-        /* com_param[i].file is just used as a dummy buffer to save data, set
-         * it's ops to empty.
+        /* comp_param[i].file is just used as a dummy buffer to save data,
+         * set its ops to empty.
          */
         comp_param[i].file = qemu_fopen_ops(NULL, &empty_ops);
         comp_param[i].done = true;
-- 
2.1.0




