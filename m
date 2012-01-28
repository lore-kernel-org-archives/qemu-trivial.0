Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rr6IN-0008A7-Uu
	for mharc-qemu-trivial@gnu.org; Sat, 28 Jan 2012 06:18:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Rr6IK-0007zY-N1
	for qemu-trivial@nongnu.org; Sat, 28 Jan 2012 06:18:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Rr6IJ-0004R1-EK
	for qemu-trivial@nongnu.org; Sat, 28 Jan 2012 06:18:08 -0500
Received: from fmmailgate01.web.de ([217.72.192.221]:55011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1Rr6IF-0004Qk-Oz; Sat, 28 Jan 2012 06:18:04 -0500
Received: from moweb001.kundenserver.de (moweb001.kundenserver.de
	[172.19.20.114])
	by fmmailgate01.web.de (Postfix) with ESMTP id 874651A9B2E72;
	Sat, 28 Jan 2012 12:18:02 +0100 (CET)
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb002) with ESMTPA (Nemesis) id 0LvB2o-1SYNVN3R6Q-00zbwc;
	Sat, 28 Jan 2012 12:17:59 +0100
Message-ID: <4F23D967.1020704@web.de>
Date: Sat, 28 Jan 2012 12:17:59 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
References: <4F232832.8060907@web.de>
In-Reply-To: <4F232832.8060907@web.de>
X-Enigmail-Version: 1.3.4
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig98E1BE30CED1D3210DA26755"
X-Provags-ID: V02:K0:CwLw6bHL2ItQkoG8KbELv4e4lnsagoQkGvAZjqBKAs/
	xmsY2k87b8EXnP1LC2t+6T1vdqzDtrf/RKzxNnsVdTm/qRHnOB
	xQr//M0eAQosB9ZtQrAbwch0TR0klBeCqMk8lpqxXcAqLSRIdL
	DGkssee8JCHZTbYDJK84pq3vlsju1UC4yn0va8lEPooIDpwfNE
	m6nhIeOA4t4VhNFfR+DrA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: Erik Rull <erik.rull@rdsoftware.de>
Subject: Re: [Qemu-trivial] [PATCH] sdl: Do not grab mouse on mode switch
	while in background
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
X-List-Received-Date: Sat, 28 Jan 2012 11:18:10 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig98E1BE30CED1D3210DA26755
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2012-01-27 23:41, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>=20
> When the mouse mode changes to absolute while the SDL windows is not in=

> focus, refrain from grabbing the input. It would steal from some other
> window.

I'll send out a SDL series with fixes and will include this. So forget
about it for trivial.

Thanks,
Jan

>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>=20
> I bet this makes no difference for your problem, Erik, but I came
> across this while trying to reproduce the issue.
>=20
>  ui/sdl.c |   30 ++++++++++++++++--------------
>  1 files changed, 16 insertions(+), 14 deletions(-)
>=20
> diff --git a/ui/sdl.c b/ui/sdl.c
> index 8cafc44..384276d 100644
> --- a/ui/sdl.c
> +++ b/ui/sdl.c
> @@ -483,12 +483,27 @@ static void sdl_grab_end(void)
>      sdl_update_caption();
>  }
> =20
> +static void absolute_mouse_grab(void)
> +{
> +    int mouse_x, mouse_y;
> +
> +    if (SDL_GetAppState() & SDL_APPINPUTFOCUS) {
> +        SDL_GetMouseState(&mouse_x, &mouse_y);
> +        if (mouse_x > 0 && mouse_x < real_screen->w - 1 &&
> +            mouse_y > 0 && mouse_y < real_screen->h - 1) {
> +            sdl_grab_start();
> +        }
> +    }
> +}
> +
>  static void sdl_mouse_mode_change(Notifier *notify, void *data)
>  {
>      if (kbd_mouse_is_absolute()) {
>          if (!absolute_enabled) {
> -            sdl_grab_start();
>              absolute_enabled =3D 1;
> +            if (is_graphic_console()) {
> +                absolute_mouse_grab();
> +            }
>          }
>      } else if (absolute_enabled) {
>          if (!gui_fullscreen) {
> @@ -571,19 +586,6 @@ static void toggle_full_screen(DisplayState *ds)
>      vga_hw_update();
>  }
> =20
> -static void absolute_mouse_grab(void)
> -{
> -    int mouse_x, mouse_y;
> -
> -    if (SDL_GetAppState() & SDL_APPINPUTFOCUS) {
> -        SDL_GetMouseState(&mouse_x, &mouse_y);
> -        if (mouse_x > 0 && mouse_x < real_screen->w - 1 &&
> -            mouse_y > 0 && mouse_y < real_screen->h - 1) {
> -            sdl_grab_start();
> -        }
> -    }
> -}
> -
>  static void handle_keydown(DisplayState *ds, SDL_Event *ev)
>  {
>      int mod_state;



--------------enig98E1BE30CED1D3210DA26755
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8j2WcACgkQitSsb3rl5xRmmgCgid8E2IMj7x1YSSa0nTtTPcrj
2TMAoIty+6y7RhQzpc2FkV5gwaDdqy/7
=ht0z
-----END PGP SIGNATURE-----

--------------enig98E1BE30CED1D3210DA26755--

