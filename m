Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XRg87-0004fT-3p
	for mharc-qemu-trivial@gnu.org; Wed, 10 Sep 2014 07:32:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XRg7z-0004VC-Kn
	for qemu-trivial@nongnu.org; Wed, 10 Sep 2014 07:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XRg7u-00041O-Od
	for qemu-trivial@nongnu.org; Wed, 10 Sep 2014 07:31:59 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:21388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XRg7h-0003zx-5d; Wed, 10 Sep 2014 07:31:42 -0400
Received: from 172.24.2.119 (EHLO szxeml448-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZG78383; Wed, 10 Sep 2014 19:31:32 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml448-hub.china.huawei.com
	(10.82.67.191) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 10 Sep 2014 19:31:26 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Wed, 10 Sep 2014 19:29:07 +0800
Message-ID: <1410348547-1308-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-devel@nongnu.org, zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PATCH v2] Fix typos and misspellings in comments
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
X-List-Received-Date: Wed, 10 Sep 2014 11:32:04 -0000

formated -> formatted
gaurantee -> guarantee
shear -> sheer

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 v2:
  The typos in epapr_hcalls.h should be fixed via the kernel (comment of PMM)
---
 hw/ppc/spapr.c             | 2 +-
 libcacard/vcard_emul_nss.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2ab4460..2becc9f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -541,7 +541,7 @@ static void *spapr_create_fdt_skel(hwaddr initrd_base,
     _FDT((fdt_property_cell(fdt, "rtas-error-log-max", RTAS_ERROR_LOG_MAX)));
 
     /*
-     * According to PAPR, rtas ibm,os-term, does not gaurantee a return
+     * According to PAPR, rtas ibm,os-term does not guarantee a return
      * back to the guest cpu.
      *
      * While an additional ibm,extended-os-term property indicates that
diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index f1bba57..07b4464 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -286,10 +286,10 @@ vcard_emul_rsa_op(VCard *card, VCardKey *key,
             }
         }
         if ((i < buffer_size) && (buffer[i] == 0)) {
-            /* yes, we have a properly formated PKCS #1 signature */
+            /* yes, we have a properly formatted PKCS #1 signature */
             /*
              * NOTE: even if we accidentally got an encrypt buffer, which
-             * through shear luck started with 00, 01, ff, 00, it won't matter
+             * through sheer luck started with 00, 01, ff, 00, it won't matter
              * because the resulting Sign operation will effectively decrypt
              * the real buffer.
              */
-- 
1.7.12.4



