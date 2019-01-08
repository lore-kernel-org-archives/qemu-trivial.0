Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggr0S-000256-Do
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jan 2019 08:01:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ggr0Q-00023V-8n
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 08:01:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ggr0P-0008Fk-BF
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 08:01:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1ggr07-0007Sp-Ju; Tue, 08 Jan 2019 08:00:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A65BB18DF7C;
	Tue,  8 Jan 2019 13:00:57 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E77C5C23A;
	Tue,  8 Jan 2019 13:00:54 +0000 (UTC)
Date: Tue, 8 Jan 2019 14:00:52 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, Thomas Huth
	<thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>, Markus
	Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, 
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <20190108140034.28ebd539.cohuck@redhat.com>
In-Reply-To: <349cd87b-0526-30b8-d9cd-0eee537ab5a4@redhat.com>
References: <20190104181208.7809-1-philmd@redhat.com>
	<20190104181208.7809-4-philmd@redhat.com>
	<349cd87b-0526-30b8-d9cd-0eee537ab5a4@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/+Uhys04BsCsXfZWNXaRn1/f";
	protocol="application/pgp-signature"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 08 Jan 2019 13:00:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 3/3] util/cutils: Move
 function documentations to the header
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
X-List-Received-Date: Tue, 08 Jan 2019 13:01:19 -0000

--Sig_/+Uhys04BsCsXfZWNXaRn1/f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Jan 2019 14:17:14 -0600
Eric Blake <eblake@redhat.com> wrote:

> On 1/4/19 12:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Many functions have documentation before the implementation in
> > cutils.c. Since we expect documentation around the prototype
> > declaration in headers, move the comments in cutils.h.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  include/qemu/cutils.h | 224 ++++++++++++++++++++++++++++++++++++++++++
> >  util/cutils.c         | 185 ----------------------------------
> >  2 files changed, 224 insertions(+), 185 deletions(-) =20
>=20
> I find documentation in .c files slightly easier to use (you can then
> read the code right below to see if the documentation is still
> accurate); but as we had an inconsistent mix, I'm also okay with your
> patch consolidating all the documentation to one of the two files,
> rather than the bad mix of half-and-half.
>=20

Another vote for documentation in .c files: If I use tags, I jump to
the implementation, not the declaration.

But also +1 for consistency.

--Sig_/+Uhys04BsCsXfZWNXaRn1/f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAlw0nwQACgkQ3s9rk8bw
L682LRAAnS1FGGNn2eLN6CftC5NPxUtYL4Lpuc55zAqltRY9o0dr29cgwCVaO60s
Wni+EuAm1reXP60N/9cRgb9FqpFo/jhzppq6JRTnzZUR508U0NFQ53wSqwIKImIw
NXhXod6rxKbVQQJsbjLpt0fjRSDbzpZgj8S4UzmblZpJSyIEgrySHmSPuMUmt6zt
xcJKNRu3qqDuNAEp0mUywEHFa/as8cy5sf7R4/RxQxhKeK+VlHZjpLZWnTAgy2Op
IMpRTiix/yB/5NZ4zyZfx2y1XIJOiv3ZwoxvzVj04fK5mvheMhiGJILHL/G9wXTM
85pPTE90L6o+gG+uulBcd688lWhsNPvAwiWnnwDgdw5qoGdlig4fPM1y/GS/PBtj
IpIwKKpt/B6RxPCvZl0O5KmSRU8FUS+5USr0Tqh7PJ5qOUe75ZvQARW39+SLxc24
G9dOu45cEq+RFm93hFwS6h+GmVXWsroB0Bd4MDCQUCFJWstJvoa0EcA0/w5+8jzh
eTX3CIGnesqvxgoyPFX4mbWZ1jkveXeJiwMEn4BI+Gq2wLmircV9RInB8aIOdd8s
QFvI4bQQJr4mroBlqmRLST/HeOVDJebWS8EKakaU5M1Q6VeUeOVZ2BKhsqCFsUDd
YQe1Uv4369xps+PnuMyHMGoUvdKH1eZoDjxtaQMfE0m3B8GC3MM=
=G+/d
-----END PGP SIGNATURE-----

--Sig_/+Uhys04BsCsXfZWNXaRn1/f--

