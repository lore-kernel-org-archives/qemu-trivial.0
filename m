Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eywtl-0003RX-SQ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 05:52:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eywti-0003PY-Gi
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 05:52:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1eywtf-0000GT-BL
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 05:52:38 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1eywtf-0000Fu-2C; Thu, 22 Mar 2018 05:52:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	w2M9gvQT164674; Thu, 22 Mar 2018 09:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : subject :
	date : message-id : in-reply-to : references : mime-version :
	content-type : content-transfer-encoding; s=corp-2017-10-26;
	bh=lPbn1KkmRpjk7IvOQ68t0h+kzrJ3VI8Tat48ewUKLBw=;
	b=MNOHwYQXi6AnB1xGeSS7we1I425+qSkDy9/gXhYwkTIEqMOfpXONvS9QMCV5a7tSZ8EL
	Hi9KGrx3c5jcA+GhxjjCtHOk235jqI+5brOWVVh05sVkpxANlICMaNluZOfMvljgyTFJ
	OoNv0C7EIc+8zZ1+raOtJDdUQtuVG4MdVNytLSyWB4EK9hhjvW2Npov9ningnUlkAa5U
	ChyC96IgbqTZgn1T4HgZcG3TYQMvaP2KdCzqxLIZQHsHmMJCknhcsdqHoazFAZa+z+B9
	vq6NxiGnm0NrxB8hc+2F0YPyNohBgEpndhQ8vq9ewMQ3ysPgiGY6O1s6cu33lkzYlXLp
	aw== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by userp2120.oracle.com with ESMTP id 2gva3hg18r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Mar 2018 09:52:33 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w2M9qWVi026359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 22 Mar 2018 09:52:32 GMT
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w2M9qWKY009622;
	Thu, 22 Mar 2018 09:52:32 GMT
Received: from localhost.localdomain (/77.138.186.148)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 22 Mar 2018 02:52:32 -0700
From: Yuval Shaia <yuval.shaia@oracle.com>
To: yuval.shaia@oracle.com, marcel@redhat.com, eblake@redhat.com,
	f4bug@amsat.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 22 Mar 2018 11:52:18 +0200
Message-Id: <20180322095220.9976-2-yuval.shaia@oracle.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180322095220.9976-1-yuval.shaia@oracle.com>
References: <20180322095220.9976-1-yuval.shaia@oracle.com>
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
X-MIME-Autoconverted: from 8bit to quoted-printable by userp2120.oracle.com id
	w2M9gvQT164674
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
Subject: [Qemu-trivial] [PATCH v2 for-2.12 1/3] hw/rdma: Change host_virt to
 void *
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
X-List-Received-Date: Thu, 22 Mar 2018 09:52:40 -0000

To avoid compilation warnings on 32-bit machines:
rdma_backend.c: In function 'rdma_backend_create_mr':
rdma_backend.c:409:37: error: cast to pointer from integer of different
size [-Werror=3Dint-to-pointer-cast]
	mr->ibmr =3D ibv_reg_mr(pd->ibpd, (void *)addr, length, access);

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
@@ -222,7 +222,7 @@ static int build_host_sge_array(RdmaDeviceResources *=
rdma_dev_res,
             return VENDOR_ERR_INVLKEY | ssge[ssge_idx].lkey;
         }
=20
-        dsge->addr =3D mr->user_mr.host_virt + ssge[ssge_idx].addr -
+        dsge->addr =3D (uintptr_t)mr->user_mr.host_virt + ssge[ssge_idx]=
.addr -
                      mr->user_mr.guest_start;
         dsge->length =3D ssge[ssge_idx].length;
         dsge->lkey =3D rdma_backend_mr_lkey(&mr->backend_mr);
@@ -401,12 +401,12 @@ void rdma_backend_destroy_pd(RdmaBackendPD *pd)
     }
 }
=20
-int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, uint64_=
t addr,
+int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, void *a=
ddr,
                            size_t length, int access)
 {
-    pr_dbg("addr=3D0x%lx\n", addr);
+    pr_dbg("addr=3D0x%p\n", addr);
     pr_dbg("len=3D%ld\n", length);
-    mr->ibmr =3D ibv_reg_mr(pd->ibpd, (void *)addr, length, access);
+    mr->ibmr =3D ibv_reg_mr(pd->ibpd, addr, length, access);
     if (mr->ibmr) {
         pr_dbg("lkey=3D0x%x\n", mr->ibmr->lkey);
         pr_dbg("rkey=3D0x%x\n", mr->ibmr->rkey);
diff --git a/hw/rdma/rdma_backend.h b/hw/rdma/rdma_backend.h
index 68f2b05ca7..07f6fed768 100644
--- a/hw/rdma/rdma_backend.h
+++ b/hw/rdma/rdma_backend.h
@@ -61,7 +61,7 @@ int rdma_backend_query_port(RdmaBackendDev *backend_dev=
,
 int rdma_backend_create_pd(RdmaBackendDev *backend_dev, RdmaBackendPD *p=
d);
 void rdma_backend_destroy_pd(RdmaBackendPD *pd);
=20
-int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, uint64_=
t addr,
+int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, void *a=
ddr,
                            size_t length, int access);
 void rdma_backend_destroy_mr(RdmaBackendMR *mr);
=20
diff --git a/hw/rdma/rdma_rm.c b/hw/rdma/rdma_rm.c
index b5fc45ddab..296e40518e 100644
--- a/hw/rdma/rdma_rm.c
+++ b/hw/rdma/rdma_rm.c
@@ -146,7 +146,7 @@ int rdma_rm_alloc_mr(RdmaDeviceResources *dev_res, ui=
nt32_t pd_handle,
     RdmaRmMR *mr;
     int ret =3D 0;
     RdmaRmPD *pd;
-    uint64_t addr;
+    void *addr;
     size_t length;
=20
     pd =3D rdma_rm_get_pd(dev_res, pd_handle);
@@ -165,10 +165,10 @@ int rdma_rm_alloc_mr(RdmaDeviceResources *dev_res, =
uint32_t pd_handle,
         /* TODO: This is my guess but not so sure that this needs to be
          * done */
         length =3D TARGET_PAGE_SIZE;
-        addr =3D (uint64_t)g_malloc(length);
+        addr =3D g_malloc(length);
     } else {
-        mr->user_mr.host_virt =3D (uint64_t) host_virt;
-        pr_dbg("host_virt=3D0x%lx\n", mr->user_mr.host_virt);
+        mr->user_mr.host_virt =3D host_virt;
+        pr_dbg("host_virt=3D0x%p\n", mr->user_mr.host_virt);
         mr->user_mr.length =3D guest_length;
         pr_dbg("length=3D0x%lx\n", guest_length);
         mr->user_mr.guest_start =3D guest_start;
@@ -216,7 +216,7 @@ void rdma_rm_dealloc_mr(RdmaDeviceResources *dev_res,=
 uint32_t mr_handle)
=20
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
=20
 typedef struct RdmaRmUserMR {
-    uint64_t host_virt;
+    void *host_virt;
     uint64_t guest_start;
     size_t length;
 } RdmaRmUserMR;
--=20
2.13.6


