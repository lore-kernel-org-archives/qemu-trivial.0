Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQFa-00051v-SA
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:01:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQFX-0004y7-Mb
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:01:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQFS-0002Dv-0x
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:01:07 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34235)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQFR-0002DI-Ps; Tue, 18 Jul 2017 07:01:01 -0400
Received: by mail-lf0-x244.google.com with SMTP id p11so1391986lfd.1;
	Tue, 18 Jul 2017 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IrwkwE1l3Pit1jVxjwRDVHwzmSVadiM4l40VW2e6LQI=;
	b=dC0QkvIgh8HDtXYSS4Nk5dM2epYznou8ity1yaesDEHh2IN4QU70kYTPhU/z90YSqE
	pQP2Lx18vYjZODe69UtJu7m+KZnY99iPNdd8suh6Tz9oCDbbT434RMBnnyyo8baG/0hj
	sT7oXMaXNQxiiol8EQPos8Th3PAWwM4Iis5Es1weUqsm2F5AvLo4f3DVsm4bHsCz0jE2
	U7W+oRn9wjqCpGYI7/decU2jwrPhva2xKnAtXQzPotFzqucjbGek/yMijg9X+jqY2fhj
	b9zlopZDSwnG9t3SYBOgR04UMokCkprGKKMu190XzxoFe0jrl7iBY1Ywtd6DLaf0uOb8
	2MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IrwkwE1l3Pit1jVxjwRDVHwzmSVadiM4l40VW2e6LQI=;
	b=JmSoAlMiQ4hwhuueXEODArjq9mP+lyFxb6Pg+kHW39iTN2LRikh6bIvFH+c38qQp64
	ssW69vKH+i7QUBc+VigUPjUOvX/q79znk0lvgXwLU4QX8Mgwh4qTtyLesNU59QIooU6D
	uQSM6JVUAOWmPYmO5QHHMYO7iT1MABJtvOFKcKaLeMDvakdLnfwTGYyF759w/nAhbMDJ
	bW759hdCrBm8M+O8ZXYSctbMspgdu+IvMJtoG+XqQT8btlPWWnAE+l9Wh+wgAqXDyfng
	Tgo9VsPAKXIC5T6sNZ/JS8YbaEb+y9P7t2YgtUXul+ipxcyuMdMdrfwOXIECOId+TdMc
	rPJg==
X-Gm-Message-State: AIVw110fqUnaUwpbqzWXbgR44vFrXrMgT2yPRjKdkbyTEvKMeR8gFtcy
	0uQMrUdjYK7pwdTFOlUdZeVnxh745Q==
X-Received: by 10.80.151.89 with SMTP id d25mr1377011edb.163.1500375660346;
	Tue, 18 Jul 2017 04:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.70 with HTTP; Tue, 18 Jul 2017 04:00:59 -0700 (PDT)
In-Reply-To: <20170718061005.29518-26-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-26-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 04:00:59 -0700
Message-ID: <CAJ+F1CKZRQ_0bVFhj+hmtkRD0f_NrxzXTfYY0Qq0pkmhsKp9Tg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 25/29] libqos: use
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
X-List-Received-Date: Tue, 18 Jul 2017 11:01:08 -0000

On Mon, Jul 17, 2017 at 11:10 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>
> No entry in MAINTAINERS for tests/libqos/* does it deserve it's own entry=
?
>

It would, do you want to candidate? :)

>  tests/libqos/libqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/libqos/libqos.c b/tests/libqos/libqos.c
> index 6226546c28..0edb7e99ba 100644
> --- a/tests/libqos/libqos.c
> +++ b/tests/libqos/libqos.c
> @@ -258,7 +258,7 @@ void generate_pattern(void *buffer, size_t len, size_=
t cycle_len)
>      p =3D rand() % 256;
>      for (i =3D 0; i < len; i++) {
>          tx[i] =3D p++ % 256;
> -        if (i % cycle_len =3D=3D 0) {
> +        if (QEMU_IS_ALIGNED(i, cycle_len)) {
>              p =3D rand() % 256;
>          }
>      }
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

