Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxDmf-0001yP-19
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2019 11:34:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gxDmb-0001um-Sl
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2019 11:34:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gxDmY-0000sW-O0
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2019 11:34:41 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gxDmY-0000qi-Fu
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2019 11:34:38 -0500
Received: by mail-wr1-f65.google.com with SMTP id n2so3027102wrw.8
	for <qemu-trivial@nongnu.org>; Fri, 22 Feb 2019 08:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kzvHFcDOFgClypPGX5P8+OFUiCFb+cMyh/DAcT9eNIQ=;
	b=qY0PsmYDd1ATkn/JhtSuvdALo/xWEG+vikc5ChkJlfC9A+fCL5pdLCrq0rcrtGXLSa
	tMq1Vt2OMaxiBMC/E45aQD2EFPnvag5f/3bVmh/8xUgJ5ZiOfiNWuzp/Gy7NtSQst7Ay
	23wyRniTW/eQC9nzV6UzDDaxNXipJxt5P5KT7/hQRIJnL5KEDlel38WjAWurwVgMDQJQ
	MPaL4F/NZq2WiogXi2xxnc1B9d/+jJJwsCNqVqMywkqSBEsBl8lDGPy+tCk1i7cPv/1K
	UM++TfEXKrKTssFjcRNBhXjeBKbPUfV2RG76b6y6wTEW9vIElsAwHCElEwrM44x5YwCw
	LqpQ==
X-Gm-Message-State: AHQUAuZyXyKidn8bohGFHn2uc4ZrV5lYxoC83N/L//Vx1tSCs6zbxpel
	ObfEOrpCi2aGu7mctnqCU9B4xeC1jpU=
X-Google-Smtp-Source: AHgI3IYPi7qroRwyJK6vFgi9R974R2JCPdW6sjNtPDBW2HsiO63z2FLQxvUPr3Snrg+3LEE9AqOUZw==
X-Received: by 2002:adf:90af:: with SMTP id i44mr3522765wri.222.1550853275187; 
	Fri, 22 Feb 2019 08:34:35 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109])
	by smtp.gmail.com with ESMTPSA id j1sm2295085wme.4.2019.02.22.08.34.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 08:34:34 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paul Burton <pburton@wavecomp.com>, Eduardo Habkost
	<ehabkost@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-trivial@nongnu.org
References: <1550769736-22498-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d401d1f8-e742-9d4f-3c47-0ad5a3f8571e@redhat.com>
Date: Fri, 22 Feb 2019 17:34:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1550769736-22498-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pci-host: Use
 object_initialize_child for correct reference counting
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
X-List-Received-Date: Fri, 22 Feb 2019 16:34:43 -0000

On 2/21/19 6:22 PM, Thomas Huth wrote:
> Both functions, object_initialize() and object_property_add_child() increase
> the reference counter of the new object, so one of the references has to be
> dropped afterwards to get the reference counting right. Otherwise the child
> object might not be properly cleaned up when the parent gets destroyed.
> Some functions of the pci-host devices miss to drop one of the references.
> Fix it by using object_initialize_child() instead, which takes care of
> calling object_initialize(), object_property_add_child() and object_unref()
> in the right order.
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/pci-host/designware.c  | 4 ++--
>  hw/pci-host/gpex.c        | 5 +++--
>  hw/pci-host/q35.c         | 4 ++--
>  hw/pci-host/xilinx-pcie.c | 4 ++--
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 29ea313..64ad21d 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -721,8 +721,8 @@ static void designware_pcie_host_init(Object *obj)
>      DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(obj);
>      DesignwarePCIERoot *root = &s->root;
>  
> -    object_initialize(root, sizeof(*root), TYPE_DESIGNWARE_PCIE_ROOT);
> -    object_property_add_child(obj, "root", OBJECT(root), NULL);
> +    object_initialize_child(obj, "root",  root, sizeof(*root),
> +                            TYPE_DESIGNWARE_PCIE_ROOT, &error_abort, NULL);
>      qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(root), "multifunction", false);
>  }
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 2583b15..1bafffc 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -29,6 +29,7 @@
>   * http://www.firmware.org/1275/practice/imap/imap0_9d.pdf
>   */
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "hw/hw.h"
>  #include "hw/pci-host/gpex.h"
>  
> @@ -120,8 +121,8 @@ static void gpex_host_initfn(Object *obj)
>      GPEXHost *s = GPEX_HOST(obj);
>      GPEXRootState *root = &s->gpex_root;
>  
> -    object_initialize(root, sizeof(*root), TYPE_GPEX_ROOT_DEVICE);
> -    object_property_add_child(obj, "gpex_root", OBJECT(root), NULL);
> +    object_initialize_child(obj, "gpex_root",  root, sizeof(*root),
> +                            TYPE_GPEX_ROOT_DEVICE, &error_abort, NULL);
>      qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(root), "multifunction", false);
>  }
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 7b871b5..960939f 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -216,8 +216,8 @@ static void q35_host_initfn(Object *obj)
>      memory_region_init_io(&phb->data_mem, obj, &pci_host_data_le_ops, phb,
>                            "pci-conf-data", 4);
>  
> -    object_initialize(&s->mch, sizeof(s->mch), TYPE_MCH_PCI_DEVICE);
> -    object_property_add_child(OBJECT(s), "mch", OBJECT(&s->mch), NULL);
> +    object_initialize_child(OBJECT(s), "mch",  &s->mch, sizeof(s->mch),
> +                            TYPE_MCH_PCI_DEVICE, &error_abort, NULL);
>      qdev_prop_set_int32(DEVICE(&s->mch), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(&s->mch), "multifunction", false);
>      /* mch's object_initialize resets the default value, set it again */
> diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
> index 60309af..f82d3f3 100644
> --- a/hw/pci-host/xilinx-pcie.c
> +++ b/hw/pci-host/xilinx-pcie.c
> @@ -149,8 +149,8 @@ static void xilinx_pcie_host_init(Object *obj)
>      XilinxPCIEHost *s = XILINX_PCIE_HOST(obj);
>      XilinxPCIERoot *root = &s->root;
>  
> -    object_initialize(root, sizeof(*root), TYPE_XILINX_PCIE_ROOT);
> -    object_property_add_child(obj, "root", OBJECT(root), NULL);
> +    object_initialize_child(obj, "root",  root, sizeof(*root),
> +                            TYPE_XILINX_PCIE_ROOT, NULL);

You forgot the errp argument:

                            TYPE_XILINX_PCIE_ROOT, &error_abort, NULL);

hw/pci-host/xilinx-pcie.c: In function ‘xilinx_pcie_host_init’:
hw/pci-host/xilinx-pcie.c:153:29: error: not enough variable arguments
to fit a sentinel [-Werror=format=]
                             TYPE_XILINX_PCIE_ROOT, NULL);
                             ^~~~~~~~~~~~~~~~~~~~~

With this fix:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

I'll respin this patch with related ppc/arm ones.

>      qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(root), "multifunction", false);
>  }
> 

