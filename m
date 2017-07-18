Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQMT-0003EP-6C
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQMQ-0003CO-VA
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQMQ-0005oA-0N
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:08:14 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34726)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQMP-0005nZ-PC; Tue, 18 Jul 2017 07:08:13 -0400
Received: by mail-lf0-x243.google.com with SMTP id p11so1409786lfd.1;
	Tue, 18 Jul 2017 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JmgL36IQlydpXzTURpSBGtcZoXd+EOH4sQbB7XVwXDU=;
	b=Ly3O0YTazkFTfOqSoWSGh39AbhH71YMvAJz7NqSAocaWlc1sB/+6LNenuQ0kn+NJ4N
	lhtPf7yCEfQhvLlnVAA5XYF5PNnEr8skfuEA3YXrgVWn88n1VJOgPN1jNEgXWjgspKCh
	czDloMBHTTuhy27JX77bauxqlk3bYVRRYGiigxp88GC+3ZOjk4TexazltNWe9hTQSUnd
	hygbBsGn506C5BhWeQ/xaOW7h9mO59/Me7PZA1fKa7lgraBbMc4jsEl4CKMj0aAMYNyw
	FJqIYNDTFayFzeRXoli/A9L9CPkxNbgSfX2XqfbF580c8ZblrPfNESdZetFqxY1zqv6D
	F84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JmgL36IQlydpXzTURpSBGtcZoXd+EOH4sQbB7XVwXDU=;
	b=S8bliMGQxZzfq+vzsVoVVLoAFzT3WWpA1J0mSxqCtQRZWP+zTnYEB5yenQdezBfxg1
	BPlYsg3nB9lTs7wS74cI2hVOah5reudMfibe91FSurIjz2NEmGnnIFMaabruU5tF/yxm
	nsdQvemcWrRRlt9IITxPvIN+ophLP3ymK7ooNo5iVLnq+ibACzS6HqcXH0yC5OhvC+UF
	euU7yB/B5mSh7WhpXQ43/0t5nccW82iUjvyXkvt0U4sYBXkccqK/ODJ6GAVelZaBnUtQ
	3y5sCE4ybV+CRV9b7mDixrrKRL8f5heUvgTBrAK4Te7sfP947kS9X52n7DEd7Eco0EQV
	gMEw==
X-Gm-Message-State: AIVw112lOK7bLSZv8JHrUaIPSjeuISMAXLDXfoNr3AA7V2Ef/BaPUKXR
	w9XcYqkuF063uiCPI44u8OnRznD21g==
X-Received: by 10.25.103.19 with SMTP id b19mr526588lfc.80.1500376092564; Tue,
	18 Jul 2017 04:08:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.59.145 with HTTP; Tue, 18 Jul 2017 04:08:11 -0700 (PDT)
In-Reply-To: <20170718061005.29518-16-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-16-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 04:08:11 -0700
Message-ID: <CAJ+F1CJh-pX4rvuZKCzYiDE+8Spruan-w73qZk+=BWsLFG5OAg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 15/29] microblaze: use
 QEMU_IS_ALIGNED macro
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jul 2017 11:08:16 -0000

On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
> (also added braces to satisfy checkpatch)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  target/microblaze/op_helper.c | 3 ++-
>  target/microblaze/translate.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.=
c
> index 1e07e21c1c..41ab52fb7a 100644
> --- a/target/microblaze/op_helper.c
> +++ b/target/microblaze/op_helper.c
> @@ -108,8 +108,9 @@ void helper_debug(CPUMBState *env)
>               (env->sregs[SR_MSR] & MSR_IE));
>      for (i =3D 0; i < 32; i++) {
>          qemu_log("r%2.2d=3D%8.8x ", i, env->regs[i]);
> -        if ((i + 1) % 4 =3D=3D 0)
> +        if (QEMU_IS_ALIGNED(i + 1, 4)) {
>              qemu_log("\n");
> +        }
>      }
>      qemu_log("\n\n");
>  }
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.=
c
> index cb65d1e129..ae7b3c71b0 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -1839,9 +1839,10 @@ void mb_cpu_dump_state(CPUState *cs, FILE *f, fpri=
ntf_function cpu_fprintf,
>
>      for (i =3D 0; i < 32; i++) {
>          cpu_fprintf(f, "r%2.2d=3D%8.8x ", i, env->regs[i]);
> -        if ((i + 1) % 4 =3D=3D 0)
> +        if (QEMU_IS_ALIGNED(i + 1, 4)) {
>              cpu_fprintf(f, "\n");
>          }
> +    }
>      cpu_fprintf(f, "\n\n");
>  }
>
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

