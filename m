Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goOia-0005fA-LB
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 03:26:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goOiY-0005f2-JJ
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:26:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goOiX-0004Pl-OQ
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:26:02 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55124)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1goOiX-0004P7-I2
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:26:01 -0500
Received: by mail-wm1-f67.google.com with SMTP id a62so16771831wmh.4
	for <qemu-trivial@nongnu.org>; Tue, 29 Jan 2019 00:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EnqG5mDu030tQl37+ITi8Al3urou9AfTygc6tZoFTd4=;
	b=nNvOP6AkiiTZ0JBaSjhcvu45K2N/0i18tVgzMX8DtcIxLl0u/u9xMfcUx1skqYdTGa
	pl65wtwcEZ30CyBTHVHzYtTrHN7Ag9IJ1QT2bEadGG/iiVz93kyNJatbzy9d7dIkcJpE
	9ME1/ORtQK3eF5BeTq+tmwvlUWe3Lsl/5zQC3+hegnHJjDWciVHdl6PQauhl0wb2y6it
	C0P2z8zVi2WzLt98R20oAYFzSax3b+1n3/fKsc8FV0Bta88f9Y271ccbC/RY8gVon980
	VlzigHZE8rE8/uOdOchSFiLl34m9Wj5Ty2nEX0bLaZWcsDkBgIDf0C56KZpJZeNhyZ8C
	+5Jw==
X-Gm-Message-State: AJcUukfJk/qcjnrzoYCkHTPr6o/XOA/k3qeKqysY+tKDau1PZ1wnqY31
	NP+hWL1vK2CWUcJzo4haRH6JblAChGs=
X-Google-Smtp-Source: ALg8bN7O1tMHs3EdkCpNfawvflpt7MGb3ZQRnmf8BIHLT9xQdtg36KEFBehMyjtVENHYkz0IHH9jHw==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr21223042wmi.102.1548750360029; 
	Tue, 29 Jan 2019 00:26:00 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	a18sm141461557wrp.13.2019.01.29.00.25.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 00:25:59 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: imammedo@redhat.com, laurent@vivier.eu, mst@redhat.com
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-2-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0f61313f-8a66-587e-b3b0-dc485923bf8d@redhat.com>
Date: Tue, 29 Jan 2019 09:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129000820.31190-2-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/3] hw/i386/pc.c: remove
 unused function pc_acpi_init()
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
X-List-Received-Date: Tue, 29 Jan 2019 08:26:03 -0000

On 1/29/19 1:08 AM, Wei Yang wrote:
> Function pc_acpi_init() is not used anymore.
> 
> Remove the definition and declaration.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/i386/pc.c         | 27 ---------------------------
>  include/hw/i386/pc.h |  1 -
>  2 files changed, 28 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 5317e08f60..734d3268fa 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1280,33 +1280,6 @@ void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
>                                          pci_address_space, -1);
>  }
>  
> -void pc_acpi_init(const char *default_dsdt)
> -{
> -    char *filename;
> -
> -    if (acpi_tables != NULL) {
> -        /* manually set via -acpitable, leave it alone */
> -        return;
> -    }
> -
> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, default_dsdt);
> -    if (filename == NULL) {
> -        warn_report("failed to find %s", default_dsdt);
> -    } else {
> -        QemuOpts *opts = qemu_opts_create(qemu_find_opts("acpi"), NULL, 0,
> -                                          &error_abort);
> -        Error *err = NULL;
> -
> -        qemu_opt_set(opts, "file", filename, &error_abort);
> -
> -        acpi_table_add_builtin(opts, &err);
> -        if (err) {
> -            warn_reportf_err(err, "failed to load %s: ", filename);
> -        }
> -        g_free(filename);
> -    }
> -}
> -
>  void xen_load_linux(PCMachineState *pcms)
>  {
>      int i;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 9d29c4b1df..541124ba6d 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -187,7 +187,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level);
>  
>  void pc_cpus_init(PCMachineState *pcms);
>  void pc_hot_add_cpu(const int64_t id, Error **errp);
> -void pc_acpi_init(const char *default_dsdt);
>  
>  void pc_guest_info_init(PCMachineState *pcms);
>  
> 

