Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X8lYt-0002kQ-A5
	for mharc-qemu-trivial@gnu.org; Sun, 20 Jul 2014 03:29:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1X8lYk-0002ja-Ln
	for qemu-trivial@nongnu.org; Sun, 20 Jul 2014 03:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1X8lYd-00059D-6x
	for qemu-trivial@nongnu.org; Sun, 20 Jul 2014 03:29:26 -0400
Received: from mout.web.de ([212.227.15.14]:54431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1X8lYc-00058s-TQ; Sun, 20 Jul 2014 03:29:19 -0400
Received: from mchn199C.mchp.siemens.de ([95.157.58.223]) by smtp.web.de
	(mrweb001) with ESMTPSA (Nemesis) id 0LeLmv-1WlUyJ0RHp-00q7G4;
	Sun, 20 Jul 2014 09:29:10 +0200
Message-ID: <53CB6FBF.1060009@web.de>
Date: Sun, 20 Jul 2014 09:29:03 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
	pbonzini@redhat.com
References: <53C9C82A.2060003@gmail.com>
In-Reply-To: <53C9C82A.2060003@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="I42XKARBwdl7Df9FlPPnJQuIqaqXrwhfh"
X-Provags-ID: V03:K0:48ZcSFx5MR7qDY1q1/kPIRX+yWlVEc5Fo2Xhd5TpJaIiywsP8Jl
	j8uC3ot7TTKJXhas7B8xu3QnM/3313Xqd7beJ+sLMRRx04xwJDHwj6PR3yZ00Z1zbpMVnXE
	5k5Wbh18wlUlDAAtgTTaGcuyX0yElWCed/9QnrMZ0Fx8Uc65u8JNscLMSu1j5InPmGptxBJ
	rjdvsa/vY6Fe9knE9cIkQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.15.14
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] kvm-all: Use 'tmpcpu' instead of 'cpu'
 in sub-looping to avoid 'cpu' be NULL
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
X-List-Received-Date: Sun, 20 Jul 2014 07:29:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I42XKARBwdl7Df9FlPPnJQuIqaqXrwhfh
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2014-07-19 03:21, Chen Gang wrote:
> If kvm_arch_remove_sw_breakpoint() in CPU_FOREACH() always be fail, it
> will let 'cpu' NULL. And the next kvm_arch_remove_sw_breakpoint() in
> QTAILQ_FOREACH_SAFE() will get NULL parameter for 'cpu'.
>=20
> And kvm_arch_remove_sw_breakpoint() can assumes 'cpu' must never be NUL=
L,
> so need define additional temporary variable for 'cpu' to avoid the cas=
e.
>=20
>=20
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  kvm-all.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/kvm-all.c b/kvm-all.c
> index 3ae30ee..1402f4f 100644
> --- a/kvm-all.c
> +++ b/kvm-all.c
> @@ -2077,12 +2077,13 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
>  {
>      struct kvm_sw_breakpoint *bp, *next;
>      KVMState *s =3D cpu->kvm_state;
> +    CPUState *tmpcpu;
> =20
>      QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
>          if (kvm_arch_remove_sw_breakpoint(cpu, bp) !=3D 0) {
>              /* Try harder to find a CPU that currently sees the breakp=
oint. */
> -            CPU_FOREACH(cpu) {
> -                if (kvm_arch_remove_sw_breakpoint(cpu, bp) =3D=3D 0) {=

> +            CPU_FOREACH(tmpcpu) {
> +                if (kvm_arch_remove_sw_breakpoint(tmpcpu, bp) =3D=3D 0=
) {
>                      break;
>                  }
>              }
>=20

Good catch. To make it clear in the changelog: The actual issue is that
we misuse "cpu" as an iteration variable while its original value is
still in use. That cpu can eventually become NULL this way is one result.=


Jan


--I42XKARBwdl7Df9FlPPnJQuIqaqXrwhfh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlPLb8MACgkQitSsb3rl5xRa2ACgjCNdDeVxG+mvBJ+685ICv++W
kC0AoJLMbqHFeipKGDMhikq3LUuvtFfm
=SeCO
-----END PGP SIGNATURE-----

--I42XKARBwdl7Df9FlPPnJQuIqaqXrwhfh--

