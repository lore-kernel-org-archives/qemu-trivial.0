Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifktc-0001Q5-Se
	for mharc-qemu-trivial@gnu.org; Fri, 13 Dec 2019 08:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ifktZ-0001Ne-K2
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 08:22:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ifktY-0007kV-Jn
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 08:22:13 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33226
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ifktY-0007jn-G8
 for qemu-trivial@nongnu.org; Fri, 13 Dec 2019 08:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576243332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jgspVajfgjE42ZvZQfn/amiK0x8QorJMMvgrfevHDE=;
 b=NTvpi8DVpzy9IXKb77VfiVwD8wtFoWZ8vTM8q4jRJCsJXTpJGz5qj5QAkqXYJ6vJoFwxzY
 ldrlzqdV02XzyPe/5S0aWvn/m3e1123sZgzgnNHY8/Z/+g9jGZzLproQBP29ZxYi4v/0Lr
 0cSH9qb8oSpSmY4Mi98R7/PvhXn7fIQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-jB4WJv4uMlulFaRHSeGn0A-1; Fri, 13 Dec 2019 08:22:10 -0500
Received: by mail-wr1-f72.google.com with SMTP id z15so2596924wrw.0
 for <qemu-trivial@nongnu.org>; Fri, 13 Dec 2019 05:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VY/4rF+g3Stxjk2j0HlkvEIE4fBT/7Xv9T82Gu/sONg=;
 b=B55BUpevLFb7fjGIOxxvvPNNJZG/DhQwljVF7HKwJ/a3hgwinavZYZ5sAWmuvek0FW
 jecKVoeNg3YZKhbgRll6WI3aAmBG6mvZF2KObftrb4kYllBw9fGcacRVWiPM+9zpLfNo
 wSoTcNcfwKtlkE6786I9gJgd5kp/w0mH1E12f+CDglcTcfvnz4p4bLW8+Ck9Rlax+BRZ
 f+YB6YehijZyjILIpca+uuBMMYrmRI4bHPQ52+YuN+5Dzny1Br9/dzVYhAW7osUvrBDS
 W/Uyl+wlL3CoGVJrHLlYPaff5PKB2Xbz6xF+tuj5Y8vHXBPrCh/jfULj7A5y6KsVl6Oy
 LwKQ==
X-Gm-Message-State: APjAAAWP5xdzJZqWbMg71mPYUnFzxeTl6aAdoU/ue0LIP9zIEaeweKIm
 SQmyobSSDUQGXQyGL56GbT59hkJpjf/TDp+k2SZ3H6FHGFDs7xN1m1zDoj0cl/el1UWBPFXJFCT
 roXvAylQSuvuJzt+n/Q==
X-Received: by 2002:a1c:6585:: with SMTP id
 z127mr13324493wmb.113.1576243329372; 
 Fri, 13 Dec 2019 05:22:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrPpDti4gPsctX5koB9VTm1Tquxj03KYjvJPGJQKBSDmkVKjKjnaXIWDgcfvBIr4GAcm2yzA==
X-Received: by 2002:a1c:6585:: with SMTP id
 z127mr13324458wmb.113.1576243328984; 
 Fri, 13 Dec 2019 05:22:08 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id c9sm9823992wmc.47.2019.12.13.05.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 05:22:08 -0800 (PST)
Subject: Re: [PATCH] hw/isa/isa-bus: Use ISA_NUM_IRQS instead of magic number
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <20191213105921.9529-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0be14c5f-4d19-e633-8ed7-47bf99e632d9@redhat.com>
Date: Fri, 13 Dec 2019 14:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213105921.9529-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: jB4WJv4uMlulFaRHSeGn0A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 13 Dec 2019 13:22:15 -0000

On 12/13/19 11:59 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> We have a definition for the number of ISA IRQs, use it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   hw/isa/isa-bus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 388800603b..1d79ed133c 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -85,7 +85,7 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
>   qemu_irq isa_get_irq(ISADevice *dev, int isairq)
>   {
>       assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) =3D=3D isa=
bus);
> -    if (isairq < 0 || isairq > 15) {
> +    if (isairq < 0 || isairq > >=3D ISA_NUM_IRQS) {

Oops, Pablo was quicker than patchew to notice this buggy patch =3D)

I messed when copy/pasting from a bigger series :/

So no need to review further.

>           hw_error("isa irq %d invalid", isairq);
>       }
>       return isabus->irqs[isairq];
>=20


