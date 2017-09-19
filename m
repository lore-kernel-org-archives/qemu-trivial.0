Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duJKM-0007EM-Rh
	for mharc-qemu-trivial@gnu.org; Tue, 19 Sep 2017 10:16:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1duJKH-0007B9-Op
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 10:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1duJKC-0006qe-FX
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 10:16:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:17302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1duJJm-0006Km-Uk; Tue, 19 Sep 2017 10:16:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF2F57E431;
	Tue, 19 Sep 2017 14:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CF2F57E431
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from red.redhat.com (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9D695D983;
	Tue, 19 Sep 2017 14:16:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org (open list:PowerPC)
Date: Tue, 19 Sep 2017 09:16:03 -0500
Message-Id: <20170919141603.27713-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 19 Sep 2017 14:16:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ppc/pnv: Improve macro parenthesization
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
X-List-Received-Date: Tue, 19 Sep 2017 14:16:41 -0000

Although none of the existing macro call-sites were broken,
it's always better to write macros that properly parenthesize
arguments that can be complex expressions, so that the intended
order of operations is not broken.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/hw/ppc/pnv_xscom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 3757b2cab9..38077b4796 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -54,7 +54,7 @@ typedef struct PnvXScomInterfaceClass {
  *   PCB SLAVE   0x110Fxxxx
  */

-#define PNV_XSCOM_EX_CORE_BASE(base, i) (base | (((uint64_t)i) << 24))
+#define PNV_XSCOM_EX_CORE_BASE(base, i) ((base) | ((uint64_t)(i) << 24))
 #define PNV_XSCOM_EX_CORE_SIZE    0x100000

 #define PNV_XSCOM_LPC_BASE        0xb0020
-- 
2.13.5


