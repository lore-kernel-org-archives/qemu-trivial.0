Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1vbl-0006Oj-2d
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 09:29:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1vbj-0006Na-Al
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 09:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c1vbh-0006M0-TK
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 09:29:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59674)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1c1vbd-0006Ho-AS; Wed, 02 Nov 2016 09:29:29 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C04664D85;
	Wed,  2 Nov 2016 13:29:28 +0000 (UTC)
Received: from [10.3.116.16] (ovpn-116-16.phx2.redhat.com [10.3.116.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA2DTQWK002272; Wed, 2 Nov 2016 09:29:27 -0400
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>, Stefan Weil <sw@weilnetz.de>, 
	QEMU Developer <qemu-devel@nongnu.org>
References: <20161101171927.25684-1-sw@weilnetz.de>
	<ccba1848-3170-c3d1-07ea-bfa2a02e70b6@redhat.com>
	<fa396830-84d2-734a-c51a-7d3073b10183@cn.fujitsu.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <ea7009c1-75d9-a7ea-641d-399d3b9c6689@redhat.com>
Date: Wed, 2 Nov 2016 08:29:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <fa396830-84d2-734a-c51a-7d3073b10183@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BCxNw7NPA0MVJiAO4AU7tXll4wgkHhHVT"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 02 Nov 2016 13:29:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix typos found by
 codespell
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
X-List-Received-Date: Wed, 02 Nov 2016 13:29:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BCxNw7NPA0MVJiAO4AU7tXll4wgkHhHVT
Content-Type: multipart/mixed; boundary="C8AImWGwwr0gUd06vBpXT94ITfQomjnkB";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <ea7009c1-75d9-a7ea-641d-399d3b9c6689@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] docs: Fix typos found by codespell
References: <20161101171927.25684-1-sw@weilnetz.de>
 <ccba1848-3170-c3d1-07ea-bfa2a02e70b6@redhat.com>
 <fa396830-84d2-734a-c51a-7d3073b10183@cn.fujitsu.com>
In-Reply-To: <fa396830-84d2-734a-c51a-7d3073b10183@cn.fujitsu.com>

--C8AImWGwwr0gUd06vBpXT94ITfQomjnkB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/01/2016 08:32 PM, Zhang Chen wrote:

>>> I still don't understand the comment in docs/colo-proxy.txt.
>> Me neither.
>>
>>
>=20
> Which part of the docs/colo-proxy.txt?

The one quoted below.

> Perhaps I can explain it more clearly and make the doc better.
>=20
>>> +++ b/docs/colo-proxy.txt
>>> @@ -158,7 +158,7 @@ secondary.
>>>     =3D=3D Usage =3D=3D
>>>   -Here, we use demo ip and port discribe more clearly.
>>> +Here, we use demo ip and port describe more clearly.
>>>   Primary(ip:3.3.3.3):
>>>   -netdev
>>> tap,id=3Dhn0,vhost=3Doff,script=3D/etc/qemu-ifup,downscript=3D/etc/qe=
mu-ifdown
>>>   -device e1000,id=3De0,netdev=3Dhn0,mac=3D52:a4:00:12:78:66
>> Maybe:
>>
>> Here is an example using demonstration IP and port addresses to more
>> clearly describe the usage.
>>
>> The remaining hunks are clear improvements, so:
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
> It's easier to understand.

Okay, so you like my proposal for a potential reword.  Now, who should
submit it as a patch? Stefan (since he found the confusing sentence in
the first place), you (since you wrote most of the document to begin
with), or me (since I proposed wording that you like)?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--C8AImWGwwr0gUd06vBpXT94ITfQomjnkB--

--BCxNw7NPA0MVJiAO4AU7tXll4wgkHhHVT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYGeo2AAoJEKeha0olJ0NqZl4H/3EYbWUJDYKuj+5qUsc23pzj
9mzQyk5ZZKxCy4zbyBHkKx09zyGbjAEoyxjf+YgaIBNFUlF8jDyYdb4KZA0xuisM
6MgZIBVEOMst2Ruy8Bvjaqcep5dPD63SaBheC6ZbyarSO1lSnfKdzYEbjFZNMBpx
qQFt9I63y0eX2G2Z5EE3mA+/Wfuswgj4+cWLlpt2D+Z9r66wsAG8WcyP7+j7uXmM
qqtp+skXu6tZ52TTetx5HlkZvNOS4MoWn84vfEMCqA3CbP9/ZaWJ9SJcDyFfJbI1
z3DzYEhh9L9s2EDGCqNa8YHmZwYGUP/24e3uBCXvkDDymaYWixLDVv2PCeEbkE4=
=Js3j
-----END PGP SIGNATURE-----

--BCxNw7NPA0MVJiAO4AU7tXll4wgkHhHVT--

