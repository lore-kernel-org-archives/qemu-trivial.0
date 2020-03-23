Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGPRf-0007Is-TH
	for mharc-qemu-trivial@gnu.org; Mon, 23 Mar 2020 11:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGPRd-0007FE-CA
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 11:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGPRc-0003iY-BQ
 for qemu-trivial@nongnu.org; Mon, 23 Mar 2020 11:56:53 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:36388)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGPRY-0003gE-7A; Mon, 23 Mar 2020 11:56:48 -0400
Received: by mail-ua1-x941.google.com with SMTP id o15so3297539ual.3;
 Mon, 23 Mar 2020 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9sdYk+m9VIBNOHQO5FBubdeWBpMknt0oInCQuRCvabk=;
 b=HcvVC9rSVzeRmghwV0dJsoagZ9/o/EtcUICpPdEIItvD2CqprcMlHNhVhCnPJJc5Tx
 3KOABXPct/V6qgxgaWbeDQzF3wmc+p90p0SfGgCKsHr1WzlXcq23piVpb+ec2qkDNljR
 kW+b5UlTu44XqnxCgwSQhU116gSDExzlDkwzciQK4y8hN41rAr9ETxr4dY8DDWUSFFD+
 Q8zR8vUkJLDb8SIT+EboUmo+QwO1Fqfaq+LpSv8gCPnsPnDOdBuffmdhM3aYVB354Koq
 iQ5zOQrKZPQY0ioj6PmUQIl7ahzn7ohtnG+6QijI8n/hcVbEZtmjbHNTa8wLxFsw2yf+
 hw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9sdYk+m9VIBNOHQO5FBubdeWBpMknt0oInCQuRCvabk=;
 b=uGGR7pdo/lPhesTzHc7maVYJiL4IEOd0WI4iGjtz+b0xXvxLE/tH7HOO+9rByErCin
 bUy32z3O3T3J8N67Bq29HV9IuCV/Gv0uPrEfCCWs1htCiqf1A25CRHEp+8vvfoUNLQ+P
 O+zAAIjDMRH5G/TzNPxmAVxRoudac65zuf8zjSlNQyNY453/a8MnC3ZeJIX8mHitlGEU
 tEM56F/RtBmS50MkWc/r7hzAURSMFu1ZV6djhDIXNBGqByo2y6vjBB0+mmw0pHy7yxK1
 x2SVHNBwunQ2tV3TfjeM7AYG5EefGkzwZIViysPWz0CfLZDOWsGso68PERjYHV/MUNTR
 puhw==
X-Gm-Message-State: ANhLgQ1e+CPpsiJOHeLqDB4lsdO4No9Z5vHwn2T26mbhJJoElu5lkTpi
 GzYfCT3JPqqt9mLzHMmrN7fYybPZq5wjJ5hQtfI=
X-Google-Smtp-Source: ADFU+vtOwLMb9HGc6CN/cWNb7fSM7pmdgHKEIBBxBnPDn2LA/MTGjSUMAZ/YRuwR1jOpP1uIuVhfxe5ZMREElC5HTMg=
X-Received: by 2002:a9f:2964:: with SMTP id t91mr7715691uat.21.1584979005734; 
 Mon, 23 Mar 2020 08:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-2-philmd@redhat.com>
In-Reply-To: <20200321144110.5010-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Mar 2020 08:48:47 -0700
Message-ID: <CAKmqyKNRs-ARh9vcV_TywnM1dBfQtMfUXV94sHTjY2BSE7=4hQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 v2 01/11] block: Avoid dead assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Fam Zheng <fam@euphon.net>, 
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Qemu-block <qemu-block@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, 
 Max Reitz <mreitz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::941
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
X-List-Received-Date: Mon, 23 Mar 2020 15:56:54 -0000

On Sat, Mar 21, 2020 at 7:42 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Fix warning reported by Clang static code analyzer:
>
>   block.c:3167:5: warning: Value stored to 'ret' is never read
>       ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
>       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: 462f5bcf6
> Reported-by: Clang Static Analyzer
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Keep 'ret' assigned and check it (Markus)
> ---
>  block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block.c b/block.c
> index a2542c977b..a6f069d8bd 100644
> --- a/block.c
> +++ b/block.c
> @@ -3165,7 +3165,7 @@ static BlockDriverState *bdrv_open_inherit(const ch=
ar *filename,
>      }
>
>      ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
> -    if (local_err) {
> +    if (ret < 0) {
>          goto fail;
>      }
>
> --
> 2.21.1
>
>

