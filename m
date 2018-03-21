Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyl0w-0005yK-Ls
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 17:11:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eyl0t-0005wF-O2
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 17:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eyl0p-00021U-Jd
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 17:11:15 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1eyl0p-00020o-AA; Wed, 21 Mar 2018 17:11:11 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w2LL0QZL155411; Wed, 21 Mar 2018 21:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : subject :
	date : message-id : in-reply-to : references; s=corp-2017-10-26;
	bh=5HID/+a99x5BWrT4x2pauzp2Fbu/nsAIH+twz2Fb69I=;
	b=VtVTkwfRdhHGAriH95yk8NEP+pzPJsl+86825jGUttUNQVvkQ+B+VOTpZS/uENWEDiBZ
	9paJCDii6xN3llCUG7sAEaItmPQK54qyyPosXLOCzT1qDz6s9SVJeMxTOItrycfbH7m+
	1enfnIpS0rPzWfVAa+chYfgcF+y0XKrV4EsOPweIGHNwY5qkJgqoRRN6bcdlKPP5KpgQ
	27v6AIoociXYpXJAlo3o8RfO4fSnjwnvxqzZlGTXonCy1DW9FigWzyQoLI84Iclf35Cb
	KFef0L6mebzDCkzkGD6M26vHzyHMSjoTqaiK4NV9fJk+8ilTIyyQEMmCJm1zUu9sVpsR
	kg== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
	by userp2130.oracle.com with ESMTP id 2guxwmr1ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Mar 2018 21:11:09 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w2LLB8bn001741
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 21 Mar 2018 21:11:08 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w2LLB7Ls013053;
	Wed, 21 Mar 2018 21:11:07 GMT
Received: from localhost.localdomain (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 21 Mar 2018 14:11:07 -0700
From: Yuval Shaia <yuval.shaia@oracle.com>
To: yuval.shaia@oracle.com, marcel@redhat.com, eblake@redhat.com,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 21 Mar 2018 23:10:54 +0200
Message-Id: <20180321211056.3339-2-yuval.shaia@oracle.com>
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
Subject: [Qemu-trivial] [PATCH 1/3] hw/rdma: Change host_virt to void *
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

To avoid compilation warnings on 32-bit machines:
rdma_backend.c: In function 'rdma_backend_create_mr':
rdma_backend.c:409:37: error: cast to pointer from integer of different
size [-Werror=int-to-pointer-cast]
	mr->ibmr = ibv_reg_mr(pd->ibpd, (void *)addr, length, access);

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
---
 hw/rdma/rdma_backend.c |  8 ++++----
 hw/rdma/rdma_backend.h |  2 +-
 hw/rdma/rdma_rm.c      | 10 +++++-----
 hw/rdma/rdma_rm_defs.h |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
index e306fba534..f1a37ba4a2 100644
--- a/hw/rdma/rdma_backend.c
+++ b/hw/rdma/rdma_backend.c
@@ -222,7 +222,7 @@ static int build_host_sge_array(RdmaDeviceResources *rdma_dev_res,
             return VENDOR_ERR_INVLKEY | ssge[ssge_idx].lkey;
         }
 
-        dsge->addr = mr->user_mr.host_virt + ssge[ssge_idx].addr -
+        dsge->addr = (uintptr_t)mr->user_mr.host_virt + ssge[ssge_idx].addr -
                      mr->user_mr.guest_start;
         dsge->length = ssge[ssge_idx].length;
         dsge->lkey = rdma_backend_mr_lkey(&mr->backend_mr);
@@ -401,12 +401,12 @@ void rdma_backend_destroy_pd(RdmaBackendPD *pd)
     }
 }
 
-int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, uint64_t addr,
+int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, void *addr,
                            size_t length, int access)
 {
-    pr_dbg("addr=0x%lx\n", addr);
+    pr_dbg("addr=0x%p\n", addr);
     pr_dbg("len=%ld\n", length);
-    mr->ibmr = ibv_reg_mr(pd->ibpd, (void *)addr, length, access);
+    mr->ibmr = ibv_reg_mr(pd->ibpd, addr, length, access);
     if (mr->ibmr) {
         pr_dbg("lkey=0x%x\n", mr->ibmr->lkey);
         pr_dbg("rkey=0x%x\n", mr->ibmr->rkey);
diff --git a/hw/rdma/rdma_backend.h b/hw/rdma/rdma_backend.h
index 68f2b05ca7..07f6fed768 100644
--- a/hw/rdma/rdma_backend.h
+++ b/hw/rdma/rdma_backend.h
@@ -61,7 +61,7 @@ int rdma_backend_query_port(RdmaBackendDev *backend_dev,
 int rdma_backend_create_pd(RdmaBackendDev *backend_dev, RdmaBackendPD *pd);
 void rdma_backend_destroy_pd(RdmaBackendPD *pd);
 
-int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, uint64_t addr,
+int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, void *addr,
                            size_t length, int access);
 void rdma_backend_destroy_mr(RdmaBackendMR *mr);
 
diff --git a/hw/rdma/rdma_rm.c b/hw/rdma/rdma_rm.c
index b5fc45ddab..296e40518e 100644
--- a/hw/rdma/rdma_rm.c
+++ b/hw/rdma/rdma_rm.c
@@ -146,7 +146,7 @@ int rdma_rm_alloc_mr(RdmaDeviceResources *dev_res, uint32_t pd_handle,
     RdmaRmMR *mr;
     int ret = 0;
     RdmaRmPD *pd;
-    uint64_t addr;
+    void *addr;
     size_t length;
 
     pd = rdma_rm_get_pd(dev_res, pd_handle);
@@ -165,10 +165,10 @@ int rdma_rm_alloc_mr(RdmaDeviceResources *dev_res, uint32_t pd_handle,
         /* TODO: This is my guess but not so sure that this needs to be
          * done */
         length = TARGET_PAGE_SIZE;
-        addr = (uint64_t)g_malloc(length);
+        addr = g_malloc(length);
     } else {
-        mr->user_mr.host_virt = (uint64_t) host_virt;
-        pr_dbg("host_virt=0x%lx\n", mr->user_mr.host_virt);
+        mr->user_mr.host_virt = host_virt;
+        pr_dbg("host_virt=0x%p\n", mr->user_mr.host_virt);
         mr->user_mr.length = guest_length;
         pr_dbg("length=0x%lx\n", guest_length);
         mr->user_mr.guest_start = guest_start;
@@ -216,7 +216,7 @@ void rdma_rm_dealloc_mr(RdmaDeviceResources *dev_res, uint32_t mr_handle)
 
     if (mr) {
         rdma_backend_destroy_mr(&mr->backend_mr);
-        munmap((void *)mr->user_mr.host_virt, mr->user_mr.length);
+        munmap(mr->user_mr.host_virt, mr->user_mr.length);
         res_tbl_dealloc(&dev_res->mr_tbl, mr_handle);
     }
 }
diff --git a/hw/rdma/rdma_rm_defs.h b/hw/rdma/rdma_rm_defs.h
index 6522dca68f..fc646da61f 100644
--- a/hw/rdma/rdma_rm_defs.h
+++ b/hw/rdma/rdma_rm_defs.h
@@ -56,7 +56,7 @@ typedef struct RdmaRmCQ {
 } RdmaRmCQ;
 
 typedef struct RdmaRmUserMR {
-    uint64_t host_virt;
+    void *host_virt;
     uint64_t guest_start;
     size_t length;
 } RdmaRmUserMR;
-- 
2.13.6


