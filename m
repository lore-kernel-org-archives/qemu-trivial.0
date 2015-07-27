Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJqRB-0001lE-IF
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 17:59:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZJqR9-0001hx-9V
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 17:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZJqR8-0002tL-Cr
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 17:59:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZJqR1-0002ny-QH; Mon, 27 Jul 2015 17:59:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id EDF918CF5F;
	Mon, 27 Jul 2015 21:59:46 +0000 (UTC)
Received: from [10.3.113.140] (ovpn-113-140.phx2.redhat.com [10.3.113.140])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6RLxk8r024472; Mon, 27 Jul 2015 17:59:46 -0400
To: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
	<20150702113102.39ab42a5@redhat.com> <559BFF5B.4050405@redhat.com>
	<87615biaux.fsf@blackfin.pond.sub.org> <55B5A5C3.2070705@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <55B6A9CC.8040004@redhat.com>
Date: Mon, 27 Jul 2015 15:59:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55B5A5C3.2070705@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="C0nUwrDwPgaqoBO54LgxdLxR4dvpDcXla"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-shell: add documentation
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
X-List-Received-Date: Mon, 27 Jul 2015 21:59:56 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C0nUwrDwPgaqoBO54LgxdLxR4dvpDcXla
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/26/2015 09:30 PM, John Snow wrote:

>=20
> It's a giant circle of people just barely out of the loop. During the
> 2.4 window I augmented the QMP shell tool to be able to issue
> transactional commands, and improved the json/python parsing for the
> key=3Dvalue pairs.
>=20
> It was primarily motivated by wanting an easy way to issue and test
> bitmap commands.
>=20
> Eric Blake knows the most about the improvements, as he was the origina=
l
> reviewer, but you know how this list likes to strip him out of the CC
> fields.

More my fault (and mailman's lousy defaults) than anything else,
although I have my own filters set up to try and flag anything with my
name, so I usually catch conversations even if I'm omitted from cc.

Did you still need my review on this series at this point, or is it
covered now?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--C0nUwrDwPgaqoBO54LgxdLxR4dvpDcXla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVtqnNAAoJEKeha0olJ0NqqUUIAIRvMZy4QCfP/Lg5e2sGzlG3
9jZ92yvu3gbqLjstbIIt01e+yZLpgaCivNvzuXFtHg3MHInvxprL2KHF7NTuBHtc
QmtxIuwZnGeFBhTTyLWPkE4HCVBY7zC/hstnnWCKz8rNezvQUVodtnx93gVSmYbT
IJUPkMizmcPwQOxKl9P1t/bV5QJncdS92eZ/QJzikg3WaCmsZ4Z8Dw+fOHCGVpRA
hQl3stt9ASGSAB6yHGdNKvFCrlmnkcQMK23pd9a8cglq+0cl9Y2/mLazbkX8x7Ms
zK94smIwRYjSPRNG6DI8nCPfs6gfJsBuaqIdNtuq44Q9oBh7LSaZ0d/pM+fawfY=
=Naoa
-----END PGP SIGNATURE-----

--C0nUwrDwPgaqoBO54LgxdLxR4dvpDcXla--

