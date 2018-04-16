Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f80p7-0001rz-QH
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 05:53:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1f80p3-0001ql-TS
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 05:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1f80oz-0004ab-U9
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 05:53:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59660 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1f80ol-0004Go-T6; Mon, 16 Apr 2018 05:53:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6530E722FE;
	Mon, 16 Apr 2018 09:52:49 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 266AA111DCF8;
	Mon, 16 Apr 2018 09:52:37 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-33-f4bug@amsat.org>
From: Marcel Apfelbaum <marcel@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marcel@redhat.com; prefer-encrypt=mutual; keydata=
	xsBNBFpwpFoBCAC66VT3ZMlr10I420na21Mdr6q/+v5XJ6w8QPOTFQMd4V4viNXT7rgJ8Qfv
	m4ViMaLoHBEmL6Kte4UNz3x28DUl91EcWpSRSMMGMa2oWj6Qv/9150byAByBYo2GijfIoayd
	NKyAZ+PnlsJ2uQgb1I0wLUZ5tDpMeZFkC2Wb8QC9fsv9N7gOA5kvT2Mea0XzNVWHowt9A0hv
	8+2O1YrqhqW7HVoLiET3XCec81rRPk+SbewVJtNIFkzamHBVruk4xozWZuluM8DNE4u+wlVx
	NsI6gxoJV9DKthh0QDqPVy01FpBPk3fHkIdQZeo3eaTE9EHU+OW8iDTXIG1HRLzt6SovABEB
	AAHNJE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbEByZWRoYXQuY29tPsLAeAQTAQIAIgUCWnCk
	WgIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQNtTA8M8v5G2awAf/eb5BhjgTEoc6
	6En2oT2UnHvXvcGZlaMonfal9WDh/dgy3HmlV9nLdbc0xLEHywtIpthgXMRi+zN6tmOv6ddq
	I4HmhvXHWnqoxIoOqpkCSFsYI3eq/z8n80FE8wAudUA6IyS/riLfUUOfh3g90d3bnRYTHCGF
	ytFc9je4NmFvCJeIBJ9U/8QkmzZ5NXPP52HT0hSfIfOarxba2y91M05VMyAr38eskT0K2n0p
	O9nruETrUu+OfXRFlil+0TsVaKH5ZxREEO6OrFUFZc/CWvgaewrCDljckJB+xDib0eFaGb/A
	bhB8zVwJDyFgtvDfqHKfyx1BHskXxrRZdyjGTTAHAc7ATQRacKRaAQgAq5+6KAJvy6FTeHJU
	Y5G3fensizw6Zn+YJ2elPCFMVd9bivYBZnr9tdv2tJtEar/buk/azOUYxki2T3aEAok1IUXW
	yjCrwdwi8m8DAlvkZDDTA9i/cRJLd4otAB/TZWRrzT9oJN/odp4vpiwlu+0EkGCA1G/81Q0s
	f062diIxm4GCmrP6hSliz8vGXJPQwjJuMQrgQH0ZW3WVXTyRJUgKzeW0Eo2YaJSnwIOormAD
	pxuP5eHepg1+ph06XPkhujOW+/wD3qRSWbKmmemEP98w+lmsefDXGGTMzgkFaPooFfxo0tJe
	nVxSTZjWWhxmjCdi3oSvRVdJ/ey4XoTj1kWacwARAQABwsBfBBgBAgAJBQJacKRaAhsMAAoJ
	EDbUwPDPL+RtqH0H/34w4BflnhIxUpJYVdDQ1ypizk+UbmA9uI8ynMeeNqzSVZWihJ5syOGb
	ssc6HnPddNWnfRaSSdxNgxn7v0M5HmgBxoO4euxUGhG3o3T1N+PDRek7vP8FhREDDaslp9mF
	whJ/+/tjrAsMKSs+lVTAeuqQPo7BO9M7cugVPUEawq/OXTF6xnUq2oqVJtQ2wG0ZZNmuaN03
	fEK8NjVpYnqnvvj3RyRqDCcAEcFKiZgXS0JXtYSGxQspDb0wY827IrF6QGh+2CttUkAfN02h
	qYRsKqlZ4/hwJdGFuy10kqgHjjV6/bfQNjSmSbQaGjDR9afGm5TnP3s6ghQFB2aOJohd3G4=
Message-ID: <24c346b4-d467-eb50-fcf2-84410498ba00@redhat.com>
Date: Mon, 16 Apr 2018 12:52:36 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180415234307.28132-33-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 16 Apr 2018 09:52:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 16 Apr 2018 09:52:49 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v3 32/41] hw/i386: Use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 16 Apr 2018 09:53:21 -0000

On 16/04/2018 2:42, Philippe Mathieu-Daud=C3=A9 wrote:
> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include=
/hw/
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/i386/ich9.h |  3 ++-
>  hw/i386/acpi-build.c   |  5 +++--
>  hw/i386/pc.c           | 19 ++++++++++---------
>  hw/i386/pc_piix.c      |  4 ++--
>  hw/i386/pc_q35.c       |  3 ++-
>  hw/i386/pc_sysfw.c     |  9 +++++----
>  hw/intc/apic_common.c  |  3 ++-
>  hw/pci-host/piix.c     |  5 +++--
>  hw/pci-host/q35.c      | 17 +++++++++--------
>  9 files changed, 38 insertions(+), 30 deletions(-)
>=20
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index 673d13d28f..9615c61b15 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -1,6 +1,7 @@
>  #ifndef HW_ICH9_H
>  #define HW_ICH9_H
> =20
> +#include "qemu/units.h"
>  #include "hw/hw.h"
>  #include "hw/isa/isa.h"
>  #include "hw/sysbus.h"
> @@ -22,7 +23,7 @@ I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_=
t smb_io_base);
> =20
>  void ich9_generate_smi(void);
> =20
> -#define ICH9_CC_SIZE (16 * 1024) /* 16KB. Chipset configuration regist=
ers */
> +#define ICH9_CC_SIZE (16 * K_BYTE) /* Chipset configuration registers =
*/
> =20
>  #define TYPE_ICH9_LPC_DEVICE "ICH9-LPC"
>  #define ICH9_LPC_DEVICE(obj) \
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 3cf2a1679c..3fdd273aa2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -21,6 +21,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qnum.h"
>  #include "acpi-build.h"
> @@ -2247,8 +2248,8 @@ build_tpm2(GArray *table_data, BIOSLinker *linker=
, GArray *tcpalog)
>                   (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL,=
 NULL);
>  }
> =20
> -#define HOLE_640K_START  (640 * 1024)
> -#define HOLE_640K_END   (1024 * 1024)
> +#define HOLE_640K_START  (640 * K_BYTE)
> +#define HOLE_640K_END   (1024 * K_BYTE)
> =20
>  static void build_srat_hotpluggable_memory(GArray *table_data, uint64_=
t base,
>                                             uint64_t len, int default_n=
ode)
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d36bac8c89..84880e7e67 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -23,6 +23,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "hw/hw.h"
>  #include "hw/i386/pc.h"
>  #include "hw/char/serial.h"
> @@ -453,8 +454,8 @@ void pc_cmos_init(PCMachineState *pcms,
>      rtc_set_memory(s, 0x15, val);
>      rtc_set_memory(s, 0x16, val >> 8);
>      /* extended memory (next 64MiB) */
> -    if (pcms->below_4g_mem_size > 1024 * 1024) {
> -        val =3D (pcms->below_4g_mem_size - 1024 * 1024) / 1024;
> +    if (pcms->below_4g_mem_size > 1 * M_BYTE) {
> +        val =3D (pcms->below_4g_mem_size - 1 * M_BYTE) / 1024;
>      } else {
>          val =3D 0;
>      }
> @@ -465,8 +466,8 @@ void pc_cmos_init(PCMachineState *pcms,
>      rtc_set_memory(s, 0x30, val);
>      rtc_set_memory(s, 0x31, val >> 8);
>      /* memory between 16MiB and 4GiB */
> -    if (pcms->below_4g_mem_size > 16 * 1024 * 1024) {
> -        val =3D (pcms->below_4g_mem_size - 16 * 1024 * 1024) / 65536;
> +    if (pcms->below_4g_mem_size > 16 * M_BYTE) {
> +        val =3D (pcms->below_4g_mem_size - 16 * M_BYTE) / 65536;
>      } else {
>          val =3D 0;
>      }
> @@ -1391,11 +1392,11 @@ void pc_memory_init(PCMachineState *pcms,
>          }
> =20
>          pcms->hotplug_memory.base =3D
> -            ROUND_UP(0x100000000ULL + pcms->above_4g_mem_size, 1ULL <<=
 30);
> +            ROUND_UP(0x100000000ULL + pcms->above_4g_mem_size, G_BYTE)=
;
> =20
>          if (pcmc->enforce_aligned_dimm) {
>              /* size hotplug region assuming 1G page max alignment per =
slot */
> -            hotplug_mem_size +=3D (1ULL << 30) * machine->ram_slots;
> +            hotplug_mem_size +=3D machine->ram_slots * G_BYTE;
>          }
> =20
>          if ((pcms->hotplug_memory.base + hotplug_mem_size) <
> @@ -1437,7 +1438,7 @@ void pc_memory_init(PCMachineState *pcms,
>          if (!pcmc->broken_reserved_end) {
>              res_mem_end +=3D memory_region_size(&pcms->hotplug_memory.=
mr);
>          }
> -        *val =3D cpu_to_le64(ROUND_UP(res_mem_end, 0x1ULL << 30));
> +        *val =3D cpu_to_le64(ROUND_UP(res_mem_end, G_BYTE));
>          fw_cfg_add_file(fw_cfg, "etc/reserved-memory-end", val, sizeof=
(*val));
>      }
> =20
> @@ -1473,7 +1474,7 @@ uint64_t pc_pci_hole64_start(void)
>          hole64_start =3D 0x100000000ULL + pcms->above_4g_mem_size;
>      }
> =20
> -    return ROUND_UP(hole64_start, 1ULL << 30);
> +    return ROUND_UP(hole64_start, G_BYTE);
>  }
> =20
>  qemu_irq pc_allocate_cpu_irq(void)
> @@ -2109,7 +2110,7 @@ static void pc_machine_set_max_ram_below_4g(Objec=
t *obj, Visitor *v,
>          return;
>      }
> =20
> -    if (value < (1ULL << 20)) {
> +    if (value < 1 * M_BYTE) {
>          warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB boun=
dary,"
>                      "BIOS may not work with less than 1MiB", value);
>      }
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 729a0508aa..5e24c42d0d 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -23,7 +23,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> -
> +#include "qemu/units.h"
>  #include "hw/hw.h"
>  #include "hw/loader.h"
>  #include "hw/i386/pc.h"
> @@ -130,7 +130,7 @@ static void pc_init1(MachineState *machine,
>                  if (lowmem > 0xc0000000) {
>                      lowmem =3D 0xc0000000;
>                  }
> -                if (lowmem & ((1ULL << 30) - 1)) {
> +                if (lowmem & ((1 * G_BYTE) - 1)) {

Hi Philippe,

You stripped the parentheses from other places, but not from here ...

>                      warn_report("Large machine and max_ram_below_4g "
>                                  "(%" PRIu64 ") not a multiple of 1G; "
>                                  "possible bad performance.",
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 9ae916327e..d19d6eaa00 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -29,6 +29,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "hw/hw.h"
>  #include "hw/loader.h"
>  #include "sysemu/arch_init.h"
> @@ -104,7 +105,7 @@ static void pc_q35_init(MachineState *machine)
>      if (lowmem > pcms->max_ram_below_4g) {
>          lowmem =3D pcms->max_ram_below_4g;
>          if (machine->ram_size - lowmem > lowmem &&
> -            lowmem & ((1ULL << 30) - 1)) {
> +            lowmem & ((1 * G_BYTE) - 1)) {

... and here

Not a big issue, of course.

Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel

>              warn_report("There is possibly poor performance as the ram=
 size "
>                          " (0x%" PRIx64 ") is more then twice the size =
of"
>                          " max-ram-below-4g (%"PRIu64") and"
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 73ac783f20..ded2aabb81 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -24,6 +24,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "sysemu/block-backend.h"
>  #include "qemu/error-report.h"
> @@ -56,7 +57,7 @@ static void pc_isa_bios_init(MemoryRegion *rom_memory=
,
>      flash_size =3D memory_region_size(flash_mem);
> =20
>      /* map the last 128KB of the BIOS in ISA space */
> -    isa_bios_size =3D MIN(flash_size, 128 * 1024);
> +    isa_bios_size =3D MIN(flash_size, 128 * K_BYTE);
>      isa_bios =3D g_malloc(sizeof(*isa_bios));
>      memory_region_init_ram(isa_bios, NULL, "isa-bios", isa_bios_size,
>                             &error_fatal);
> @@ -83,7 +84,7 @@ static void pc_isa_bios_init(MemoryRegion *rom_memory=
,
>   * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to=
 8MB in
>   * size.
>   */
> -#define FLASH_MAP_BASE_MIN ((hwaddr)(0x100000000ULL - 8*1024*1024))
> +#define FLASH_MAP_BASE_MIN ((hwaddr)(0x100000000ULL - 8 * M_BYTE))
> =20
>  /* This function maps flash drives from 4G downward, in order of their=
 unit
>   * numbers. The mapping starts at unit#0, with unit number increments =
of 1, and
> @@ -222,8 +223,8 @@ static void old_pc_system_rom_init(MemoryRegion *ro=
m_memory, bool isapc_ram_fw)
> =20
>      /* map the last 128KB of the BIOS in ISA space */
>      isa_bios_size =3D bios_size;
> -    if (isa_bios_size > (128 * 1024)) {
> -        isa_bios_size =3D 128 * 1024;
> +    if (isa_bios_size > 128 * K_BYTE) {
> +        isa_bios_size =3D 128 * K_BYTE;
>      }
>      isa_bios =3D g_malloc(sizeof(*isa_bios));
>      memory_region_init_alias(isa_bios, NULL, "isa-bios", bios,
> diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
> index 78903ea909..f9dfacf48d 100644
> --- a/hw/intc/apic_common.c
> +++ b/hw/intc/apic_common.c
> @@ -18,6 +18,7 @@
>   * License along with this library; if not, see <http://www.gnu.org/li=
censes/>
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> @@ -319,7 +320,7 @@ static void apic_common_realize(DeviceState *dev, E=
rror **errp)
> =20
>      /* Note: We need at least 1M to map the VAPIC option ROM */
>      if (!vapic && s->vapic_control & VAPIC_ENABLE_MASK &&
> -        !hax_enabled() && ram_size >=3D 1024 * 1024) {
> +        !hax_enabled() && ram_size >=3D 1 * M_BYTE) {
>          vapic =3D sysbus_create_simple("kvmvapic", -1, NULL);
>      }
>      s->vapic =3D vapic;
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 0e608347c1..8e469c91b8 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -23,6 +23,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "hw/hw.h"
>  #include "hw/i386/pc.h"
>  #include "hw/pci/pci.h"
> @@ -284,7 +285,7 @@ static void i440fx_pcihost_get_pci_hole64_end(Objec=
t *obj, Visitor *v,
> =20
>      pci_bus_get_w64_range(h->bus, &w64);
>      value =3D range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> -    hole64_end =3D ROUND_UP(hole64_start + s->pci_hole64_size, 1ULL <<=
 30);
> +    hole64_end =3D ROUND_UP(hole64_start + s->pci_hole64_size, G_BYTE)=
;
>      if (s->pci_hole64_fix && value < hole64_end) {
>          value =3D hole64_end;
>      }
> @@ -430,7 +431,7 @@ PCIBus *i440fx_init(const char *host_type, const ch=
ar *pci_type,
> =20
>      *piix3_devfn =3D piix3->dev.devfn;
> =20
> -    ram_size =3D ram_size / 8 / 1024 / 1024;
> +    ram_size /=3D 8 * M_BYTE;
>      if (ram_size > 255) {
>          ram_size =3D 255;
>      }
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index a36a1195e4..280b5403d0 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -28,6 +28,7 @@
>   * THE SOFTWARE.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "hw/hw.h"
>  #include "hw/pci-host/q35.h"
>  #include "qapi/error.h"
> @@ -144,7 +145,7 @@ static void q35_host_get_pci_hole64_end(Object *obj=
, Visitor *v,
> =20
>      pci_bus_get_w64_range(h->bus, &w64);
>      value =3D range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> -    hole64_end =3D ROUND_UP(hole64_start + s->mch.pci_hole64_size, 1UL=
L << 30);
> +    hole64_end =3D ROUND_UP(hole64_start + s->mch.pci_hole64_size, G_B=
YTE);
>      if (s->pci_hole64_fix && value < hole64_end) {
>          value =3D hole64_end;
>      }
> @@ -310,15 +311,15 @@ static void mch_update_pciexbar(MCHPCIState *mch)
>      addr_mask =3D MCH_HOST_BRIDGE_PCIEXBAR_ADMSK;
>      switch (pciexbar & MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_MASK) {
>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_256M:
> -        length =3D 256 * 1024 * 1024;
> +        length =3D 256 * M_BYTE;
>          break;
>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_128M:
> -        length =3D 128 * 1024 * 1024;
> +        length =3D 128 * M_BYTE;
>          addr_mask |=3D MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK |
>              MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
>          break;
>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_64M:
> -        length =3D 64 * 1024 * 1024;
> +        length =3D 64 * M_BYTE;
>          addr_mask |=3D MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
>          break;
>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
> @@ -396,16 +397,16 @@ static void mch_update_smram(MCHPCIState *mch)
>          switch (pd->config[MCH_HOST_BRIDGE_ESMRAMC] &
>                  MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_MASK) {
>          case MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_1MB:
> -            tseg_size =3D 1024 * 1024;
> +            tseg_size =3D 1 * M_BYTE;
>              break;
>          case MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_2MB:
> -            tseg_size =3D 1024 * 1024 * 2;
> +            tseg_size =3D 2 * M_BYTE;
>              break;
>          case MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_8MB:
> -            tseg_size =3D 1024 * 1024 * 8;
> +            tseg_size =3D 8 * M_BYTE;
>              break;
>          default:
> -            tseg_size =3D 1024 * 1024 * (uint32_t)mch->ext_tseg_mbytes=
;
> +            tseg_size =3D (uint32_t)mch->ext_tseg_mbytes * M_BYTE;
>              break;
>          }
>      } else {
>=20


