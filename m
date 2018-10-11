Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAcGX-0005mn-Sx
	for mharc-qemu-trivial@gnu.org; Thu, 11 Oct 2018 10:48:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAcGV-0005lw-2t
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 10:48:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAcGQ-0002Tm-7Q
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 10:48:38 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38025)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gAcGP-0002Ko-8U
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 10:48:34 -0400
Received: by mail-wr1-f67.google.com with SMTP id a13-v6so10027769wrt.5
	for <qemu-trivial@nongnu.org>; Thu, 11 Oct 2018 07:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CN+NPgJxRuAfZ2Y0FxX9IkFy3wcMePYtjNanCstI7SE=;
	b=fR/fmykrhb5TQSoK7tKLk2O/NLE0ZTze5m7Vn4sZX7KXKiVZYekH1kuwZFWiWLW357
	VxMLVJEoAeGO5IfxkCPZExYhOP/9GIbsZ3z2D8HERgCtZ1UUQj/P4V602UEz18j9Ebtq
	n1krf/Rep9bg63kPKU735gQf2kjrVAblCdLsfA08Z9Z+zeHG7pLnvt3hPwyspUqnFIqa
	mph7d6CMiRCXXQGNO/wA/mUzFCoNeo4CXLJiKo1zobrCulU/VynmisZTlK2BYjh4IHNl
	4JR7Am/wX4eFzzyiMq7u/uQ+f48bvhz+3G/vnMF/hManIHgIrvd8uNEXFMI9hAj+N5Rd
	BApw==
X-Gm-Message-State: ABuFfojGigzL6Ri6CaZbM4HdSGP8GC4kOHumuUeS4c8SLWsdeHWqG+sR
	mKjwwmeAPjAmUMS54Ps1PuzTXg==
X-Google-Smtp-Source: ACcGV61j6X19NZPIkoYQ/gkYzAlR0SZBYQOU6yhEt86YGDTKGWfQJu3cbXRloHsH/s+9ctDIQvGmYg==
X-Received: by 2002:adf:cd0c:: with SMTP id
	w12-v6mr1988685wrm.67.1539269300799; 
	Thu, 11 Oct 2018 07:48:20 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	m136-v6sm12968977wmb.4.2018.10.11.07.48.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 07:48:20 -0700 (PDT)
To: Li Qiang <liq3ea@gmail.com>, mst@redhat.com, marcel.apfelbaum@gmail.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1539261534-2795-1-git-send-email-liq3ea@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce1a63fd-772e-d11f-bb6f-a59f76377239@redhat.com>
Date: Thu, 11 Oct 2018 16:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1539261534-2795-1-git-send-email-liq3ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] piix: use TYPE_FOO
 constants than string constats
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
X-List-Received-Date: Thu, 11 Oct 2018 14:48:40 -0000

On 11/10/2018 14:38, Li Qiang wrote:
> Make them more QOMConventional.
> Cc:qemu-trivial@nongnu.org 
> 
> Signed-off-by: Li Qiang <liq3ea@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/pci-host/piix.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 230d5d2ea3..5881e63364 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -95,6 +95,9 @@ typedef struct PIIX3State {
>  #define I440FX_PCI_DEVICE(obj) \
>      OBJECT_CHECK(PCII440FXState, (obj), TYPE_I440FX_PCI_DEVICE)
>  
> +#define TYPE_PIIX3_DEVICE "PIIX3"
> +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> +
>  struct PCII440FXState {
>      /*< private >*/
>      PCIDevice parent_obj;
> @@ -413,13 +416,13 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>       * These additional routes can be discovered through ACPI. */
>      if (xen_enabled()) {
>          PCIDevice *pci_dev = pci_create_simple_multifunction(b,
> -                             -1, true, "PIIX3-xen");
> +                             -1, true, TYPE_PIIX3_XEN_DEVICE);
>          piix3 = PIIX3_PCI_DEVICE(pci_dev);
>          pci_bus_irqs(b, xen_piix3_set_irq, xen_pci_slot_get_pirq,
>                  piix3, XEN_PIIX_NUM_PIRQS);
>      } else {
>          PCIDevice *pci_dev = pci_create_simple_multifunction(b,
> -                             -1, true, "PIIX3");
> +                             -1, true, TYPE_PIIX3_DEVICE);
>          piix3 = PIIX3_PCI_DEVICE(pci_dev);
>          pci_bus_irqs(b, piix3_set_irq, pci_slot_get_pirq, piix3,
>                  PIIX_NUM_PIRQS);
> @@ -737,7 +740,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
>  }
>  
>  static const TypeInfo piix3_info = {
> -    .name          = "PIIX3",
> +    .name          = TYPE_PIIX3_DEVICE,
>      .parent        = TYPE_PIIX3_PCI_DEVICE,
>      .class_init    = piix3_class_init,
>  };
> @@ -750,7 +753,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
>  };
>  
>  static const TypeInfo piix3_xen_info = {
> -    .name          = "PIIX3-xen",
> +    .name          = TYPE_PIIX3_XEN_DEVICE,
>      .parent        = TYPE_PIIX3_PCI_DEVICE,
>      .class_init    = piix3_xen_class_init,
>  };
> 

