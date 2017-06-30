Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQso6-0000pi-1h
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jun 2017 06:05:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dQso4-0000pE-7J
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 06:05:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dQso0-0003Ca-AB
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 06:05:44 -0400
Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108]:53565)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dQso0-0003BT-4F
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 06:05:40 -0400
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 8B88710EA39
	for <qemu-trivial@nongnu.org>; Fri, 30 Jun 2017 12:05:38 +0200 (CEST)
Received: from [192.168.0.243] (gar31-1-82-66-74-139.fbx.proxad.net
	[82.66.74.139]) (Authenticated sender: groug@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPA id CBAD9520093;
	Fri, 30 Jun 2017 12:05:32 +0200 (CEST)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Date: Fri, 30 Jun 2017 12:05:32 +0200
Message-ID: <149881713243.18888.18140083803237379387.stgit@bahia>
User-Agent: StGit/0.17.1-20-gc0b1b-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2482046348307044843
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrtdeigddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.40.108
Subject: [Qemu-trivial] [PATCH] spapr: refresh "platform-specific" hcalls
 comment
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
X-List-Received-Date: Fri, 30 Jun 2017 10:05:45 -0000

We have more of these since the addition of KVMPPC_H_LOGICAL_MEMOP in 2012.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr.h |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index a66bbac35242..1826cc4fd696 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -377,9 +377,8 @@ struct sPAPRMachineState {
  * as well.
  *
  * We also need some hcalls which are specific to qemu / KVM-on-POWER.
- * So far we just need one for H_RTAS, but in future we'll need more
- * for extensions like virtio.  We put those into the 0xf000-0xfffc
- * range which is reserved by PAPR for "platform-specific" hcalls.
+ * We put those into the 0xf000-0xfffc range which is reserved by PAPR
+ * for "platform-specific" hcalls.
  */
 #define KVMPPC_HCALL_BASE       0xf000
 #define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)


