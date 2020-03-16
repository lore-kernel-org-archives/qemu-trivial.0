Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDp0R-0001Dv-M9
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2020 08:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jDp0P-0001Ct-5v
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2020 08:38:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jDp0N-0003Bb-PF
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2020 08:38:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44103
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jDp0N-00034O-Ik
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2020 08:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584362283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8s1pbMd8HiFdjP0FyxZTLEw+ccXxxpvBh8ui/fgRtc=;
 b=U6o43tBET/rNDe8frZqNUubrr7WMnO818C4uBLnqbe+rpCgwGJS1ZC5F7I5i275NB0fKca
 no3rn2f979H4mdHSPBoCMmqg/drMp52W1s4qDsCTNWPbA1H0E/PCd6Si7NEza6CvJkCyiu
 05HIz0ukPcbVtN4c+ywx9brqngIFi6o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-PZU8zLqiMuOa3r7z0ltOhA-1; Mon, 16 Mar 2020 08:38:01 -0400
X-MC-Unique: PZU8zLqiMuOa3r7z0ltOhA-1
Received: by mail-wr1-f71.google.com with SMTP id b11so8945777wru.21
 for <qemu-trivial@nongnu.org>; Mon, 16 Mar 2020 05:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=74Ivas21HF4MoE96e8hQMSlPbRf3Nzcooh5m6Iuis2I=;
 b=Nggfy+kQM1bO6rjjmG7HCy/pNGvB8WZg/0FpMVgJqW0h/8We+cHuzwovfxf6kp71Tr
 vzIXb3NcQOdCkfhx8WdPhPUKzAASCgleIx+JHqHWygTWKGnQMqb3KoEGGjbj2WDcAh1F
 +OW9PGi8rPSrh8zhDT6bifAY9N2TIyHLqr0zTOHmHKTs82dH9Z23qlUxXM7thl6gnEnl
 rW9T02/TDTAzfpinx1VPqrRLz9opMtusLg6zvwG10Evcsj4IJF3ELUyZ4Tm8dhYNdGJ2
 wjFXpOA4IjksVd5r4OR9I4L1A+4fE+Ilfhy+zfxjeIahOtZlki5kHv+tT/iOCeh/JFgS
 2DVg==
X-Gm-Message-State: ANhLgQ3oikktLFpLwoIpzNnR3aRcfKAGJOUzCF79rPkuzb9UeernGGvd
 AeCGYbxMnu6qlZo1VXQeJU7Aem6tPqGAiPk9gwxeGROjyYGVqw6XBkuhS5P4c2X2cHXh7h1WKfX
 X7KArPsYDaqGU1Fj2QA==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr12780727wro.255.1584362280331; 
 Mon, 16 Mar 2020 05:38:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vttllZIVd7rfj2P3jTwFi9aXCPgkpbu9vI1mAOa6elnistYO5w6CJRc6xKANCZ/RXsdh2i4QQ==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr12780704wro.255.1584362280120; 
 Mon, 16 Mar 2020 05:38:00 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.82.39])
 by smtp.gmail.com with ESMTPSA id v2sm6948546wrt.58.2020.03.16.05.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 05:37:59 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Mark the LatticeMico32 target as orphan
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?B?w4Frb3MgS292w6Fjcw==?= <akoskovacs@gmx.com>,
 qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Richard Henderson <rth@twiddle.net>, "Emilio G . Cota" <cota@braap.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20200316122641.14017-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ca8fb038-43e4-d702-5ebc-bcc78b99445b@redhat.com>
Date: Mon, 16 Mar 2020 13:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316122641.14017-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Mon, 16 Mar 2020 12:38:07 -0000

On 16/03/20 13:26, Philippe Mathieu-Daud=C3=A9 wrote:
> Michael Walle expressed his desire to orphan the lm32 target [*]:
>=20
>   I guess it is time to pull the plug. Mainly, because I have
>   no time for this anymore. I've always worked on this on my
>   spare time and life changed. And secondly, I guess RISC-V is
>   taking over ;) It has a far better ecosystem. Also, to my
>   knowledge the only (public) user of LM32 is milkymist and this
>   project is dead for years now..
>=20
>   So time to say goodbye. It was fun and I've learned a lot -
>   technically and also how a huge open source project works.
>   Thank you everyone for that :)
>=20
>   Basically everything still works and there are even TCG test
>   cases which covers all instructions the processor has.
>=20
> Many thanks to Michael for his substantial contributions to QEMU,
> and for maintaining the LM32 target for various years!
>=20
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg605024.html
>=20
> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Michael: Do you want to keep your M: entry, switch it to R: or remove?
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32867bc636..5376c59581 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -184,7 +184,7 @@ F: include/hw/net/lasi_82596.h
> =20
>  LM32 TCG CPUs
>  M: Michael Walle <michael@walle.cc>
> -S: Maintained
> +S: Orphan
>  F: target/lm32/
>  F: disas/lm32.c
>  F: hw/lm32/
>=20

Cc: qemu-trivial@nongnu.org


