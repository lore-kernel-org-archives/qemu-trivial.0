Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nnO-0004OP-2A
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 05:27:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1h9nnK-0004OC-W6
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 05:27:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1h9nnI-0005p0-Vv
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 05:27:26 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1h9nnI-0005nL-Im
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 05:27:24 -0400
Received: by mail-wr1-x443.google.com with SMTP id r4so1677875wrq.8
	for <qemu-trivial@nongnu.org>; Fri, 29 Mar 2019 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=52GS/XOCCIeAEH/KhWo/VS5Z9QELoOppbhH96d7yK0k=;
	b=QdaKK5C2oRmaaGnexI2wL/ZPabVtSZLI4Ghuoq22G739X6ChrGXMht0o+Y5yRAZVXM
	hmCzPuTjXvcDEtutsp5U4ZbqRj2Sep1eSd7QeZFp693uvwL7wMTxwAjRu8C/BlDnr5aC
	5BP4yYPvRzryHePYHKjyMyHqzRLnvYytKsFPVermj6F9pVkvewtjnHioSmrwi1aPZYfk
	je1Vcd2Y8wpYvYRiL2WybRwAQc5YfRBbc1wBqjqoGgpUHYeIo/+xEE4o5sp77kyBf7JT
	wyZAm0XghKTQY+yeG6qUY8YDhyxjjen6hq5+s8B/rFsSaPMFCq8RU9XmezN6My2IsHSj
	oq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=52GS/XOCCIeAEH/KhWo/VS5Z9QELoOppbhH96d7yK0k=;
	b=oDPjdaotlqaPgp7Rt6T4eH2ijA4uph0t/5rCOH6+/1U5bvNcFoLPCt0nfNbP8uyvx0
	9NqtakOX1MYvpCgruYc04zp9SnzHeRbbVXqN4cAP8IIjVfsdZ/AwsrDpRjZAXxyWp/Xz
	N2aoMMd5FQtjSXfchn9+ZjvVJIzLO+DpRX/bI4d/+txJELf3tTIkeBHsUqTna0pG+2VF
	qSuwmSSS8D3wVIe+bDsGM6l4YWUPZK8golgaWDq2sh0sB1iyfYYdCOYcNZrcqDNbqEf9
	4lw4XDTacwOYXZd5hf+5V7fXsByvoqWuJ9jcVTrqGe9Kyd16TWame8VVMHdyA1Gk/v6e
	0Y9A==
X-Gm-Message-State: APjAAAXc69EWKNH7svF3f6vmzeDRh0IdJc0b3CBs9i4eOJ5nc9V0PC47
	NNr/VZeV9Xg8W75yJ1GyAnVHeA==
X-Google-Smtp-Source: APXvYqykZL6NS4gZNTv0X0YubJFwDqGOSPqMOGc5yFQRsztdH8jSxl4XpA479LItIq40nA0j+igGWQ==
X-Received: by 2002:adf:b612:: with SMTP id f18mr13018341wre.236.1553851643233;
	Fri, 29 Mar 2019 02:27:23 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	f128sm1493283wme.28.2019.03.29.02.27.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Mar 2019 02:27:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4541C1FF87;
	Fri, 29 Mar 2019 09:27:22 +0000 (UTC)
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-5-git-send-email-like.xu@linux.intel.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	like.xu@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
In-reply-to: <1553849325-44201-5-git-send-email-like.xu@linux.intel.com>
Date: Fri, 29 Mar 2019 09:27:22 +0000
Message-ID: <87h8bmuj2d.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/9] cpu/topology: add ARM
 support for smp machine properties
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
X-List-Received-Date: Fri, 29 Mar 2019 09:27:29 -0000


Like Xu <like.xu@linux.intel.com> writes:

> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>  hw/arm/fsl-imx6.c      | 5 +++++
>  hw/arm/fsl-imx6ul.c    | 5 +++++
>  hw/arm/fsl-imx7.c      | 5 +++++
>  hw/arm/highbank.c      | 1 +
>  hw/arm/mcimx6ul-evk.c  | 1 +
>  hw/arm/mcimx7d-sabre.c | 3 +++
>  hw/arm/raspi.c         | 2 ++
>  hw/arm/realview.c      | 1 +
>  hw/arm/sabrelite.c     | 1 +
>  hw/arm/vexpress.c      | 3 +++
>  hw/arm/virt.c          | 7 +++++++
>  hw/arm/xlnx-zynqmp.c   | 7 +++++++
>  target/arm/cpu.c       | 7 +++++++
>  13 files changed, 48 insertions(+)
>
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index 7b7b97f..efed3a4 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -23,6 +23,7 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "hw/arm/fsl-imx6.h"
> +#include "hw/boards.h"
>  #include "sysemu/sysemu.h"
>  #include "chardev/char.h"
>  #include "qemu/error-report.h"
> @@ -33,9 +34,11 @@
>
>  static void fsl_imx6_init(Object *obj)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      FslIMX6State *s =3D FSL_IMX6(obj);
>      char name[NAME_SIZE];
>      int i;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>
>      for (i =3D 0; i < MIN(smp_cpus, FSL_IMX6_NUM_CPUS); i++) {
>          snprintf(name, NAME_SIZE, "cpu%d", i);
> @@ -93,9 +96,11 @@ static void fsl_imx6_init(Object *obj)
>
>  static void fsl_imx6_realize(DeviceState *dev, Error **errp)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      FslIMX6State *s =3D FSL_IMX6(dev);
>      uint16_t i;
>      Error *err =3D NULL;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>
>      if (smp_cpus > FSL_IMX6_NUM_CPUS) {
>          error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index 4b56bfa..426bf8e 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -23,14 +23,17 @@
>  #include "hw/misc/unimp.h"
>  #include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
> +#include "hw/boards.h"
>
>  #define NAME_SIZE 20
>
>  static void fsl_imx6ul_init(Object *obj)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      FslIMX6ULState *s =3D FSL_IMX6UL(obj);
>      char name[NAME_SIZE];
>      int i;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>
>      for (i =3D 0; i < MIN(smp_cpus, FSL_IMX6UL_NUM_CPUS); i++) {
>          snprintf(name, NAME_SIZE, "cpu%d", i);
> @@ -156,10 +159,12 @@ static void fsl_imx6ul_init(Object *obj)
>
>  static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      FslIMX6ULState *s =3D FSL_IMX6UL(dev);
>      int i;
>      qemu_irq irq;
>      char name[NAME_SIZE];
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>
>      if (smp_cpus > FSL_IMX6UL_NUM_CPUS) {
>          error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 7663ad6..b759f7b 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -25,11 +25,14 @@
>  #include "hw/misc/unimp.h"
>  #include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
> +#include "hw/boards.h"
>
>  #define NAME_SIZE 20
>
>  static void fsl_imx7_init(Object *obj)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>      FslIMX7State *s =3D FSL_IMX7(obj);
>      char name[NAME_SIZE];
>      int i;
> @@ -155,11 +158,13 @@ static void fsl_imx7_init(Object *obj)
>
>  static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      FslIMX7State *s =3D FSL_IMX7(dev);
>      Object *o;
>      int i;
>      qemu_irq irq;
>      char name[NAME_SIZE];
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>
>      if (smp_cpus > FSL_IMX7_NUM_CPUS) {
>          error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index 96ccf18..58c77f6 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -240,6 +240,7 @@ static void calxeda_init(MachineState *machine, enum =
cxmachines machine_id)
>      SysBusDevice *busdev;
>      qemu_irq pic[128];
>      int n;
> +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
>      qemu_irq cpu_irq[4];
>      qemu_irq cpu_fiq[4];
>      qemu_irq cpu_virq[4];
> diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
> index fb2b015..29fb706 100644
> --- a/hw/arm/mcimx6ul-evk.c
> +++ b/hw/arm/mcimx6ul-evk.c
> @@ -29,6 +29,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
>      static struct arm_boot_info boot_info;
>      MCIMX6ULEVK *s =3D g_new0(MCIMX6ULEVK, 1);
>      int i;
> +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
>
>      if (machine->ram_size > FSL_IMX6UL_MMDC_SIZE) {
>          error_report("RAM size " RAM_ADDR_FMT " above max supported (%08=
x)",
> diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
> index 9c5f0e7..c2cdaf9 100644
> --- a/hw/arm/mcimx7d-sabre.c
> +++ b/hw/arm/mcimx7d-sabre.c
> @@ -20,6 +20,7 @@
>  #include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
> +#include "hw/boards.h"
>
>  typedef struct {
>      FslIMX7State soc;
> @@ -28,10 +29,12 @@ typedef struct {
>
>  static void mcimx7d_sabre_init(MachineState *machine)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());

Isn't this redundant? Doesn't ms =3D=3D machine?

>      static struct arm_boot_info boot_info;
>      MCIMX7Sabre *s =3D g_new0(MCIMX7Sabre, 1);
>      Object *soc;
>      int i;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>
>      if (machine->ram_size > FSL_IMX7_MMDC_SIZE) {
>          error_report("RAM size " RAM_ADDR_FMT " above max supported (%08=
x)",
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 66899c2..8ab8e10 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -113,6 +113,7 @@ static void setup_boot(MachineState *machine, int ver=
sion, size_t ram_size)
>  {
>      static struct arm_boot_info binfo;
>      int r;
> +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
>
>      binfo.board_id =3D raspi_boardid[version];
>      binfo.ram_size =3D ram_size;
> @@ -174,6 +175,7 @@ static void raspi_init(MachineState *machine, int ver=
sion)
>      BlockBackend *blk;
>      BusState *bus;
>      DeviceState *carddev;
> +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
>
>      object_initialize(&s->soc, sizeof(s->soc),
>                        version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836);
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 242f5a8..517c275 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -69,6 +69,7 @@ static void realview_init(MachineState *machine,
>      NICInfo *nd;
>      I2CBus *i2c;
>      int n;
> +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
>      int done_nic =3D 0;
>      qemu_irq cpu_irq[4];
>      int is_mpcore =3D 0;
> diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
> index ee140e5..108faab 100644
> --- a/hw/arm/sabrelite.c
> +++ b/hw/arm/sabrelite.c
> @@ -47,6 +47,7 @@ static void sabrelite_init(MachineState *machine)
>  {
>      IMX6Sabrelite *s =3D g_new0(IMX6Sabrelite, 1);
>      Error *err =3D NULL;
> +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
>
>      /* Check the amount of memory is compatible with the SOC */
>      if (machine->ram_size > FSL_IMX6_MMDC_SIZE) {
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index f07134c..1927d12 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -206,9 +206,11 @@ struct VEDBoardInfo {
>  static void init_cpus(const char *cpu_type, const char *privdev,
>                        hwaddr periphbase, qemu_irq *pic, bool secure, boo=
l virt)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      DeviceState *dev;
>      SysBusDevice *busdev;
>      int n;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>
>      /* Create the actual CPUs */
>      for (n =3D 0; n < smp_cpus; n++) {
> @@ -558,6 +560,7 @@ static void vexpress_common_init(MachineState *machin=
e)
>      MemoryRegion *flash0mem;
>      const hwaddr *map =3D daughterboard->motherboard_map;
>      int i;
> +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
>
>      daughterboard->init(vms, machine->ram_size, machine->cpu_type, pic);
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ce2664a..ff1dff3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -555,11 +555,13 @@ static void create_v2m(VirtMachineState *vms, qemu_=
irq *pic)
>
>  static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>  {
> +    MachineState *ms =3D MACHINE(vms);
>      /* We create a standalone GIC */
>      DeviceState *gicdev;
>      SysBusDevice *gicbusdev;
>      const char *gictype;
>      int type =3D vms->gic_version, i;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>      uint32_t nb_redist_regions =3D 0;
>
>      gictype =3D (type =3D=3D 3) ? gicv3_class_name() : gic_class_name();
> @@ -984,10 +986,12 @@ static void create_flash(const VirtMachineState *vm=
s,
>
>  static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpa=
ce *as)
>  {
> +    MachineState *ms =3D MACHINE(vms);
>      hwaddr base =3D vms->memmap[VIRT_FW_CFG].base;
>      hwaddr size =3D vms->memmap[VIRT_FW_CFG].size;
>      FWCfgState *fw_cfg;
>      char *nodename;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>
>      fw_cfg =3D fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> @@ -1423,6 +1427,8 @@ static void machvirt_init(MachineState *machine)
>      MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>      bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
>      bool aarch64 =3D true;
> +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> +    unsigned int max_cpus =3D machine->topo.max_cpus;
>
>      /*
>       * In accelerated mode, the memory map is computed earlier in kvm_ty=
pe()
> @@ -1786,6 +1792,7 @@ static int64_t virt_get_default_cpu_node_id(const M=
achineState *ms, int idx)
>  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>  {
>      int n;
> +    unsigned int max_cpus =3D ms->topo.max_cpus;
>      VirtMachineState *vms =3D VIRT_MACHINE(ms);
>
>      if (ms->possible_cpus) {
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 4f8bc41..29b9427 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -19,6 +19,7 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> +#include "hw/boards.h"
>  #include "hw/arm/xlnx-zynqmp.h"
>  #include "hw/intc/arm_gic_common.h"
>  #include "exec/address-spaces.h"
> @@ -174,8 +175,10 @@ static inline int arm_gic_ppi_index(int cpu_nr, int =
ppi_index)
>  static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_=
cpu,
>                                     Error **errp)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      Error *err =3D NULL;
>      int i;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>      int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQM=
P_NUM_RPU_CPUS);
>
>      if (num_rpus <=3D 0) {
> @@ -221,8 +224,10 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *=
s, const char *boot_cpu,
>
>  static void xlnx_zynqmp_init(Object *obj)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      XlnxZynqMPState *s =3D XLNX_ZYNQMP(obj);
>      int i;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>      int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
>
>      object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
> @@ -290,10 +295,12 @@ static void xlnx_zynqmp_init(Object *obj)
>
>  static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>      XlnxZynqMPState *s =3D XLNX_ZYNQMP(dev);
>      MemoryRegion *system_memory =3D get_system_memory();
>      uint8_t i;
>      uint64_t ram_size;
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
>      int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
>      const char *boot_cpu =3D s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
>      ram_addr_t ddr_low_size, ddr_high_size;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 4155782..e5d7e3b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -30,6 +30,7 @@
>  #include "hw/qdev-properties.h"
>  #if !defined(CONFIG_USER_ONLY)
>  #include "hw/loader.h"
> +#include "hw/boards.h"
>  #endif
>  #include "hw/arm/arm.h"
>  #include "sysemu/sysemu.h"
> @@ -1183,6 +1184,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      init_cpreg_list(cpu);
>
>  #ifndef CONFIG_USER_ONLY
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> +
>      if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>          cs->num_ases =3D 2;
>
> @@ -1713,6 +1717,9 @@ static void cortex_a9_initfn(Object *obj)
>  #ifndef CONFIG_USER_ONLY
>  static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());

How expensive is qdev_get_machine? This could potentially be a
performance issue if this register is read a lot.

> +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> +
>      /* Linux wants the number of processors from here.
>       * Might as well set the interrupt-controller bit too.
>       */


--
Alex Benn=C3=A9e

