Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPl1E-00070P-2v
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2016 00:57:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1aPl1B-0006wg-9E
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 00:57:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1aPl1A-0003rK-0s
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 00:57:49 -0500
Received: from ozlabs.org ([103.22.144.67]:36663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1aPl19-0003r5-N2
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 00:57:47 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id C891C140BDE; Sun, 31 Jan 2016 16:57:41 +1100 (AEDT)
Date: Sat, 30 Jan 2016 23:35:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20160130123502.GQ23043@voom.redhat.com>
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
	<1453991009-32736-3-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aNvCJ41Feu8IgPyB"
Content-Disposition: inline
In-Reply-To: <1453991009-32736-3-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3 2/3] .travis.yml: run make check for
	all matrix targets
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
X-List-Received-Date: Sun, 31 Jan 2016 05:57:50 -0000


--aNvCJ41Feu8IgPyB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2016 at 02:23:28PM +0000, Alex Benn=E9e wrote:
> We only ran make check once before it used to be an unreliable target.
> It was only a stop gap measure and we should be able to revert it now.
> This also stops us needing a large all-MMU build.
>=20
> We disable "make check" for a couple of the extra config targets which
> are currently broken.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>

So, in general I like the idea of running make check more widely.

However.. I was wondering - what's the rationale for having separate
matrix builds for each target (or small group) rather than just doing
one build with all the targets?

I can't see any obvious benefit to splitting the build that way, but
it does increase the total build time significantly - and will do so
rather more so with make check added.

> ---
>  .travis.yml | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index 4a0c23a..16be23f 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -40,7 +40,7 @@ notifications:
>      on_failure: always
>  env:
>    global:
> -    - TEST_CMD=3D""
> +    - TEST_CMD=3D"make check"
>      - EXTRA_CONFIG=3D""
>    matrix:
>      # Group major targets together with their linux-user counterparts
> @@ -73,17 +73,14 @@ script:
>  matrix:
>    # We manually include a number of additional build for non-standard bi=
ts
>    include:
> -    # Make check target (we only do this once)
> -    - env:
> -        - TARGETS=3Dalpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softm=
mu,i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu,microblazeel=
-softmmu,mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu,or32-s=
oftmmu,ppc-softmmu,ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu,s=
h4eb-softmmu,sparc-softmmu,sparc64-softmmu,unicore32-softmmu,lm32-softmmu,m=
oxie-softmmu,tricore-softmmu,xtensa-softmmu,xtensaeb-softmmu
> -          TEST_CMD=3D"make check"
> -      compiler: gcc
>      # Debug related options
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
>             EXTRA_CONFIG=3D"--enable-debug"
>        compiler: gcc
> +    # We currently disable "make check"
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
>             EXTRA_CONFIG=3D"--enable-debug --enable-tcg-interpreter"
> +           TEST_CMD=3D""
>        compiler: gcc
>      # Disable a few of the optional features
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
> @@ -104,11 +101,15 @@ matrix:
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
>             EXTRA_CONFIG=3D"--enable-trace-backends=3Dsimple"
>        compiler: gcc
> +    # We currently disable "make check"
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
>             EXTRA_CONFIG=3D"--enable-trace-backends=3Dftrace"
> +           TEST_CMD=3D""
>        compiler: gcc
> +    # We currently disable "make check"
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
> -          EXTRA_CONFIG=3D"--enable-trace-backends=3Dust"
> +           EXTRA_CONFIG=3D"--enable-trace-backends=3Dust"
> +           TEST_CMD=3D""
>        compiler: gcc
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
>             EXTRA_CONFIG=3D"--enable-modules"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aNvCJ41Feu8IgPyB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWrK32AAoJEGw4ysog2bOST4cP/R40pMHbg34PaI8Yfiwu2L6Z
D/or20KJqq+PSc7Up/SUfljE20v3JZNjVSvjADCaiq3Ap23Y84ufx7nnq6rH4yev
yW8DEa1dDCB0Xph/CqevRvrAHvk3JLW/fjr75MCF2ks6Zxgfco5xxDibCKAQ1Uj1
yV0YSGqTq+sKH/yAIhg9YRjLnlKXZUO/vofZ2mIDmAV7ZR6XSraBm3T8tu+ANxG/
0JjcVNQUDb79Q+ziHux+3C76nk94HoMYXuP6sm+IKC8pZGR603XPbG//YsMvur1a
P+IYZ8ifMfFxqxT13bMnzUWYtZe7E48FhYrdBLlTNIUCTSqC6zMZJCYOj4mRNEQK
UBsF8kDAz1tDY/R3EMFDiYABXBdRXiE9ILzDWCXdN+xvH1PomEb/6FlIZ5RfVF7r
8UFRe5n7Ul/RAspllGSe1FhcgHki0oGIysuw1whCtnY5wHqycsxZNc451akGHndG
NCzJ/aiyYgFDZSVgk8Ct5LJKumLfsBFX5A3fKUThfFrmfVvd2UCsqHYARCJxLGCj
3ly65j+4HqlfhPC629UYGlXn19wsWAOlIzCuab5TBuxXCf0E/IjJfOOEW6T5xQrk
mqeanNuZQ8L7dakAVCvelWw3MEMtci4eI8DK+fkcmB19uli4REg/XWVIF/OcMMWE
LNqutTI38pxrxk6gC1Wg
=f+vR
-----END PGP SIGNATURE-----

--aNvCJ41Feu8IgPyB--

