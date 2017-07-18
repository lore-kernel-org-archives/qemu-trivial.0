Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQv6-0006PS-NA
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:44:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1dXQv4-0006Nj-JJ
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1dXQv3-0005tB-SW
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:44:02 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:39511)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@walle.cc>)
	id 1dXQuz-0005PJ-9L; Tue, 18 Jul 2017 07:43:57 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 0D5DB22532;
	Tue, 18 Jul 2017 13:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1500378138;
	bh=p/x947BTba3BP8bCaBFRvy6oQcxhH21lltgj8TNghCY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ULQFRcpJcdZ/sxwEbrVf93LcpAl6VgElumcY725yPbrVolFQgKn8DjRyIHhZG/CAd
	1EOLgSonplVGAMxtQYzYY15iiOA/OYFYOxd1UWkoVWlcZPeM+Siuv7izpVSsRZCScm
	XPNeekUz7wpv2UKAoUAoT42hAzsmpasXESfc3250=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Tue, 18 Jul 2017 13:42:17 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Eric Blake
	<eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
In-Reply-To: <20170718061005.29518-17-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-17-f4bug@amsat.org>
Message-ID: <501136f163a5ab92df3d839360483774@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.5
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-trivial] [PATCH 16/29] lm32: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 11:44:03 -0000

Am 2017-07-18 08:09, schrieb Philippe Mathieu-Daud=C3=A9:
> Applied using the Coccinelle semantic patch=20
> scripts/coccinelle/use_osdep.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

QEMU_IS_ALIGNED() sounds like it is used to check if a memory access is=20
aligned. Although it does the same, the line in question is used for=20
formatted output. I'm not sure if this macro should be used here.

-michael

> ---
>  target/lm32/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/lm32/translate.c b/target/lm32/translate.c
> index 692882f447..a9b159a6e3 100644
> --- a/target/lm32/translate.c
> +++ b/target/lm32/translate.c
> @@ -1185,7 +1185,7 @@ void lm32_cpu_dump_state(CPUState *cs, FILE *f,
> fprintf_function cpu_fprintf,
>=20
>      for (i =3D 0; i < 32; i++) {
>          cpu_fprintf(f, "r%2.2d=3D%8.8x ", i, env->regs[i]);
> -        if ((i + 1) % 4 =3D=3D 0) {
> +        if (QEMU_IS_ALIGNED(i + 1, 4)) {
>              cpu_fprintf(f, "\n");
>          }
>      }


