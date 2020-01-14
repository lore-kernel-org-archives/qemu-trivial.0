Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irLYj-0001xD-O6
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2020 07:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1irLYg-0001tz-Dg
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 07:44:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1irLYe-00078R-97
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 07:44:34 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47834
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1irLYe-00078N-65
 for qemu-trivial@nongnu.org; Tue, 14 Jan 2020 07:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579005871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoV8XFb70US4wtfbY1n94Er2azORQJIzo99CIq35yg8=;
 b=g/8SEUz2so9UWZlrRfvvF54sj+jDC5+CsJs707JI1m8TbMlJxNsoaTg88nnTQQhM9nnkPv
 ltCSKRYeUzhEESnhwOAXjNS29J+rzFfrC6HS4XXqMNX1X0rWjl+oLm71gUJhYHi9840Lvb
 ySLJQ2NH0l1+0uomVPnSvBEAPc4qbmU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-3AohKaWnM2-0ng7949oGKQ-1; Tue, 14 Jan 2020 07:44:28 -0500
Received: by mail-wr1-f71.google.com with SMTP id u18so6402469wrn.11
 for <qemu-trivial@nongnu.org>; Tue, 14 Jan 2020 04:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7j8CwUwkHJam8aVjm733nleoJ5Yw969ctuPEeETw7z4=;
 b=aKk4qU53k+Aqy8F0ViFbPoIz7V7B6lLTpoL8zbod1qDtWd3Pm7z3wh9y8zXQZff1L6
 KOEOvoHDiriEEdyMS3KnjiZG+zXF7cgAAy+/eV033PG5qIhSOLV/mXSmQy+H1Svip+qz
 K1BImdA93q7549R2IIGPWb7lFmmCtQmal9CMAPsZPAXK5jxKnp0E6NWBYAUyIBcvU2Ok
 PcL1wlZcHqTPb/Sxw2sgWO0/GwPD9erlek5J8wvzE0rSwUyC0DnFbGfrd4xZOm74Bk98
 DdKUFvMjcdIjEXnr1lqQq6MY2ijdychC/ZhWVQCOLcwStSKNjISTPzfzmxF2HuynpCTP
 ZUIQ==
X-Gm-Message-State: APjAAAUQ1IYowksGR5Fge/m6mMzTuYbmNrst/RrSOZH8ErAOSf+tWCXk
 d25WiDEgtIqWayopd0Yoi7SszhDFwzdafNZYbdiZwxGeb1VjHl4DoE7RWKE+uOuEAoQe1wp2s8S
 JJrXK7JdJipiL3UrFoQ==
X-Received: by 2002:a1c:4857:: with SMTP id v84mr27888895wma.8.1579005867248; 
 Tue, 14 Jan 2020 04:44:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzm7xmqsDRrXMqCEChulMqqQcND2uTklxttqvXkG4nn2i3NhBjwiOlFqUhjKjVXlSz6vIKRog==
X-Received: by 2002:a1c:4857:: with SMTP id v84mr27888876wma.8.1579005867071; 
 Tue, 14 Jan 2020 04:44:27 -0800 (PST)
Received: from [10.0.1.197] (lfbn-mon-1-1103-34.w90-48.abo.wanadoo.fr.
 [90.48.206.34])
 by smtp.gmail.com with ESMTPSA id b137sm19520346wme.26.2020.01.14.04.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 04:44:26 -0800 (PST)
Subject: Re: [PATCH] target/arm: add PMU feature to cortex-r5 and cortex-r5f
To: Clement Deschamps <clement.deschamps@greensocs.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20200114105918.2366370-1-clement.deschamps@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <03110090-dd50-b124-e60a-9cf136e8f7fd@redhat.com>
Date: Tue, 14 Jan 2020 13:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114105918.2366370-1-clement.deschamps@greensocs.com>
Content-Language: en-US
X-MC-Unique: 3AohKaWnM2-0ng7949oGKQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Tue, 14 Jan 2020 12:44:36 -0000

On 1/14/20 11:59 AM, Clement Deschamps wrote:

Maybe describe here:

The PMU is not optional on cortex-r5 and cortex-r5f (see
the "Features" chapter of the Technical Reference Manual).

> Signed-off-by: Clement Deschamps <clement.deschamps@greensocs.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
> See cortex-r5 TRM - 1.3 Features
>=20
> PMU is not optional on cortex-r5 and cortex-r5f
> ---
>   target/arm/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d62fd5fdc6..64cd0a7d73 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2121,6 +2121,7 @@ static void cortex_r5_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V7);
>       set_feature(&cpu->env, ARM_FEATURE_V7MP);
>       set_feature(&cpu->env, ARM_FEATURE_PMSA);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>       cpu->midr =3D 0x411fc153; /* r1p3 */
>       cpu->id_pfr0 =3D 0x0131;
>       cpu->id_pfr1 =3D 0x001;
>=20


