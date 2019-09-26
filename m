Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDWEU-0004su-7a
	for mharc-qemu-trivial@gnu.org; Thu, 26 Sep 2019 12:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDWEN-0004hs-HT
 for qemu-trivial@nongnu.org; Thu, 26 Sep 2019 12:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDWEK-0004Ne-Lz
 for qemu-trivial@nongnu.org; Thu, 26 Sep 2019 12:02:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iDWEI-0004Jp-Pz
 for qemu-trivial@nongnu.org; Thu, 26 Sep 2019 12:02:55 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4536451EE6
 for <qemu-trivial@nongnu.org>; Thu, 26 Sep 2019 16:02:51 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id w8so1143003wrm.3
 for <qemu-trivial@nongnu.org>; Thu, 26 Sep 2019 09:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nY6SW94W7LfWTmKSQKoaxwAVsm4QTFIShLMWcD5mqPc=;
 b=aWqjJHxAkYlb7IFGophvtEkRAIUoQtYuFoANOnwXQ/Qb0EH1BojZe9GyEpaJSDhPhc
 2suiis4P2SosKyoeYCpJqvtT6Id7X1jtLo1BXoLUddOluMBufKaWLgT3wmR8Qn4AeSYU
 SlBAh5NTbSN6o6cLg56aMdILdxsOmTjQ/p92lUBCeRhXuhHr7+zbQZigk4caIAqioIkH
 OSmIkyZUbpeoPUF+QcfQeBUjXkcfGaybkKNMSO36rv8sYecscI5STRSW6HNz/eugNUii
 afPkiNlptuESoSvnmRMbiQ+ZeMFiyDz26ju8auxO0ipu/BaXX3VlvZxFOEWpnfpr9/pJ
 AbTQ==
X-Gm-Message-State: APjAAAUe7CrVdiW9nGq1vGZHMZLCol4RKIaJoXceCW7DwwPVHvTfptfN
 FPDb2HE84iPgNu9PWlOD2P+++l+daaSn4HJFJNGAthaMYKe2mbJRKKSi9PCXDBw1t8vlE6rA/gT
 kMqjj0OMUR6aPmh3HGQ==
X-Received: by 2002:a1c:1b14:: with SMTP id b20mr3387045wmb.122.1569513770075; 
 Thu, 26 Sep 2019 09:02:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRYyjA9kAY3Uls24l4mar3+9Wkx7/rdUbO0mZNkxewOJlLD+w7PlvDXaFXABVyN5cuMkx5fA==
X-Received: by 2002:a1c:1b14:: with SMTP id b20mr3387017wmb.122.1569513769853; 
 Thu, 26 Sep 2019 09:02:49 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id m18sm4451909wrg.97.2019.09.26.09.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2019 09:02:49 -0700 (PDT)
Subject: Re: [PATCH 11/11] hw/misc/vmcoreinfo: Convert reset handler to
 DeviceReset
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20190926151733.25349-1-philmd@redhat.com>
 <20190926151733.25349-12-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f110c099-7521-95e0-74b9-9c7e53d7d5d8@redhat.com>
Date: Thu, 26 Sep 2019 18:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190926151733.25349-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Thu, 26 Sep 2019 16:03:05 -0000

On 9/26/19 5:17 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Convert the reset handler into a proper Device reset method.

Marc-Andr=C3=A9 noticed this one is incorrect, because while being QDEV i=
t is
not connected to a QBUS.

Maybe we can add a Device::unconnected property, and when set, the
parent realize() calls 'qemu_register_reset(dev->reset, dev);'?
This might look the same, but at least Devices implementations could
stop to use this function...

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/misc/vmcoreinfo.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/misc/vmcoreinfo.c b/hw/misc/vmcoreinfo.c
> index 326a3ce8f4..a1c4847cdf 100644
> --- a/hw/misc/vmcoreinfo.c
> +++ b/hw/misc/vmcoreinfo.c
> @@ -13,7 +13,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "sysemu/reset.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "migration/vmstate.h"
>  #include "hw/misc/vmcoreinfo.h"
> @@ -26,7 +25,7 @@ static void fw_cfg_vmci_write(void *dev, off_t offset=
, size_t len)
>          && s->vmcoreinfo.guest_format !=3D FW_CFG_VMCOREINFO_FORMAT_NO=
NE;
>  }
> =20
> -static void vmcoreinfo_reset(void *dev)
> +static void vmcoreinfo_reset(DeviceState *dev)
>  {
>      VMCoreInfoState *s =3D VMCOREINFO(dev);
> =20
> @@ -61,7 +60,6 @@ static void vmcoreinfo_realize(DeviceState *dev, Erro=
r **errp)
>                               NULL, fw_cfg_vmci_write, s,
>                               &s->vmcoreinfo, sizeof(s->vmcoreinfo), fa=
lse);
> =20
> -    qemu_register_reset(vmcoreinfo_reset, dev);
>      vmcoreinfo_state =3D s;
>  }
> =20
> @@ -84,6 +82,7 @@ static void vmcoreinfo_device_class_init(ObjectClass =
*klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
>      dc->vmsd =3D &vmstate_vmcoreinfo;
> +    dc->reset =3D vmcoreinfo_reset;
>      dc->realize =3D vmcoreinfo_realize;
>      dc->hotpluggable =3D false;
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>=20

