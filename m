Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZKqGk-0003JV-Sg
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jul 2015 12:01:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kamalesh@linux.vnet.ibm.com>) id 1ZKqGh-0003EO-QA
	for qemu-trivial@nongnu.org; Thu, 30 Jul 2015 12:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kamalesh@linux.vnet.ibm.com>) id 1ZKqGc-0001vj-IV
	for qemu-trivial@nongnu.org; Thu, 30 Jul 2015 12:01:15 -0400
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:43380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kamalesh@linux.vnet.ibm.com>) id 1ZKqGb-0001tn-UH
	for qemu-trivial@nongnu.org; Thu, 30 Jul 2015 12:01:10 -0400
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <kamalesh@linux.vnet.ibm.com>;
	Thu, 30 Jul 2015 21:31:05 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
	by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 30 Jul 2015 21:30:59 +0530
X-Helo: d28dlp02.in.ibm.com
X-MailFrom: kamalesh@linux.vnet.ibm.com
X-RcptTo: qemu-trivial@nongnu.org
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id 82A693940062
	for <qemu-trivial@nongnu.org>; Thu, 30 Jul 2015 21:30:59 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t6UG0wRJ43581534
	for <qemu-trivial@nongnu.org>; Thu, 30 Jul 2015 21:30:58 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t6UG0uRo002764
	for <qemu-trivial@nongnu.org>; Thu, 30 Jul 2015 21:30:57 +0530
Received: from Kepler.in.ibm.com ([9.77.193.43])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t6UG0tfk002629; Thu, 30 Jul 2015 21:30:55 +0530
From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu, 30 Jul 2015 21:30:42 +0530
Message-Id: <1438272042-3769-1-git-send-email-kamalesh@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.2
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15073016-0013-0000-0000-0000068BE5A4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 122.248.162.4
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] s390x/kvm: Fix couple of typos
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
X-List-Received-Date: Thu, 30 Jul 2015 16:01:17 -0000

Fix spellings of 'transfered' -> 'transferred' and
'occured' -> 'occurred'.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
---
 target-s390x/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index ae3a0affec9c..7e39045826cd 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -588,9 +588,9 @@ int kvm_s390_set_clock(uint8_t *tod_high, uint64_t *tod_low)
  * @addr:      the logical start address in guest memory
  * @ar:        the access register number
  * @hostbuf:   buffer in host memory. NULL = do only checks w/o copying
- * @len:       length that should be transfered
+ * @len:       length that should be transferred
  * @is_write:  true = write, false = read
- * Returns:    0 on success, non-zero if an exception or error occured
+ * Returns:    0 on success, non-zero if an exception or error occurred
  *
  * Use KVM ioctl to read/write from/to guest memory. An access exception
  * is injected into the vCPU in case of translation errors.
--
2.1.2


