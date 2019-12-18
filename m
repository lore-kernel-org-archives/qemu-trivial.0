Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihWU6-000655-NM
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 05:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihWU4-00062G-4U
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 05:23:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihWU2-00083R-U9
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 05:23:12 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33225)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihWU2-00080G-PG
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 05:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576664590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpdCi1Vs5Sx99MRuyxpOGtmz6PhoFr8L0o1+pOaA+HM=;
 b=bsLfoVPedZzvg7cuLcJJwORqORCAEr9Wbvn6rgptKErCisegJvhpv+twYL4C7wId4x84mJ
 1Kx7k2X7BcIfv2HM/gFxZgyPIJNylsY9XLLvWoXmTK0qgtUnN4LpyWGjetEle43udzwIwr
 wacdtpAcG3hv940OJ68qU1R3cEWYQms=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-wQ1BYVyEPGOFK0zQVssbVA-1; Wed, 18 Dec 2019 05:23:06 -0500
Received: by mail-wr1-f69.google.com with SMTP id o6so684909wrp.8
 for <qemu-trivial@nongnu.org>; Wed, 18 Dec 2019 02:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PkL8wZtfB33r50sUpWg026bN3R6UzcewUQVBMO7Orzg=;
 b=eST3FyW/t+VBVdphajO2vwg13dkvXS+OYkzOh3D0IrV+Mx0Qn8jD7Tck9/vZ/E151w
 P6WzZueknxy5vEZHmqv7YY+oqBDnQXwUXy8utN51Ma0DTgXYPxArwYBNk/sWnkdIK7rJ
 FNBnfY58nY9JPepc+uXbzkiflWJvJa/XIVM9tLOUtqLiry67WL7p/IAygZyWv9zNNQ1Z
 +mh6BMwv+m+DLRlaXZ/wgT2fZxo5pxrpKw7+kZIKX9sLTjC78Eu4w0hDrJo2fjn1SffZ
 p7rqBXR7DxdedOVPMTeW9r5MFXQSHgA/cQ1VceX/ZyaSS2n0b9H/IqrJpJaV0/5FdJlh
 Fhvg==
X-Gm-Message-State: APjAAAWkA5xhX9r3PZRcPFqSNYg138OyDn7rGFWGcVh8QsKuy887y1+m
 uiVcFkwKu8rfTakYEhzvDmu83M5BJLwT5+U6CXgbKP7L0UILVH9pSx7u9EkRlpLL3y74+ymp/A7
 XAI+n9Vmcnnoe9ks7qA==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr1862369wrq.332.1576664585741; 
 Wed, 18 Dec 2019 02:23:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSTSWOSUaG4kA8hkaj3lJwpt1r0BiKPaf0Bg1q64BBFRNodVTgQ3RWOstxB963DB6VF/2TmA==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr1862335wrq.332.1576664585415; 
 Wed, 18 Dec 2019 02:23:05 -0800 (PST)
Received: from [192.168.23.166] (40.red-88-21-19.staticip.rima-tde.net.
 [88.21.19.40])
 by smtp.gmail.com with ESMTPSA id w22sm1875036wmk.34.2019.12.18.02.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 02:23:04 -0800 (PST)
Subject: Re: [PATCH 2/6] hw/display/tcx: Add missing fall through comments
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Olivier Danet <odanet@caramail.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-3-philmd@redhat.com>
 <CAL1e-=gPi2C41Lc7cOQnTP+gL3aW=yWpQvamzTSfdDCJOK5BEA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d1234e8e-4ab8-eded-c0c3-8b9c0946fdf5@redhat.com>
Date: Wed, 18 Dec 2019 11:23:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAL1e-=gPi2C41Lc7cOQnTP+gL3aW=yWpQvamzTSfdDCJOK5BEA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: wQ1BYVyEPGOFK0zQVssbVA-1
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
X-List-Received-Date: Wed, 18 Dec 2019 10:23:13 -0000

On 12/18/19 8:54 AM, Aleksandar Markovic wrote:
>=20
>=20
> On Tuesday, December 17, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com=20
> <mailto:philmd@redhat.com>> wrote:
>=20
>     GCC9 is confused by this comment when building with
>     CFLAG -Wimplicit-fallthrough=3D2:
>=20
>      =C2=A0 hw/display/tcx.c: In function =E2=80=98tcx_dac_writel=E2=80=
=99:
>      =C2=A0 hw/display/tcx.c:453:26: error: this statement may fall throu=
gh
>     [-Werror=3Dimplicit-fallthrough=3D]
>      =C2=A0 =C2=A0 453 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
->dac_index =3D (s->dac_index + 1) & 0xff; /*
>     Index autoincrement */
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>      =C2=A0 hw/display/tcx.c:454:9: note: here
>      =C2=A0 =C2=A0 454 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~=
~~
>      =C2=A0 hw/display/tcx.c: In function =E2=80=98tcx_dac_readl=E2=80=99=
:
>      =C2=A0 hw/display/tcx.c:412:22: error: this statement may fall throu=
gh
>     [-Werror=3Dimplicit-fallthrough=3D]
>      =C2=A0 =C2=A0 412 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->dac_index =
=3D (s->dac_index + 1) & 0xff; /*
>     Index autoincrement */
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~=
~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>      =C2=A0 hw/display/tcx.c:413:5: note: here
>      =C2=A0 =C2=A0 413 |=C2=A0 =C2=A0 =C2=A0default:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~~~~
>      =C2=A0 cc1: all warnings being treated as errors
>=20
>     Add the missing fall through comments.
>=20
>     Fixes: 55d7bfe22
>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
>     ---
>     Cc: Olivier Danet <odanet@caramail.com <mailto:odanet@caramail.com>>
>     Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk
>     <mailto:mark.cave-ayland@ilande.co.uk>>
>     ---
>      =C2=A0hw/display/tcx.c | 2 ++
>      =C2=A01 file changed, 2 insertions(+)
>=20
>=20
> The content of the patch is fine, but the commit message is, I think,=20
> inacurate: gcc is not confused at all, it does what it was told to.

You are correct, I'll update the comment.

> The title is fine.
>=20
>     diff --git a/hw/display/tcx.c b/hw/display/tcx.c
>     index 14e829d3fa..abbeb30284 100644
>     --- a/hw/display/tcx.c
>     +++ b/hw/display/tcx.c
>     @@ -410,6 +410,7 @@ static uint64_t tcx_dac_readl(void *opaque,
>     hwaddr addr,
>      =C2=A0 =C2=A0 =C2=A0case 2:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D s->b[s->dac_index] << 24;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->dac_index =3D (s->dac_index + 1=
) & 0xff; /* Index
>     autoincrement */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */
>      =C2=A0 =C2=A0 =C2=A0default:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->dac_state =3D 0;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>     @@ -451,6 +452,7 @@ static void tcx_dac_writel(void *opaque, hwaddr
>     addr, uint64_t val,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->b[index] =3D val =
>> 24;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_palette_entri=
es(s, index, index + 1);
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->dac_index =3D (s-=
>dac_index + 1) & 0xff; /* Index
>     autoincrement */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->dac_state =3D 0;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>     --=20
>     2.21.0
>=20
>=20


