Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1idEOD-0001Jg-Jn
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2019 09:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1idEO9-0001CW-G1
 for qemu-trivial@nongnu.org; Fri, 06 Dec 2019 09:15:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1idEO7-0001Em-T4
 for qemu-trivial@nongnu.org; Fri, 06 Dec 2019 09:15:20 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42053)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1idEO7-0001DQ-Oh
 for qemu-trivial@nongnu.org; Fri, 06 Dec 2019 09:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575641719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ez6aKTrCztIhj+k6BO+Q+SbcPIi5BLLMxobDaC/9HCg=;
 b=YYxa5ISU8s9ph6NOec778in15W36DlpSI2r4JI+TsL2LSHSzjfJabuDrH7tUB+Yz97r6bE
 uiTZiIctjjl34atJFygFMYxRtsojSIdeMUpJmI0yu9dZOp0wFKTT90N5EEUDeqdkYqWzX4
 Nn7OOTaYDovDOMtRQszm27X+QuOMvtE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-NtoquQYpMXarlrmajqyvIg-1; Fri, 06 Dec 2019 09:15:17 -0500
Received: by mail-wm1-f70.google.com with SMTP id j203so1678002wma.2
 for <qemu-trivial@nongnu.org>; Fri, 06 Dec 2019 06:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aez2pqz/QPpZMITOw7HT4/ywKDjbfgmh+cBAnl2Cy+Q=;
 b=jMYxclFE4cZG7GjJpTd5yCCOc5I01c8JBHwVnLljg1Fztu7QdOa33ZuFOR99pxkFtu
 or86ZaYMsDtZiqQr3acF5NsWEVKg8DxcV3rOKlueoQRnpQKqSqARPMf9/LDJZYSg6mv5
 VKLiaxKRao4GGlVIRgyYApislMrmAW5UNkge0XkpYLzm2H9A7grNN3fjT5APsim8UnGa
 +zxV1iqZ+zpTMIeCqXLnYMNDFCCw8qN+ibgwCyJ87uXtUNSXdcMeghiRMlApPdVEPqMR
 Wv4F29vavUPKXXF2R3sUoMUeuPQTZvOC41CG0eqWl+K1GskuNUD1h5AwX+hITB1xmq5o
 CosA==
X-Gm-Message-State: APjAAAVKgzcfHkJwuXFRshHQGfT5hM+lY7WRHAgS72ojB+0SNI9JLJUp
 ugd4ychY4SWx1y/go1r3OY7zS7mt+GI0jYRkehIwKKXeOb2AfRDYSPDWRE2nCQ/1te6kNTJP/mB
 qk4/SE4VTrvtOcmnSaQ==
X-Received: by 2002:a05:600c:507:: with SMTP id
 i7mr11403050wmc.135.1575641715948; 
 Fri, 06 Dec 2019 06:15:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvIUsEdxu0K846Mk45UXUhL4OMf5SYJAOiBYrBCNn1AY7jTO9W9M5gDgrE/cWIXx/FlNUv7A==
X-Received: by 2002:a05:600c:507:: with SMTP id
 i7mr11403035wmc.135.1575641715762; 
 Fri, 06 Dec 2019 06:15:15 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id e16sm3445854wme.35.2019.12.06.06.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2019 06:15:15 -0800 (PST)
Subject: Re: [PATCH] mailmap: Add entry about me
To: Yu-Chen Lin <npes87184@gmail.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191206140931.14133-1-npes87184@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bd91caac-86c5-54a6-080d-37909b91a656@redhat.com>
Date: Fri, 6 Dec 2019 15:15:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191206140931.14133-1-npes87184@gmail.com>
Content-Language: en-US
X-MC-Unique: NtoquQYpMXarlrmajqyvIg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
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
X-List-Received-Date: Fri, 06 Dec 2019 14:15:23 -0000

Cc'ing qemu-trivial@

On 12/6/19 3:09 PM, Yu-Chen Lin wrote:
> I have two mail address, add entries for
> showing author and email correctly.
>=20
> Signed-off-by: Yu-Chen Lin <npes87184@gmail.com>
> ---
>   .mailmap | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/.mailmap b/.mailmap
> index 3816e4effe..3fbf3902a3 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -151,7 +151,8 @@ Xiaoqiang Zhao <zxq_yx_007@163.com>
>   Xinhua Cao <caoxinhua@huawei.com>
>   Xiong Zhang <xiong.y.zhang@intel.com>
>   Yin Yin <yin.yin@cs2c.com.cn>
> -yuchenlin <npes87184@gmail.com>
> +Yu-Chen Lin <npes87184@gmail.com>
> +Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>

Thanks for updating your entry in .mailmap!

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

>   YunQiang Su <syq@debian.org>
>   YunQiang Su <ysu@wavecomp.com>
>   Yuri Pudgorodskiy <yur@virtuozzo.com>
>=20


