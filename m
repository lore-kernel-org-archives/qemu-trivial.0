Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCned-0005HI-Bp
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2017 09:18:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCneX-0005Cj-Ct
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 09:18:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCneW-0000hX-Cd
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 09:17:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eCneP-0000bL-5T; Thu, 09 Nov 2017 09:17:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D3E62C9767;
	Thu,  9 Nov 2017 14:17:48 +0000 (UTC)
Received: from [10.10.125.14] (ovpn-125-14.rdu2.redhat.com [10.10.125.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5BA63757;
	Thu,  9 Nov 2017 14:17:43 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20171108165519.8931-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Kevin Wolf <kwolf@redhat.com>, stefanha@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <deee0973-665c-c170-1248-e99331b68272@redhat.com>
Date: Thu, 9 Nov 2017 08:17:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108165519.8931-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="LK0wnlEnCm1x3hRjbVbJPMwtVSbVHW5pD"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 09 Nov 2017 14:17:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] coroutine: Fix
 documentation of co_aio_sleep_ns()
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
X-List-Received-Date: Thu, 09 Nov 2017 14:18:02 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LK0wnlEnCm1x3hRjbVbJPMwtVSbVHW5pD
Content-Type: multipart/mixed; boundary="4vVu6Wt5lbRLrWEbHFqRBphm09QDfijmU";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, stefanha@redhat.com
Message-ID: <deee0973-665c-c170-1248-e99331b68272@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] coroutine: Fix documentation of
 co_aio_sleep_ns()
References: <20171108165519.8931-1-eblake@redhat.com>
In-Reply-To: <20171108165519.8931-1-eblake@redhat.com>

--4vVu6Wt5lbRLrWEbHFqRBphm09QDfijmU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/08/2017 10:55 AM, Eric Blake wrote:
> co_sleep_ns() was removed in commit 0b9caf9b, leaving behind a
> stale comment.  Update the documentation to match the current
> usage of this function.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
>=20
> ---
> v2: instead of just blindly cribbing from Paolo's email, try to incorpo=
rate
> the feedback given on the wording
> ---
>  include/qemu/coroutine.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Self-NAK; superseded by:
https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg01681.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--4vVu6Wt5lbRLrWEbHFqRBphm09QDfijmU--

--LK0wnlEnCm1x3hRjbVbJPMwtVSbVHW5pD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAloEY4cACgkQp6FrSiUn
Q2rkxgf/QOX51KbwsGwss5HRE2wuAuoK5tYl3o3ZL5TCvcNNg6UTATEoU0ROIImw
7ChpJHaUlyf9n6hTADYoneEeSx9E8h9X535MTypNJOPDgBxIuXh6GsxjUDbJWCiT
Tktk2MCJtDqmE2kvtn65k4PMsRglYZe7MyMtDIVghyu3BTGclYrRWSjmGRca0L4N
MkHaum/r0itOp1aQ89yOtefp9bQ6xw2mCH1VAsp41WxaYWAg2Qgkz1QiJCrCScyx
KA0sTF6/X9fNUrWChhPks9MzrwZ9z3eJQqBxo4ohBeoZpFpHOiUNX0K/XyYK90d7
ZIGXLx+LCt4h05nG0ptmPzjeoAwVxg==
=eKXD
-----END PGP SIGNATURE-----

--LK0wnlEnCm1x3hRjbVbJPMwtVSbVHW5pD--

