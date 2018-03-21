Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyl0x-0005yv-8D
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 17:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eyl0u-0005wc-Eu
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 17:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eyl0q-00022Q-C3
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 17:11:16 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1eyl0q-00021M-2y; Wed, 21 Mar 2018 17:11:12 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w2LKxB41154497; Wed, 21 Mar 2018 21:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : subject :
	date : message-id : in-reply-to : references; s=corp-2017-10-26;
	bh=jHh19As8+Nd9FpTbeOSH6qJ+Oo/01MNY+xSeF8+Lj+Y=;
	b=Pt82izce5kcDZ7qc87v5lndPYK2LIlYBQcCH92C/Te33Y4XnNqSIFufyfA+3UqEgXB/Y
	vWgXm2BppuDTLtr70i2db6DmepJ80ht4csB6GuB04T4QB3yz7DtoEtbv+MLcKwGcBa24
	5dWta630XzuYtZ+jwVOR9JXEEzGI2clLExMUtFGLDtgX4OUD5d7sCd4ktCcxl8GsKKIm
	a1UnKuRC9LVC64YJYXqJz5A+vwOroPOVfgEpWvPSYKkYimNJmradrva/bENY6ZDvTRsM
	2CaHc4WY/MuX5Rbo84xIA+MNrJBo1oOi0+OlqTyA1Rv4yLgk4PL5HYHAUSCiT7VMcz0G
	Og== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
	by userp2130.oracle.com with ESMTP id 2guxwmr1ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Mar 2018 21:11:11 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w2LLB9uJ004000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 21 Mar 2018 21:11:10 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w2LLB95K019150;
	Wed, 21 Mar 2018 21:11:09 GMT
Received: from localhost.localdomain (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 21 Mar 2018 14:11:09 -0700
From: Yuval Shaia <yuval.shaia@oracle.com>
To: yuval.shaia@oracle.com, marcel@redhat.com, eblake@redhat.com,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 21 Mar 2018 23:10:55 +0200
Message-Id: <20180321211056.3339-3-yuval.shaia@oracle.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180321211056.3339-1-yuval.shaia@oracle.com>
References: <20180321211056.3339-1-yuval.shaia@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8839
	signatures=668695
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1711220000 definitions=main-1803200127
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
Subject: [Qemu-trivial] [PATCH 2/3] hw/rdma: Use correct print format in
 CHK_ATTR macro
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
X-List-Received-Date: Wed, 21 Mar 2018 21:11:17 -0000

Macro should not cast the given variable to u64 instead it should use
the supplied format argument (fmt).

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
---
 hw/rdma/rdma_backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
index f1a37ba4a2..0391a7dd95 100644
--- a/hw/rdma/rdma_backend.c
+++ b/hw/rdma/rdma_backend.c
@@ -656,8 +656,8 @@ void rdma_backend_destroy_qp(RdmaBackendQP *qp)
 #define CHK_ATTR(req, dev, member, fmt) ({ \
     pr_dbg("%s="fmt","fmt"\n", #member, dev.member, req->member); \
     if (req->member > dev.member) { \
-        warn_report("%s = 0x%lx is higher than host device capability 0x%lx", \
-                    #member, (uint64_t)req->member, (uint64_t)dev.member); \
+        warn_report("%s = "fmt" is higher than host device capability "fmt, \
+                    #member, req->member, dev.member); \
         req->member = dev.member; \
     } \
     pr_dbg("%s="fmt"\n", #member, req->member); })
-- 
2.13.6


