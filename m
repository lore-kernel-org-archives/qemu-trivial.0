Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn0eJ-0002wW-8u
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 07:31:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn0eG-0002ub-52
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 07:31:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn0eF-0000MM-An
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 07:31:52 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:54643)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gn0eF-0000M6-5M
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 07:31:51 -0500
Received: by mail-wm1-f44.google.com with SMTP id a62so6601155wmh.4
	for <qemu-trivial@nongnu.org>; Fri, 25 Jan 2019 04:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aoOHjhCOc5QChVzfXsBhWSlUx6PCr6FkX1UyQEVNw5A=;
	b=D9M4fOBs0RCjGA3zjmfCUQ67bewF2M/g25TKE8+LGH4kqq0mTHYkrQ0LZnDcTSskI6
	Ghg0YJkrbt8yRFl58CiWMJwRGFUNjR+ON5FsnTj6qFphy1KMiGJhEC+wjlDiPxnHrINR
	oU20lbfFRlyaVYdtycxpTnNurjnY9B6XwN4VQVBvCWMDR4EoylRaopCdJPtHI7VrzUra
	0Z+bydsDZ1QLsC5XYOr5S1Kooy8OJH2e4B6LoJHzWePKX4Nlf65tAtXSTjNVACFcSHXw
	aKwqNup5malTfRYZmR9gML2ZArzESIzGL86YL9lR+78M1XnRB3ySiLuzfM3YwQl327SU
	fVgg==
X-Gm-Message-State: AJcUukepUjwafgo2amY4q/7aBds0QybnxcAAMHze/jzqatzt0dzH4hWJ
	IZxjMl+BtECHUHUffeC+Ad/cJ4rAzUA=
X-Google-Smtp-Source: ALg8bN5KuvRVm4XVa9GOT4xav4s16EP7608kHaHGgDABsGkTDDlGTfx/xDzgDOUslpH0qSFMb99t5w==
X-Received: by 2002:a1c:7f0c:: with SMTP id a12mr6439626wmd.89.1548419509822; 
	Fri, 25 Jan 2019 04:31:49 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	x20sm87694813wme.6.2019.01.25.04.31.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 04:31:49 -0800 (PST)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, imammedo@redhat.com
Cc: qemu-trivial@nongnu.org
References: <20190125094047.22276-1-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <773a9051-9cca-ac9b-99d0-4cdb46a13952@redhat.com>
Date: Fri, 25 Jan 2019 13:31:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125094047.22276-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.44
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] typo: apci->acpi
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
X-List-Received-Date: Fri, 25 Jan 2019 12:31:54 -0000

On 1/25/19 10:40 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> apci_1_compatible should be acpi_1_compatible.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

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

