Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctx7n-0002X2-OX
	for mharc-qemu-trivial@gnu.org; Fri, 31 Mar 2017 10:01:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ctx7l-0002VW-B5
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 10:01:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ctx7k-0006GI-Df
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 10:01:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29691)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ctx7e-0006Bb-Tl; Fri, 31 Mar 2017 10:01:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C38EDC0567B3;
	Fri, 31 Mar 2017 14:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C38EDC0567B3
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C38EDC0567B3
Received: from [10.10.122.200] (ovpn-122-200.rdu2.redhat.com [10.10.122.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECC59729D3;
	Fri, 31 Mar 2017 14:01:48 +0000 (UTC)
To: minyard@acm.org, qemu-devel@nongnu.org
References: <1490894892-8055-1-git-send-email-minyard@acm.org>
	<0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
	<71b59e1b-caf0-d7b0-0648-b98d62e66c6b@acm.org>
	<f99214c2-6a18-5ab0-c6af-75590cc8d5fd@redhat.com>
	<f0dd4986-add0-b3d5-745e-e56ca0d23a22@acm.org>
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Corey Minyard <cminyard@mvista.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <7ba4f927-8d0b-2387-c324-42670c8265f3@redhat.com>
Date: Fri, 31 Mar 2017 09:01:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f0dd4986-add0-b3d5-745e-e56ca0d23a22@acm.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6kwjxMPUfJfB43Sd09vWGRrUJllTx1bn2"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 31 Mar 2017 14:01:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v2 resend] ipmi: Fix macro issues
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
X-List-Received-Date: Fri, 31 Mar 2017 14:01:58 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6kwjxMPUfJfB43Sd09vWGRrUJllTx1bn2
Content-Type: multipart/mixed; boundary="IM7rU9692pvE4LApkOtNPMqfvM5MjDR05";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: minyard@acm.org, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Corey Minyard <cminyard@mvista.com>
Message-ID: <7ba4f927-8d0b-2387-c324-42670c8265f3@redhat.com>
Subject: Re: [PATCH for-2.9? v2 resend] ipmi: Fix macro issues
References: <1490894892-8055-1-git-send-email-minyard@acm.org>
 <0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
 <71b59e1b-caf0-d7b0-0648-b98d62e66c6b@acm.org>
 <f99214c2-6a18-5ab0-c6af-75590cc8d5fd@redhat.com>
 <f0dd4986-add0-b3d5-745e-e56ca0d23a22@acm.org>
In-Reply-To: <f0dd4986-add0-b3d5-745e-e56ca0d23a22@acm.org>

--IM7rU9692pvE4LApkOtNPMqfvM5MjDR05
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2017 08:32 AM, Corey Minyard wrote:

>> Note, on the other hand, that a call such as
>> IPMI_BT_SET_HBUSY(ib->control_reg, 2) would result in writing 0 to the=

>> HBUSY bit. In other words, the IPMI_BT_SET_HBUSY() macro is rather wei=
rd
>> in that it sets or clears the HBUSY bit based solely on whether its v
>> parameter is even or odd, rather than the more usual semantics of
>> whether the v parameter is 0 or non-zero.  We could change that if we
>> wanted - by having the macro expand to "(left | (!!(v) << shift))"
>> instead of our current expansion of "(left | (((v) & 1) << shift))" -
>> but I still don't think it would change the semantics of any existing
>> caller.
>=20
> Yeah, that would be better.  Should I do another patch?

Up to you; I'm fine with either the existing patch as proposed or with
reviewing a v4 (interesting that you resent v2, even though you had also
posted a v3 at one point, where the only difference seems to have been
adding my R-b).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--IM7rU9692pvE4LApkOtNPMqfvM5MjDR05--

--6kwjxMPUfJfB43Sd09vWGRrUJllTx1bn2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY3mFMAAoJEKeha0olJ0Nqho4H/2h5D9IMW/ahVHWPUEmPd2y6
LC5qriPUs/5H9xwavpgtCwekKS7npWLqAkm8yR6/Fq66ws75tNA8JQqnl5VXKDhH
hCrKRZuyBk2FDjgEHxssEQO7kP7tb3xi/rGiGZ2Ry83w2eaX9FQJQOBtKLuqSFBq
FFwKr+eDyKFUp+GFBDaISOtofGElNoq8qpyveOBzR0gSpdt1PrvU3Bj3I9GNY/H0
viiekm+97SETLRN7XobDWikQiAokR4VCNUTZzXtQfY+ZogHtxvB64DqZfsVIytc+
dsJlHGExjl5VrVpMkc9b3Z8v6HpcVpqT6gx9cGB7gfDCHXJ4OGE8KhICMbzm+Vs=
=+DiS
-----END PGP SIGNATURE-----

--6kwjxMPUfJfB43Sd09vWGRrUJllTx1bn2--

