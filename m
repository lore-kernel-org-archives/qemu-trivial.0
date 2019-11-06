Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSKi5-0001gs-9T
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2019 07:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iSKi3-0001fY-5I
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 07:46:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iSKi1-00060t-RN
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 07:46:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52558
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iSKi1-000606-MU
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 07:46:49 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA6CggtR130081
 for <qemu-trivial@nongnu.org>; Wed, 6 Nov 2019 07:46:47 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w3xab8fdx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-trivial@nongnu.org>; Wed, 06 Nov 2019 07:46:47 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-trivial@nongnu.org> from <groug@kaod.org>;
 Wed, 6 Nov 2019 12:46:45 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Nov 2019 12:46:42 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA6CkflV27459934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Nov 2019 12:46:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2AD742059;
 Wed,  6 Nov 2019 12:46:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0FAA42068;
 Wed,  6 Nov 2019 12:46:40 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.181.93])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Nov 2019 12:46:40 +0000 (GMT)
Subject: [PATCH] numa: Add missing \n to error message
From: Greg Kurz <groug@kaod.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Date: Wed, 06 Nov 2019 13:46:40 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19110612-0012-0000-0000-0000036136BD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110612-0013-0000-0000-0000219C93AB
Message-Id: <157304440026.351774.14607704217028190097.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-06_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911060125
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2019 12:46:52 -0000

If memory allocation fails when using -mem-path, QEMU is supposed to print
out a message to indicate that fallback to anonymous RAM is deprecated. This
is done with error_printf() which does output buffering. As a consequence,
the message is only printed at the next flush, eg. when quiting QEMU, and
it also lacks a trailing newline:

qemu-system-ppc64: unable to map backing store for guest RAM: Cannot allocate memory
qemu-system-ppc64: warning: falling back to regular RAM allocation
QEMU 4.1.50 monitor - type 'help' for more information
(qemu) q
This is deprecated. Make sure that -mem-path  specified path has sufficient resources to allocate -m specified RAM amountgreg@boss02:~/Work/qemu/qemu-spapr$

Add the missing \n to fix both issues.

Fixes: cb79224b7e4b "deprecate -mem-path fallback to anonymous RAM"
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/core/numa.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 038c96d4abc6..e3332a984f7c 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -503,7 +503,7 @@ static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
             warn_report("falling back to regular RAM allocation");
             error_printf("This is deprecated. Make sure that -mem-path "
                          " specified path has sufficient resources to allocate"
-                         " -m specified RAM amount");
+                         " -m specified RAM amount\n");
             /* Legacy behavior: if allocation failed, fall back to
              * regular RAM allocation.
              */


