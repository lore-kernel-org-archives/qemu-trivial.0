Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyqQ-0003Vu-Cz
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:19:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqJ-0003HW-DE
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqE-0000cH-65
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVypy-0000U6-KI; Mon, 22 Sep 2014 04:19:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 80D2645D10;
	Mon, 22 Sep 2014 12:19:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4356B702;
	Mon, 22 Sep 2014 12:11:19 +0400 (MSK)
Received: (nullmailer pid 16990 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:10 +0400
Message-Id: <1411373477-16938-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 2/9] Fix typos and misspellings in comments
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
X-List-Received-Date: Mon, 22 Sep 2014 08:19:36 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

formated -> formatted
gaurantee -> guarantee
shear -> sheer

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/spapr.c             |    2 +-
 libcacard/vcard_emul_nss.c |    4 ++--
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
1.7.10.4


