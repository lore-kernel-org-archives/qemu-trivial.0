Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cCeJH-0004JO-GD
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2016 22:14:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cCeJF-0004IB-B0
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2016 22:14:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cCeJE-0004mu-DV
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2016 22:14:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cCeJ9-0004kq-OV; Thu, 01 Dec 2016 22:14:43 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7FE131B32E;
	Fri,  2 Dec 2016 03:14:41 +0000 (UTC)
Received: from [10.10.66.15] ([10.10.66.15])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB23Ee0F018177; Thu, 1 Dec 2016 22:14:40 -0500
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
	<a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
	<8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
Cc: Stefan Weil <sw@weilnetz.de>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <090ea9be-288f-f0c4-b9e9-a402c7302f40@redhat.com>
Date: Thu, 1 Dec 2016 21:14:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Flq7SNIkSQNXbhAfeiMhl0cFhV0KM0C44"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 02 Dec 2016 03:14:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.8] docs: Fix
 description of the sentence
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
X-List-Received-Date: Fri, 02 Dec 2016 03:14:50 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Flq7SNIkSQNXbhAfeiMhl0cFhV0KM0C44
Content-Type: multipart/mixed; boundary="SahcX6AAlD8JIqTt4O3QtXbwV8fJ0iXut";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
 qemu devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Cc: Stefan Weil <sw@weilnetz.de>
Message-ID: <090ea9be-288f-f0c4-b9e9-a402c7302f40@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.8] docs: Fix description of the
 sentence
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
 <a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
 <8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
In-Reply-To: <8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>

--SahcX6AAlD8JIqTt4O3QtXbwV8fJ0iXut
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/01/2016 08:59 PM, Zhang Chen wrote:
>=20
>=20
> On 12/01/2016 10:57 PM, Eric Blake wrote:
>> On 12/01/2016 12:55 AM, Zhang Chen wrote:
>>> Say it in another way to make it easier to understand.
>>>
>>> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> I guess that's because I suggested the replacement text to use, even
>> though I didn't write the patch.
>=20
> Yes, In that case, should I change the signed-off-by to acked-by or
> remove it?

I'm okay if you want to leave it as-is.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--SahcX6AAlD8JIqTt4O3QtXbwV8fJ0iXut--

--Flq7SNIkSQNXbhAfeiMhl0cFhV0KM0C44
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYQOccAAoJEKeha0olJ0NqPr0H/3+yratT9E8boyy2Lc28tG8n
lgpO9tBujc+N2aIPlg3aQy67qBr+iO4g+AqS1b4UbkPJgVGNgSm+2IACwmgoLkl0
9oE17Rk/1Ry6icT3j0ItqOc1EDc8vLhqaf8KiKoAbzapQGxNoC8YxzfQi3fZnpvg
CAkaZ7rJs/UQ6tqR7f9MKlepa29DkMedBVOc0vpbmJW0opmotOtl2SSO+ie2eDDN
Khikr0fCRhhQQprCkrRnpTudgWhBFOYjIhc5q5SgPCnHhtQrtSXhkCdMAM6D0/3w
4djlk4qXiAs5t2zt7vhmmkVrtOgsEsIkfpmOhgfs+qlPbQNkyWdH6wyMeHQPwA4=
=vqsx
-----END PGP SIGNATURE-----

--Flq7SNIkSQNXbhAfeiMhl0cFhV0KM0C44--

