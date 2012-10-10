Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TM0YG-0007J0-Gc
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 13:58:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TM0Y8-0007IG-1k
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 13:58:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TM0Y6-0000DX-9E
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 13:58:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TM0Y5-0000D9-UI; Wed, 10 Oct 2012 13:58:26 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9AHwOR4003680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 10 Oct 2012 13:58:25 -0400
Received: from [10.3.113.23] (ovpn-113-23.phx2.redhat.com [10.3.113.23])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9AHwMcB024831; Wed, 10 Oct 2012 13:58:24 -0400
Message-ID: <5075B73E.9020506@redhat.com>
Date: Wed, 10 Oct 2012 11:58:22 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
In-Reply-To: <50759F9E.3060800@redhat.com>
X-Enigmail-Version: 1.4.4
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig2E036F849F6642211FD8F566"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtfs-proxy-helper: check
 return code of setfsgid/setfsuid
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 17:58:35 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig2E036F849F6642211FD8F566
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/10/2012 10:17 AM, Paolo Bonzini wrote:
> Il 10/10/2012 18:14, Stefan Weil ha scritto:
>>>
>>>
>>> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.=
c
>>> index f9a8270..b34a84a 100644
>>> --- a/fsdev/virtfs-proxy-helper.c
>>> +++ b/fsdev/virtfs-proxy-helper.c
>>> @@ -290,8 +290,12 @@ static int setfsugid(int uid, int gid)
>>>           CAP_DAC_OVERRIDE,
>>>       };
>>>   -    setfsgid(gid);
>>> -    setfsuid(uid);
>>> +    if (setfsgid(gid) !=3D 0) {
>>> +        return -1;
>>> +    }
>>
>> Wouldn't setfsgid(gid) =3D=3D gid be also ok?
>=20
> Of course, it should be < 0.  I have no idea how to test this thing...

POSIX states that uid_t and gid_t may be unsigned, so checking for < 0
is not necessarily possible (really, all you can check for is equality
with the same value as ((uid_t)-1) when put through integer promotion
rules).

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig2E036F849F6642211FD8F566
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQEcBAEBCAAGBQJQdbc+AAoJEKeha0olJ0NqkbEH/3AaFLRZiJz1SqPWD80U0OES
eWSpoYJYxHTMKlZYwxPGPyUeI0qrCAKbEVyjVO36F55T0az5YD8ubV0qGYO1It9O
qQhkrbWmpN235jUTX2VW/RahO5cNFS6kvbL+xoGa1LzBftUqFv/1gjknIMRDlU36
6hGczQuhm4N97ycYDRd1uUD3TrBiXIpUFjDRZOVqjnwQda9/Esjc4+mjkAcfS6r2
3rQHUQk2CRqi6RarWyLggORym4ck95rQgnymdNl7gNpllBJ3VboEmE7KfvOiB3UA
MvcorI8fOv/4tD52+VIMT0GSZp021TxWADcGdYIw23m8RCfapAB5fXtmvA0cNlo=
=pFH2
-----END PGP SIGNATURE-----

--------------enig2E036F849F6642211FD8F566--

