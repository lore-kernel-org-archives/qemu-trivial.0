Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nDn-0000Vj-IL
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 04:50:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nDj-0000Tq-D3
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nDi-0006ym-8A
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:50:39 -0400
Received: from mga06.intel.com ([134.134.136.31]:30610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1h9nDh-0006Sh-UQ; Fri, 29 Mar 2019 04:50:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2019 01:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129706902"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga008.jf.intel.com with ESMTP; 29 Mar 2019 01:49:32 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Date: Fri, 29 Mar 2019 16:48:36 +0800
Message-Id: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 0/9] refactor cpu topo into
 machine properties
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
X-List-Received-Date: Fri, 29 Mar 2019 08:50:40 -0000

This patch series make existing cores/threads/sockets into machine
properties and get rid of global variables they use currently.

Like Xu (9):
  cpu/topology: add struct CpuTopology to MachineState
  cpu/topology: add general support for machine properties
  cpu/topology: add uncommon arch support for smp machine properties
  cpu/topology: add ARM support for smp machine properties
  cpu/topology: add i386 support for smp machine properties
  cpu/topology: add PPC support for smp machine properties
  cpu/topology: add riscv support for smp machine properties
  cpu/topology: add s390x support for smp machine properties
  cpu/topology: replace smp global variables with machine propertie

 accel/kvm/kvm-all.c          |  3 +++
 backends/hostmem.c           |  4 ++++
 cpus.c                       |  4 ++++
 exec.c                       |  2 ++
 gdbstub.c                    |  7 ++++++-
 hw/alpha/dp264.c             |  1 +
 hw/arm/fsl-imx6.c            |  5 +++++
 hw/arm/fsl-imx6ul.c          |  5 +++++
 hw/arm/fsl-imx7.c            |  5 +++++
 hw/arm/highbank.c            |  1 +
 hw/arm/mcimx6ul-evk.c        |  1 +
 hw/arm/mcimx7d-sabre.c       |  3 +++
 hw/arm/raspi.c               |  2 ++
 hw/arm/realview.c            |  1 +
 hw/arm/sabrelite.c           |  1 +
 hw/arm/vexpress.c            |  3 +++
 hw/arm/virt.c                |  7 +++++++
 hw/arm/xlnx-zynqmp.c         |  7 +++++++
 hw/cpu/core.c                |  3 +++
 hw/hppa/machine.c            |  4 ++++
 hw/i386/acpi-build.c         |  3 +++
 hw/i386/kvmvapic.c           |  5 +++++
 hw/i386/pc.c                 | 12 +++++++++++
 hw/mips/boston.c             |  1 +
 hw/mips/mips_malta.c         |  9 +++++++++
 hw/openrisc/openrisc_sim.c   |  1 +
 hw/ppc/e500.c                |  3 +++
 hw/ppc/mac_newworld.c        |  2 ++
 hw/ppc/mac_oldworld.c        |  2 ++
 hw/ppc/pnv.c                 |  3 +++
 hw/ppc/prep.c                |  2 ++
 hw/ppc/spapr.c               | 29 ++++++++++++++++++++++++++
 hw/ppc/spapr_rtas.c          |  3 +++
 hw/riscv/sifive_e.c          |  4 ++++
 hw/riscv/sifive_plic.c       |  3 +++
 hw/riscv/sifive_u.c          |  4 ++++
 hw/riscv/spike.c             |  2 ++
 hw/riscv/virt.c              |  1 +
 hw/s390x/s390-virtio-ccw.c   |  2 ++
 hw/s390x/sclp.c              |  1 +
 hw/smbios/smbios.c           | 11 ++++++++++
 hw/sparc/sun4m.c             |  2 ++
 hw/sparc64/sun4u.c           |  2 ++
 hw/xtensa/sim.c              |  1 +
 hw/xtensa/xtfpga.c           |  1 +
 include/hw/arm/virt.h        |  2 +-
 include/hw/boards.h          |  8 ++++++++
 include/sysemu/sysemu.h      |  2 +-
 migration/postcopy-ram.c     |  7 +++++++
 numa.c                       |  1 +
 target/arm/cpu.c             |  7 +++++++
 target/i386/cpu.c            |  4 ++++
 target/openrisc/sys_helper.c |  5 +++++
 target/s390x/cpu.c           |  3 +++
 target/s390x/excp_helper.c   |  6 ++++++
 tcg/tcg.c                    | 15 ++++++++++++++
 vl.c                         | 48 ++++++++++++++++++++++++--------------------
 57 files changed, 261 insertions(+), 25 deletions(-)

-- 
1.8.3.1


