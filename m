Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9piI-0003qL-Cy
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 07:30:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9piE-0003nr-0O
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 07:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9piA-0008H8-Qh
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 07:30:17 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:43659)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9pi3-0008Dt-W4; Fri, 29 Mar 2019 07:30:08 -0400
Received: by mail-yw1-f66.google.com with SMTP id j66so535189ywc.10;
	Fri, 29 Mar 2019 04:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lPRrijM64CGh1z8Q5aja6B8uqwmODbyQzSgkUvCn47I=;
	b=UCjgfrIYcjW9GHqNFu/Aw6XAwOykfmjyZ7Djl++kbmrQhZufNpn7H6OenSp6Zasc9u
	r4XI9oSwYxX7M0p75bUiuTPYPPiBERlc7noNhNg6h7CZVrj9NhhfliQkVNbxg2wZRu5n
	WZ53W/wZBE0xgaBqX89zV48Ry0kZyeybnO4BSe+FQ7DPs3AJ66Fqt7klEv1F0JJGxl4b
	5UQA7c4mtKA+nyGCyr3Tlbsb3P78HnXi3M2e2D7+ljiUblLeksJiCm84dkil7Zz2eXjD
	1ptC3fjHY2q0NGz1sDaZMSjNJOZvtzAMkSCkwn39dL27m+RsKBUgZGlUrtKWLo02F4u4
	s96w==
X-Gm-Message-State: APjAAAX3WWljFY7F/OtfZ9jH4cynptWmVa7BJIFmmnmNxjpKXqQjH1tM
	Xi9Yj2tB/defEqs1lJyCYE3b8d/hHrMD+rpRmeY=
X-Google-Smtp-Source: APXvYqyfh7jUqgjdN0EeZLJ3UYsbeo3I4qPCD1rwuK2wToah7V+9/7c+eTtFMK4jzUjMe7pT9X/S65bb2365JAEmn3o=
X-Received: by 2002:a81:8807:: with SMTP id y7mr5075864ywf.356.1553859006329; 
	Fri, 29 Mar 2019 04:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-5-git-send-email-like.xu@linux.intel.com>
	<87h8bmuj2d.fsf@zen.linaroharston>
In-Reply-To: <87h8bmuj2d.fsf@zen.linaroharston>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 29 Mar 2019 12:20:35 +0100
Message-ID: <CAAdtpL4SL7tqcVQF9OT4_4TJMWEjBhMsMKd6Ffdb+ekZCRTS6A@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, like.xu@intel.com, 
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001a7743058539fe95"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.66
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
X-List-Received-Date: Fri, 29 Mar 2019 11:30:21 -0000

--0000000000001a7743058539fe95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 29 mars 2019 10:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> a =C3=
=A9crit :

>
> Like Xu <like.xu@linux.intel.com> writes:
>
> > Signed-off-by: Like Xu <like.xu@linux.intel.com>
> > ---
> >  hw/arm/fsl-imx6.c      | 5 +++++
> >  hw/arm/fsl-imx6ul.c    | 5 +++++
> >  hw/arm/fsl-imx7.c      | 5 +++++
> >  hw/arm/highbank.c      | 1 +
> >  hw/arm/mcimx6ul-evk.c  | 1 +
> >  hw/arm/mcimx7d-sabre.c | 3 +++
> >  hw/arm/raspi.c         | 2 ++
> >  hw/arm/realview.c      | 1 +
> >  hw/arm/sabrelite.c     | 1 +
> >  hw/arm/vexpress.c      | 3 +++
> >  hw/arm/virt.c          | 7 +++++++
> >  hw/arm/xlnx-zynqmp.c   | 7 +++++++
> >  target/arm/cpu.c       | 7 +++++++
> >  13 files changed, 48 insertions(+)
> >
> > diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> > index 7b7b97f..efed3a4 100644
> > --- a/hw/arm/fsl-imx6.c
> > +++ b/hw/arm/fsl-imx6.c
> > @@ -23,6 +23,7 @@
> >  #include "qapi/error.h"
> >  #include "qemu-common.h"
> >  #include "hw/arm/fsl-imx6.h"
> > +#include "hw/boards.h"
> >  #include "sysemu/sysemu.h"
> >  #include "chardev/char.h"
> >  #include "qemu/error-report.h"
> > @@ -33,9 +34,11 @@
> >
> >  static void fsl_imx6_init(Object *obj)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      FslIMX6State *s =3D FSL_IMX6(obj);
> >      char name[NAME_SIZE];
> >      int i;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >
> >      for (i =3D 0; i < MIN(smp_cpus, FSL_IMX6_NUM_CPUS); i++) {
> >          snprintf(name, NAME_SIZE, "cpu%d", i);
> > @@ -93,9 +96,11 @@ static void fsl_imx6_init(Object *obj)
> >
> >  static void fsl_imx6_realize(DeviceState *dev, Error **errp)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      FslIMX6State *s =3D FSL_IMX6(dev);
> >      uint16_t i;
> >      Error *err =3D NULL;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >
> >      if (smp_cpus > FSL_IMX6_NUM_CPUS) {
> >          error_setg(errp, "%s: Only %d CPUs are supported (%d
> requested)",
> > diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> > index 4b56bfa..426bf8e 100644
> > --- a/hw/arm/fsl-imx6ul.c
> > +++ b/hw/arm/fsl-imx6ul.c
> > @@ -23,14 +23,17 @@
> >  #include "hw/misc/unimp.h"
> >  #include "sysemu/sysemu.h"
> >  #include "qemu/error-report.h"
> > +#include "hw/boards.h"
> >
> >  #define NAME_SIZE 20
> >
> >  static void fsl_imx6ul_init(Object *obj)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      FslIMX6ULState *s =3D FSL_IMX6UL(obj);
> >      char name[NAME_SIZE];
> >      int i;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >
> >      for (i =3D 0; i < MIN(smp_cpus, FSL_IMX6UL_NUM_CPUS); i++) {
> >          snprintf(name, NAME_SIZE, "cpu%d", i);
> > @@ -156,10 +159,12 @@ static void fsl_imx6ul_init(Object *obj)
> >
> >  static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      FslIMX6ULState *s =3D FSL_IMX6UL(dev);
> >      int i;
> >      qemu_irq irq;
> >      char name[NAME_SIZE];
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >
> >      if (smp_cpus > FSL_IMX6UL_NUM_CPUS) {
> >          error_setg(errp, "%s: Only %d CPUs are supported (%d
> requested)",
> > diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> > index 7663ad6..b759f7b 100644
> > --- a/hw/arm/fsl-imx7.c
> > +++ b/hw/arm/fsl-imx7.c
> > @@ -25,11 +25,14 @@
> >  #include "hw/misc/unimp.h"
> >  #include "sysemu/sysemu.h"
> >  #include "qemu/error-report.h"
> > +#include "hw/boards.h"
> >
> >  #define NAME_SIZE 20
> >
> >  static void fsl_imx7_init(Object *obj)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >      FslIMX7State *s =3D FSL_IMX7(obj);
> >      char name[NAME_SIZE];
> >      int i;
> > @@ -155,11 +158,13 @@ static void fsl_imx7_init(Object *obj)
> >
> >  static void fsl_imx7_realize(DeviceState *dev, Error **errp)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      FslIMX7State *s =3D FSL_IMX7(dev);
> >      Object *o;
> >      int i;
> >      qemu_irq irq;
> >      char name[NAME_SIZE];
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >
> >      if (smp_cpus > FSL_IMX7_NUM_CPUS) {
> >          error_setg(errp, "%s: Only %d CPUs are supported (%d
> requested)",
> > diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> > index 96ccf18..58c77f6 100644
> > --- a/hw/arm/highbank.c
> > +++ b/hw/arm/highbank.c
> > @@ -240,6 +240,7 @@ static void calxeda_init(MachineState *machine, enu=
m
> cxmachines machine_id)
> >      SysBusDevice *busdev;
> >      qemu_irq pic[128];
> >      int n;
> > +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> >      qemu_irq cpu_irq[4];
> >      qemu_irq cpu_fiq[4];
> >      qemu_irq cpu_virq[4];
> > diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
> > index fb2b015..29fb706 100644
> > --- a/hw/arm/mcimx6ul-evk.c
> > +++ b/hw/arm/mcimx6ul-evk.c
> > @@ -29,6 +29,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
> >      static struct arm_boot_info boot_info;
> >      MCIMX6ULEVK *s =3D g_new0(MCIMX6ULEVK, 1);
> >      int i;
> > +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> >
> >      if (machine->ram_size > FSL_IMX6UL_MMDC_SIZE) {
> >          error_report("RAM size " RAM_ADDR_FMT " above max supported
> (%08x)",
> > diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
> > index 9c5f0e7..c2cdaf9 100644
> > --- a/hw/arm/mcimx7d-sabre.c
> > +++ b/hw/arm/mcimx7d-sabre.c
> > @@ -20,6 +20,7 @@
> >  #include "sysemu/sysemu.h"
> >  #include "qemu/error-report.h"
> >  #include "sysemu/qtest.h"
> > +#include "hw/boards.h"
> >
> >  typedef struct {
> >      FslIMX7State soc;
> > @@ -28,10 +29,12 @@ typedef struct {
> >
> >  static void mcimx7d_sabre_init(MachineState *machine)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
>
> Isn't this redundant? Doesn't ms =3D=3D machine?
>
> >      static struct arm_boot_info boot_info;
> >      MCIMX7Sabre *s =3D g_new0(MCIMX7Sabre, 1);
> >      Object *soc;
> >      int i;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >
> >      if (machine->ram_size > FSL_IMX7_MMDC_SIZE) {
> >          error_report("RAM size " RAM_ADDR_FMT " above max supported
> (%08x)",
> > diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> > index 66899c2..8ab8e10 100644
> > --- a/hw/arm/raspi.c
> > +++ b/hw/arm/raspi.c
> > @@ -113,6 +113,7 @@ static void setup_boot(MachineState *machine, int
> version, size_t ram_size)
> >  {
> >      static struct arm_boot_info binfo;
> >      int r;
> > +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> >
> >      binfo.board_id =3D raspi_boardid[version];
> >      binfo.ram_size =3D ram_size;
> > @@ -174,6 +175,7 @@ static void raspi_init(MachineState *machine, int
> version)
> >      BlockBackend *blk;
> >      BusState *bus;
> >      DeviceState *carddev;
> > +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> >
> >      object_initialize(&s->soc, sizeof(s->soc),
> >                        version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836);
> > diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> > index 242f5a8..517c275 100644
> > --- a/hw/arm/realview.c
> > +++ b/hw/arm/realview.c
> > @@ -69,6 +69,7 @@ static void realview_init(MachineState *machine,
> >      NICInfo *nd;
> >      I2CBus *i2c;
> >      int n;
> > +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> >      int done_nic =3D 0;
> >      qemu_irq cpu_irq[4];
> >      int is_mpcore =3D 0;
> > diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
> > index ee140e5..108faab 100644
> > --- a/hw/arm/sabrelite.c
> > +++ b/hw/arm/sabrelite.c
> > @@ -47,6 +47,7 @@ static void sabrelite_init(MachineState *machine)
> >  {
> >      IMX6Sabrelite *s =3D g_new0(IMX6Sabrelite, 1);
> >      Error *err =3D NULL;
> > +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> >
> >      /* Check the amount of memory is compatible with the SOC */
> >      if (machine->ram_size > FSL_IMX6_MMDC_SIZE) {
> > diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> > index f07134c..1927d12 100644
> > --- a/hw/arm/vexpress.c
> > +++ b/hw/arm/vexpress.c
> > @@ -206,9 +206,11 @@ struct VEDBoardInfo {
> >  static void init_cpus(const char *cpu_type, const char *privdev,
> >                        hwaddr periphbase, qemu_irq *pic, bool secure,
> bool virt)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      DeviceState *dev;
> >      SysBusDevice *busdev;
> >      int n;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >
> >      /* Create the actual CPUs */
> >      for (n =3D 0; n < smp_cpus; n++) {
> > @@ -558,6 +560,7 @@ static void vexpress_common_init(MachineState
> *machine)
> >      MemoryRegion *flash0mem;
> >      const hwaddr *map =3D daughterboard->motherboard_map;
> >      int i;
> > +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> >
> >      daughterboard->init(vms, machine->ram_size, machine->cpu_type, pic=
);
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index ce2664a..ff1dff3 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -555,11 +555,13 @@ static void create_v2m(VirtMachineState *vms,
> qemu_irq *pic)
> >
> >  static void create_gic(VirtMachineState *vms, qemu_irq *pic)
> >  {
> > +    MachineState *ms =3D MACHINE(vms);
> >      /* We create a standalone GIC */
> >      DeviceState *gicdev;
> >      SysBusDevice *gicbusdev;
> >      const char *gictype;
> >      int type =3D vms->gic_version, i;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >      uint32_t nb_redist_regions =3D 0;
> >
> >      gictype =3D (type =3D=3D 3) ? gicv3_class_name() : gic_class_name(=
);
> > @@ -984,10 +986,12 @@ static void create_flash(const VirtMachineState
> *vms,
> >
> >  static FWCfgState *create_fw_cfg(const VirtMachineState *vms,
> AddressSpace *as)
> >  {
> > +    MachineState *ms =3D MACHINE(vms);
> >      hwaddr base =3D vms->memmap[VIRT_FW_CFG].base;
> >      hwaddr size =3D vms->memmap[VIRT_FW_CFG].size;
> >      FWCfgState *fw_cfg;
> >      char *nodename;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >
> >      fw_cfg =3D fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> > @@ -1423,6 +1427,8 @@ static void machvirt_init(MachineState *machine)
> >      MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> >      bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
> >      bool aarch64 =3D true;
> > +    unsigned int smp_cpus =3D machine->topo.smp_cpus;
> > +    unsigned int max_cpus =3D machine->topo.max_cpus;
> >
> >      /*
> >       * In accelerated mode, the memory map is computed earlier in
> kvm_type()
> > @@ -1786,6 +1792,7 @@ static int64_t virt_get_default_cpu_node_id(const
> MachineState *ms, int idx)
> >  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *m=
s)
> >  {
> >      int n;
> > +    unsigned int max_cpus =3D ms->topo.max_cpus;
> >      VirtMachineState *vms =3D VIRT_MACHINE(ms);
> >
> >      if (ms->possible_cpus) {
> > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > index 4f8bc41..29b9427 100644
> > --- a/hw/arm/xlnx-zynqmp.c
> > +++ b/hw/arm/xlnx-zynqmp.c
> > @@ -19,6 +19,7 @@
> >  #include "qapi/error.h"
> >  #include "qemu-common.h"
> >  #include "cpu.h"
> > +#include "hw/boards.h"
> >  #include "hw/arm/xlnx-zynqmp.h"
> >  #include "hw/intc/arm_gic_common.h"
> >  #include "exec/address-spaces.h"
> > @@ -174,8 +175,10 @@ static inline int arm_gic_ppi_index(int cpu_nr, in=
t
> ppi_index)
> >  static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char
> *boot_cpu,
> >                                     Error **errp)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      Error *err =3D NULL;
> >      int i;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >      int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
> XLNX_ZYNQMP_NUM_RPU_CPUS);
> >
> >      if (num_rpus <=3D 0) {
> > @@ -221,8 +224,10 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState
> *s, const char *boot_cpu,
> >
> >  static void xlnx_zynqmp_init(Object *obj)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      XlnxZynqMPState *s =3D XLNX_ZYNQMP(obj);
> >      int i;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >      int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
> >
> >      object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
> > @@ -290,10 +295,12 @@ static void xlnx_zynqmp_init(Object *obj)
> >
> >  static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> >      XlnxZynqMPState *s =3D XLNX_ZYNQMP(dev);
> >      MemoryRegion *system_memory =3D get_system_memory();
> >      uint8_t i;
> >      uint64_t ram_size;
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> >      int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
> >      const char *boot_cpu =3D s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
> >      ram_addr_t ddr_low_size, ddr_high_size;
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 4155782..e5d7e3b 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -30,6 +30,7 @@
> >  #include "hw/qdev-properties.h"
> >  #if !defined(CONFIG_USER_ONLY)
> >  #include "hw/loader.h"
> > +#include "hw/boards.h"
> >  #endif
> >  #include "hw/arm/arm.h"
> >  #include "sysemu/sysemu.h"
> > @@ -1183,6 +1184,9 @@ static void arm_cpu_realizefn(DeviceState *dev,
> Error **errp)
> >      init_cpreg_list(cpu);
> >
> >  #ifndef CONFIG_USER_ONLY
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> > +
> >      if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> >          cs->num_ases =3D 2;
> >
> > @@ -1713,6 +1717,9 @@ static void cortex_a9_initfn(Object *obj)
> >  #ifndef CONFIG_USER_ONLY
> >  static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo
> *ri)
> >  {
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
>
> How expensive is qdev_get_machine? This could potentially be a
> performance issue if this register is read a lot.
>

At this point this number is constant and accessible somehow via CPUARMStat=
e,
right?


> > +    unsigned int smp_cpus =3D ms->topo.smp_cpus;
> > +
> >      /* Linux wants the number of processors from here.
> >       * Might as well set the interrupt-controller bit too.
> >       */
>
>
> --
> Alex Benn=C3=A9e
>
>

--0000000000001a7743058539fe95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
Le ven. 29 mars 2019 10:27, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.ben=
nee@linaro.org">alex.bennee@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><br>
Like Xu &lt;<a href=3D"mailto:like.xu@linux.intel.com" target=3D"_blank" re=
l=3D"noreferrer">like.xu@linux.intel.com</a>&gt; writes:<br>
<br>
&gt; Signed-off-by: Like Xu &lt;<a href=3D"mailto:like.xu@linux.intel.com" =
target=3D"_blank" rel=3D"noreferrer">like.xu@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/fsl-imx6.c=C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 hw/arm/fsl-imx6ul.c=C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 hw/arm/fsl-imx7.c=C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 hw/arm/highbank.c=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 hw/arm/mcimx6ul-evk.c=C2=A0 | 1 +<br>
&gt;=C2=A0 hw/arm/mcimx7d-sabre.c | 3 +++<br>
&gt;=C2=A0 hw/arm/raspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 hw/arm/realview.c=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 hw/arm/sabrelite.c=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 hw/arm/vexpress.c=C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 hw/arm/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;=C2=A0 hw/arm/xlnx-zynqmp.c=C2=A0 =C2=A0| 7 +++++++<br>
&gt;=C2=A0 target/arm/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;=C2=A0 13 files changed, 48 insertions(+)<br>
&gt;<br>
&gt; diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c<br>
&gt; index 7b7b97f..efed3a4 100644<br>
&gt; --- a/hw/arm/fsl-imx6.c<br>
&gt; +++ b/hw/arm/fsl-imx6.c<br>
&gt; @@ -23,6 +23,7 @@<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu-common.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/arm/fsl-imx6.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/sysemu.h&quot;<br>
&gt;=C2=A0 #include &quot;chardev/char.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt; @@ -33,9 +34,11 @@<br>
&gt;<br>
&gt;=C2=A0 static void fsl_imx6_init(Object *obj)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FslIMX6State *s =3D FSL_IMX6(obj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char name[NAME_SIZE];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; MIN(smp_cpus, FSL_IMX6_NUM_CP=
US); i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(name, NAME_SIZE, &quot;cpu%=
d&quot;, i);<br>
&gt; @@ -93,9 +96,11 @@ static void fsl_imx6_init(Object *obj)<br>
&gt;<br>
&gt;=C2=A0 static void fsl_imx6_realize(DeviceState *dev, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FslIMX6State *s =3D FSL_IMX6(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint16_t i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (smp_cpus &gt; FSL_IMX6_NUM_CPUS) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s: Only %d C=
PUs are supported (%d requested)&quot;,<br>
&gt; diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c<br>
&gt; index 4b56bfa..426bf8e 100644<br>
&gt; --- a/hw/arm/fsl-imx6ul.c<br>
&gt; +++ b/hw/arm/fsl-imx6ul.c<br>
&gt; @@ -23,14 +23,17 @@<br>
&gt;=C2=A0 #include &quot;hw/misc/unimp.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/sysemu.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;<br>
&gt;=C2=A0 #define NAME_SIZE 20<br>
&gt;<br>
&gt;=C2=A0 static void fsl_imx6ul_init(Object *obj)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FslIMX6ULState *s =3D FSL_IMX6UL(obj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char name[NAME_SIZE];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; MIN(smp_cpus, FSL_IMX6UL_NUM_=
CPUS); i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(name, NAME_SIZE, &quot;cpu%=
d&quot;, i);<br>
&gt; @@ -156,10 +159,12 @@ static void fsl_imx6ul_init(Object *obj)<br>
&gt;<br>
&gt;=C2=A0 static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)<b=
r>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FslIMX6ULState *s =3D FSL_IMX6UL(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq irq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char name[NAME_SIZE];<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (smp_cpus &gt; FSL_IMX6UL_NUM_CPUS) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s: Only %d C=
PUs are supported (%d requested)&quot;,<br>
&gt; diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c<br>
&gt; index 7663ad6..b759f7b 100644<br>
&gt; --- a/hw/arm/fsl-imx7.c<br>
&gt; +++ b/hw/arm/fsl-imx7.c<br>
&gt; @@ -25,11 +25,14 @@<br>
&gt;=C2=A0 #include &quot;hw/misc/unimp.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/sysemu.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;<br>
&gt;=C2=A0 #define NAME_SIZE 20<br>
&gt;<br>
&gt;=C2=A0 static void fsl_imx7_init(Object *obj)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FslIMX7State *s =3D FSL_IMX7(obj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char name[NAME_SIZE];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; @@ -155,11 +158,13 @@ static void fsl_imx7_init(Object *obj)<br>
&gt;<br>
&gt;=C2=A0 static void fsl_imx7_realize(DeviceState *dev, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FslIMX7State *s =3D FSL_IMX7(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Object *o;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq irq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char name[NAME_SIZE];<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (smp_cpus &gt; FSL_IMX7_NUM_CPUS) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s: Only %d C=
PUs are supported (%d requested)&quot;,<br>
&gt; diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c<br>
&gt; index 96ccf18..58c77f6 100644<br>
&gt; --- a/hw/arm/highbank.c<br>
&gt; +++ b/hw/arm/highbank.c<br>
&gt; @@ -240,6 +240,7 @@ static void calxeda_init(MachineState *machine, en=
um cxmachines machine_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SysBusDevice *busdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq pic[128];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int n;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D machine-&gt;topo.smp_cpus;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq cpu_irq[4];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq cpu_fiq[4];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq cpu_virq[4];<br>
&gt; diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c<br>
&gt; index fb2b015..29fb706 100644<br>
&gt; --- a/hw/arm/mcimx6ul-evk.c<br>
&gt; +++ b/hw/arm/mcimx6ul-evk.c<br>
&gt; @@ -29,6 +29,7 @@ static void mcimx6ul_evk_init(MachineState *machine)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 static struct arm_boot_info boot_info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MCIMX6ULEVK *s =3D g_new0(MCIMX6ULEVK, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D machine-&gt;topo.smp_cpus;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (machine-&gt;ram_size &gt; FSL_IMX6UL_MMDC_SIZE=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;RAM size &quot; R=
AM_ADDR_FMT &quot; above max supported (%08x)&quot;,<br>
&gt; diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c<br>
&gt; index 9c5f0e7..c2cdaf9 100644<br>
&gt; --- a/hw/arm/mcimx7d-sabre.c<br>
&gt; +++ b/hw/arm/mcimx7d-sabre.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 #include &quot;sysemu/sysemu.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/qtest.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;<br>
&gt;=C2=A0 typedef struct {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FslIMX7State soc;<br>
&gt; @@ -28,10 +29,12 @@ typedef struct {<br>
&gt;<br>
&gt;=C2=A0 static void mcimx7d_sabre_init(MachineState *machine)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
<br>
Isn&#39;t this redundant? Doesn&#39;t ms =3D=3D machine?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 static struct arm_boot_info boot_info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MCIMX7Sabre *s =3D g_new0(MCIMX7Sabre, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Object *soc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (machine-&gt;ram_size &gt; FSL_IMX7_MMDC_SIZE) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;RAM size &quot; R=
AM_ADDR_FMT &quot; above max supported (%08x)&quot;,<br>
&gt; diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c<br>
&gt; index 66899c2..8ab8e10 100644<br>
&gt; --- a/hw/arm/raspi.c<br>
&gt; +++ b/hw/arm/raspi.c<br>
&gt; @@ -113,6 +113,7 @@ static void setup_boot(MachineState *machine, int =
version, size_t ram_size)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 static struct arm_boot_info binfo;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D machine-&gt;topo.smp_cpus;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 binfo.board_id =3D raspi_boardid[version];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 binfo.ram_size =3D ram_size;<br>
&gt; @@ -174,6 +175,7 @@ static void raspi_init(MachineState *machine, int =
version)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BlockBackend *blk;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BusState *bus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceState *carddev;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D machine-&gt;topo.smp_cpus;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_initialize(&amp;s-&gt;soc, sizeof(s-&gt;soc=
),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836);<br>
&gt; diff --git a/hw/arm/realview.c b/hw/arm/realview.c<br>
&gt; index 242f5a8..517c275 100644<br>
&gt; --- a/hw/arm/realview.c<br>
&gt; +++ b/hw/arm/realview.c<br>
&gt; @@ -69,6 +69,7 @@ static void realview_init(MachineState *machine,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NICInfo *nd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I2CBus *i2c;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int n;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D machine-&gt;topo.smp_cpus;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 int done_nic =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq cpu_irq[4];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int is_mpcore =3D 0;<br>
&gt; diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c<br>
&gt; index ee140e5..108faab 100644<br>
&gt; --- a/hw/arm/sabrelite.c<br>
&gt; +++ b/hw/arm/sabrelite.c<br>
&gt; @@ -47,6 +47,7 @@ static void sabrelite_init(MachineState *machine)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IMX6Sabrelite *s =3D g_new0(IMX6Sabrelite, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D machine-&gt;topo.smp_cpus;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Check the amount of memory is compatible with t=
he SOC */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (machine-&gt;ram_size &gt; FSL_IMX6_MMDC_SIZE) =
{<br>
&gt; diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c<br>
&gt; index f07134c..1927d12 100644<br>
&gt; --- a/hw/arm/vexpress.c<br>
&gt; +++ b/hw/arm/vexpress.c<br>
&gt; @@ -206,9 +206,11 @@ struct VEDBoardInfo {<br>
&gt;=C2=A0 static void init_cpus(const char *cpu_type, const char *privdev,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 hwaddr periphbase, qemu_irq *pic, bool secure, bool virt)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceState *dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SysBusDevice *busdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int n;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Create the actual CPUs */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (n =3D 0; n &lt; smp_cpus; n++) {<br>
&gt; @@ -558,6 +560,7 @@ static void vexpress_common_init(MachineState *mac=
hine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion *flash0mem;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const hwaddr *map =3D daughterboard-&gt;motherboar=
d_map;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D machine-&gt;topo.smp_cpus;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 daughterboard-&gt;init(vms, machine-&gt;ram_size, =
machine-&gt;cpu_type, pic);<br>
&gt;<br>
&gt; diff --git a/hw/arm/virt.c b/hw/arm/virt.c<br>
&gt; index ce2664a..ff1dff3 100644<br>
&gt; --- a/hw/arm/virt.c<br>
&gt; +++ b/hw/arm/virt.c<br>
&gt; @@ -555,11 +555,13 @@ static void create_v2m(VirtMachineState *vms, qe=
mu_irq *pic)<br>
&gt;<br>
&gt;=C2=A0 static void create_gic(VirtMachineState *vms, qemu_irq *pic)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(vms);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* We create a standalone GIC */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceState *gicdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SysBusDevice *gicbusdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *gictype;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int type =3D vms-&gt;gic_version, i;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t nb_redist_regions =3D 0;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gictype =3D (type =3D=3D 3) ? gicv3_class_name() :=
 gic_class_name();<br>
&gt; @@ -984,10 +986,12 @@ static void create_flash(const VirtMachineState =
*vms,<br>
&gt;<br>
&gt;=C2=A0 static FWCfgState *create_fw_cfg(const VirtMachineState *vms, Ad=
dressSpace *as)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(vms);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr base =3D vms-&gt;memmap[VIRT_FW_CFG].base;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr size =3D vms-&gt;memmap[VIRT_FW_CFG].size;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 FWCfgState *fw_cfg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *nodename;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fw_cfg =3D fw_cfg_init_mem_wide(base + 8, base, 8,=
 base + 16, as);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)s=
mp_cpus);<br>
&gt; @@ -1423,6 +1427,8 @@ static void machvirt_init(MachineState *machine)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion *ram =3D g_new(MemoryRegion, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool firmware_loaded =3D bios_name || drive_get(IF=
_PFLASH, 0, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool aarch64 =3D true;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D machine-&gt;topo.smp_cpus;<br=
>
&gt; +=C2=A0 =C2=A0 unsigned int max_cpus =3D machine-&gt;topo.max_cpus;<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* In accelerated mode, the memory map is com=
puted earlier in kvm_type()<br>
&gt; @@ -1786,6 +1792,7 @@ static int64_t virt_get_default_cpu_node_id(cons=
t MachineState *ms, int idx)<br>
&gt;=C2=A0 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineSt=
ate *ms)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int n;<br>
&gt; +=C2=A0 =C2=A0 unsigned int max_cpus =3D ms-&gt;topo.max_cpus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(ms);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ms-&gt;possible_cpus) {<br>
&gt; diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c<br>
&gt; index 4f8bc41..29b9427 100644<br>
&gt; --- a/hw/arm/xlnx-zynqmp.c<br>
&gt; +++ b/hw/arm/xlnx-zynqmp.c<br>
&gt; @@ -19,6 +19,7 @@<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu-common.h&quot;<br>
&gt;=C2=A0 #include &quot;cpu.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/arm/xlnx-zynqmp.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/intc/arm_gic_common.h&quot;<br>
&gt;=C2=A0 #include &quot;exec/address-spaces.h&quot;<br>
&gt; @@ -174,8 +175,10 @@ static inline int arm_gic_ppi_index(int cpu_nr, i=
nt ppi_index)<br>
&gt;=C2=A0 static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const cha=
r *boot_cpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)=
<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_AP=
U_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (num_rpus &lt;=3D 0) {<br>
&gt; @@ -221,8 +224,10 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPStat=
e *s, const char *boot_cpu,<br>
&gt;<br>
&gt;=C2=A0 static void xlnx_zynqmp_init(Object *obj)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 XlnxZynqMPState *s =3D XLNX_ZYNQMP(obj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU=
_CPUS);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, &quot;apu-cluster&quo=
t;, &amp;s-&gt;apu_cluster,<br>
&gt; @@ -290,10 +295,12 @@ static void xlnx_zynqmp_init(Object *obj)<br>
&gt;<br>
&gt;=C2=A0 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)<=
br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt;=C2=A0 =C2=A0 =C2=A0 XlnxZynqMPState *s =3D XLNX_ZYNQMP(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion *system_memory =3D get_system_memory(=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t ram_size;<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU=
_CPUS);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *boot_cpu =3D s-&gt;boot_cpu ? s-&gt;bo=
ot_cpu : &quot;apu-cpu[0]&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ram_addr_t ddr_low_size, ddr_high_size;<br>
&gt; diff --git a/target/arm/cpu.c b/target/arm/cpu.c<br>
&gt; index 4155782..e5d7e3b 100644<br>
&gt; --- a/target/arm/cpu.c<br>
&gt; +++ b/target/arm/cpu.c<br>
&gt; @@ -30,6 +30,7 @@<br>
&gt;=C2=A0 #include &quot;hw/qdev-properties.h&quot;<br>
&gt;=C2=A0 #if !defined(CONFIG_USER_ONLY)<br>
&gt;=C2=A0 #include &quot;hw/loader.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 #include &quot;hw/arm/arm.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/sysemu.h&quot;<br>
&gt; @@ -1183,6 +1184,9 @@ static void arm_cpu_realizefn(DeviceState *dev, =
Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 init_cpreg_list(cpu);<br>
&gt;<br>
&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;has_el3 || arm_feature(env, ARM_FEATUR=
E_M_SECURITY)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;num_ases =3D 2;<br>
&gt;<br>
&gt; @@ -1713,6 +1717,9 @@ static void cortex_a9_initfn(Object *obj)<br>
&gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt;=C2=A0 static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPReg=
Info *ri)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 MachineState *ms =3D MACHINE(qdev_get_machine());<br>
<br>
How expensive is qdev_get_machine? This could potentially be a<br>
performance issue if this register is read a lot.<br></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">At this point this number =
is constant and accessible somehow via=C2=A0<span style=3D"color:rgb(128,0,=
128);font-family:sans-serif;font-size:13.696px">CPUARMState, right?=C2=A0</=
span></div><div dir=3D"auto"><span style=3D"color:rgb(128,0,128);font-famil=
y:sans-serif;font-size:13.696px"><br></span></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 unsigned int smp_cpus =3D ms-&gt;topo.smp_cpus;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Linux wants the number of processors from here.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Might as well set the interrupt-controller=
 bit too.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
<br>
--<br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div></div>

--0000000000001a7743058539fe95--

