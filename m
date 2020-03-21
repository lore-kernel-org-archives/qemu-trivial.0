Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFetN-00039D-BC
	for mharc-qemu-trivial@gnu.org; Sat, 21 Mar 2020 10:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFetK-00036F-IT
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFetJ-0008Ld-Dq
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:14:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:20982)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFetJ-0008LC-Al
 for qemu-trivial@nongnu.org; Sat, 21 Mar 2020 10:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584800061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4YPJfNJi4WWcG7pY6jdJqKE/BIVLG+Ljgkk1E7R0Ec=;
 b=DP6uspuwRS9Ys3eXDtTTmmPAyKnIvhrxb4LgKQ7XlVspGqV4iERQcLImylfq/vIUoyR+j1
 NHkpOKQ7kHVj+xUBs0iJF3kXDpg6qpzxbFDnIT6Q4LilIWfltSuYtnSiPlHlsf+s8nC5gG
 XDaLXhbmQ3g4So2QQF6597/GEMiO/KE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-YdyU3mTBObSMa72WlIa5Gg-1; Sat, 21 Mar 2020 10:14:19 -0400
X-MC-Unique: YdyU3mTBObSMa72WlIa5Gg-1
Received: by mail-ed1-f71.google.com with SMTP id i10so7575747edk.13
 for <qemu-trivial@nongnu.org>; Sat, 21 Mar 2020 07:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qt1rHCnwTVKvmp4ECYAy2Qr+S1/Jr4/xJXDIyI0NVHs=;
 b=o+5F8SqsCKhXU2WALpulG+fs4koIyZqNoZfNTSwUepcUPkWLuxCfUqugHrhx4tuFRX
 1Z5ouXlNp/YC8Bm3XtDGFsImm/9qH0TjhXkGIWb0A3Og3z4rEYEX6vE1wh3Zgy58Ie3p
 LiBnT47NFlL5UhilsJ4peUzjy8/4BGsptEnVjDShcqz2yA0sBfd9+EVRDI4xqWdFikz5
 g7L3CjG3qdw/NaJyR4VIFdiKdQGrbBqvh7CdzMgkmoL/2pU6SyDidJ+tOswdHy7iOQHK
 TXWf1TcQwP6XGchSqVkvow3ba0INS59iqB0yWb3X/yFECC3zLPENyELYl9yhW9HN6AeP
 58oQ==
X-Gm-Message-State: ANhLgQ0SqETzg3vHs5RmDTi1r32H8AnFjj5nPFqGVNjrmrlPWUFiV43b
 Oht0mu1MxDVvRReTa96NMqtVCxrcvUaSujF+7hFXz8A9+ap5zz6BKcNHrYK8f9rilerE+T2HnOt
 ZVHP6xslIiBMNA8FXfQ==
X-Received: by 2002:a17:907:2154:: with SMTP id
 rk20mr2095860ejb.298.1584800058080; 
 Sat, 21 Mar 2020 07:14:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv/Y2nCgu7P2p3jdGiuanAi4R5EOhRMe94mLPQttnahOfgMryMxlRLU5XoHsDht2tMQ2SwBWg==
X-Received: by 2002:a17:907:2154:: with SMTP id
 rk20mr2095843ejb.298.1584800057627; 
 Sat, 21 Mar 2020 07:14:17 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id z22sm599472edl.6.2020.03.21.07.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:14:17 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <02375897-b520-fefb-a141-c013d29bde28@redhat.com>
Date: Sat, 21 Mar 2020 15:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Sat, 21 Mar 2020 14:14:23 -0000

On 3/21/20 2:39 PM, Aleksandar Markovic wrote:
>=20
>=20
> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om=20
> <mailto:philmd@redhat.com>> wrote:
>=20
>     Fix warning reported by Clang static code analyzer:
>=20
>      =C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 hw/ide/sii3112.o
>      =C2=A0 hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is nev=
er read
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=C2=A0 =C2=A0 =C2=A0~
>=20
>     Reported-by: Clang Static Analyzer
>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
>     ---
>      =C2=A0hw/ide/sii3112.c | 2 +-
>      =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>     index 06605d7af2..36f1905ddb 100644
>     --- a/hw/ide/sii3112.c
>     +++ b/hw/ide/sii3112.c
>     @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque,
>     hwaddr addr,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D (uint32_t)d->regs[1].sien =
<< 16;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>      =C2=A0 =C2=A0 =C2=A0default:
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>=20
>=20
> There is another function in the same file, having a similar switch=20
> statement. There is no warning for that second tunction, since "val" is=
=20
> its parameter, not a local varioble, like is the case here. This means=20
> that the proposed change introduces inconsistency between two functions,=
=20
> therefore it is better to remove the initialization of "val" to 0, than=
=20
> to remove this line in "default" section.

No clue why there is no warnings emitted for sii3112_reg_write()...

Do you mind sending a patch?

>=20
> Regards,
> Aleksandar
>=20
>      =C2=A0 =C2=A0 =C2=A0}
>      =C2=A0 =C2=A0 =C2=A0trace_sii3112_read(size, addr, val);
>      =C2=A0 =C2=A0 =C2=A0return val;
>     --=20
>     2.21.1
>=20
>=20


