Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cylZs-0007gE-K6
	for mharc-qemu-trivial@gnu.org; Thu, 13 Apr 2017 16:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chugh.ishani@research.iiit.ac.in>)
	id 1cyhPA-0001vw-1Y
	for qemu-trivial@nongnu.org; Thu, 13 Apr 2017 12:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chugh.ishani@research.iiit.ac.in>)
	id 1cyhP7-00072w-Am
	for qemu-trivial@nongnu.org; Thu, 13 Apr 2017 12:15:32 -0400
Received: from research.iiit.ac.in ([196.12.53.8]:47114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chugh.ishani@research.iiit.ac.in>)
	id 1cyhP6-00071e-AE
	for qemu-trivial@nongnu.org; Thu, 13 Apr 2017 12:15:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by research.iiit.ac.in (Postfix) with ESMTP id 26D35741BFD;
	Thu, 13 Apr 2017 21:45:20 +0530 (IST)
Received: from research.iiit.ac.in ([127.0.0.1])
	by localhost (research.iiit.ac.in [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JuwVw8mSwnC1; Thu, 13 Apr 2017 21:45:17 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by research.iiit.ac.in (Postfix) with ESMTP id 0C7A3741C59;
	Thu, 13 Apr 2017 21:45:17 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.9.2 research.iiit.ac.in 0C7A3741C59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=research.iiit.ac.in;
	s=4E8815E6-5B55-11E4-B758-8D4964374E96; t=1492100117;
	bh=HnF8h1mORjrXgOP08ipwrGE09zGcOiuzJwxWbsov2aU=;
	h=From:To:Subject:Date:Message-Id;
	b=gWB5+Gk01U89gha7XIJnsQ5ZVzhyJBLqB7SfrlWvH5840n2DeD7ScalTIPPUlpb2d
	js6MsY8DqOqAotZpNiW9AqkBEalCbGK1aThZ1ivk6vlZW4Y34g8aIWQ+NEmj037+Or
	O+qdm04D6Qb/IC07zLVUmCsiTxfOg0UvZjxtSs6w=
X-Virus-Scanned: amavisd-new at research.iiit.ac.in
Received: from research.iiit.ac.in ([127.0.0.1])
	by localhost (research.iiit.ac.in [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0wTzMWFUQ0Fk; Thu, 13 Apr 2017 21:45:16 +0530 (IST)
Received: from ishani-ThinkCentre-M72e.iiit.ac.in (unknown [10.2.40.225])
	by research.iiit.ac.in (Postfix) with ESMTPSA id BB765741C1E;
	Thu, 13 Apr 2017 21:45:16 +0530 (IST)
From: Ishani Chugh <chugh.ishani@research.iiit.ac.in>
To: qemu-trivial@nongnu.org
Cc: rth@twiddle.net, ehabkost@redhat.com, agraf@suse.de,
	david@gibson.dropbear.id.au, marex@denx.de, crwulff@gmail.com,
	kbastian@mail.uni-paderborn.de, edgar.iglesias@gmail.com,
	Ishani Chugh <chugh.ishani@research.iiit.ac.in>
Date: Thu, 13 Apr 2017 21:44:39 +0530
Message-Id: <1492100079-4110-1-git-send-email-chugh.ishani@research.iiit.ac.in>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 196.12.53.8
X-Mailman-Approved-At: Thu, 13 Apr 2017 16:42:51 -0400
Subject: [Qemu-trivial] [PATCH] Remove reduntant qemu: from error functions
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
X-List-Received-Date: Thu, 13 Apr 2017 16:15:33 -0000

This patch removes redundant "qemu:" from error functions. The link to the bitesized task is:
http://wiki.qemu-project.org/Contribute/BiteSizedTasks#Error_checking

Signed-off-by: Ishani Chugh <chugh.ishani@research.iiit.ac.in>
---
 hw/microblaze/boot.c           | 2 +-
 hw/nios2/boot.c                | 2 +-
 hw/ppc/pnv.c                   | 2 +-
 hw/s390x/sclp.c                | 4 ++--
 hw/tricore/tricore_testboard.c | 2 +-
 numa.c                         | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 1834d22..457a08a 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -189,7 +189,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
                                                   ram_size - initrd_offset);
             }
             if (initrd_size < 0) {
-                error_report("qemu: could not load initrd '%s'",
+                error_report("could not load initrd '%s'",
                              initrd_filename);
                 exit(EXIT_FAILURE);
             }
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index e0a9aff..2b31f5b 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -197,7 +197,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
                                                   ram_size - initrd_offset);
             }
             if (initrd_size < 0) {
-                error_report("qemu: could not load initrd '%s'",
+                error_report("could not load initrd '%s'",
                              initrd_filename);
                 exit(EXIT_FAILURE);
             }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 3fa722a..3a21da0 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -420,7 +420,7 @@ static void ppc_powernv_init(MachineState *machine)
     /* Create the processor chips */
     chip_typename = g_strdup_printf(TYPE_PNV_CHIP "-%s", machine->cpu_model);
     if (!object_class_by_name(chip_typename)) {
-        error_report("qemu: invalid CPU model '%s' for %s machine",
+        error_report("invalid CPU model '%s' for %s machine",
                      machine->cpu_model, MACHINE_GET_CLASS(machine)->name);
         exit(1);
     }
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index e741da1..6996088 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -496,10 +496,10 @@ static void sclp_realize(DeviceState *dev, Error **errp)
 
     ret = s390_set_memory_limit(machine->maxram_size, &hw_limit);
     if (ret == -E2BIG) {
-        error_setg(&err, "qemu: host supports a maximum of %" PRIu64 " GB",
+        error_setg(&err, "host supports a maximum of %" PRIu64 " GB",
                    hw_limit >> 30);
     } else if (ret) {
-        error_setg(&err, "qemu: setting the guest size failed");
+        error_setg(&err, "setting the guest size failed");
     }
 
 out:
diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index 19dd587..8910bf0 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -50,7 +50,7 @@ static void tricore_load_kernel(CPUTriCoreState *env)
                            NULL, 0,
                            EM_TRICORE, 1, 0);
     if (kernel_size <= 0) {
-        error_report("qemu: no kernel file '%s'",
+        error_report("no kernel file '%s'",
                 tricoretb_binfo.kernel_filename);
         exit(1);
     }
diff --git a/numa.c b/numa.c
index 6fc2393..39b743b 100644
--- a/numa.c
+++ b/numa.c
@@ -174,7 +174,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
     }
 
     if (node->has_mem && node->has_memdev) {
-        error_setg(errp, "qemu: cannot specify both mem= and memdev=");
+        error_setg(errp, "cannot specify both mem= and memdev=");
         return;
     }
 
@@ -182,7 +182,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
         have_memdevs = node->has_memdev;
     }
     if (node->has_memdev != have_memdevs) {
-        error_setg(errp, "qemu: memdev option must be specified for either "
+        error_setg(errp, "memdev option must be specified for either "
                    "all or no nodes");
         return;
     }
-- 
2.7.4


