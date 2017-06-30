Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQvob-00030N-0W
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jun 2017 09:18:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dQvoY-0002u8-P9
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 09:18:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dQvoU-0000Oc-Eh
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 09:18:26 -0400
Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]:49411)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dQvoU-0000NJ-8C
	for qemu-trivial@nongnu.org; Fri, 30 Jun 2017 09:18:22 -0400
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id C2C2C10ECAA
	for <qemu-trivial@nongnu.org>; Fri, 30 Jun 2017 15:18:15 +0200 (CEST)
Received: from bahia.lan (gar31-1-82-66-74-139.fbx.proxad.net [82.66.74.139])
	(Authenticated sender: groug@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPA id CD735520095;
	Fri, 30 Jun 2017 15:18:10 +0200 (CEST)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Date: Fri, 30 Jun 2017 15:18:10 +0200
Message-ID: <149882869053.24031.15086612121177689276.stgit@bahia.lan>
User-Agent: StGit/0.17.1-20-gc0b1b-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5734771179218639339
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrtdeigdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.174.144
Subject: [Qemu-trivial] [PATCH] spapr: make spapr_populate_hotplug_cpu_dt()
 static
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
X-List-Received-Date: Fri, 30 Jun 2017 13:18:27 -0000

Since commit ff9006ddbfd1 ("spapr: move spapr_core_[foo]plug() callbacks
close to machine code in spapr.c"), this function doesn't need to be extern
anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c         |    4 ++--
 include/hw/ppc/spapr.h |    2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0ee9fac50bd4..65d8ad2f4966 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2863,8 +2863,8 @@ out:
     error_propagate(errp, local_err);
 }
 
-void *spapr_populate_hotplug_cpu_dt(CPUState *cs, int *fdt_offset,
-                                    sPAPRMachineState *spapr)
+static void *spapr_populate_hotplug_cpu_dt(CPUState *cs, int *fdt_offset,
+                                           sPAPRMachineState *spapr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     DeviceClass *dc = DEVICE_GET_CLASS(cs);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index a66bbac35242..12bf9697990e 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -640,8 +640,6 @@ void spapr_hotplug_req_add_by_count_indexed(sPAPRDRConnectorType drc_type,
 void spapr_hotplug_req_remove_by_count_indexed(sPAPRDRConnectorType drc_type,
                                                uint32_t count, uint32_t index);
 void spapr_cpu_parse_features(sPAPRMachineState *spapr);
-void *spapr_populate_hotplug_cpu_dt(CPUState *cs, int *fdt_offset,
-                                    sPAPRMachineState *spapr);
 
 /* CPU and LMB DRC release callbacks. */
 void spapr_core_release(DeviceState *dev);


