Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAmOy-00045E-OL
	for mharc-qemu-trivial@gnu.org; Sun, 31 Mar 2019 22:10:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hAmOv-00044f-KQ
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:10:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hAmOu-0004aT-Fi
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:10:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:34480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hAmOu-0004Zu-5B; Sun, 31 Mar 2019 22:10:16 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Mar 2019 19:10:12 -0700
X-IronPort-AV: E=Sophos;i="5.60,294,1549958400"; d="scan'208";a="131807045"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.239.196.174])
	([10.239.196.174])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
	31 Mar 2019 19:10:10 -0700
To: Alistair Francis <alistair23@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, like.xu@intel.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-8-git-send-email-like.xu@linux.intel.com>
	<CAKmqyKPqKqdBpeyJMbrZq3b2pe5V-yHJAsNDugOEWrdKr0buqg@mail.gmail.com>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <f18ff267-e23d-7853-c092-c9211ca7823b@linux.intel.com>
Date: Mon, 1 Apr 2019 10:10:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPqKqdBpeyJMbrZq3b2pe5V-yHJAsNDugOEWrdKr0buqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 7/9] cpu/topology: add riscv
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
X-List-Received-Date: Mon, 01 Apr 2019 02:10:18 -0000

On 2019/3/30 7:01, Alistair Francis wrote:
> On Fri, Mar 29, 2019 at 1:59 AM Like Xu <like.xu@linux.intel.com> wrote:
>>
>> Signed-off-by: Like Xu <like.xu@linux.intel.com>
>> ---
>>   hw/openrisc/openrisc_sim.c | 1 +
>>   hw/riscv/sifive_e.c        | 4 ++++
>>   hw/riscv/sifive_plic.c     | 3 +++
>>   hw/riscv/sifive_u.c        | 4 ++++
>>   hw/riscv/spike.c           | 2 ++
>>   hw/riscv/virt.c            | 1 +
>>   6 files changed, 15 insertions(+)
>>
>> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
>> index 7d3b734..ecfc973 100644
>> --- a/hw/openrisc/openrisc_sim.c
>> +++ b/hw/openrisc/openrisc_sim.c
>> @@ -131,6 +131,7 @@ static void openrisc_sim_init(MachineState *machine)
>>       qemu_irq *cpu_irqs[2];
>>       qemu_irq serial_irq;
>>       int n;
>> +    unsigned int smp_cpus = machine->topo.smp_cpus;
> 
> OpenRISC and RISC-V are not the same thing, it's probably worth
> splitting this out into a separate patch.
> 
> Alistair
You're right and thanks.
I may fix it in next version.

> 
>>
>>       for (n = 0; n < smp_cpus; n++) {
>>           cpu = OPENRISC_CPU(cpu_create(machine->cpu_type));
>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> index b1cd113..c65c7b5 100644
>> --- a/hw/riscv/sifive_e.c
>> +++ b/hw/riscv/sifive_e.c
>> @@ -137,6 +137,8 @@ static void riscv_sifive_e_init(MachineState *machine)
>>
>>   static void riscv_sifive_e_soc_init(Object *obj)
>>   {
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    unsigned int smp_cpus = ms->topo.smp_cpus;
>>       SiFiveESoCState *s = RISCV_E_SOC(obj);
>>
>>       object_initialize_child(obj, "cpus", &s->cpus,
>> @@ -150,6 +152,8 @@ static void riscv_sifive_e_soc_init(Object *obj)
>>
>>   static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>>   {
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    unsigned int smp_cpus = ms->topo.smp_cpus;
>>       const struct MemmapEntry *memmap = sifive_e_memmap;
>>
>>       SiFiveESoCState *s = RISCV_E_SOC(dev);
>> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
>> index ac768e6..161fbd9 100644
>> --- a/hw/riscv/sifive_plic.c
>> +++ b/hw/riscv/sifive_plic.c
>> @@ -23,6 +23,7 @@
>>   #include "qemu/error-report.h"
>>   #include "hw/sysbus.h"
>>   #include "hw/pci/msi.h"
>> +#include "hw/boards.h"
>>   #include "target/riscv/cpu.h"
>>   #include "sysemu/sysemu.h"
>>   #include "hw/riscv/sifive_plic.h"
>> @@ -432,6 +433,8 @@ static void sifive_plic_irq_request(void *opaque, int irq, int level)
>>
>>   static void sifive_plic_realize(DeviceState *dev, Error **errp)
>>   {
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    unsigned int smp_cpus = ms->topo.smp_cpus;
>>       SiFivePLICState *plic = SIFIVE_PLIC(dev);
>>       int i;
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index 5ecc47c..b4a8d66 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -321,6 +321,8 @@ static void riscv_sifive_u_init(MachineState *machine)
>>
>>   static void riscv_sifive_u_soc_init(Object *obj)
>>   {
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    unsigned int smp_cpus = ms->topo.smp_cpus;
>>       SiFiveUSoCState *s = RISCV_U_SOC(obj);
>>
>>       object_initialize_child(obj, "cpus", &s->cpus, sizeof(s->cpus),
>> @@ -336,6 +338,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
>>
>>   static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>>   {
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    unsigned int smp_cpus = ms->topo.smp_cpus;
>>       SiFiveUSoCState *s = RISCV_U_SOC(dev);
>>       const struct MemmapEntry *memmap = sifive_u_memmap;
>>       MemoryRegion *system_memory = get_system_memory();
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index 2a000a5..5fe441c 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -171,6 +171,7 @@ static void spike_v1_10_0_board_init(MachineState *machine)
>>       MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>>       MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>>       int i;
>> +    unsigned int smp_cpus = machine->topo.smp_cpus;
>>
>>       /* Initialize SOC */
>>       object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
>> @@ -253,6 +254,7 @@ static void spike_v1_09_1_board_init(MachineState *machine)
>>       MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>>       MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>>       int i;
>> +    unsigned int smp_cpus = machine->topo.smp_cpus;
>>
>>       /* Initialize SOC */
>>       object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index fc4c6b3..9d4d305 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -395,6 +395,7 @@ static void riscv_virt_board_init(MachineState *machine)
>>       char *plic_hart_config;
>>       size_t plic_hart_config_len;
>>       int i;
>> +    unsigned int smp_cpus = machine->topo.smp_cpus;
>>       void *fdt;
>>
>>       /* Initialize SOC */
>> --
>> 1.8.3.1
>>
>>
> 


