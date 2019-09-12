Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8Q9U-000480-3B
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2019 10:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i8Q9Q-00044R-QE
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 10:32:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i8Q9P-0004w5-Fn
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 10:32:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i8Q9P-0004vD-8U
 for qemu-trivial@nongnu.org; Thu, 12 Sep 2019 10:32:47 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 99BCA3D962
 for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2019 14:32:45 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id t11so915288wrq.19
 for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2019 07:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fsKGarDdOH4J1O22Ov2Gr4Nd6iGJTKt/UHb4EhrpL4=;
 b=TkEtwVwZxLnXL85sh9BaFepvDGi3a+E0POnaRiMudatcubMKUQXSzWwKcHPNy0NinZ
 bZfebmdgFp55Ri0PyKFH+JQgunR7/Zyyi+1I93GOOMYpvsLuL55lOZR171b1XEDl0gEL
 Kf1i2HgG+8UM/8KpI06BJarxJA3D8/yx3dDsd0zPc0jgQ1lLKs3Li7mzyYuGOzupQvPX
 byTEQ4qndfZU8Hnpdnue/7MzHYSuucwo61Rgl5cFk0/G9vVuDwR8sBqaxjVCDdL4xl4F
 RC8BgYI/AkCUmtQ+H0qLy5skXMNZl4OT1qraA4NgV83UPQb2mjYYtJuj/Fc8zzAGFCmo
 ZEGA==
X-Gm-Message-State: APjAAAVktWY5E9Bw0udrcI9ZdTMmHH8jXVQDHriW1UFvg6poLK6GTVtM
 d2rLDxHmT5hTfZ2TMgmFlHbz10RZoHLzkjjHWegUTyRsd5y537XLWzSL4tOaoktgJJy2/va8Z6s
 5cdaQCadfzQnsyCwU9A==
X-Received: by 2002:a1c:a8d8:: with SMTP id r207mr229437wme.135.1568298764398; 
 Thu, 12 Sep 2019 07:32:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7XdRgDSEBbgAlvZKjbLn6WPBMYqo4eUT+j4JjTxLpzZRjJc+tfuEjfLjoX8nuxGYrethGFA==
X-Received: by 2002:a1c:a8d8:: with SMTP id r207mr229408wme.135.1568298764151; 
 Thu, 12 Sep 2019 07:32:44 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id v8sm39210512wra.79.2019.09.12.07.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2019 07:32:43 -0700 (PDT)
To: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <1568296920-29939-1-git-send-email-frederic.konrad@adacore.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ca55df80-6461-9650-f2e4-b2136d54adc3@redhat.com>
Date: Thu, 12 Sep 2019 16:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1568296920-29939-1-git-send-email-frederic.konrad@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/m68k/fpu_helper.c:
 rename the access arguments
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
X-List-Received-Date: Thu, 12 Sep 2019 14:32:50 -0000

On 9/12/19 4:02 PM, KONRAD Frederic wrote:
> The "access" arguments clash with a macro under Windows with MinGW:
>   CC      m68k-softmmu/target/m68k/fpu_helper.o
>   target/m68k/fpu_helper.c: In function 'fmovem_predec':
>   target/m68k/fpu_helper.c:405:56: error: macro "access" passed 4 argum=
ents,
>    but takes just 2
>                size =3D access(env, addr, &env->fregs[i], ra);
>=20
> So this renames them access_fn.

access() is not your friend... this reminds me of

commit 05e015f73c3b5c50c237d3d8e555e25cfa543a5c
Author: KONRAD Frederic <frederic.konrad@adacore.com>
Date:   Thu Sep 21 12:04:20 2017 +0200

    memory: avoid a name clash with access macro

    This avoids a name clash with the access macro on windows 64:

    make
            CHK version_gen.h
      CC      aarch64-softmmu/memory.o
    /home/konrad/qemu/memory.c: In function 'access_with_adjusted_size':
    /home/konrad/qemu/memory.c:591:73: error: macro "access" passed 7
arguments, \
                     but takes just 2
                     (size - access_size - i) * 8, access_mask, attrs);
                                                                     ^
>=20
> Tested with:
>  ./configure --target-list=3Dm68k-softmmu
>  make -j8
>=20
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  target/m68k/fpu_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
> index 9b039c8..4137542 100644
> --- a/target/m68k/fpu_helper.c
> +++ b/target/m68k/fpu_helper.c
> @@ -396,14 +396,14 @@ typedef int (*float_access)(CPUM68KState *env, ui=
nt32_t addr, FPReg *fp,
>                              uintptr_t ra);
> =20
>  static uint32_t fmovem_predec(CPUM68KState *env, uint32_t addr, uint32=
_t mask,
> -                               float_access access)
> +                              float_access access_fn)
>  {
>      uintptr_t ra =3D GETPC();
>      int i, size;
> =20
>      for (i =3D 7; i >=3D 0; i--, mask <<=3D 1) {
>          if (mask & 0x80) {
> -            size =3D access(env, addr, &env->fregs[i], ra);
> +            size =3D access_fn(env, addr, &env->fregs[i], ra);
>              if ((mask & 0xff) !=3D 0x80) {
>                  addr -=3D size;
>              }
> @@ -414,14 +414,14 @@ static uint32_t fmovem_predec(CPUM68KState *env, =
uint32_t addr, uint32_t mask,
>  }
> =20
>  static uint32_t fmovem_postinc(CPUM68KState *env, uint32_t addr, uint3=
2_t mask,
> -                               float_access access)
> +                               float_access access_fn)
>  {
>      uintptr_t ra =3D GETPC();
>      int i, size;
> =20
>      for (i =3D 0; i < 8; i++, mask <<=3D 1) {
>          if (mask & 0x80) {
> -            size =3D access(env, addr, &env->fregs[i], ra);
> +            size =3D access_fn(env, addr, &env->fregs[i], ra);
>              addr +=3D size;
>          }
>      }
>=20

