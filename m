Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wcgdp-0000j2-Uy
	for mharc-qemu-trivial@gnu.org; Tue, 22 Apr 2014 15:46:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Wcgdk-0000gC-PW
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 15:46:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Wcgdg-0001yG-Dm
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 15:46:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Wcgdg-0001y2-5d; Tue, 22 Apr 2014 15:45:56 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3MJjqbO031127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 22 Apr 2014 15:45:52 -0400
Received: from [10.3.113.120] (ovpn-113-120.phx2.redhat.com [10.3.113.120])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3MJjpqE029267; Tue, 22 Apr 2014 15:45:51 -0400
Message-ID: <5356C6EE.5040005@redhat.com>
Date: Tue, 22 Apr 2014 13:45:50 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <5353B7F9.4060803@gmail.com> <5355349E.6060601@redhat.com>
	<53569371.6010404@suse.de> <5356996A.5090502@redhat.com>
	<CAFEAcA9E6E7qt9X1QfQm3Gaa4PGt21MNdSB6ok94ht3zQK459A@mail.gmail.com>
In-Reply-To: <CAFEAcA9E6E7qt9X1QfQm3Gaa4PGt21MNdSB6ok94ht3zQK459A@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="NXHRS3Wpl66efHWsPlsbAiI6FnjxiMPHL"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Chen Gang <gang.chen.5i5j@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: [Qemu-trivial] commit log tips [was: [Qemu-devel] [PATCH trivial]
 vl: Avoid to close stdout after finish 'writeconfig' option]
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
X-List-Received-Date: Tue, 22 Apr 2014 19:46:05 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NXHRS3Wpl66efHWsPlsbAiI6FnjxiMPHL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/22/2014 01:18 PM, Peter Maydell wrote:
> On 22 April 2014 17:31, Eric Blake <eblake@redhat.com> wrote:
>> Hmm, maybe we should update the qemu wiki?
>> http://wiki.qemu.org/Contribute/SubmitAPatch doesn't mention the qemu
>> preferred style (you pointed to the GNOME style, but at least GNU
>> coreutils explicitly prefers lowercase).
>>
>> At any rate, I'm not going to reject a patch based on capitalization,
>=20
> Yeah, it doesn't really seem worth trying to enforce niceties
> of style here -- the effort required doesn't seem to really match
> the benefit, and we already have a lot of hoops we make new
> submitters jump through. "[file or area being patched]: [reasonably
> descriptive short summary]" is about the limit I personally feel
> comfortable insisting on.

So, given this discussion, I enhanced the existing paragraph in the wiki
page mentioned above to include a couple more sentences:

'''Write a good commit message'''. QEMU follows the usual standard for
git commit messages: the first line (which becomes the email subject
line) is "subsystem: single line summary of change". Whether the "single
line summary of change" starts with a capital is a matter of taste, but
we prefer that the summary does not end in ".". Look at <code>git
short-log 30</code> for an idea of sample subject lines.  Then there is
a blank line and a more detailed description of the patch, another blank
and your Signed-off-by: line. The body of the commit message is a good
place to document why your change is important. Don't include comments
like "This is a suggestion for fixing this bug" (they can go below the
"---" line in the email so they don't go into the final commit message).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--NXHRS3Wpl66efHWsPlsbAiI6FnjxiMPHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTVsbvAAoJEKeha0olJ0Nquv0IAIfni2p3+yKS+ehzMwVp2YQ+
ANqZkHFXCHsK7MOHjp641MbTXQNT39M9T0C7khA7XXo/U30bzYeVyAF2H9m3X8HJ
kzzcDI3/SvCO3uktWY+Kiad1b/lCYNgV4sgrnRbVst9Yq9GS2jO/iAgC2hV45yWF
K2MGVFGqWSLRTdzUp3U4yLH8ujonZuYsFI4QUEhCQ4SCiVkqjSadeO5tXYNhn9b8
mbSTeQXiOuleeq1VjZtzUfBqMnHL9+ufVi/e4Pidggd5xVoQ7tWYI5RA30dNHrGn
k1KUXfSCyQ5PJdJHfvJz+Tn+VYGU8Kqm0DYrTxfLqA/otPeV8Tn9H5hWqvm6uag=
=XMgg
-----END PGP SIGNATURE-----

--NXHRS3Wpl66efHWsPlsbAiI6FnjxiMPHL--

