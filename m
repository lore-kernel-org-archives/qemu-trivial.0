Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cWOum-0002aQ-7E
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2017 09:51:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caliborn@SDF.ORG>) id 1cWOui-0002Yq-SY
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2017 09:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caliborn@SDF.ORG>) id 1cWOue-00009c-00
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2017 09:51:08 -0500
Received: from ol.sdf.org ([205.166.94.20]:64888 helo=mx.sdf.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <caliborn@SDF.ORG>)
	id 1cWOud-00009F-Fg; Wed, 25 Jan 2017 09:51:03 -0500
Received: from sdf.lonestar.org (IDENT:caliborn@sdf.lonestar.org
	[205.166.94.15])
	by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id v0PEoUti008171
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256 bits) verified NO);
	Wed, 25 Jan 2017 14:50:31 GMT
Date: Wed, 25 Jan 2017 14:50:30 +0000 (UTC)
From: Valentin Plotkin <caliborn@SDF.ORG>
X-X-Sender: caliborn@sdf.lonestar.org
To: qemu-devel@nongnu.org
cc: Alexander Graf <agraf@suse.de>, Scott Wood <scottwood@freescale.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <Pine.NEB.4.64.1701251446290.11466@sdf.lonestar.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 205.166.94.20
Subject: [Qemu-trivial] [PATCH v2] target-ppc: Add MMU model check for booke
 machines
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
X-List-Received-Date: Wed, 25 Jan 2017 14:51:10 -0000

Machines bamboo, e500 and virtex-ml507 assume a certain MMU model,
otherwise resulting in unpredictable behavior. Add apropriate checks
into *_init functions.

Signed-off-by: Valentin <caliborn@sdf.org>
---
  hw/ppc/e500.c          | 6 ++++++
  hw/ppc/ppc440_bamboo.c | 6 ++++++
  hw/ppc/virtex_ml507.c  | 7 +++++++
  3 files changed, 19 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index cf8b122..5b1958c 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -827,6 +827,12 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
          env = &cpu->env;
          cs = CPU(cpu);

+        if (env->mmu_model != POWERPC_MMU_BOOKE206) {
+            fprintf(stderr, "MMU model %i not supported by this machine.\n",
+                env->mmu_model);
+            exit(1);
+        }
+
          if (!firstenv) {
              firstenv = env;
          }
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 5c535b1..9d997bf 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -193,6 +193,12 @@ static void bamboo_init(MachineState *machine)
      }
      env = &cpu->env;

+    if (env->mmu_model != POWERPC_MMU_BOOKE) {
+        fprintf(stderr, "MMU model %i not supported by this machine.\n",
+            env->mmu_model);
+        exit(1);
+    }
+
      qemu_register_reset(main_cpu_reset, cpu);
      ppc_booke_timers_init(cpu, 400000000, 0);
      ppc_dcr_init(env, NULL, NULL);
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index b97d966..fdbcf22 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -221,6 +221,13 @@ static void virtex_init(MachineState *machine)

      cpu = ppc440_init_xilinx(&ram_size, 1, machine->cpu_model, 400000000);
      env = &cpu->env;
+
+    if (env->mmu_model != POWERPC_MMU_BOOKE) {
+        fprintf(stderr, "MMU model %i not supported by this machine.\n",
+            env->mmu_model);
+        exit(1);
+    }
+
      qemu_register_reset(main_cpu_reset, cpu);

      memory_region_allocate_system_memory(phys_ram, NULL, "ram", ram_size);
-- 
2.5.5


This fixes 'qemu-system-ppc -nographic -cpu G2leGP3 -M ppce500; bug from
BiteSizedTasks.

Version 2: fixed style, moved checks from mmubooke_create_initial_mapping
to *_init. Thanks to Thomas Huth <thuth@redhat.com>.

