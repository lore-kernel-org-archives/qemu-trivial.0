Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bnWuy-0000iM-Ez
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2016 16:17:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bnWuv-0000fH-Dw
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 16:17:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bnWuu-0003fw-C0
	for qemu-trivial@nongnu.org; Fri, 23 Sep 2016 16:17:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41922)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bnWup-0003Yx-CT; Fri, 23 Sep 2016 16:17:47 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEA127302C;
	Fri, 23 Sep 2016 20:17:46 +0000 (UTC)
Received: from [10.3.116.58] (ovpn-116-58.phx2.redhat.com [10.3.116.58])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8NKHjLv012686; Fri, 23 Sep 2016 16:17:46 -0400
To: David Anderson <dave@natulte.net>
References: <20160922040019.19165-1-dave@natulte.net>
	<dcfeabcb-bfb5-b184-0842-b3413889eb56@redhat.com>
	<CAMx+r7XKTASxhX3N=7n_BxO=9vnNPed2fsSGyQw8wigiGgk65A@mail.gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <dabdd434-7f84-da85-8c38-dd35e817ba7e@redhat.com>
Date: Fri, 23 Sep 2016 15:17:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAMx+r7XKTASxhX3N=7n_BxO=9vnNPed2fsSGyQw8wigiGgk65A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lOhqtLXWKw7Xk0hDhKK3BC1BBhexFgW05"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 23 Sep 2016 20:17:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi: make the json schema
 files more regular.
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
X-List-Received-Date: Fri, 23 Sep 2016 20:17:54 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lOhqtLXWKw7Xk0hDhKK3BC1BBhexFgW05
Content-Type: multipart/mixed; boundary="S6JoPpuS5Na3RQqelcQPxcXxehtf3AKN1";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: David Anderson <dave@natulte.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Message-ID: <dabdd434-7f84-da85-8c38-dd35e817ba7e@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qapi: make the json schema files more
 regular.
References: <20160922040019.19165-1-dave@natulte.net>
 <dcfeabcb-bfb5-b184-0842-b3413889eb56@redhat.com>
 <CAMx+r7XKTASxhX3N=7n_BxO=9vnNPed2fsSGyQw8wigiGgk65A@mail.gmail.com>
In-Reply-To: <CAMx+r7XKTASxhX3N=7n_BxO=9vnNPed2fsSGyQw8wigiGgk65A@mail.gmail.com>

--S6JoPpuS5Na3RQqelcQPxcXxehtf3AKN1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/23/2016 03:04 PM, David Anderson wrote:
> On Thu, Sep 22, 2016 at 6:07 AM, Eric Blake <eblake@redhat.com> wrote:
>=20
>> On 09/21/2016 11:00 PM, David Anderson wrote:
>>> This makes it easier to parse the schema file for tool generation:
>>> each paragraph is either a non-docstring comment, or a docstring
>>> immediately followed by a Python dict describing an API item.
>>>
>>> Signed-off-by: David Anderson <dave@natulte.net>
>>> ---
>>>  qapi-schema.json     | 3 +--
>>>  qapi/block-core.json | 5 -----
>>>  2 files changed, 1 insertion(+), 7 deletions(-)
>>
>> Related to the work Marc-Andre is already doing, but fine to take now.=

>>
>=20
> Do you have a link to that work? It sounds like the schema format may b=
e
> changing, which is relevant to my interests since I'm trying to parse i=
t :).

https://lists.gnu.org/archive/html/qemu-devel/2016-09/msg05782.html

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--S6JoPpuS5Na3RQqelcQPxcXxehtf3AKN1--

--lOhqtLXWKw7Xk0hDhKK3BC1BBhexFgW05
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX5Y3pAAoJEKeha0olJ0Nq2n0IAIfCtiwnAg3XWoCQjeicrGx+
aumK/XywLIxd6LeIOxQnbC+xEBGC8uYQEfhQbz8Gqpakfn6c6/OJCrasJ6tKLpKP
E2rrZi0W2xFgwgC70WVmlD80dbVR0m3T1aycjLIFy9pZsCAJ5cGTN2AC0m6HBMiP
VzO88DJCviTN1JcF/A/xpIcHrVOlRQHPegYy7nJQiW9LwzAFEqiXnRX5VWpOt2oC
v3yB/krBpQYE0Dz7wMCTkSOp6ViAicjkYN3UDhPSEcK6L0QCKNm1VylMj7ceBaI9
N7d78FkB7A7I3uSLgCEm+1Pqr+dVPkgf8iZgcXtYtzEYxFADWRZ/I8rB05J7IOQ=
=O+4i
-----END PGP SIGNATURE-----

--lOhqtLXWKw7Xk0hDhKK3BC1BBhexFgW05--

