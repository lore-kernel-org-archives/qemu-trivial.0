Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zgv2f-0001SL-HC
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2015 09:34:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZgahY-0006io-0A
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 11:50:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZgahW-0005yL-Um
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 11:50:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZgahJ-0005ar-B1; Mon, 28 Sep 2015 11:50:37 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E18E3C0B64C1;
	Mon, 28 Sep 2015 15:50:36 +0000 (UTC)
Received: from [10.3.113.188] (ovpn-113-188.phx2.redhat.com [10.3.113.188])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SFoZcQ009044; Mon, 28 Sep 2015 11:50:36 -0400
To: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <1443211950-8207-1-git-send-email-sw@weilnetz.de>
	<871tdjni3w.fsf@blackfin.pond.sub.org> <5608F9BC.603@weilnetz.de>
	<5609576F.2060407@redhat.com> <56095A66.8050003@weilnetz.de>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <560961C7.7090209@redhat.com>
Date: Mon, 28 Sep 2015 09:50:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <56095A66.8050003@weilnetz.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="TG15S1OpUxSpdVC0ehX8NlOfngrXothKP"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace/simple: Fix warning
 and wrong trace file name for MinGW
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
X-List-Received-Date: Mon, 28 Sep 2015 15:50:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TG15S1OpUxSpdVC0ehX8NlOfngrXothKP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/28/2015 09:19 AM, Stefan Weil wrote:
> Am 28.09.2015 um 17:06 schrieb Eric Blake:
>> On 09/28/2015 02:26 AM, Stefan Weil wrote:
>>
>>>> Can you explain why osdep.h's
>>>>
>>>>     #define FMT_pid "%" PRId64
>>>>
>>>> is appropriate for Windows?
>>> Don't blame me for any strangeness which you might find in Windows. :=
-)
>>>
>>> Mingw-w64 sys/types.h defines pid_t to be either an int or an __int64=
=2E
>>> FMT_pid must match these definitions.
>>>
>>> But getpid returns an int, not a pid_t...
>> Can we 1) file a bug against mingw for their buggy getpid(), and 2)
>> write a wrapper that makes getpid() always return pid_t in the meantim=
e?
>=20
> 1) No, because MinGW and Mingw-w64 use the same declaration as MS.
> They cannot change that, of course. Nor will MS correct this after many=

> years, for obvious reasons.

If getpid() always returns int, then defining pid_t to __int64 feels
wrong.  I still claim its a mingw bug to have a mismatch in types.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--TG15S1OpUxSpdVC0ehX8NlOfngrXothKP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWCWHHAAoJEKeha0olJ0Nq7boH/0HBdJhLk5Q2iB1n8tizEyom
YlIEmQn6t+TTtKCJPfOQVK4HoAgiCzXcaVuJexgMW79sIe7ABPDWkPbeNAiNMxcS
qeIHssSEJQ/3PVLLZa2PbVYQd8CWQu2R5kOywbiBT4f3Klqcoh+omtbFKArCqqln
2yJXW9YiHOOpU65nb2p/GWc21W0CSGaJoLiG52N56gYNMck+F7fyMd5ho02d5CS8
mj9P4RB+ybNXtP451+RxGMUXbpvJJTZ/+zJTk0X/b8jGLxlHjMqH4tiiqEfRvXtj
JZ3Knar71LUo1mKcz5TtAhJ0zA9JYOc6J1Bi7AfY/ekMmCQZRc9SHUW/mwbLGZU=
=5I5h
-----END PGP SIGNATURE-----

--TG15S1OpUxSpdVC0ehX8NlOfngrXothKP--

