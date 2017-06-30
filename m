Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQsMf-0007aI-Ht
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jun 2017 05:37:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dQsMd-0007Zn-9D
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 05:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dQsMa-0003DJ-4f
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 05:37:23 -0400
Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108]:53752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dQsMZ-0003C4-Ui
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 05:37:20 -0400
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 6524C10F3ED
	for <qemu-trivial@nongnu.org>; Fri, 30 Jun 2017 11:37:18 +0200 (CEST)
Received: from [192.168.0.243] (gar31-1-82-66-74-139.fbx.proxad.net
	[82.66.74.139]) (Authenticated sender: groug@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPA id DA5885200B6;
	Fri, 30 Jun 2017 11:37:13 +0200 (CEST)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Date: Fri, 30 Jun 2017 11:37:07 +0200
Message-ID: <149881542765.17418.16611868807694688341.stgit@bahia>
User-Agent: StGit/0.17.1-20-gc0b1b-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2003538885694036459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrtdeigdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.40.108
Subject: [Qemu-trivial] [PATCH] spapr: fix bogus function name in comment
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
X-List-Received-Date: Fri, 30 Jun 2017 09:37:24 -0000

$ git grep spapr_ppc_reset
hw/ppc/spapr.c: * as part of spapr_ppc_reset().

$ git grep ppc_spapr_reset
hw/ppc/spapr.c:static void ppc_spapr_reset(void)
hw/ppc/spapr.c:    mc->reset = ppc_spapr_reset;
hw/ppc/spapr_hcall.c:        /* If ppc_spapr_reset() did not set up a HPT
 but one is necessary

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0ee9fac50bd4..43a1cb5725d6 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1973,7 +1973,7 @@ static void spapr_boot_set(void *opaque, const char *boot_device,
  * Unlike PCI DR devices, LMB DR devices explicitly register this reset
  * routine. Reset for PCI DR devices will be handled by PHB reset routine
  * when it walks all its children devices. LMB devices reset occurs
- * as part of spapr_ppc_reset().
+ * as part of ppc_spapr_reset().
  */
 static void spapr_drc_reset(void *opaque)
 {


