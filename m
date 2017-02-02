Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZNwb-0003lB-Qk
	for mharc-qemu-trivial@gnu.org; Thu, 02 Feb 2017 15:25:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cZNwa-0003jS-03
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 15:25:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cZNwY-000144-VK
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 15:25:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33643)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cZNwT-00011w-7f; Thu, 02 Feb 2017 15:25:17 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63FB27E9F2;
	Thu,  2 Feb 2017 20:25:17 +0000 (UTC)
Received: from [10.10.120.245] (ovpn-120-245.rdu2.redhat.com [10.10.120.245]
	(may be forged))
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v12KPGjA017003; Thu, 2 Feb 2017 15:25:16 -0500
To: Stefan Weil <sw@weilnetz.de>
References: <20170202195601.11286-1-sw@weilnetz.de>
	<bdfbc0e6-e630-a1ac-5132-24b6a2dd6122@redhat.com>
	<a5309467-337b-2827-489d-2abbce8356e4@weilnetz.de>
Cc: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <508ce64c-800d-bfdc-ba88-19b425edab64@redhat.com>
Date: Thu, 2 Feb 2017 14:25:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <a5309467-337b-2827-489d-2abbce8356e4@weilnetz.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="oOGbnEEPLEnlQJmWFJ5PsSmTfG76gNA5L"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 02 Feb 2017 20:25:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Remove invalid
 assertions
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
X-List-Received-Date: Thu, 02 Feb 2017 20:25:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oOGbnEEPLEnlQJmWFJ5PsSmTfG76gNA5L
Content-Type: multipart/mixed; boundary="df8j6dbq1RKVEQmmjgvM3exOQroWA5R9x";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <508ce64c-800d-bfdc-ba88-19b425edab64@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] tci: Remove invalid assertions
References: <20170202195601.11286-1-sw@weilnetz.de>
 <bdfbc0e6-e630-a1ac-5132-24b6a2dd6122@redhat.com>
 <a5309467-337b-2827-489d-2abbce8356e4@weilnetz.de>
In-Reply-To: <a5309467-337b-2827-489d-2abbce8356e4@weilnetz.de>

--df8j6dbq1RKVEQmmjgvM3exOQroWA5R9x
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/02/2017 02:10 PM, Stefan Weil wrote:
> Am 02.02.2017 um 21:00 schrieb Eric Blake:
>> On 02/02/2017 01:56 PM, Stefan Weil wrote:
>>> tb_jmp_insn_offset and tb_jmp_reset_offset are pointers
>>> and cannot be used with ARRAY_SIZE.
>>>

>> mst posted an alternative patch:
>> https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00551.html
>=20
>=20
> Yes, I noticed that, too. It's not obvious that this new
> assertion will be correct, and none of the other targets
> has that kind of assertion. Only two targets use an
> assertion which detects NULL pointers, but NULL pointers
> will result in an abort anyway.
>=20
> Do you think that there are reasons why TCI should use
> the assertion suggested by Michael?

I don't have any strong opinions on which patch is better, so much as
just pointing out that alternative proposals exist so that we have good
threading in making the decision on which one to go with.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--df8j6dbq1RKVEQmmjgvM3exOQroWA5R9x--

--oOGbnEEPLEnlQJmWFJ5PsSmTfG76gNA5L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYk5WqAAoJEKeha0olJ0NqKwoH/Rum2+tFQJSW29+TyF5Z8At4
MO6GW5YSWtE+osHS2YdC56hVdlGExx17Er/Cm2uj8yD2roankDW4YSux8ADjacIC
mh4vxZXxGoGDMnr5etj1H8Wo1eOmQDQK3fNwv17i1lDrt8mXgPrtbvusgDT7eLCm
7a+imsNrqzpvrJAy5czEvDmpyoEsyx0zvgxgPiTB+zWyy9aoRRoVG1z7jzzyVUPp
q3xBTsEdHNga/cpdFu34F+Ei3NOrfiGHg7dDiXL1qdFF9MAk20FR/WM1fCgY0+Nc
4NeD5v38w1xs5b3l+UpU8j6VQCGsiSCGYB2dnJ+wr6PQLJcGrlmwAgY0qqMgHJ8=
=lJAI
-----END PGP SIGNATURE-----

--oOGbnEEPLEnlQJmWFJ5PsSmTfG76gNA5L--

