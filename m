Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eFhj4-0004Yl-MX
	for mharc-qemu-trivial@gnu.org; Fri, 17 Nov 2017 09:34:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eFhj1-0004WU-Sv
	for qemu-trivial@nongnu.org; Fri, 17 Nov 2017 09:34:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eFhiz-0001p4-8H
	for qemu-trivial@nongnu.org; Fri, 17 Nov 2017 09:34:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eFhip-0001Zs-IU; Fri, 17 Nov 2017 09:34:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7A87883C9;
	Fri, 17 Nov 2017 14:34:22 +0000 (UTC)
Received: from [10.10.123.34] (ovpn-123-34.rdu2.redhat.com [10.10.123.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75AC17C19C;
	Fri, 17 Nov 2017 14:34:21 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20171113194857.13933-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	vsementsov@virtuozzo.com, qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <119e49f8-9dfb-ffb2-6301-ff581d6fb2b5@redhat.com>
Date: Fri, 17 Nov 2017 08:34:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171113194857.13933-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="KphEPpfptKJNlO8tL8RI2DbLjAl9uS2OC"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 17 Nov 2017 14:34:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] nbd/client: Don't
 hard-disconnect on ESHUTDOWN from server
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
X-List-Received-Date: Fri, 17 Nov 2017 14:34:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KphEPpfptKJNlO8tL8RI2DbLjAl9uS2OC
Content-Type: multipart/mixed; boundary="2rl1TRa70ftxS7Eukc3hVOkQX05mRiiiV";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org
Message-ID: <119e49f8-9dfb-ffb2-6301-ff581d6fb2b5@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.11] nbd/client: Don't hard-disconnect
 on ESHUTDOWN from server
References: <20171113194857.13933-1-eblake@redhat.com>
In-Reply-To: <20171113194857.13933-1-eblake@redhat.com>

--2rl1TRa70ftxS7Eukc3hVOkQX05mRiiiV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/13/2017 01:48 PM, Eric Blake wrote:
> The NBD spec says that a server may fail any transmission request
> with ESHUTDOWN when it is apparent that no further request from
> the client can be successfully honored.  The client is supposed
> to then initiate a soft shutdown (wait for all remaining in-flight
> requests to be answered, then send NBD_CMD_DISC).  However, since
> qemu's server never uses ESHUTDOWN errors, this code was mostly
> untested since its introduction in commit b6f5d3b5.
>=20
> More recently, I learned that nbdkit as the NBD server is able to
> send ESHUTDOWN errors, so I finally tested this code, and noticed
> that our client was special-casing ESHUTDOWN to cause a hard
> shutdown (immediate disconnect, with no NBD_CMD_DISC), but only
> if the server sends this error as a simple reply.  Further
> investigation found that commit d2febedb introduced a regression
> where structured replies behave differently than simple replies -
> but that the structured reply behavior is more in line with the
> spec (even if we still lack code in nbd-client.c to properly quit
> sending further requests).  So this patch reverts the portion of
> b6f5d3b5 that introduced an improper hard-disconnect special-case
> at the lower level, and leaves the future enhancement of a nicer
> soft-disconnect at the higher level for another day.
>=20
> CC: qemu-trivial@nongnu.org

I think I meant qemu-stable, not qemu-trivial.  At any rate, this is now
queued on my NBD tree for 2.11-rc2.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--2rl1TRa70ftxS7Eukc3hVOkQX05mRiiiV--

--KphEPpfptKJNlO8tL8RI2DbLjAl9uS2OC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAloO82wACgkQp6FrSiUn
Q2pRFgf+JPNaMJVqISsX7coKfHm4oVlGfWaIrccaEdfpEzHHCflImdfyosZ3QH5l
dOwmDg5e/3N1Pvm+RqwRUqijlrLGdDEv2TOCglyXi/nQhHBX1YS2rz0o9qoyda7f
dalB2mKVtIELSvyzBYPzJSDVU+JdYbim3L0BGNRmcrjCmXasmEPfIeteiCR0gmXl
kS33MHCMlIhiYhEWvmYzgi4oOl4yE+Sp3zWTe+6MrGzU3bgAi4e1F6mbiVpGEB+X
BQoFfHLacKrRg6h45DgA0+50n4F97d5sco/son+dG1fEXRlFBxN7ByEabp5YOrgD
rSkZ2lvHO3vfnAJ0wsZNjznGC2z1aA==
=Rr7A
-----END PGP SIGNATURE-----

--KphEPpfptKJNlO8tL8RI2DbLjAl9uS2OC--

