Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9ojy-0000Oe-SH
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 06:28:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h9ojv-0000EY-V1
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 06:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h9oe9-0008Lu-Jp
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 06:22:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h9oe8-0008Kk-5X; Fri, 29 Mar 2019 06:22:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D85D308339F;
	Fri, 29 Mar 2019 10:21:58 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C06D782193;
	Fri, 29 Mar 2019 10:21:56 +0000 (UTC)
Date: Fri, 29 Mar 2019 11:21:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	like.xu@intel.com, qemu-devel@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>
Message-ID: <20190329112152.0c7ad147@redhat.com>
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 29 Mar 2019 10:21:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/9] refactor cpu topo into
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
X-List-Received-Date: Fri, 29 Mar 2019 10:28:01 -0000

On Fri, 29 Mar 2019 16:48:36 +0800
Like Xu <like.xu@linux.intel.com> wrote:

> This patch series make existing cores/threads/sockets into machine
> properties and get rid of global variables they use currently.
Thanks for looking into it!
Its long overdue and rather desired conversion (albeit naive one,
but this series is a good starting point). I'll go over your patches
next week with comments and concrete suggestions how to implement
particular things.

> Like Xu (9):
>   cpu/topology: add struct CpuTopology to MachineState
>   cpu/topology: add general support for machine properties
>   cpu/topology: add uncommon arch support for smp machine properties
>   cpu/topology: add ARM support for smp machine properties
>   cpu/topology: add i386 support for smp machine properties
>   cpu/topology: add PPC support for smp machine properties
>   cpu/topology: add riscv support for smp machine properties
>   cpu/topology: add s390x support for smp machine properties
>   cpu/topology: replace smp global variables with machine propertie
> 
>  accel/kvm/kvm-all.c          |  3 +++
>  backends/hostmem.c           |  4 ++++
>  cpus.c                       |  4 ++++
>  exec.c                       |  2 ++
>  gdbstub.c                    |  7 ++++++-
>  hw/alpha/dp264.c             |  1 +
>  hw/arm/fsl-imx6.c            |  5 +++++
>  hw/arm/fsl-imx6ul.c          |  5 +++++
>  hw/arm/fsl-imx7.c            |  5 +++++
>  hw/arm/highbank.c            |  1 +
>  hw/arm/mcimx6ul-evk.c        |  1 +
>  hw/arm/mcimx7d-sabre.c       |  3 +++
>  hw/arm/raspi.c               |  2 ++
>  hw/arm/realview.c            |  1 +
>  hw/arm/sabrelite.c           |  1 +
>  hw/arm/vexpress.c            |  3 +++
>  hw/arm/virt.c                |  7 +++++++
>  hw/arm/xlnx-zynqmp.c         |  7 +++++++
>  hw/cpu/core.c                |  3 +++
>  hw/hppa/machine.c            |  4 ++++
>  hw/i386/acpi-build.c         |  3 +++
>  hw/i386/kvmvapic.c           |  5 +++++
>  hw/i386/pc.c                 | 12 +++++++++++
>  hw/mips/boston.c             |  1 +
>  hw/mips/mips_malta.c         |  9 +++++++++
>  hw/openrisc/openrisc_sim.c   |  1 +
>  hw/ppc/e500.c                |  3 +++
>  hw/ppc/mac_newworld.c        |  2 ++
>  hw/ppc/mac_oldworld.c        |  2 ++
>  hw/ppc/pnv.c                 |  3 +++
>  hw/ppc/prep.c                |  2 ++
>  hw/ppc/spapr.c               | 29 ++++++++++++++++++++++++++
>  hw/ppc/spapr_rtas.c          |  3 +++
>  hw/riscv/sifive_e.c          |  4 ++++
>  hw/riscv/sifive_plic.c       |  3 +++
>  hw/riscv/sifive_u.c          |  4 ++++
>  hw/riscv/spike.c             |  2 ++
>  hw/riscv/virt.c              |  1 +
>  hw/s390x/s390-virtio-ccw.c   |  2 ++
>  hw/s390x/sclp.c              |  1 +
>  hw/smbios/smbios.c           | 11 ++++++++++
>  hw/sparc/sun4m.c             |  2 ++
>  hw/sparc64/sun4u.c           |  2 ++
>  hw/xtensa/sim.c              |  1 +
>  hw/xtensa/xtfpga.c           |  1 +
>  include/hw/arm/virt.h        |  2 +-
>  include/hw/boards.h          |  8 ++++++++
>  include/sysemu/sysemu.h      |  2 +-
>  migration/postcopy-ram.c     |  7 +++++++
>  numa.c                       |  1 +
>  target/arm/cpu.c             |  7 +++++++
>  target/i386/cpu.c            |  4 ++++
>  target/openrisc/sys_helper.c |  5 +++++
>  target/s390x/cpu.c           |  3 +++
>  target/s390x/excp_helper.c   |  6 ++++++
>  tcg/tcg.c                    | 15 ++++++++++++++
>  vl.c                         | 48 ++++++++++++++++++++++++--------------------
>  57 files changed, 261 insertions(+), 25 deletions(-)
> 


