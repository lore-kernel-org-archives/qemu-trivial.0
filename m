Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iX6Fs-00076h-N2
	for mharc-qemu-trivial@gnu.org; Tue, 19 Nov 2019 11:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iX6Fo-0006yf-Sl
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 11:21:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iX6Fm-0005gO-FS
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 11:21:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60142
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iX6Fm-0005g3-AX
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 11:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574180481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qF4T07IIgo0DnEu78N1pSXmtuZ7OF5jsZbBnH3/S1WE=;
 b=dtBPZFINmfFVEO7o9iMmpbgT6D27vEKE0jGCDqMZdb17RSow7sZ6mkw5g4TQNSFZsQAfbP
 RIjX9vg+6Ftydmp1W5Mwofq/7ZRjOMI+9rnsBXOKwU/+fW8DFp+X9WIZYgz0sPWKR+evFl
 3m2wolt9PT05qId+0aRbxbL+Z6+Z6fI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-vBvHEoamO2GOh25j17aUjw-1; Tue, 19 Nov 2019 11:21:18 -0500
X-MC-Unique: vBvHEoamO2GOh25j17aUjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96BC2800686;
 Tue, 19 Nov 2019 16:21:16 +0000 (UTC)
Received: from localhost (unknown [10.36.118.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D02191B41E;
 Tue, 19 Nov 2019 16:21:13 +0000 (UTC)
Date: Tue, 19 Nov 2019 16:21:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v4 0/2] hw: Remove dynamic field width from trace events
Message-ID: <20191119162112.GC229732@stefanha-x1.localdomain>
References: <20191118222746.31467-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191118222746.31467-1-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2019 16:21:26 -0000

--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:27:44PM +0100, Philippe Mathieu-Daud=E9 wrote:
> This series fixes LP#1844817 [2].
>=20
> (Eric noted in [1] the dtrace via stap backend can not support
> the dynamic '*' width format.)
>=20
> If they are trivial/block/tracing pull in preparation, this
> series will be happy to be taken, else it will go via mips-next.
>=20
> Thanks,
>=20
> Phil.
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg04720.html
> [2] https://bugs.launchpad.net/qemu/+bug/1844817
>=20
> Philippe Mathieu-Daud=E9 (2):
>   hw/block/pflash: Remove dynamic field width from trace events
>   hw/mips/gt64xxx: Remove dynamic field width from trace events
>=20
>  hw/block/pflash_cfi01.c |  8 ++++----
>  hw/block/pflash_cfi02.c |  8 ++++----
>  hw/mips/gt64xxx_pci.c   | 16 ++++++++--------
>  hw/block/trace-events   |  8 ++++----
>  hw/mips/trace-events    |  4 ++--
>  5 files changed, 22 insertions(+), 22 deletions(-)
>=20
> --=20
> 2.21.0
>=20

Will send a pull request today.

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3UFngACgkQnKSrs4Gr
c8hb+QgApzAB6OB9tFcqcictmaTP4f/jIgfxKX5vHYS/0SN1GSy1teAP8mZi4QYs
q46G7r2Ke8JRvsVq2SgYVM7f65JM/a6/ZRthJV5Fxp5Zhb7Ne0di9fF0DrXhzRKM
GTgalo5HSCKtC+uQp2WJspPgco/NeotlHJsCmsd4X5JyVhBpr8axKhxsHpyIAKi3
a95wgqV1+GAvu6H+YxdRZaa39gEUu5J3IwPa8WW1UwRU8CXscwk6Wqicy2oFrs24
QI+hdnVXZid8JC+2uD6LayyquEMwEMHTlvNlg0DUTQkvoDlIAkWp0ZPFc9OXScWd
f68W+aBEO9nC3EpV7rS02EUL00FmbA==
=PJtq
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--


