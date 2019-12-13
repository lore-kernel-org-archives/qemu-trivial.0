Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifjXI-00040a-Ra
	for mharc-qemu-trivial@gnu.org; Fri, 13 Dec 2019 06:55:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ifjXH-00040O-HX
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 06:55:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ifjXG-0004RF-F0
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 06:55:07 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50008
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ifjXG-0004Q4-9o
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 06:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576238105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARv6mcy281jUa1nbgAjuLfWfQQSOGGA4O9KDT/2tagM=;
 b=JEpxKBIlrSAicd5i65lFzU+c5o39EsnHp8vOskKYfHlgkDYBdXPenWLF9CQR//KW4sL4cl
 pxVcq7A/GFUsGLobB+v9asmYjLuqnrnJC3AOjf5mbD2MHHJnijlsY5DgKil6sCoh4YbwE1
 L6pz3jH4CJQEdx/XYOeOjIEqVbNDxNs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-8Ufr6lkXPcmrGXj5_7DWBw-1; Fri, 13 Dec 2019 06:55:04 -0500
Received: by mail-wr1-f69.google.com with SMTP id 90so2475509wrq.6
 for <qemu-trivial@nongnu.org>; Fri, 13 Dec 2019 03:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z1TphYBfZEVPZphlaqakJCWwiVWqp8Gd3XbmpXjBi4I=;
 b=BdiUMUY3kxBH9ltgC69+j4WXBCp+wmC9mD+0gG3b5yxyKiA2brdS+GbqUz8481KxjK
 tfNHGfYHsTFw4Q7XVhZZ8I2YriKXZXm8vpqWvv43FkkSHf5RyN6gc2OOmjsB443FejIV
 qxFy2iVBTprxYa1LXy60VPxTqNQikCbfRs2wp7mpEhR4bjxfOYHgiaZ2DJBUnEkAV3xD
 Myx4bqYNI7EB43i5qLgRfwv5j0wjvzN0cb3JvjHjoi/HsFuCi60yMNRZQyEDl0JnCI+c
 s1DgyH8XA8qAaW6RY/HBIejV+NHrgQz7CMtdJxtA5UNsllk7AGkqXN6df1lhj8arUBf/
 w5bA==
X-Gm-Message-State: APjAAAVzT7X5m3tCSLpVGt+0I6aCvnDNrcvZNyutu00Wg1CGVN1g45Yh
 +Hbirx4+prOIndJyd+g0mvAZ0/LW1NCefYXsaprrRu/N95OIUdsxF9t1BVDZk49DKok34fE2SXn
 s2wubF19C9SdYMdFTYg==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr13010796wrf.385.1576238102948; 
 Fri, 13 Dec 2019 03:55:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxp97+/F1/T9RSvc65pPuib8yjdamuaVfF7HAVYD1x+PRiPlaxWvZC+lr5Tc/0mj0ARxgfZCQ==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr13010772wrf.385.1576238102737; 
 Fri, 13 Dec 2019 03:55:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id g2sm9668770wrw.76.2019.12.13.03.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 03:55:02 -0800 (PST)
Subject: Re: [PATCH] hw/i386/pc: Simplify ioapic_init_gsi()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-trivial@nongnu.org
References: <20191213111145.11288-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <573a8391-ff5d-601c-e651-75025a1ea026@redhat.com>
Date: Fri, 13 Dec 2019 12:55:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213111145.11288-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 8Ufr6lkXPcmrGXj5_7DWBw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 13 Dec 2019 11:55:08 -0000

On 13/12/19 12:11, Philippe Mathieu-Daud=C3=A9 wrote:
> All callers of ioapic_init_gsi() provide a parent. We want new
> uses to follow the same good practice and provide the parent
> name, so do not make this optional: assert the parent name is
> provided, and simplify the code.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/pc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index ac08e63604..234945d328 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1488,15 +1488,14 @@ void ioapic_init_gsi(GSIState *gsi_state, const c=
har *parent_name)
>      SysBusDevice *d;
>      unsigned int i;
> =20
> +    assert(parent_name);
>      if (kvm_ioapic_in_kernel()) {
>          dev =3D qdev_create(NULL, TYPE_KVM_IOAPIC);
>      } else {
>          dev =3D qdev_create(NULL, TYPE_IOAPIC);
>      }
> -    if (parent_name) {
> -        object_property_add_child(object_resolve_path(parent_name, NULL)=
,
> -                                  "ioapic", OBJECT(dev), NULL);
> -    }
> +    object_property_add_child(object_resolve_path(parent_name, NULL),
> +                              "ioapic", OBJECT(dev), NULL);
>      qdev_init_nofail(dev);
>      d =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(d, 0, IO_APIC_DEFAULT_ADDRESS);
>=20

Queued, thanks.

Paolo


