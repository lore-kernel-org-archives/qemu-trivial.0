Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0iiT-0005P9-32
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2019 04:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0iiR-0005N9-Dl
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 04:45:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0iiP-0006zj-DK
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 04:45:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34782)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i0iiP-0006zI-7r
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 04:45:05 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 588EA81DF2
 for <qemu-trivial@nongnu.org>; Thu, 22 Aug 2019 08:45:04 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id m25so2651512wml.6
 for <qemu-trivial@nongnu.org>; Thu, 22 Aug 2019 01:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/QHYBaltmIWKCAfGcizV8F+g02QqH2o4X+LH6iUwZb8=;
 b=qnEuB1EBzjFyWoMBZGHa8MF/UFVVkgR3zrKr2hO4BbuDr7sswT/QHfmFYmDZZT/oDU
 d6ior6cGG+D0dPGzauS+ecrSXSdWnyDPJ1//ULWn+54UIMCllI4npb4sLgbnrgL8uM6p
 +pbgWqF0hD4APtZQ0ToQQSj85Qk5PojSaycYD/BAyEsn0BNYnp54ecJb3AEihEu6ZQ4z
 UOb1HXqbLvdR5hKntCk22Oow7qlF+XCPhhP0tmdAg5wSUJtnB3NFqN9R6qCaxSt85xAA
 oro7qcN97PChDD5tr8LuiHO7RGxcP/JLMPwP94gXh/CPS8GjiyjhcqszbVf3oRU0838j
 fYlg==
X-Gm-Message-State: APjAAAXYVF+QRbqdAOQ9l4o6fRHkYOtHp+6b02Dvy3DHSujw7k6iRVdU
 GoyNybQKXszHoPk09j9b1yDTMKaj6OGsSgckZLH7GcwS6+jJ/kRRfa3tGwMzYj8gQAXnfX+CJCB
 DkfdJybrlRZMcOtdNGg==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr45197015wrx.100.1566463503110; 
 Thu, 22 Aug 2019 01:45:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6AFL7HWRMC0La/t/10cUYp2wjU8WdhAKGEf2ocaNvwdBLnqL0gc3hefDpyg6A1yd4rFqnaw==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr45197002wrx.100.1566463502944; 
 Thu, 22 Aug 2019 01:45:02 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id s64sm9021976wmf.16.2019.08.22.01.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2019 01:45:02 -0700 (PDT)
To: Chen Zhang <tgfbeta@me.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
References: <8E5A9C27-C76D-46CF-85B0-79121A00B05F@me.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a448f7da-c990-7dc5-e5ab-139994dfc814@redhat.com>
Date: Thu, 22 Aug 2019 10:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8E5A9C27-C76D-46CF-85B0-79121A00B05F@me.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vfio: fix a typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 08:45:08 -0000

On 8/22/19 8:49 AM, Chen Zhang via Qemu-devel wrote:
> Signed-off-by: Chen Zhang <tgfbeta@me.com>
> ---
>  hw/vfio/pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index dc3479c..c5e6fe6 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -44,7 +44,7 @@
>  #define TYPE_VFIO_PCI "vfio-pci"
>  #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PC=
I)
> =20
> -#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> +#define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> =20
>  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
> @@ -3199,7 +3199,7 @@ static void vfio_pci_nohotplug_dev_class_init(Obj=
ectClass *klass, void *data)
>  }
> =20
>  static const TypeInfo vfio_pci_nohotplug_dev_info =3D {=20
> -    .name =3D TYPE_VIFO_PCI_NOHOTPLUG,
> +    .name =3D TYPE_VFIO_PCI_NOHOTPLUG,
>      .parent =3D TYPE_VFIO_PCI,
>      .instance_size =3D sizeof(VFIOPCIDevice),
>      .class_init =3D vfio_pci_nohotplug_dev_class_init,
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

