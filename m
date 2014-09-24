Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWtTb-0003V8-Rv
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 16:47:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brian@vten.us>) id 1XWoEw-0008BZ-B5
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 11:12:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <brian@vten.us>) id 1XWoEr-0002Tf-FU
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 11:12:22 -0400
Received: from mail.vten.us ([104.131.46.26]:54698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brian@vten.us>)
	id 1XWoEf-0002QK-OF; Wed, 24 Sep 2014 11:12:05 -0400
Received: from iggy-ub.localnet (unknown [173.226.135.235])
	by mail.vten.us (Postfix) with ESMTPSA id 8E8F7120148;
	Wed, 24 Sep 2014 11:12:00 -0400 (EDT)
From: Brian Jackson <brian@vten.us>
To: qemu-devel@nongnu.org
Date: Wed, 24 Sep 2014 10:11:55 -0500
Message-ID: <1834906.ino1Wd60mT@iggy-ub>
User-Agent: KMail/4.14.1 (Linux/3.16-2-amd64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1411553636-24717-4-git-send-email-alex.bennee@linaro.org>
References: <1411553636-24717-1-git-send-email-alex.bennee@linaro.org>
	<1411553636-24717-4-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 104.131.46.26
X-Mailman-Approved-At: Wed, 24 Sep 2014 16:47:49 -0400
Cc: qemu-trivial@nongnu.org,
	Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, agraf@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 3/4] .travis.yml:
	pre-seed sub-modules for speed
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
X-List-Received-Date: Wed, 24 Sep 2014 15:12:27 -0000

On Wednesday, September 24, 2014 11:13:55 AM Alex Benn=E9e wrote:
> A significant portion of the build time is spent initialising all the=

> sub-modules we use in the source tree. Often this is almost as long a=
s
> the build itself. By pre-seeding the .git/modules tree this will
> hopefully improve things.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Alexander Graf <agraf@suse.de>

Reviewed-by: Brian Jackson <iggy@theiggy.com>

>=20
> ---
> v2
>   - use wget -O - | tar as suggested by agraf
>=20
> diff --git a/.travis.yml b/.travis.yml
> index f113339..b9025be 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -37,7 +37,11 @@ env:
>      - TARGETS=3Dunicore32-softmmu,unicore32-linux-user
>      # Group remaining softmmu only targets into one build
>      -
> TARGETS=3Dlm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,x=
tensaeb-
> softmmu +git:
> +  # we want to do this ourselves
> +  submodules: false
>  before_install:
> +  - wget -O -
> http://people.linaro.org/~alex.bennee/qemu-submodule-git-seed.tar.xz =
| tar
> -xvJ - git submodule update --init --recursive
>    - sudo apt-get update -qq
>    - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS}
> ${EXTRA_PKGS}


