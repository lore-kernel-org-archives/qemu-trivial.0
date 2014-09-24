Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWtTb-0003Ub-M3
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 16:47:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brian@vten.us>) id 1XWoED-0007sI-BQ
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 11:11:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <brian@vten.us>) id 1XWoE5-0002LQ-KE
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 11:11:37 -0400
Received: from mail.vten.us ([104.131.46.26]:54695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brian@vten.us>)
	id 1XWoDs-0002J4-CB; Wed, 24 Sep 2014 11:11:16 -0400
Received: from iggy-ub.localnet (unknown [173.226.135.235])
	by mail.vten.us (Postfix) with ESMTPSA id C5EC5120148;
	Wed, 24 Sep 2014 11:10:38 -0400 (EDT)
From: Brian Jackson <brian@vten.us>
To: qemu-devel@nongnu.org
Date: Wed, 24 Sep 2014 10:10:32 -0500
Message-ID: <6333990.3XRPC2An5Y@iggy-ub>
User-Agent: KMail/4.14.1 (Linux/3.16-2-amd64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1411553636-24717-3-git-send-email-alex.bennee@linaro.org>
References: <1411553636-24717-1-git-send-email-alex.bennee@linaro.org>
	<1411553636-24717-3-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 104.131.46.26
X-Mailman-Approved-At: Wed, 24 Sep 2014 16:47:49 -0400
Cc: qemu-trivial@nongnu.org,
	Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, agraf@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/4] .travis.yml: make
	the make slightly more parallel
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
X-List-Received-Date: Wed, 24 Sep 2014 15:11:42 -0000

On Wednesday, September 24, 2014 11:13:54 AM Alex Benn=E9e wrote:
> The Travis VMs have 1.5 cores so we might as well make some use of th=
e
> paralellism.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Alexander Graf <agraf@suse.de>

Reviewed-by: Brian Jackson <iggy@theiggy.com>

>=20
> diff --git a/.travis.yml b/.travis.yml
> index 72cfc9f..f113339 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -41,7 +41,10 @@ before_install:
>    - git submodule update --init --recursive
>    - sudo apt-get update -qq
>    - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS}
> ${EXTRA_PKGS} -script: "./configure --target-list=3D${TARGETS}
> ${EXTRA_CONFIG} && make && ${TEST_CMD}" +before_script:
> +  - ./configure --target-list=3D${TARGETS} --enable-debug-tcg ${EXTR=
A_CONFIG}
> +script:
> +  - make -j2 && {TEST_CMD}
>  matrix:
>    # We manually include a number of additional build for non-standar=
d bits
>    include:


