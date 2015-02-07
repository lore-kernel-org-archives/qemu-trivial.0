Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YK6JK-0001pW-UF
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 09:24:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1YK2a2-0006uy-Ff
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 05:25:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1YK2Zo-0006Lm-VY
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 05:25:38 -0500
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:35944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1YK2Zo-0006Kz-MD
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 05:25:24 -0500
Received: from /spool/local
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Sat, 7 Feb 2015 10:25:22 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 7 Feb 2015 10:25:20 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com
	(d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id D7F341B0804B; 
	Sat,  7 Feb 2015 10:25:27 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t17APJ9S4391262; Sat, 7 Feb 2015 10:25:19 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t17APIrL004344; Sat, 7 Feb 2015 03:25:18 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t17APGnm004326; Sat, 7 Feb 2015 03:25:16 -0700
Received: from bahia.local (unknown [9.83.101.84])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 9396022030A;
	Sat,  7 Feb 2015 11:25:15 +0100 (CET)
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Alexander Graf <agraf@suse.de>
Date: Sat, 07 Feb 2015 11:25:14 +0100
Message-ID: <20150207102514.3944.93272.stgit@bahia.local>
User-Agent: StGit/0.17-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15020710-0017-0000-0000-000002F6802D
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.110
X-Mailman-Approved-At: Sat, 07 Feb 2015 09:24:37 -0500
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH] Fix name error in migration stream
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
X-List-Received-Date: Sat, 07 Feb 2015 10:25:39 -0000

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
---
 scripts/analyze-migration.py |    2 +-
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


