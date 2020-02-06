Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izpzK-0003OK-65
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 17:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izpzG-0003Nt-5f
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 17:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izpzE-00038T-Sy
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 17:51:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31367
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izpzE-00036q-PX
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 17:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581029464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icv33eBiR2I+mYSDzaq6QSN263N2WB1MBrPZaycniYY=;
 b=J3XNCDSKH4os+wfbM7b4gvtlnBfO9G2AF3IJJRU1F3b1AcTLk3Pdn76EbH5q1rd7AM+XKK
 42Sw3NwkEEIZ6XJC1c/wqt8uoO8II+reQS5EDesvCWdcBXefMdM9m/QXkHD5ulo6SMiUbo
 CjSb4hy4XiWLWRCvJnapNTHOi4FvSM0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-ZoH2K9_WO56e6TwPZrsJgQ-1; Thu, 06 Feb 2020 17:51:01 -0500
Received: by mail-wr1-f72.google.com with SMTP id u8so205317wrp.10
 for <qemu-trivial@nongnu.org>; Thu, 06 Feb 2020 14:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6zonQwthUIyO3uDNOl9B69G6xjJlqM2rgpgfOa2CcHw=;
 b=XiH0B/MFUCm3T8JiqAzr58FoAED8jGIslg9Oq/dieFMNkatg5rqktv3f0GgX9UcTAK
 HU6W/rHMf+VKb7uVKqRir/MQrp9MFEMFJz/dzNkRUzgHoUIJeEmwn+JQ4RZWVi4jJBp7
 rptP/X59hNeqU4hNS9nkys89iT0KX9GkLxdB6gBbfWe2ipip6QDj+uKw4kV3x3vZ+WLB
 AIpAFAUjHuaN4kahMrxS19W28+3hzcvwqGhuFvt5gOjSfegTe5O9suZ9RGHiybXgmVBB
 CIF1JhoZM4xjDegjGt+MPc/YnGdX4PQ58UN/wEQ4cos6YG1AI2duFsxDvOO00voZOCfZ
 dPzA==
X-Gm-Message-State: APjAAAWLPaCobIdxGyFE0RBeJvNnXa7HLFoQY68gnYUgDX6kAx507e07
 0lVelq7zskfIJtVJa4kpQz6oHM27BxEwpL6AK2IbgtvlmdllU9flSj6jixx+lE+E1kBKKWRFEWR
 W3OIM0PoIwh9D2ekrFQ==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr65065wmd.127.1581029460387;
 Thu, 06 Feb 2020 14:51:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxdSbC5vabCytVlx5A/MrdIFVsarN6xI1JGhN4tUxlG0+6LS+sCypTiBv/oAbWECrnInTX6Q==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr65051wmd.127.1581029460189;
 Thu, 06 Feb 2020 14:51:00 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id l29sm853996wrb.64.2020.02.06.14.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 14:50:59 -0800 (PST)
Subject: Re: [PATCH] docs/arm-cpu-features: Make kvm-no-adjvtime comment
 clearer
To: qemu-devel@nongnu.org, Andrew Jones <drjones@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200206224858.23184-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f8ed42e-15be-1f80-107b-fa4d4254da2b@redhat.com>
Date: Thu, 6 Feb 2020 23:50:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206224858.23184-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: ZoH2K9_WO56e6TwPZrsJgQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 06 Feb 2020 22:51:07 -0000

On 2/6/20 11:48 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The bold text sounds like 'knock knock'. Only bolding the
> second 'not' makes it easier to read.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   docs/arm-cpu-features.rst | 2 +-
>   target/arm/kvm.c          | 5 +----
>   2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> index dbf3b7cf42..fc1623aeca 100644
> --- a/docs/arm-cpu-features.rst
> +++ b/docs/arm-cpu-features.rst
> @@ -185,7 +185,7 @@ the list of KVM VCPU features and their descriptions.
>  =20
>     kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  Thi=
s
>                              means that by default the virtual time
> -                           adjustment is enabled (vtime is *not not*
> +                           adjustment is enabled (vtime is not *not*
>                              adjusted).
>  =20
>                              When virtual time adjustment is enabled each
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 85860e6f95..bcca8c8029 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -194,10 +194,7 @@ static void kvm_no_adjvtime_set(Object *obj, bool va=
lue, Error **errp)
>   /* KVM VCPU properties should be prefixed with "kvm-". */
>   void kvm_arm_add_vcpu_properties(Object *obj)
>   {
> -    if (!kvm_enabled()) {
> -        return;
> -    }
> -
> +    assert(kvm_enabled());

Oops, this was not supposed to be committed.

>       ARM_CPU(obj)->kvm_adjvtime =3D true;
>       object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_ge=
t,
>                                kvm_no_adjvtime_set, &error_abort);
>=20


