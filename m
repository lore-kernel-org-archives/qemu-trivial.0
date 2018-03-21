Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyl1n-0006kY-0D
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 17:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eyl1k-0006iJ-H2
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 17:12:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eyl1g-0002nu-Ea
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 17:12:08 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1eyl1g-0002mz-6M; Wed, 21 Mar 2018 17:12:04 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w2LL1NSO156245; Wed, 21 Mar 2018 21:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : subject : date : message-id; s=corp-2017-10-26;
	bh=geDFrYzZP1NccZHaD5LTM8tiTi2i3sPoctsdhUNsghs=;
	b=HJAf9h0rGCeiHXwp56ZvQcFWqPlfSlC+V112BznTzuswU+hKudHSQrqcGlKKz1xH0yw8
	33gvIbHHwq0n8tMzk7xh7C2Gbgr19o7rMP5MN4WYB8D+0Fn/27vryfhyXtvZ7dk+IS1z
	R6Wkngrbo4Jk+qCQAGNwCAIL+WQCsNVhED2MefYp7FyIWr3YIOuwCrS1Je/vhUe0L7dk
	RyLbOKCY8WsfrSlF6WTfHmTM1LJcFeSjE1q8dT9UWhwU1cZq4AbcQ0xefMRtiQX/qdvs
	HdCV9AsUK+ufO6wcvxHNOfFCU0Yi5X5spwkQ8Pis7sIsgCG9DmFEJwfZQ+TGAfjBXzZc
	XQ== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
	by userp2130.oracle.com with ESMTP id 2guxwmr1gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Mar 2018 21:12:03 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w2LLB6PK011074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 21 Mar 2018 21:11:06 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w2LLB5Q6013049;
	Wed, 21 Mar 2018 21:11:05 GMT
Received: from localhost.localdomain (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 21 Mar 2018 14:11:05 -0700
From: Yuval Shaia <yuval.shaia@oracle.com>
To: yuval.shaia@oracle.com, marcel@redhat.com, eblake@redhat.com,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 21 Mar 2018 23:10:53 +0200
Message-Id: <20180321211056.3339-1-yuval.shaia@oracle.com>
X-Mailer: git-send-email 2.13.6
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8839
	signatures=668695
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1803200127
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
Subject: [Qemu-trivial] [PATCH 0/3] hw/rdma: Fix 32-bit compilation
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
X-List-Received-Date: Wed, 21 Mar 2018 21:12:09 -0000

Hi all,
Following are three patches which fixes various compilation warnings and
errors detected when compiling rdma device in 32bit host.

All three patches are based on Eric Blake patch for rdma device.
Thanks!

Patch #1: Change host_virt to void *
Low level IB verbs library accept void * argument so let's make sure this
is what we supply. This issue reported by Eric Blake.

Patch #2: Use correct print format in CHK_ATTR macro
This macro can utilize the given 'format' argument and not need to cast all
members to u64. This patch is an alternative to suggested patch by Eric
Blake.

Patch #3: Fix 32-bit compilation
Based on Eric Blake patch this patch replaces all %ld/%lx with the platform
independent PRIx64/PRId64 format.

Again, thanks Eric Blake for the report.

Yuval Shaia (3):
  hw/rdma: Change host_virt to void *
  hw/rdma: Use correct print format in CHK_ATTR macro
  hw/rdma: Fix 32-bit compilation

 hw/rdma/rdma_backend.c        | 33 +++++++++++++++++----------------
 hw/rdma/rdma_backend.h        |  2 +-
 hw/rdma/rdma_rm.c             | 14 +++++++-------
 hw/rdma/rdma_rm_defs.h        |  2 +-
 hw/rdma/rdma_utils.c          |  6 +++---
 hw/rdma/vmw/pvrdma_cmd.c      |  8 ++++----
 hw/rdma/vmw/pvrdma_dev_ring.c |  6 +++---
 hw/rdma/vmw/pvrdma_dev_ring.h |  2 +-
 hw/rdma/vmw/pvrdma_main.c     | 25 +++++++++++++------------
 hw/rdma/vmw/pvrdma_qp_ops.c   |  6 +++---
 10 files changed, 53 insertions(+), 51 deletions(-)

-- 
2.13.6


