Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWg6j-0003eG-OR
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 07:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWg6h-0003cv-HT
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 07:26:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWg6g-0001hT-BP
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 07:26:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45128
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWg6g-0001h4-87
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 07:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574079973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ib5KKhD5HJk0z9NsNcG+DYUAl/uqORxihVH5ZKzHyY8=;
 b=RXDCWoEsZrq/bpVUk4YeDQG3qzCLL3H2mL7q2qJA9EdVwpR5t/RXrvH7MePE5avQ+HxwOB
 OF5TQmQEzJ1vGIUQsyWTMQsHI1twsU6x8YsF7SqsRAhgJtJMeZ6E+AchUq6eI30O/lKg+f
 ngokjayWgUNaEsSfVK0fM4qLgq/y/dM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-5JbCUWxbM0O-PuTWt-cCSg-1; Mon, 18 Nov 2019 07:26:11 -0500
Received: by mail-wm1-f72.google.com with SMTP id y14so13040269wmi.4
 for <qemu-trivial@nongnu.org>; Mon, 18 Nov 2019 04:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k3zctEOJ/bTdP4mIF4ywjSUD0sBgS+dq3Ce/p9kgI94=;
 b=eWRwWMKAfjh/F9VHOFPgHyGSP7drITHDRYacCimFzA93muQOazY8h1RJbcncbhM0gX
 qAEEj6VFDHzqotL1gM77/5eStGlAAL9+ehmCjOZc4kXMZctUDVOurPrZU1v4vJZwC4qT
 f2BPSLph1gx4ycIIbPm1GItvwFAqivMLYKX3W/EbxgZ3XlmzGz5Y8H9JrlLSDGMf0IcZ
 s+x9xnLFU74z56dlSQJp1sGK7Xw7zWBq2qPLMWOvpwUIO62lkfXsiG5t4JL3/0zjUC1H
 rneAL9E628itgC6yT+XIVLROgCWTHJPOS/naZMbOnR+mpcA5Nfd5q/Vco+IwdXEcUmsu
 po/A==
X-Gm-Message-State: APjAAAUNwYl33zMPR7eJzG/7BKyEPkR9SLFMiDD9d6Rm46EU4BCRyaIj
 JB1P+FBb/M8KHcTYsK3AsH+eP5zxFAJi1O0hi/UdBqNX6x4ZxP918TsZWVdHTxxUW88XY7GKXuK
 aUfN8IYyu2HWURwtrlQ==
X-Received: by 2002:a1c:7701:: with SMTP id t1mr31250541wmi.113.1574079970156; 
 Mon, 18 Nov 2019 04:26:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJV0z2Tj4vVSxYg6gLNZzLq/P82KJ0E/dg75/0Qg/iEV1tGkQ+weouSCb9xyAvPP0b9FBYZQ==
X-Received: by 2002:a1c:7701:: with SMTP id t1mr31250514wmi.113.1574079969955; 
 Mon, 18 Nov 2019 04:26:09 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id d7sm23350868wrx.11.2019.11.18.04.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 04:26:09 -0800 (PST)
Subject: Re: [PATCH 1/3] MAINTAINERS: Add hw/sd/ssi-sd.c in the SD section
To: qemu-devel@nongnu.org
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191012065426.10772-1-philmd@redhat.com>
 <20191012065426.10772-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <46d94900-e916-54e2-06e6-1963fbed3bb8@redhat.com>
Date: Mon, 18 Nov 2019 13:26:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191012065426.10772-2-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 5JbCUWxbM0O-PuTWt-cCSg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Mon, 18 Nov 2019 12:26:16 -0000

Cc'ing qemu-trivial@

On 10/12/19 8:54 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> The hw/sd/ssi-sd.c file is orphean, add it to the SD section.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ca814850e..47eae9fc46 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1445,6 +1445,7 @@ S: Odd Fixes
>   F: include/hw/sd/sd*
>   F: hw/sd/core.c
>   F: hw/sd/sd*
> +F: hw/sd/ssi-sd.c
>   F: tests/sd*
>  =20
>   USB
>=20


