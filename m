Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1is5zT-0005bd-Aj
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2020 09:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1is5zN-0005U3-Ps
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 09:19:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1is5zK-0001rS-97
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 09:19:13 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35076
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1is5zK-0001r9-5r
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 09:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579184349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t2khawDoikQ5y0QYmfvwtJ9tdeFNA5Uwy+BJeJh+QYQ=;
 b=GRjF0OI6uJiI91QZlcRT6OyQZxgj+uXF/PmOi/+8yKFSo3D/aD7L7EWw06TBJjSkublzx1
 JYsRFFY8hp2By9TK0aXTY/mZtIGuQe6pZeRIqfFOOlS/wKVyVgro+H3z9XDFEA+cEhEyIP
 KM1T15hacmjLxNL3wy2oPM94GLB+tVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-N3Swz1CYNAy8VD_UsZl8Rg-1; Thu, 16 Jan 2020 09:19:01 -0500
X-MC-Unique: N3Swz1CYNAy8VD_UsZl8Rg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74800801FA3;
 Thu, 16 Jan 2020 14:18:59 +0000 (UTC)
Received: from localhost (ovpn-117-207.ams2.redhat.com [10.36.117.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52A5D19488;
 Thu, 16 Jan 2020 14:18:55 +0000 (UTC)
Date: Thu, 16 Jan 2020 14:18:54 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v2] Makefile: Keep trace-events-subdirs ordered
Message-ID: <20200116141854.GL163546@stefanha-x1.localdomain>
References: <20200116114339.30670-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200116114339.30670-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L/Qt9NZ8t00Dhfad"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 16 Jan 2020 14:19:17 -0000

--L/Qt9NZ8t00Dhfad
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2020 at 12:43:39PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Adding the same directory multiple times to trace-events-subdirs
> might trigger build failures, in particular when using the LTTng
> Userspace Tracer library as backend.
>=20
> For example when using two times the hw/core/ directory:
>=20
>     $ ./configure --enable-trace-backends=3Dust && make
>    [...]
>      CC      trace-ust-all.o
>    In file included from trace-ust-all.h:13,
>                     from trace-ust-all.c:13:
>    trace-ust-all.h:35151:1: error: redefinition of =E2=80=98__tracepoint_=
cb_qemu___loader_write_rom=E2=80=99
>    35151 | TRACEPOINT_EVENT(
>          | ^~~~~~~~~~~~~~~~
>    trace-ust-all.h:31791:1: note: previous definition of =E2=80=98__trace=
point_cb_qemu___loader_write_rom=E2=80=99 was here
>    31791 | TRACEPOINT_EVENT(
>          | ^~~~~~~~~~~~~~~~
>=20
> To ease review and reduce likelihood of merge failures (see [*]),
> keep trace-events-subdirs ordered when possible, following eb7ccb3c0.
>=20
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg671007.html
>     Duplicate trace-events-subdirs entries generates duplicated
>     symbols when using the LTTng Userspace Tracer library.
>=20
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Add build log error in commit description (lvivier)
>=20
> "Fixes: 26b8e6dc & 8d5d515a0"
>=20
> To be even safer we should use $(sort $(trace-events-subdirs))
> ---
>  Makefile.objs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--L/Qt9NZ8t00Dhfad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4gcM4ACgkQnKSrs4Gr
c8iJWQf9HPXHWf+0ZNEdJ9DIJBsUfArR6okUx1PTynAcp/jAudFC5k9LreNaHZ8O
EbpAqa/jNGRtT3S53KLBAmIyCEhNFGdYSypakDI8FRZJmvYN5K9c0PC1nenNvf7U
1Evw8RhDu3a9mqJFr9iXJJD+ehTI/LzJKVRHK0dviic9k55syUTagy/hTTl1GLJw
mDTN6erHOntNMNkbALSQFKLcqETvG0OmgMer5bIEy6PcYMlyK1ZbGJ1YlM6Hk9WA
sAdvMXLt9Z9Yo0NniL8d1YazxuE3Q1yziX+jV08kJVb82W8YAe0Jt0/HrqxUwpuK
tFSICM+qlIE0oKaHWyUBQ+sQ2Rk5tw==
=TssH
-----END PGP SIGNATURE-----

--L/Qt9NZ8t00Dhfad--


