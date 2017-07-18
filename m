Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXSUS-0006kf-D0
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 09:24:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@d-silva.org>) id 1dXQBE-0000x9-9k
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@d-silva.org>) id 1dXQBD-0008M0-9O
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:56:40 -0400
Received: from [202.78.40.170] (port=52890 helo=mail2.nmnhosting.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@d-silva.org>)
	id 1dXQB7-0008Ir-FN; Tue, 18 Jul 2017 06:56:34 -0400
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
	by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id v6IANkBa092795
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Tue, 18 Jul 2017 20:23:47 +1000 (AEST)
	(envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "=?UTF-8?Q?'Philippe_Mathieu-Daud=C3=A9'?=" <f4bug@amsat.org>,
	<qemu-trivial@nongnu.org>, "'Peter Maydell'" <peter.maydell@linaro.org>,
	"'Corey Minyard'" <cminyard@mvista.com>
Cc: <qemu-devel@nongnu.org>, "'Eric Blake'" <eblake@redhat.com>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-8-f4bug@amsat.org>
In-Reply-To: <20170718061005.29518-8-f4bug@amsat.org>
Date: Tue, 18 Jul 2017 20:23:42 +1000
Message-ID: <045101d2ffaf$ef4b60e0$cde222a0$@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHEzQUaXR229Stv+ncxiUtmhZnsBgEHQq0qom2LilA=
Content-Language: en-au
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.4.3
	(mail2.nmnhosting.com [10.0.1.20]);
	Tue, 18 Jul 2017 20:23:49 +1000 (AEST)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 202.78.40.170
X-Mailman-Approved-At: Tue, 18 Jul 2017 09:24:37 -0400
Subject: Re: [Qemu-trivial] [PATCH 07/29] ds1338: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 10:56:41 -0000

I'm not sure this makes sense - we're dealing with time here.

--=20
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece



> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 =
[mailto:philippe.mathieu.daude@gmail.com]
> On Behalf Of Philippe Mathieu-Daud=C3=A9
> Sent: Tuesday, 18 July 2017 4:10 PM
> To: qemu-trivial@nongnu.org; Peter Maydell <peter.maydell@linaro.org>;
> Alastair D'Silva <alastair@d-silva.org>; Corey Minyard
> <cminyard@mvista.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>; =
qemu-devel@nongnu.org;
> Eric Blake <eblake@redhat.com>
> Subject: [PATCH 07/29] ds1338: use QEMU_IS_ALIGNED macro
>=20
> Applied using the Coccinelle semantic patch
> scripts/coccinelle/use_osdep.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/timer/ds1338.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/timer/ds1338.c b/hw/timer/ds1338.c index
> 3849b74a68..a77fe14514 100644
> --- a/hw/timer/ds1338.c
> +++ b/hw/timer/ds1338.c
> @@ -65,7 +65,7 @@ static void capture_current_time(DS1338State *s)
>      s->nvram[1] =3D to_bcd(now.tm_min);
>      if (s->nvram[2] & HOURS_12) {
>          int tmp =3D now.tm_hour;
> -        if (tmp % 12 =3D=3D 0) {
> +        if (QEMU_IS_ALIGNED(tmp, 12)) {
>              tmp +=3D 12;
>          }
>          if (tmp <=3D 12) {
> @@ -154,7 +154,7 @@ static int ds1338_send(I2CSlave *i2c, uint8_t =
data)
>                  if (data & HOURS_PM) {
>                      tmp +=3D 12;
>                  }
> -                if (tmp % 12 =3D=3D 0) {
> +                if (QEMU_IS_ALIGNED(tmp, 12)) {
>                      tmp -=3D 12;
>                  }
>                  now.tm_hour =3D tmp;
> --
> 2.13.2
>=20
>=20
> ---
> This email has been checked for viruses by AVG.
> http://www.avg.com



