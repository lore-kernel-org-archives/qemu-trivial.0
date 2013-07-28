Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3NZI-0001hd-JN
	for mharc-qemu-trivial@gnu.org; Sun, 28 Jul 2013 05:47:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V3NZA-0001XD-If
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 05:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V3NZ5-0007C4-9j
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 05:47:04 -0400
Received: from cantor2.suse.de ([195.135.220.15]:56859 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1V3NYu-0007B8-9m; Sun, 28 Jul 2013 05:46:48 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id ABB06A4EB7;
	Sun, 28 Jul 2013 11:46:47 +0200 (CEST)
Message-ID: <51F4E884.4010509@suse.de>
Date: Sun, 28 Jul 2013 11:46:44 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1374990895-25584-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1374990895-25584-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] musicpal: Fix typo in name
	of local function
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Jul 2013 09:47:11 -0000

Am 28.07.2013 07:54, schrieb Stefan Weil:
> The misspelling was spotted by Andreas F=C3=A4rber.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/arm/musicpal.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index b06d442..ddddd27 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -534,7 +534,7 @@ static void lcd_invalidate(void *opaque)
>  {
>  }
> =20
> -static void musicpal_lcd_gpio_brigthness_in(void *opaque, int irq, int=
 level)
> +static void musicpal_lcd_gpio_brightness_in(void *opaque, int irq, int=
 level)
>  {
>      musicpal_lcd_state *s =3D opaque;
>      s->brightness &=3D ~(1 << irq);
> @@ -619,7 +619,7 @@ static int musicpal_lcd_init(SysBusDevice *dev)
>      s->con =3D graphic_console_init(DEVICE(dev), &musicpal_gfx_ops, s)=
;
>      qemu_console_resize(s->con, 128*3, 64*3);
> =20
> -    qdev_init_gpio_in(&dev->qdev, musicpal_lcd_gpio_brigthness_in, 3);
> +    qdev_init_gpio_in(&dev->qdev, musicpal_lcd_gpio_brightness_in, 3);
> =20
>      return 0;
>  }

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

but to clarify: I had notified you not to send this small patch, which
now conflicts with my argument cleanup, but to add this typo to your
blacklist to check the whole codebase for similar typos. Are there none?

But since this is a sensible cleanup anyway, I'll just put a copy into
my queue before the refactoring, to avoid merge conflicts with -trivial.

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

