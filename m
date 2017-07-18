Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQBQ-00017I-Ab
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 06:56:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQBN-00015L-Vg
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:56:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQBN-0008On-6M
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:56:50 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:36723)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQBN-0008OW-0d; Tue, 18 Jul 2017 06:56:49 -0400
Received: by mail-wr0-x242.google.com with SMTP id y67so1693299wrb.3;
	Tue, 18 Jul 2017 03:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LE+g9hsG15DtytLOUQGzOHQw5sX7SmyyW9sd1haeyM0=;
	b=jwobhD9cNqAKjm9NcaDllhC0T8yJggdiN+efGrxgOXXz2SLb1/RnqIIcQD0fHu3SVH
	qCYW5z4vLic6p8UKjsDP6G4bjpbqb+QZYo9D8vHbehc1am8aHvZyZGpOnMRdw8TUPvn7
	HahhpsRGeJsKGowXCb9+a50oKpBBzdE0PT6NePiJtUYCfIwvnl46eGkYwR5hCkRYnHm9
	jfbmSiyx3ZqqSt4Ac3e2F+oOU1TipbPeaFQ8etgK+kkHW8DnbnmcA6roo0D6njT7qP3L
	Ac2Me56nV9AzhXZbJ1ONisI7rOtyZRdeqzGZzUNRGutQv7mhy/BC9gC3ncrIIbdcVocl
	h/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LE+g9hsG15DtytLOUQGzOHQw5sX7SmyyW9sd1haeyM0=;
	b=nZRhOSO/dfrjt5lFmVK4G6suJwtYK8FkxKnsnFjUjJ3qop2br9Wojx1vd1NVSnI7aY
	2GatYV2ppzu12nGXKU0QrYHuKw3F1Vcp+VJXiv/xJ7U1RSGaPnURikeJA3CE/PqS0Sxt
	kWSp38VcIikLhHRVPONvU1iQ/bKjA16gkOOHrBJRCVmjABbtMGvVqOGzaL3CAjlWHk+V
	yo70jB06frbqz3xhu0Fjb7+BrIjxJAidOZUk82A1OnZt/Y6G9ow7u177nYJphlkxP59m
	EewDN8aE3QZdxRYLk+avae1CkIYvKDqE+CiAI8+D7BjXYCUpK5J14jSASm14TSs9j+fK
	InMQ==
X-Gm-Message-State: AIVw112vV6vjCVkP7t++qoBM4Ldqz2KE8CgiVHIagfpy8tq/pG2gQ/sS
	LLha0052PTXkhOOFxs1vNQyHIiK8ug==
X-Received: by 10.80.205.217 with SMTP id h25mr1425896edj.59.1500375407999;
	Tue, 18 Jul 2017 03:56:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.70 with HTTP; Tue, 18 Jul 2017 03:56:47 -0700 (PDT)
In-Reply-To: <20170718061005.29518-27-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-27-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 03:56:47 -0700
Message-ID: <CAJ+F1C+WsdUp3Vtx+-FZ9g7URSAQuJWb6h7-w6yJXM+4TKQNjA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 26/29] tests/tcg: use
 ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 10:56:51 -0000

Hi

On Mon, Jul 17, 2017 at 11:10 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/tcg/alpha/test-cond.c | 2 +-
>  tests/tcg/alpha/test-ovf.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

I think those do not include osdep.h

(sigh, tests/tcg would need some love ;)

> diff --git a/tests/tcg/alpha/test-cond.c b/tests/tcg/alpha/test-cond.c
> index 74adffaa69..e5596f10b8 100644
> --- a/tests/tcg/alpha/test-cond.c
> +++ b/tests/tcg/alpha/test-cond.c
> @@ -77,7 +77,7 @@ int main (void)
>  {
>    int i;
>
> -  for (i =3D 0; i < sizeof (vectors)/sizeof(vectors[0]); i++)
> +  for (i =3D 0; i < ARRAY_SIZE(vectors); i++)
>      if ((*vectors[i].func)(vectors[i].v) !=3D vectors[i].r) {
>        write(1, "Failed\n", 7);
>        return 1;
> diff --git a/tests/tcg/alpha/test-ovf.c b/tests/tcg/alpha/test-ovf.c
> index 01c80e7525..43fc6ebb2e 100644
> --- a/tests/tcg/alpha/test-ovf.c
> +++ b/tests/tcg/alpha/test-ovf.c
> @@ -20,7 +20,7 @@ int main (void)
>  {
>    int i;
>
> -  for (i =3D 0; i < sizeof (vectors)/sizeof(vectors[0]); i++)
> +  for (i =3D 0; i < ARRAY_SIZE(vectors); i++)
>      if ((*vectors[i].func)(vectors[i].a, vectors[i].b) !=3D vectors[i].r=
) {
>        write(1, "Failed\n", 7);
>      }
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

