Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vkn1Z-00055p-SU
	for mharc-qemu-trivial@gnu.org; Sun, 24 Nov 2013 22:39:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Vkn1O-00052u-O7
	for qemu-trivial@nongnu.org; Sun, 24 Nov 2013 22:39:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Vkn1G-0005LJ-B2
	for qemu-trivial@nongnu.org; Sun, 24 Nov 2013 22:39:38 -0500
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:34002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Vkn1F-0005Jp-Fd
	for qemu-trivial@nongnu.org; Sun, 24 Nov 2013 22:39:30 -0500
Received: from /spool/local
	by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aik@ozlabs.ru>;
	Mon, 25 Nov 2013 13:39:16 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 25 Nov 2013 13:39:14 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 30D773578050;
	Mon, 25 Nov 2013 14:39:14 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	rAP3LLdM62718180; Mon, 25 Nov 2013 14:21:21 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	rAP3dDhm006923; Mon, 25 Nov 2013 14:39:13 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.190.163.12])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	rAP3dDbK006920; Mon, 25 Nov 2013 14:39:13 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.190.164.82])
	by ozlabs.au.ibm.com (Postfix) with ESMTP id 32A34A011E;
	Mon, 25 Nov 2013 14:39:13 +1100 (EST)
Received: from ka1.ozlabs.ibm.com (ka1.ozlabs.ibm.com [10.61.145.11])
	by bran.ozlabs.ibm.com (Postfix) with ESMTP id C0A8F16A963;
	Mon, 25 Nov 2013 14:39:12 +1100 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Mon, 25 Nov 2013 14:39:10 +1100
Message-Id: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.8.4.rc4
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13112503-1396-0000-0000-000003EBD3F6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.147
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vl: remove (max_cpus > 255) check from
	smp_parse
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
X-List-Received-Date: Mon, 25 Nov 2013 03:39:47 -0000

Since modern POWER7/POWER8 chips can have more that 256 CPU threads
(>2000 actually), remove this check from smp_parse.

The CPUs number is still checked against machine->max_cpus and this check
should be enough not to break other archs.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 vl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/vl.c b/vl.c
index 8d5d874..e6ed260 100644
--- a/vl.c
+++ b/vl.c
@@ -1420,10 +1420,6 @@ static void smp_parse(QemuOpts *opts)
         max_cpus = smp_cpus;
     }
 
-    if (max_cpus > 255) {
-        fprintf(stderr, "Unsupported number of maxcpus\n");
-        exit(1);
-    }
     if (max_cpus < smp_cpus) {
         fprintf(stderr, "maxcpus must be equal to or greater than smp\n");
         exit(1);
-- 
1.8.4.rc4


