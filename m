Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3anS-0006Vu-7O
	for mharc-qemu-trivial@gnu.org; Sun, 06 Nov 2016 22:40:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1c3anQ-0006To-MK
	for qemu-trivial@nongnu.org; Sun, 06 Nov 2016 22:40:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1c3anP-0004wy-TT
	for qemu-trivial@nongnu.org; Sun, 06 Nov 2016 22:40:32 -0500
Received: from [59.151.112.132] (port=29422 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1c3anJ-0004hn-IA; Sun, 06 Nov 2016 22:40:25 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12721631"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2016 11:40:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4CB6C43972A7;
	Mon,  7 Nov 2016 11:40:09 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 7 Nov 2016 11:40:12 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>, qemu
	trival <qemu-trivial@nongnu.org>
CC: Wen Congyang <wency@cn.fujitsu.com>, zhanghailiang
	<zhang.zhanghailiang@huawei.com>
Date: Mon, 7 Nov 2016 11:48:25 +0800
Message-ID: <1478490505-9315-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 4CB6C43972A7.AE86B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] docs/block-replication.txt: Introduce nbd
 qmp commands
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
X-List-Received-Date: Mon, 07 Nov 2016 03:40:33 -0000

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 docs/block-replication.txt | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index 6bde673..6b9c77b 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -152,9 +152,22 @@ Primary:
          children.0.driver=raw
 
   Run qmp command in primary qemu:
-    { 'execute': 'human-monitor-command',
+    { 'execute': 'blockdev-add',
       'arguments': {
-          'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=xxxx,file.port=xxxx,file.export=colo1,node-name=nbd_client1'
+          'driver': 'replication',
+          'node-name': 'nbd_client1',
+          'mode': 'primary',
+          'file': {
+              'driver': 'nbd',
+              'export': 'colo1',
+              'server': {
+                  'type': 'inet',
+                  'data': {
+                      'host': 'xxxx',
+                      'port': 'xxxx'
+                  }
+              }
+          }
       }
     }
     { 'execute': 'x-blockdev-change',
@@ -223,12 +236,11 @@ Primary:
         'child': 'children.1'
     }
   }
-  { 'execute': 'human-monitor-command',
+  { 'execute': 'x-blockdev-del',
     'arguments': {
-        'command-line': 'drive_del xxxx'
+        'node-name': 'nbd_client1'
     }
   }
-  Note: there is no qmp command to remove the blockdev now
 
 Secondary:
   The primary host is down, so we should do the following thing:
-- 
1.9.3




