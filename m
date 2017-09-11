Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drUz5-00063V-Cx
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 16:07:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45452)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drUz2-00060y-3q
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:07:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1drUz0-00008f-UC
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 16:07:04 -0400
Received: from mout.gmx.net ([212.227.15.19]:55690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1drUyv-0008Ur-9H; Mon, 11 Sep 2017 16:06:57 -0400
Received: from [192.168.1.3] ([185.58.161.191]) by mail.gmx.com (mrgmx001
	[212.227.17.184]) with ESMTPSA (Nemesis) id 0Ln8Tl-1dF8x10mvF-00hJEB;
	Mon, 11 Sep 2017 22:06:54 +0200
To: qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, jperkin@joyent.com, qemu-devel@nongnu.org
References: <20170903164952.26760-1-n54@gmx.com>
	<20170911171639.22005-1-n54@gmx.com>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <aae5b3ae-f158-a7a6-fb8c-7726c2a18cd0@gmx.com>
Date: Mon, 11 Sep 2017 22:09:16 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170911171639.22005-1-n54@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="iVnRK52EjSv8F66TTJwmnqoEGJS6hHnGC"
X-Provags-ID: V03:K0:DaXfU9Y8n3ugr23oAZeYxtsSAnNYZ5nhSSfNNgq/ASW7GJKWwbt
	LhE7JKfpu1ETMa8jzyHc9vL5bcww1+E5nyM1JM1oKVCuv0D/rAUvrzneeVyK8BdvzCxp+cP
	W3Xok/0t2/dYG03pRvrmNtpQPvUAL6Mfk/NQvcsBtmbbgTJsihocUZ6SOUGGnnKKwhu/MIc
	ddRFsLV6J+rqW+RAYu69A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:dfHQqZVteew=:y5hKyjbpvVRqG1Eh9aImxV
	b8NP5cawUsXr0CIa05yH4FYTGjIf3/Tga4wHd4owW1gXxeGFi8zm4afW/9664rcfjq/W4ZwAF
	k/i4tYOE2g3SIYoqeL1QWggucDUIJ5T65MyCZL5FN3PjKY7CC+7ovJkAQg12t5o233ApEhFOu
	ZcFUGKCOf76deBk12oUmXJBPJ5xaVSKK/blMHO/58mzBVI6J0SqYiROhs/l+fNWnuRdGQTpF+
	PeSNjtRgL6cM0N9V0lDZBa9kc9oKbyfMChFsALimSv3IqKsXeJVSffXjRjYKWsVTW6PW6A7po
	bSeOwAtmOiwecVBqa5MR2ldZoK8qP+8FsdZoneCm0uSVC651nPXE7sbd6F4zUoEovUYQhep94
	JrlriPAuAV3cIrJFM/4RLU6KmpJ1ygPaIDPOgmgOAaoeTlOVo+NysB6yU9+a2cC6qb4HiQLO2
	W/CZ2auF6TO7iFCxR45+edR6WjKjwdSG3wA2VpkvW8Z8oiziH8PGe/5cDV5NDo1aCU7+8an3S
	LhrqhATISxsouhiueN7Zl9/h76fOyT9U2yuJMC/cSNOToFK+c3pxeFPeiJRc0NWVpC8fawj+m
	RsegNqrEDelx1O9l3YZD89VrsSp9qxrEPyEZqWVZCDPQMLtZ6pslkhFYN46sB4bDf9/qBWxT1
	AC055msBCgmOrW6oKaqUT4exFLOS5ELwxFCo4rbv+9yhe9UMBr0kFUv9XFhERw/AVjIOszxr+
	zLI7lb2XDJeK6b7HgF1H+rlST/0HNb9RCJin1nIt1cXp88poTAQgXZq4sd4j1ccrd3cCjY5lf
	GMvjdN5sOji8JFA0Av0uuGXUYmG5g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.19
Subject: Re: [Qemu-trivial] [PATCH v2] Discover openpty(3) dynamically in
 configure
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
X-List-Received-Date: Mon, 11 Sep 2017 20:07:05 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iVnRK52EjSv8F66TTJwmnqoEGJS6hHnGC
Content-Type: multipart/mixed; boundary="WhCox4UFGrf3JV84sLTxXPJenJG4lN10M";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, jperkin@joyent.com, qemu-devel@nongnu.org
Message-ID: <aae5b3ae-f158-a7a6-fb8c-7726c2a18cd0@gmx.com>
Subject: Re: [Qemu-trivial] [PATCH v2] Discover openpty(3) dynamically in
 configure
References: <20170903164952.26760-1-n54@gmx.com>
 <20170911171639.22005-1-n54@gmx.com>
In-Reply-To: <20170911171639.22005-1-n54@gmx.com>

--WhCox4UFGrf3JV84sLTxXPJenJG4lN10M
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.09.2017 19:16, Kamil Rytarowski wrote:
> openpty(3) might:
>  - exists in libc (OSX)
>  - exists in libutil (GNU, BSD)
>  - does not exist (SmartOS)
>=20
> Add a function to discover this function in the ./configure script.
> Add new config types: CONFIG_OPENPTY_LIBC and CONFIG_OPENPTY_LIBUTIL,
> respectively defined when openpts(3) links with -lc or -lutil.
>=20
> Replace the condition adding -lutil in tests (for openpty(3)) from
> CONFIG_POSIX to CONFIG_OPENPTY_LIBUTIL.
>=20
> Replace the fallback openpty(3) impelementation comment from Solaris
> to SmartOS. Solaris is EOL'ed and it's confirmed that it does not work
> on Oracle Solaris.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>

> ---
>  configure              | 25 +++++++++++++++++++++++++
>  tests/Makefile.include |  2 +-
>  util/qemu-openpty.c    |  4 ++--
>  3 files changed, 28 insertions(+), 3 deletions(-)
>=20
> diff --git a/configure b/configure
> index fd7e3a5e81..a614adcd29 100755
> --- a/configure
> +++ b/configure
> @@ -3819,6 +3819,25 @@ EOF
>    fi
>  fi
> =20
> +##########################################
> +# openpty probe
> +openpty_libc=3Dno
> +openpty_libutil=3Dno
> +cat > $TMPC << EOF
> +extern int openpty(int *amaster, int *aslave, char *name, void *termp,=
 void *winp);
> +
> +int main(void)
> +{
> +    int master_fd, slave_fd;
> +    return openpty(&master_fd, &slave_fd, 0, 0, 0) =3D=3D 0;
> +}
> +EOF
> +if compile_prog "" "" ; then
> +  openpty_libc=3Dyes
> +elif compile_prog "" "-lutil" ; then
> +  openpty_libutil=3Dyes
> +fi
> +
>  ##########################################
>  # signalfd probe
>  signalfd=3D"no"
> @@ -5788,6 +5807,12 @@ fi
>  if test "$fdt" =3D "yes" ; then
>    echo "CONFIG_FDT=3Dy" >> $config_host_mak
>  fi
> +if test "$openpty_libc" =3D "yes" ; then
> +  echo "CONFIG_OPENPTY_LIBC=3Dy" >> $config_host_mak
> +fi
> +if test "$openpty_libutil" =3D "yes" ; then
> +  echo "CONFIG_OPENPTY_LIBUTIL=3Dy" >> $config_host_mak
> +fi
>  if test "$signalfd" =3D "yes" ; then
>    echo "CONFIG_SIGNALFD=3Dy" >> $config_host_mak
>  fi
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index fae5715e9c..e7e0bc2724 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -814,7 +814,7 @@ tests/migration/initrd-stress.img: tests/migration/=
stress$(EXESUF)
>  	rm $(INITRD_WORK_DIR)/init
>  	rmdir $(INITRD_WORK_DIR)
> =20
> -ifeq ($(CONFIG_POSIX),y)
> +ifeq ($(CONFIG_OPENPTY_LIBUTIL),y)
>  LIBS +=3D -lutil
>  endif
> =20
> diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
> index 2e8b43bdf5..62c87e5563 100644
> --- a/util/qemu-openpty.c
> +++ b/util/qemu-openpty.c
> @@ -51,8 +51,8 @@
>  # include <termios.h>
>  #endif
> =20
> -#ifdef __sun__
> -/* Once Solaris has openpty(), this is going to be removed. */
> +/* The fallback implementation is needed at least on SmartOS. */
> +#if !defined(CONFIG_OPENPTY_LIBC) && !defined(CONFIG_OPENPTY_LIBUTIL)
>  static int openpty(int *amaster, int *aslave, char *name,
>                     struct termios *termp, struct winsize *winp)
>  {
>=20



--WhCox4UFGrf3JV84sLTxXPJenJG4lN10M--

--iVnRK52EjSv8F66TTJwmnqoEGJS6hHnGC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZtu1yAAoJEEuzCOmwLnZsEWkP+gNA/9sasN51UEVeVd/KkEYM
F7eDI4iA/v5i2rLepFCIs02huwE4xxttlZ+bOV1VOgjJT+MA75kDA62qy0nHrtEk
bUIM1XmODbS65E6Z4HwvYE6OTbiXx9YjUzrygUfG8e71szIRN75i/q3igqmbg9wH
/Sql+PdPfie4/VTyZAb392bZrWrrMxFjdlfuCmLIQS5TE1W5UmDBsyo1QWrEar4C
urgMbksWD64rlsOJ6YX1kogA22HuhrC7g6XrwJAOvwac6+p2t91vOVU9n0uj76OK
P6zUrgU1PeLuazJSckvpxEeqBMxlYtv9HlBrXeqO+UXgijP4BSnU91zT1gFGgWK3
iel13Vb1/jeMDnCxEOeV0b3RSVz9CghkDUd+35xNMJ5JaRIm4p9QVY3wWJifYezV
vsAKm40i4jEZe40FLUuPaIzBKORYMImPC7JOE9laN858wO887UMVssbN6AeyX20P
YVoUlPBJijS4cAWtjQlJJs67g2/FylXisx87KSv6dnamxfb6Nz8xjBMmksdhJ7A1
hwToem49i3U9V3MqF3XSmKwVcdZxrVC1q5B7CP3t4vof6GritJ4ooflCIKZVijoe
8yL3jMH5PDEh1X5kItnGsYXnZl9Znp52bG47bFceBgKNsqKxL4Ln3Vz64MrhdHK6
GbvxtCB3ApRNsL3cZdla
=I9fU
-----END PGP SIGNATURE-----

--iVnRK52EjSv8F66TTJwmnqoEGJS6hHnGC--

