Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekGgJ-0006hd-5W
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2018 16:58:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yasmins@linux.vnet.ibm.com>) id 1ekFG3-0000JA-JV
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:26:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yasmins@linux.vnet.ibm.com>) id 1ekFG2-0001Rh-JL
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:26:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45310
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yasmins@linux.vnet.ibm.com>)
	id 1ekFG2-0001RT-Ds
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:26:54 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w19KOEge009309
	for <qemu-trivial@nongnu.org>; Fri, 9 Feb 2018 15:26:51 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2g1fp6euyu-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Fri, 09 Feb 2018 15:26:50 -0500
Received: from localhost
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <yasmins@linux.vnet.ibm.com>;
	Fri, 9 Feb 2018 13:26:48 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
	by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 9 Feb 2018 13:26:46 -0700
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id w19KQjjs10289548; Fri, 9 Feb 2018 13:26:45 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC40678047;
	Fri,  9 Feb 2018 13:26:45 -0700 (MST)
Received: from kofr1.aus.stglabs.ibm.com (unknown [9.40.193.40])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 625387803F; 
	Fri,  9 Feb 2018 13:26:45 -0700 (MST)
From: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, joserz@linux.vnet.ibm.com
Date: Fri,  9 Feb 2018 14:26:21 -0600
X-Mailer: git-send-email 2.14.1
X-TM-AS-GCONF: 00
x-cbid: 18020920-0016-0000-0000-0000083BCBE7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008505; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000251; SDB=6.00987349; UDB=6.00501155;
	IPR=6.00766707; 
	BA=6.00005821; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019466;
	XFM=3.00000015; UTC=2018-02-09 20:26:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020920-0017-0000-0000-00003D6745B1
Message-Id: <20180209202621.97852-1-yasmins@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1802090258
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
X-Mailman-Approved-At: Fri, 09 Feb 2018 16:58:03 -0500
Subject: [Qemu-trivial] [PATCH v2] dump: Show custom message for ENOSPC
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
X-List-Received-Date: Fri, 09 Feb 2018 20:26:56 -0000

This patch intends to make a more specific message for when
the system has not enough space to save guest memory.

Reported-by: yilzhang@redhat.com
Cc: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
Signed-off-by: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
---
 dump.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/dump.c b/dump.c
index e9dfed060a..12e0c779ee 100644
--- a/dump.c
+++ b/dump.c
@@ -106,7 +106,7 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
 
     written_size = qemu_write_full(s->fd, buf, size);
     if (written_size != size) {
-        return -1;
+        return -errno;
     }
 
     return 0;
@@ -364,7 +364,11 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
 
     ret = fd_write_vmcore(buf, length, s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to save memory");
+        if (ret == -ENOSPC) {
+            error_setg(errp, "dump: not enough space to save memory");
+        } else {
+            error_setg(errp, "dump: failed to save memory");
+        }
     } else {
         s->written_size += length;
     }
-- 
2.14.1


