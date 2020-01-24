Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iuw97-0004VI-HK
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jan 2020 05:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iuw92-0004QC-VI
 for qemu-trivial@nongnu.org; Fri, 24 Jan 2020 05:24:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iuw91-0005Hs-SM
 for qemu-trivial@nongnu.org; Fri, 24 Jan 2020 05:24:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36389
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iuw91-0005HP-Oh
 for qemu-trivial@nongnu.org; Fri, 24 Jan 2020 05:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579861495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jub131MXyMRaMBUqRg2Fc5ggG8DBK5kB113uWrxUibc=;
 b=bJIsIMgPegeiEZcOSuCnR2cpmU205ExtfJDvzb1XI4P5ULwEOjP+/MvmEnrzisjWGT4/2A
 wvoO9cmFNRbpwRJBDIWitvEA8nRW1IEkByyihVrAC0ATKJMzdmTSvHB+32SZ/ObK9pHOl3
 E78bvAftM0NTTaTlWJ0UyA795zCMDSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-JW7fU0d-Njyxnmz8Ib8mVA-1; Fri, 24 Jan 2020 05:24:51 -0500
X-MC-Unique: JW7fU0d-Njyxnmz8Ib8mVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6ABDDB5B;
 Fri, 24 Jan 2020 10:24:48 +0000 (UTC)
Received: from localhost (ovpn-117-162.ams2.redhat.com [10.36.117.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AD283B4;
 Fri, 24 Jan 2020 10:24:48 +0000 (UTC)
Date: Fri, 24 Jan 2020 10:24:47 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: salvador@qindel.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, sfandino@yahoo.com,
 stefanha@gmail.com, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qemu_set_log_filename: filename argument may be NULL
Message-ID: <20200124102447.GC736986@stefanha-x1.localdomain>
References: <20200123113225.GB691377@stefanha-x1.localdomain>
 <20200123193626.19956-1-salvador@qindel.com>
MIME-Version: 1.0
In-Reply-To: <20200123193626.19956-1-salvador@qindel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 24 Jan 2020 10:24:58 -0000

--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 08:36:26PM +0100, salvador@qindel.com wrote:
> From: Salvador Fandino <salvador@qindel.com>
>=20
> NULL is a valid log filename used to indicate we want to use stderr
> but qemu_set_log_filename (which is called by bsd-user/main.c) was not
> handling it correctly.
>=20
> That also made redundant a couple of NULL checks in calling code which
> have been removed.
>=20
> Signed-off-by: Salvador Fandino <salvador@qindel.com>
> ---
>  trace/control.c |  4 +---
>  util/log.c      | 28 ++++++++++++++++------------
>  vl.c            |  5 +----
>  3 files changed, 18 insertions(+), 19 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4qxe4ACgkQnKSrs4Gr
c8gSaggAlTUMkt7cOnpWn/GK1mEcnlmjkQPKU1MWQI/t0bcozxCQZ105VX0qixBJ
2/9A0vgr4qzbcGQPGor4VaMeTINW70g+I5zggdxksU3M6JfxialdID7n2dBnkRiA
bn9V4BP6IvNSl1uDJ3n6GwNbZp/S2iZEjfNJEDRYYvRlkv5crKnoQ5iuBzCAe785
+w1oK53F0rr1QguXm59VR+d6w65yhj29gadAVs6zQlWpWZ3CgrWPW+aF9qx1ttaF
8XyfNypk7dlJdcyWmIb6HSDKr1XZ66ZjPCVpMbG0L0MXnucU8jnowFLk7KWK/pnV
FP0LhQ/ZVIM1sphATxRiJPBpI9X5tQ==
=emAk
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--


