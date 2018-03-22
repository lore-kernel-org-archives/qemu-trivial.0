Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eywtj-0003Pv-MP
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 05:52:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eywth-0003PQ-AZ
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 05:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eywte-0000Fp-7F
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 05:52:37 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44384)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1eywtd-0000FP-TS; Thu, 22 Mar 2018 05:52:34 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w2M9gubj054485; Thu, 22 Mar 2018 09:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : subject :
	date : message-id : mime-version : content-type :
	content-transfer-encoding; s=corp-2017-10-26;
	bh=u7DjfSnMNjO7iHIhfNUqy94sK4vKaS7mF+pZZM0sU3E=;
	b=MtnVfv/lCng1xz7CRaF7eZ6Sl5W8H2a+C3nZC7SKYumhyXKN8g2T90Lj5R/m0WpXHj1m
	ifwPrkx0wJPaMX43Bk0++ZBu41X20N2nDZVPt9HHFqIwDOikQ9LIZxyAEURgsDPyMbdi
	zCaFUU8Mwu+F6mntjR706KnbRvKpgF0xUgSjmEWFvi30DR8Q7K3Fwstaeu+R8tNtBRcL
	1pz0I/+17g7tooT8KfKhMcGrdabbuh0IPbA67gqmKUugFay3ZSq08r3I4IYHNMe0YG9K
	99tw70CN+1wIr8WSL9OJ+CYjhQsAo0oskjNszRJf3Lq4xBbt71qhCAR715406jen5Buh
	hA== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by userp2130.oracle.com with ESMTP id 2gva3mr18u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Mar 2018 09:52:31 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w2M9qVPN026262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 22 Mar 2018 09:52:31 GMT
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w2M9qUjc009611;
	Thu, 22 Mar 2018 09:52:30 GMT
Received: from localhost.localdomain (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 22 Mar 2018 02:52:29 -0700
From: Yuval Shaia <yuval.shaia@oracle.com>
To: yuval.shaia@oracle.com, marcel@redhat.com, eblake@redhat.com,
	f4bug@amsat.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 22 Mar 2018 11:52:17 +0200
Message-Id: <20180322095220.9976-1-yuval.shaia@oracle.com>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8839
	signatures=668695
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1803200127
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by userp2130.oracle.com id
	w2M9gubj054485
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
Subject: [Qemu-trivial] [PATCH v2 for-2.12 0/3] hw/rdma: Fix 32-bit
 compilation
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
X-List-Received-Date: Thu, 22 Mar 2018 09:52:38 -0000

Hi all,
Following are three patches which fixes various compilation warnings and
errors detected when compiling rdma device in 32bit host.

All three patches are based on Eric Blake patch for rdma device.
Thanks!

Patch #1: Change host_virt to void *
Low level IB verbs library accept void * argument so let's make sure this
is what we supply. This issue reported by Eric Blake.

Patch #2: Use correct print format in CHK_ATTR macro
This macro can utilize the given 'format' argument and not need to cast a=
ll
members to u64. This patch is an alternative to suggested patch by Eric
Blake.

Patch #3: Fix 32-bit compilation
Based on Eric Blake patch this patch replaces all %ld/%lx with the platfo=
rm
independent PRIx64/PRId64 format.

Again, thanks Eric Blake for the report.

v1 -> v2:
	* Address comments from Philippe Mathieu-Daud=C3=A9
	* Fix checkpatch warnings (trim some strings)
	* Add reviewers signatures

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

--=20
2.13.6


