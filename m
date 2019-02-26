Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gydbr-0007C7-3m
	for mharc-qemu-trivial@gnu.org; Tue, 26 Feb 2019 09:21:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1gydbp-0007AQ-4C
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 09:21:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1gydbn-000308-Kb
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 09:21:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42112
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1gydbn-0002wX-9M
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2019 09:21:23 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1QEEY2A011634
	for <qemu-trivial@nongnu.org>; Tue, 26 Feb 2019 09:21:13 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2qw6bb3h08-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Tue, 26 Feb 2019 09:21:13 -0500
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <groug@kaod.org>;
	Tue, 26 Feb 2019 14:21:12 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 26 Feb 2019 14:21:09 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x1QEL86232112776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 26 Feb 2019 14:21:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3C85A4064;
	Tue, 26 Feb 2019 14:21:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A17E1A4054;
	Tue, 26 Feb 2019 14:21:08 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 26 Feb 2019 14:21:08 +0000 (GMT)
Received: from bahia.lan (sig-9-145-71-26.uk.ibm.com [9.145.71.26])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id F31862201C6;
	Tue, 26 Feb 2019 15:21:07 +0100 (CET)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Date: Tue, 26 Feb 2019 15:21:07 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19022614-0012-0000-0000-000002FA63D7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022614-0013-0000-0000-000021320837
Message-Id: <155119086741.1037569.12734854713022304642.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-02-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=659 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1902260105
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-trivial] [PATCH] bswap: Fix accessors syntax in comment
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
X-List-Received-Date: Tue, 26 Feb 2019 14:21:26 -0000

All accessors that have an endian infix DO have an underscore between
{size} and {endian}.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/qemu/bswap.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index a684c1a7a298..5a70f78c0ba4 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -255,9 +255,9 @@ typedef union {
 /*
  * the generic syntax is:
  *
- * load: ld{type}{sign}{size}{endian}_p(ptr)
+ * load: ld{type}{sign}{size}_{endian}_p(ptr)
  *
- * store: st{type}{size}{endian}_p(ptr, val)
+ * store: st{type}{size}_{endian}_p(ptr, val)
  *
  * Note there are small differences with the softmmu access API!
  *
@@ -293,10 +293,10 @@ typedef union {
  *
  * For cases where the size to be used is not fixed at compile time,
  * there are
- *  stn{endian}_p(ptr, sz, val)
+ *  stn_{endian}_p(ptr, sz, val)
  * which stores @val to @ptr as an @endian-order number @sz bytes in size
  * and
- *  ldn{endian}_p(ptr, sz)
+ *  ldn_{endian}_p(ptr, sz)
  * which loads @sz bytes from @ptr as an unsigned @endian-order number
  * and returns it in a uint64_t.
  */


