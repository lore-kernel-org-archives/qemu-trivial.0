Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLYMf-0003DD-MQ
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2019 15:24:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLYMc-0003AH-Q6
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 15:24:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLYKM-0002su-Ed
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 15:22:07 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLYKL-0002rZ-CO
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2019 15:22:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so22311346wre.7
	for <qemu-trivial@nongnu.org>; Tue, 30 Apr 2019 12:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+3q2W/XxvBymSvTp+0j8mpDo60A6BvU3bfPhmQO0Upo=;
	b=i/Omoug0/q5yLh5Uf5Q59rxmUgrqy49bsls4XAHR2GCheCVEV+V5mwZlowz7rC21Y+
	q72WnDE5AGGrD2CnXqhj9afFYFZ2jSGgEPwlhwWp6i/xfqs5dAG2daXvrxnIMmGa6khS
	lORWBJKCx/lFOuBbvnbtOf+NpqJA2Y0M20TuotnG8UaBu9ELT/uO3eB+pENGePo5BnCD
	uicSOndVYjNDuR1wyquWa5TDYEljaBOu+fWtsjw7v5XEu9ylj9WEVEMGYssLuGvL2Xyr
	CT8AB7gKjewJWbe6/mACY44fTQvGILfYlcLukwlGLfSjN+fyfalgDQIq6J6JBlVMXOEe
	d3wg==
X-Gm-Message-State: APjAAAU5mKI20ZozWEYXD1LroOPHvAqBGyHVrWH2ryBUL5kW5Vlelqd5
	bCZ52GngV9peCCJbv6pLJSw0j+a4B1w=
X-Google-Smtp-Source: APXvYqx+XOQL3ezeq16jS1+Dd7FZbMJnp1iMQCSeI9SlzzyJ8P0AhjtlekSvDEOjrncLoR7SKQy3TA==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr37267330wro.48.1556652123692; 
	Tue, 30 Apr 2019 12:22:03 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	r2sm12302833wrr.65.2019.04.30.12.22.02
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 12:22:02 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo
	<arikalo@wavecomp.com>, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20190430191552.4027-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1e384dcb-5f43-c718-15be-2577e1df69e0@redhat.com>
Date: Tue, 30 Apr 2019 21:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430191552.4027-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [PATCH v2] hw/pci-host: Use
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
X-List-Received-Date: Tue, 30 Apr 2019 19:24:28 -0000

On 4/30/19 9:15 PM, Thomas Huth wrote:
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  v2: Added missing &error_abort parameter in xilinx-pcie.c

(I had this patch queued locally since pre-release, but haven't got to
respin my series yet, sorry.)

> 
>  hw/pci-host/designware.c  | 4 ++--
>  hw/pci-host/gpex.c        | 5 +++--
>  hw/pci-host/q35.c         | 4 ++--
>  hw/pci-host/xilinx-pcie.c | 4 ++--
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 29ea313798..64ad21d295 100644
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
> index 2583b151a4..1bafffcc34 100644
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
> index 7b871b5734..960939f5ed 100644
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
> index 60309afe9e..ceb00e23e6 100644
> --- a/hw/pci-host/xilinx-pcie.c
> +++ b/hw/pci-host/xilinx-pcie.c
> @@ -149,8 +149,8 @@ static void xilinx_pcie_host_init(Object *obj)
>      XilinxPCIEHost *s = XILINX_PCIE_HOST(obj);
>      XilinxPCIERoot *root = &s->root;
>  
> -    object_initialize(root, sizeof(*root), TYPE_XILINX_PCIE_ROOT);
> -    object_property_add_child(obj, "root", OBJECT(root), NULL);
> +    object_initialize_child(obj, "root",  root, sizeof(*root),
> +                            TYPE_XILINX_PCIE_ROOT, &error_abort, NULL);
>      qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(root), "multifunction", false);
>  }
> 

