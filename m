Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gom0F-0002hL-GN
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 04:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gom0D-0002fT-EM
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:17:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gom0A-0005DY-MU
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:17:48 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:35665)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1golzv-0004w6-V7; Wed, 30 Jan 2019 04:17:34 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MF39M-1gvLZU3g6q-00FWR7; Wed, 30 Jan 2019 10:17:17 +0100
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, imammedo@redhat.com
Cc: qemu-trivial@nongnu.org
References: <20190125094047.22276-1-dgilbert@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <7c6b541c-ed1d-0de2-29fe-76ca56c05640@vivier.eu>
Date: Wed, 30 Jan 2019 10:17:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190125094047.22276-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YhlQAKKHFmvPJe6l0YeI9mAkznOFBJDALV0YCyTVO9nyvND3cZx
	u6+Fr9BL5sPdvOJoOMcbOr61OREXNxA+YVBpCudj7VbBFQcP4WL+3FIeh8Dms4DJHEULwMv
	pwg14V1j1/SDs8X+L/0lxCCtXGRF6bYu/ZY9YslVH8sGEkUFcoRDCYJN6j3y11K8gDrD5j3
	RcmwxVY4F08cx8N0oCEeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tw7btUIs+EM=:kYLhTj55yMlln0xWusWQp4
	qAskedvx+rSSkNr5KXsHMdqAlg/eje46aT+7AlRq9Lb/P1lAt+5I08iu7tF8xSFPZ0scX/EzD
	XfudOeUDND3WByq2IAs/jCY5rXZbVBj/fiB0BcWInpxBeAMU/x4r5CCnxCw8y4NE9W9CA8U3z
	1SNAq8x58fiyH/GVl0jXwwOBg1KOFIE86xb8yat9cui+leZzYwwPHwbbSGiWMWtxtE0Rln4Yb
	7SQ+UFj+pX2dgOh29gynZanDYTJY5VxuRgP4WdZIDaT2KJQINLpBqkdv9N7rKbkVwupoM3pFj
	52oQhnJnWRnKqwMdR48iTjt8dubbN5WSVnbs7yH4Vfs5pYXqLHuQZTh5YkJVZ0SIvdD5Njzrf
	aeaO/mfrdbu1UcBQRUMV+Mn1p8Iqsfjxi872bG9QZ25WHn4YqxHwpzAdWUY3g+zfF8vTnnXkY
	B6P9xFCVevYW0StexKTVxGmQ8ty7dPK14/UIBqdjMYyIL3c/GZNfAYRAnoiKL6eqZfX8mqLfX
	tkKdSSzjqs/idZgLZLRkM9BvKfDafuVw3jwpqGaVdmZj/T25BdBwMegpNdL/l0qG8rrN+AiLS
	oZTjQQLjYNnVilkId0Lr8FrdVcsDeah40NWEIhW1jWypt8GjUGZRZC8OK3Y1qWzG7hecs5J52
	k3jc8Z9WlW+AxG1ZHJ9LI1WvAl44+VTUlqITa1L3w/5dJyTUBXYQmvXlpUMZsA9ziFTg2HJr2
	KfwgO+JMFT4Aq2mQbIWiPZZ0XROAw/G2Rqy4DEWFFTTFK/30vaZMsdGqemQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [PATCH] typo: apci->acpi
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
X-List-Received-Date: Wed, 30 Jan 2019 09:17:50 -0000

On 25/01/2019 10:40, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> apci_1_compatible should be acpi_1_compatible.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/acpi/cpu.c         | 2 +-
>  hw/i386/acpi-build.c  | 2 +-
>  include/hw/acpi/cpu.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index f10b190019..a0a43fe6b5 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -508,7 +508,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>              GArray *madt_buf = g_array_new(0, 1, 1);
>              int arch_id = arch_ids->cpus[i].arch_id;
>  
> -            if (opts.apci_1_compatible && arch_id < 255) {
> +            if (opts.acpi_1_compatible && arch_id < 255) {
>                  dev = aml_processor(i, 0, 0, CPU_NAME_FMT, i);
>              } else {
>                  dev = aml_device(CPU_NAME_FMT, i);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 2e21a31f82..d60603abd7 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1847,7 +1847,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          build_legacy_cpu_hotplug_aml(dsdt, machine, pm->cpu_hp_io_base);
>      } else {
>          CPUHotplugFeatures opts = {
> -            .apci_1_compatible = true, .has_legacy_cphp = true
> +            .acpi_1_compatible = true, .has_legacy_cphp = true
>          };
>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>                         "\\_SB.PCI0", "\\_GPE._E02");
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 89ce172941..62f0278ba2 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -48,7 +48,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>                           CPUHotplugState *state, hwaddr base_addr);
>  
>  typedef struct CPUHotplugFeatures {
> -    bool apci_1_compatible;
> +    bool acpi_1_compatible;
>      bool has_legacy_cphp;
>  } CPUHotplugFeatures;
>  
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

