Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7mUc-00008J-Ah
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 13:30:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1d7mUa-00006p-HV
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 13:30:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1d7mUZ-0002jD-6r
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 13:30:40 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1d7mUU-0002iV-BN; Mon, 08 May 2017 13:30:34 -0400
Received: by mail-qk0-x243.google.com with SMTP id k74so11076513qke.2;
	Mon, 08 May 2017 10:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=h12k9INoPuD+99+Gr/W3oXtweYvOCExj71MwhbTYOiA=;
	b=pprx+i32EVXDNSe1K/9Zb7eKNc997GM+zk3K1CwoIROErm/hiq59fWXLrcCgnFvmr7
	/XoxgC1Mwa+shVrCwIBUckfyTPhivc3Lb5DbESjnR9IvHbzCnyvKMyoB0KOz2dzX74gI
	0Zd9Ap8SrB5ArPTkWVi6tR3iUto6W5uAbu07y7gwzfdcsoPIJ9g0nDG/rNkhTjMov2Bz
	gRVg2Z9oQr02UdUohPIY0XuCkbztQ+oaoclw9kE6cfK8jnGyVqzjqNjKIOzMe1UftKM+
	AFSLgstgbUx6j7ZMLfduGBKI88skGI0Uf3gHKgDrkrCpCNN2AUnyu7NDkZppA5LFryw8
	7O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=h12k9INoPuD+99+Gr/W3oXtweYvOCExj71MwhbTYOiA=;
	b=imdRJODgMqqxDkDUTLRlHiNs4GPuLDdwXqBjaliEYQlpUef7IfDo7Xy4Wfu2biua39
	jRMQzBVs6bnL2Kw1paxtJoJyK0qMBWBZRW1ge8bx0Dzx2j9dq4NuHyvFpeGKAEe0m+aw
	AvLufz4IHWVmGG5mFnNeaIO0xhbtdYaaoWDscldF7TcTAVs0VjxLTUQfavn2YWklqvEE
	KxPrG9MG4dJSUK9GPHPWzvDs+d5FGplkk5jcAt9oq1eLSqJ19qsITqx5dVj3z+Zn0iVS
	sKuXXf/v5O/hkH5bWnlUNP10RM8RHZkooWa5mnf9FouFtW1oopCLrSj974kIPOuAVw7T
	9RoA==
X-Gm-Message-State: AODbwcDDDC2yk+Vhbr725Jkova+jsqKVmmgy7t88ovRhgxngMUvEIk0V
	KaYfRJ9Bi5T0SA==
X-Received: by 10.55.3.10 with SMTP id 10mr28177379qkd.65.1494264633581;
	Mon, 08 May 2017 10:30:33 -0700 (PDT)
Received: from localhost (50-206-204-8-static.hfc.comcastbusiness.net.
	[50.206.204.8]) by smtp.gmail.com with ESMTPSA id
	b130sm11017640qka.0.2017.05.08.10.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 May 2017 10:30:32 -0700 (PDT)
Date: Mon, 8 May 2017 13:30:31 -0400
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170508173031.GK22428@stefanha-x1.localdomain>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zPXeIxDajdrcF2en"
Content-Disposition: inline
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/23] Trivial patches for
 2017-05-07
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
X-List-Received-Date: Mon, 08 May 2017 17:30:42 -0000


--zPXeIxDajdrcF2en
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 07, 2017 at 10:02:03AM +0300, Michael Tokarev wrote:
> The following changes since commit 12a95f320a36ef66f724a49bb05e4fb553ac5d=
be:
>=20
>   Merge remote-tracking branch 'kwolf/tags/for-upstream' into staging (20=
17-05-04 13:44:32 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>=20
> for you to fetch changes up to 311875781e549af91a3216d34c6ef40420bab435:
>=20
>   tests: Remove redundant assignment (2017-05-07 09:57:51 +0300)
>=20
> ----------------------------------------------------------------
> trivial patches for 2017-05-07
>=20
> ----------------------------------------------------------------
> Andreas Grapentin (1):
>       use _Static_assert in QEMU_BUILD_BUG_ON
>=20
> Chris Webb (1):
>       virtfs: allow a device id to be specified in the -virtfs option
>=20
> Craig Jellick (1):
>       Add 'none' as type for drive's if option
>=20
> Eric Blake (2):
>       tests: Ignore more test executables
>       tests: Ignore another built executable (test-hmp)
>=20
> Fam Zheng (3):
>       block: Make 'replication_state' an enum
>       virtio-blk: Remove useless condition around g_free()
>       tests: Remove redundant assignment
>=20
> Ishani Chugh (1):
>       Remove reduntant qemu: from error functions
>=20
> KONRAD Frederic (1):
>       ppc_booke: drop useless assignment
>=20
> Kamil Rytarowski (2):
>       scripts/qemu-binfmt-conf.sh: Fix shell portability issue
>       scripts: Switch to more portable Perl shebang
>=20
> Marc-Andr=E9 Lureau (1):
>       doc: fix function spelling
>=20
> Paolo Bonzini (3):
>       jazz_led: fix bad snprintf
>       MAINTAINERS: Update paths for main loop
>       MAINTAINERS: Update paths for AioContext implementation
>=20
> Philippe Mathieu-Daud=E9 (3):
>       usb-ccid: make ccid_write_data_block() cope with null buffers
>       device_tree: fix compiler warnings (clang 5)
>       qga: fix compiler warnings (clang 5)
>=20
> Saurav Sachidanand (1):
>       util: Use g_malloc/g_free in envlist.c
>=20
> Thomas Huth (2):
>       qemu-doc: Fix broken URLs of amnhltm.zip and dosidle210.zip
>       hw/core/generic-loader: Fix crash when running without CPU
>=20
> sochin.jiang fix wrong parameter comments in channel-file.h (1):
>       channel-file: fix wrong parameter comments
>=20
>  MAINTAINERS                     |  8 +++----
>  block/replication.c             | 44 +++++++++++++++++++----------------=
---
>  bsd-user/main.c                 | 14 ++++--------
>  configure                       | 18 ++++++++++++++++
>  device_tree.c                   |  1 +
>  hw/block/virtio-blk.c           |  4 +---
>  hw/core/generic-loader.c        |  9 ++++----
>  hw/display/jazz_led.c           |  4 ++--
>  hw/microblaze/boot.c            |  2 +-
>  hw/nios2/boot.c                 |  2 +-
>  hw/ppc/pnv.c                    |  2 +-
>  hw/ppc/ppc_booke.c              |  1 -
>  hw/s390x/sclp.c                 |  4 ++--
>  hw/tricore/tricore_testboard.c  |  2 +-
>  hw/usb/dev-smartcard-reader.c   |  5 ++++-
>  include/io/channel-file.h       |  2 +-
>  include/io/channel.h            |  2 +-
>  include/qemu/compiler.h         |  4 +++-
>  linux-user/main.c               |  9 +++-----
>  numa.c                          |  4 ++--
>  qemu-doc.texi                   | 10 ++++-----
>  qemu-options.hx                 |  4 ++--
>  qga/commands-posix.c            |  8 ++++---
>  scripts/checkpatch.pl           |  3 ++-
>  scripts/clean-header-guards.pl  |  3 ++-
>  scripts/cleanup-trace-events.pl |  2 +-
>  scripts/disas-objdump.pl        |  4 +++-
>  scripts/get_maintainer.pl       |  3 ++-
>  scripts/qemu-binfmt-conf.sh     |  4 ++--
>  scripts/shaderinclude.pl        |  2 +-
>  scripts/switch-timer-api        |  2 +-
>  scripts/texi2pod.pl             |  4 +++-
>  tests/.gitignore                |  4 ++++
>  tests/postcopy-test.c           |  2 +-
>  util/envlist.c                  | 47 +++++++++++++++++------------------=
------
>  vl.c                            |  5 +++--
>  36 files changed, 133 insertions(+), 115 deletions(-)
>=20

Thanks, applied to my staging tree:
https://github.com/stefanha/qemu/commits/staging

Stefan

--zPXeIxDajdrcF2en
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZEKs3AAoJEJykq7OBq3PIHuUIAIYvcrcbY2VFJTI14Iu/+/HF
LmzNhvMWNXAACx18aeAoAopNmyW2VK0xh7PoNI+0ViDECrBtKe0YuHvrBhk5lfHt
s9Wq3cZhSL4tNYCQA09qW38OQEsp9lxlNP2J/aCfmaZrr0CEgwmLnzKzVTaqbfV6
sZaVnmthaj/0Z0UEODV6dzQZn5QaW4t0cxQbKSJFK/+aJRLMm6SBFpt1EfSIeWfi
IaZbD6+LLxSo9EWNlgdl+//koUZb06bAIDdC8tjgB1+DQQ1y9R7yldstFLNXYbY7
WZR/V011REsjfbhbeNclUfjuZ46JkQFEHWzYzWSI4aoO+hxWAGUbLMMrIyldxLs=
=SKG0
-----END PGP SIGNATURE-----

--zPXeIxDajdrcF2en--

