Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5bT-0005ta-1w
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:51:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bQ-0005o8-JI
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bP-00048w-Im
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:24 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL5b7-000429-Ls; Tue, 10 Feb 2015 02:51:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A6D0741831;
	Tue, 10 Feb 2015 10:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 40A4394D;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9394 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:19 +0300
Message-Id: <be7433efbf8b4134ab9763abdecaf2e6a35e1ed1.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Greg Kurz <gkurz@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 30/46] Fix name error in migration stream
	analyzation script
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
X-List-Received-Date: Tue, 10 Feb 2015 07:51:25 -0000

From: Greg Kurz <gkurz@linux.vnet.ibm.com>

It fixes the following error:

Traceback (most recent call last):
  File "./scripts/analyze-migration.py", line 584, in <module>
    dump.read(dump_memory = args.memory)
  File "./scripts/analyze-migration.py", line 528, in read
    self.sections[section_id].read()
  File "./scripts/analyze-migration.py", line 250, in read
    self.file.readvar(n_valid * HASH_PTE_SIZE_64)
NameError: global name 'HASH_PTE_SIZE_64' is not defined

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/analyze-migration.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index b8b9968..0c8b22f 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -247,7 +247,7 @@ class HTABSection(object):
             if index == 0 and n_valid == 0 and n_invalid == 0:
                 break
 
-            self.file.readvar(n_valid * HASH_PTE_SIZE_64)
+            self.file.readvar(n_valid * self.HASH_PTE_SIZE_64)
 
     def getDict(self):
         return ""
-- 
2.1.4


