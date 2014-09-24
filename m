Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWtTc-0003Vf-5p
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 16:47:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brian@vten.us>) id 1XWoP9-0007bR-0V
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 11:22:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <brian@vten.us>) id 1XWoP2-0005HD-Ja
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 11:22:54 -0400
Received: from mail.vten.us ([104.131.46.26]:54729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brian@vten.us>)
	id 1XWoOs-0005Bd-73; Wed, 24 Sep 2014 11:22:38 -0400
Received: from iggy-ub.localnet (unknown [173.226.135.235])
	by mail.vten.us (Postfix) with ESMTPSA id 588D0120148;
	Wed, 24 Sep 2014 11:13:11 -0400 (EDT)
From: Brian Jackson <brian@vten.us>
To: qemu-devel@nongnu.org
Date: Wed, 24 Sep 2014 10:13:05 -0500
Message-ID: <8024367.sEpDvf3ZWp@iggy-ub>
User-Agent: KMail/4.14.1 (Linux/3.16-2-amd64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1411553636-24717-5-git-send-email-alex.bennee@linaro.org>
References: <1411553636-24717-1-git-send-email-alex.bennee@linaro.org>
	<1411553636-24717-5-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 104.131.46.26
X-Mailman-Approved-At: Wed, 24 Sep 2014 16:47:49 -0400
Cc: qemu-trivial@nongnu.org,
	Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, agraf@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 4/4] .travis.yml: remove
	"make check" from main matrix
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
X-List-Received-Date: Wed, 24 Sep 2014 15:23:00 -0000

On Wednesday, September 24, 2014 11:13:56 AM Alex Benn=E9e wrote:
> There are problems with unreliability in "make check" which still nee=
d
> to be tracked down. As the tests are broadly the same for all targets=
 if
> added one explicit target to the matrix to run it. However this does
> build all softmmu targets to ensure they at least "run"
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Alexander Graf <agraf@suse.de>

Reviewed-by: Brian Jackson <iggy@theiggy.com>

>=20
> diff --git a/.travis.yml b/.travis.yml
> index b9025be..ad66e5b 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -12,7 +12,7 @@ notifications:
>      on_failure: always
>  env:
>    global:
> -    - TEST_CMD=3D"make check"
> +    - TEST_CMD=3D""
>      - EXTRA_CONFIG=3D""
>      # Development packages, EXTRA_PKGS saved for additional builds
>      - CORE_PKGS=3D"libusb-1.0-0-dev libiscsi-dev librados-dev
> libncurses5-dev" @@ -48,10 +48,23 @@ before_install:
>  before_script:
>    - ./configure --target-list=3D${TARGETS} --enable-debug-tcg ${EXTR=
A_CONFIG}
> script:
> -  - make -j2 && {TEST_CMD}
> +  - make -j2 && ${TEST_CMD}
>  matrix:
>    # We manually include a number of additional build for non-standar=
d bits
>    include:
> +    # Make check target (we only do this once)
> +    - env:
> +        - TARGETS=3Dalpha-softmmu,arm-softmmu,aarch64-softmmu,cris-s=
oftmmu,
> +                =20
> i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu, +       =
     =20
>     microblazeel-softmmu,mips-softmmu,mips64-softmmu, +              =
  =20
> mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softmmu, +          =
     =20
>  ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu, +           =
     =20
> sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,
> +                  unicore32-softmmu,unicore32-linux-user,
> +                =20
> lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu, +         =
     =20
>   xtensaeb-softmmu
> +          TEST_CMD=3D"make check"
> +      compiler: gcc
>      # Debug related options
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
>             EXTRA_CONFIG=3D"--enable-debug"
> @@ -80,7 +93,6 @@ matrix:
>        compiler: gcc
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
>             EXTRA_CONFIG=3D"--enable-trace-backends=3Dftrace"
> -           TEST_CMD=3D""
>        compiler: gcc
>      - env: TARGETS=3Di386-softmmu,x86_64-softmmu
>            EXTRA_PKGS=3D"liblttng-ust-dev liburcu-dev"


