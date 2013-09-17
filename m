Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLyum-0003ha-2t
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 13:18:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1VLyue-0003ca-Nj
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 13:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1VLyuX-0003C6-34
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 13:18:08 -0400
Received: from mout.web.de ([212.227.15.3]:57613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1VLyuW-0003Bo-Km
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 13:18:01 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.58.223]) by smtp.web.de
	(mrweb103) with ESMTPSA (Nemesis) id 0MCqkB-1VE2Z31CSp-009kDG for
	<qemu-trivial@nongnu.org>; Tue, 17 Sep 2013 19:17:58 +0200
Message-ID: <52388EC1.6030108@web.de>
Date: Tue, 17 Sep 2013 19:17:53 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1379437402-30804-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1379437402-30804-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="gv28mp0JoaTvotAhMj5dlE2ocsJovAWQk"
X-Provags-ID: V03:K0:NR+3/FHhrxIeR5zpgf0RrPXu0vp5FIxZxgrOEeSCaQk7ASbx0yL
	57zb8fNzGaQVLrYmTlCiSUDki8fidxIjGTk8aNqBK9wPFkSW5eQiSJ9qNRigsraOvPJniYK
	K+EO6IUkIynss1aodJIVXRiBXrFANgdvaKZe7h6WAVMkbX+yXXhvU7cAie1edWsWlPqBtap
	e9t2M0rZSRCLhrmf7etoQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.3
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [PATCH] cpu-exec: Fix compiler warning
	(-Werror=clobbered)
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
X-List-Received-Date: Tue, 17 Sep 2013 17:18:14 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gv28mp0JoaTvotAhMj5dlE2ocsJovAWQk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2013-09-17 19:03, Stefan Weil wrote:
> 'cpu' and 'env' are not modified after sigsetjmp. Therefore they will
> still have their last value after longjmp restored the stack context.
>=20
> The code which should "reload" both variables causes a compiler warning=
:
>=20
> cpu-exec.c:204:15: error:
> variable =E2=80=98cpu=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=
=80=99 or =E2=80=98vfork=E2=80=99 [-Werror=3Dclobbered]
> cpu-exec.c:202:28: error:
> argument =E2=80=98env=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=
=80=99 or =E2=80=98vfork=E2=80=99 [-Werror=3Dclobbered]
>=20
> Remove this unneeded code.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> Jan,
>=20
> could you please review this patch which removes code added by you earl=
ier?
> I have run tests with the old code and assertions to see whether the va=
lues
> were really smashed. They never were, and from the documentation of set=
jmp
> I'd not expect that they ever might be.
>=20
> The patch is needed to fix a compiler warning with -Wextra.

This used to fix a real, deadly crash. Therefore a reversion can't be
trivial by definition. Unfortunately, I don't recall which compiler
version and concrete scenario were involved back then.

Anyway - did anything change in the code structure around since then?
Does anything ensure that this "optimization" is not longer performed by
the compiler?

I'll try to understand the warnings meanwhile.

Jan

>=20
> Thanks,
> Stefan
>=20
>  cpu-exec.c |    5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/cpu-exec.c b/cpu-exec.c
> index 5a43995..fbfb749 100644
> --- a/cpu-exec.c
> +++ b/cpu-exec.c
> @@ -676,11 +676,6 @@ int cpu_exec(CPUArchState *env)
>                  /* reset soft MMU for next block (it can currently
>                     only be set by a memory fault) */
>              } /* for(;;) */
> -        } else {
> -            /* Reload env after longjmp - the compiler may have smashe=
d all
> -             * local variables as longjmp is marked 'noreturn'. */
> -            cpu =3D current_cpu;
> -            env =3D cpu->env_ptr;
>          }
>      } /* for(;;) */
> =20
>=20



--gv28mp0JoaTvotAhMj5dlE2ocsJovAWQk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlI4jsUACgkQitSsb3rl5xTzLACgsfT+4ab0Tury5oUsd6c5v0ev
rucAn31kZ150XF4VwqgfSx3CVTBsNc44
=1bvC
-----END PGP SIGNATURE-----

--gv28mp0JoaTvotAhMj5dlE2ocsJovAWQk--

