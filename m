Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxFlO-0006Cp-0f
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 09:55:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZxFlK-00069t-T0
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 09:55:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZxFlJ-0004ym-K0
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 09:55:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZxFlD-0004wI-15; Fri, 13 Nov 2015 09:55:31 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 892F33453D6;
	Fri, 13 Nov 2015 14:55:30 +0000 (UTC)
Received: from [10.3.113.115] (ovpn-113-115.phx2.redhat.com [10.3.113.115])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tADEtTYY002563; Fri, 13 Nov 2015 09:55:30 -0500
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1447353228-30550-1-git-send-email-eblake@redhat.com>
	<20151113102603.GH6650@stefanha-x1.localdomain>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5645F9E1.6070108@redhat.com>
Date: Fri, 13 Nov 2015 07:55:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151113102603.GH6650@stefanha-x1.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="N4SlvTElSF9VGLBCFa9bVwa28aaGr2fJM"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Ignore
	test-blockjob-txn
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
X-List-Received-Date: Fri, 13 Nov 2015 14:55:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--N4SlvTElSF9VGLBCFa9bVwa28aaGr2fJM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/13/2015 03:26 AM, Stefan Hajnoczi wrote:
> On Thu, Nov 12, 2015 at 11:33:48AM -0700, Eric Blake wrote:
>> Commit 6c6f312d added a new test, but did not mark it for
>> exclusion in .gitignore.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> Yeah, I know this affects only non-VPATH builds, which we don't
>> recommend, but we might as well be consistent.
>=20
> I'm a non-VPATH diehard too :)
>=20
>>  tests/.gitignore | 1 +
>>  1 file changed, 1 insertion(+)
>=20
> Thanks, applied to my block tree:
> https://github.com/stefanha/qemu/commits/block

Did you want to apply v2 instead?
https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg03214.html

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--N4SlvTElSF9VGLBCFa9bVwa28aaGr2fJM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWRfnhAAoJEKeha0olJ0Nqdr0H/2fOosqWvK871t3Nacr/h6Ad
Yd5BZmrmEXZy0t4dLfIgiJgU0PqlEv4n3tumdUiZPTeQ01ITk9I7ls42eUZ0CZFh
HrjDcrKdfFNRtqIiLuIluw5SBKto5is9u+dDeJS27ntooYlAOYxcb0IVhVLLwbQ7
s6IYR0pv3F2gw96liAp6S2Br1w05mEv6TRn7XNz0dzj6LXK/b38cuW8syjphKk2L
3D6V2ZHyi8YhUOi8weWC0mFB16xMasuBHR4sNhhkXCBPEum+RZJ5z5X6YHN4ONk/
aZXmxfWlN0AbEE7corLdA+4RUcGp9rlsX2+ntfzEH67bzY7JNj6TKNIAmok0MwA=
=zJNd
-----END PGP SIGNATURE-----

--N4SlvTElSF9VGLBCFa9bVwa28aaGr2fJM--

