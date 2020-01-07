Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ios7m-0001es-Q0
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 11:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ios7j-0001Yh-A3
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 11:54:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ios7i-0006Y8-6e
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 11:54:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52166
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ios7i-0006XS-3K
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 11:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578416069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nFDOCPmSXH8bZUNWRQB5ZxxGg/sXOpSyOndloGfLzcg=;
 b=d+WxAhYznr1znLNrRP7Ez0/W1gwWMTAqHkL7uuvUOBMuDYw4dnQYU1EYla1Y3eOCPd/pLC
 YfKt7wjzmk2RCsGJLrNGJEcD1WH4VMwZjUEnlY4N9q2epIW5soU0E1zwaeWySgUkNyK64m
 SDZFRH2RvsW7NscnNjVEzZeHERxV3hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-1F-4xrLHPoOnr2PhCe1c0g-1; Tue, 07 Jan 2020 11:54:26 -0500
X-MC-Unique: 1F-4xrLHPoOnr2PhCe1c0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 636CE800D4E;
 Tue,  7 Jan 2020 16:54:25 +0000 (UTC)
Received: from localhost (unknown [10.36.118.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC09385F13;
 Tue,  7 Jan 2020 16:54:24 +0000 (UTC)
Date: Tue, 7 Jan 2020 16:54:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v1 17/59] block/dmg.c: remove unneeded 'fail' label in
 dmg_read_mish_block()
Message-ID: <20200107165423.GA410801@stefanha-x1.localdomain>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-18-danielhb413@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200106182425.20312-18-danielhb413@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Tue, 07 Jan 2020 16:54:33 -0000

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 03:23:43PM -0300, Daniel Henrique Barboza wrote:
> Both the 'fail' label and 'ret' variable can be removed from the
> function. Instead, call 'return -EINVAL' in the error conditions.
>=20
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> CC: qemu-block@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  block/dmg.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4Ut78ACgkQnKSrs4Gr
c8hGYAgAqAa6OqSNkw7RLXe//mM1/mCxHdPmM2l5uck0jyyR37mxbdJfPS30eUGb
urohApMEDZlbez4zZsRZRm/J1h7Nt81svz25cR88vJkaaEtFuoXLZjsfhm85fo50
PBbdZ1sS/GVMdKCiSo40TgeAKVAduSzDa6fuhsTt4I7RA2MBNl5wYhQEI7Idyfo1
3RWHR5WaWc47egMaaGbtOYA1z35Gts0xJV5lgRg+pGqEDRlswxKRFYn4vN524GnL
J1rxHLjStb/veh6YTfqvbqXJOKsc3tyTNChvAqjHtHrPiFbDvukKkLZdo+Ho6pY3
rqUVFBdheJEGNY9M5sr/5hP9h+cN0w==
=/S9a
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--


