Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db0Y6-0000kO-C1
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 04:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1db0Y4-0000iW-Av
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 04:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1db0Xz-0003xS-AS
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 04:23:04 -0400
Received: from 8.mo7.mail-out.ovh.net ([46.105.77.114]:47587)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1db0Xz-0003vp-39
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 04:22:59 -0400
Received: from player762.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id A655566D03
	for <qemu-trivial@nongnu.org>; Fri, 28 Jul 2017 10:22:57 +0200 (CEST)
Received: from bahia.lan (gar31-1-82-66-74-139.fbx.proxad.net [82.66.74.139])
	(Authenticated sender: groug@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id 1EE67E0097;
	Fri, 28 Jul 2017 10:22:54 +0200 (CEST)
Date: Fri, 28 Jul 2017 10:22:53 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170728102253.3872842f@bahia.lan>
In-Reply-To: <20170728053610.15770-10-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-10-f4bug@amsat.org>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/pmTKLw_myNSr..ZFMVTmkmW";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 17609356018704751044
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.77.114
Subject: Re: [Qemu-trivial] [PATCH 09/47] MAINTAINERS: add missing entry for
 virtio/9p
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
X-List-Received-Date: Fri, 28 Jul 2017 08:23:05 -0000

--Sig_/pmTKLw_myNSr..ZFMVTmkmW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Jul 2017 02:35:32 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6da3264d4e..4f9ce6e686 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1056,6 +1056,7 @@ S: Supported
>  F: hw/9pfs/
>  F: fsdev/
>  F: tests/virtio-9p-test.c
> +F: include/standard-headers/linux/virtio_9p.h

I don't really know what to do here... I see no other standard headers in
the MAINTAINERS file.

>  T: git git://github.com/kvaneesh/QEMU.git
>  T: git git://github.com/gkurz/qemu.git 9p-next
> =20


--Sig_/pmTKLw_myNSr..ZFMVTmkmW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAll69F0ACgkQAvw66wEB28KXbgCdGVE5sHWMdh/Lq8hIZDn+EKtL
yx0AmwQLf/XfP/fW4XTagn6TpDVfxNm+
=oIFv
-----END PGP SIGNATURE-----

--Sig_/pmTKLw_myNSr..ZFMVTmkmW--

