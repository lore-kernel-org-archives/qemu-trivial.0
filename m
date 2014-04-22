Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wcdbu-0006wk-6e
	for mharc-qemu-trivial@gnu.org; Tue, 22 Apr 2014 12:31:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Wcdbo-0006jg-M6
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 12:31:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Wcdbk-0007KB-Iw
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 12:31:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Wcdbk-0007K5-BH; Tue, 22 Apr 2014 12:31:44 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3MGVd9J022595
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 22 Apr 2014 12:31:39 -0400
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s3MGVcjm026849; Tue, 22 Apr 2014 12:31:38 -0400
Message-ID: <5356996A.5090502@redhat.com>
Date: Tue, 22 Apr 2014 10:31:38 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <5353B7F9.4060803@gmail.com> <5355349E.6060601@redhat.com>
	<53569371.6010404@suse.de>
In-Reply-To: <53569371.6010404@suse.de>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="gwndXE23v1N1EPhALog5kjbdiahge1XOr"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chen Gang <gang.chen.5i5j@gmail.com>, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, aliguori@amazon.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] vl: Avoid to close
 stdout after finish 'writeconfig' option
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
X-List-Received-Date: Tue, 22 Apr 2014 16:31:52 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gwndXE23v1N1EPhALog5kjbdiahge1XOr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/22/2014 10:06 AM, Andreas F=C3=A4rber wrote:

>> Grammar, and awkward to read.  May I suggest:
>=20
>> vl: avoid closing stdout with 'writeconfig'
>=20

> Eric, did you intentionally request to change "Avoid" to lowercase?

Yes, out of habit, and in comparison to many recent commits.  In fact,
looking at the current qemu.git head 'git shortlog -100 2d03b49c' shows:

3 commits matching '\.$', 97 without
75 commits matching ': [A-Z]', 24 matching ': [a-z]' (some overlap here,
and merge commits don't match either)

extending further to 1000 commits:

21 commits with trailing dot, 979 without
644 matching ': [A-Z]', 260 matching ': [a-z]'

at 10000, things are a bit more even:
5187 matching ': [A-Z]', 3904 matching ': [a-z]'

but still a distinct leaning towards capital at the start of the message

> I was once pointed to https://wiki.gnome.org/Git/CommitMessages as a
> template, and starting an English-language heading with an uppercase
> letter seems natural, with anything else being too lazy to press Shift.=


Hmm, maybe we should update the qemu wiki?
http://wiki.qemu.org/Contribute/SubmitAPatch doesn't mention the qemu
preferred style (you pointed to the GNOME style, but at least GNU
coreutils explicitly prefers lowercase).

At any rate, I'm not going to reject a patch based on capitalization,
and can retrain my fingers to use a capital if that is the documented
preference.

> Personally I find -writeconfig the most straightforward way to
> indicate it's an option, just like () makes clear something is a
> function. The original subject had an explicit "option", that got lost
> for v2.

Good call, so maybe:

 vl: Avoid closing stdout with '-writeconfig'

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--gwndXE23v1N1EPhALog5kjbdiahge1XOr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTVplqAAoJEKeha0olJ0NqgbAH/1p/yfFT6EAfww+2RKbZK1Bp
ZpYfpxsmSnFIcqxOfkfmMlLLmqclDMikRQ0pdKWMZccM7z0wuLmPOnQi010/dnXV
fnPXd+Ods7bxXbXsAGWUbroFPFWybrsC2UNwcxpGKfI+hMUYMfSNRWw5NJJLK4gi
QreTKv4pigyZe4Vqkf3dvxoQQWwSfUIT2LB5pOENJUNfDtgl80ggLJ51HK+uaQ+b
XeMNeTDsif+LYK3MRJgt9DVQi06dtwrV/FC4ASACRHcq/ohUzmtKzQpNa34dcUk2
nx1JP3r1kbCRP9O8YjgcfSDT3TYBRH1V28ikx84j0qySLBymz4QfGox09uLbYw0=
=G9wA
-----END PGP SIGNATURE-----

--gwndXE23v1N1EPhALog5kjbdiahge1XOr--

