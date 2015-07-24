Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZIdCw-0007pt-Ef
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jul 2015 09:40:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kamalesh@linux.vnet.ibm.com>) id 1ZIYCj-00046W-7V
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 04:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kamalesh@linux.vnet.ibm.com>) id 1ZIYCe-0007zM-8s
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 04:19:41 -0400
Received: from e23smtp04.au.ibm.com ([202.81.31.146]:53933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kamalesh@linux.vnet.ibm.com>) id 1ZIYCb-0007ve-Pz
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 04:19:36 -0400
Received: from /spool/local
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <kamalesh@linux.vnet.ibm.com>;
	Fri, 24 Jul 2015 18:19:25 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 24 Jul 2015 18:19:22 +1000
X-Helo: d23dlp03.au.ibm.com
X-MailFrom: kamalesh@linux.vnet.ibm.com
X-RcptTo: qemu-trivial@nongnu.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 0C84A357804F
	for <qemu-trivial@nongnu.org>; Fri, 24 Jul 2015 18:19:22 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t6O8J7nc60751952
	for <qemu-trivial@nongnu.org>; Fri, 24 Jul 2015 18:19:18 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t6O8IkrZ025928
	for <qemu-trivial@nongnu.org>; Fri, 24 Jul 2015 18:18:47 +1000
Received: from Kepler.in.ibm.com ([9.124.158.136])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t6O8IjII025723; Fri, 24 Jul 2015 18:18:46 +1000
From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Fri, 24 Jul 2015 13:48:13 +0530
Message-Id: <1437725893-21994-1-git-send-email-kamalesh@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.2
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15072408-0013-0000-0000-000001A09B72
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 202.81.31.146
X-Mailman-Approved-At: Fri, 24 Jul 2015 09:40:12 -0400
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] device_tree: Fix a typo
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
X-List-Received-Date: Fri, 24 Jul 2015 08:19:42 -0000

Fix spelling of 'allocting' -> 'allocating'.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
---
 device_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device_tree.c b/device_tree.c
index d2de5809474e..a9f5f8e598d3 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -241,7 +241,7 @@ uint32_t qemu_fdt_alloc_phandle(void *fdt)

     /*
      * We need to find out if the user gave us special instruction at
-     * which phandle id to start allocting phandles.
+     * which phandle id to start allocating phandles.
      */
     if (!phandle) {
         phandle = machine_phandle_start(current_machine);
--
2.1.2


