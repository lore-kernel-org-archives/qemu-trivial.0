Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmRe3-0007b3-FQ
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 13:46:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WmRdx-0007St-FM
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 13:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WmRds-00035Y-Sb
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 13:46:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WmRdj-00033W-M2; Mon, 19 May 2014 13:46:19 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4JHkHGf027578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 19 May 2014 13:46:17 -0400
Received: from [10.3.113.91] (ovpn-113-91.phx2.redhat.com [10.3.113.91])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s4JHkGlF013132; Mon, 19 May 2014 13:46:16 -0400
Message-ID: <537A4368.4020203@redhat.com>
Date: Mon, 19 May 2014 11:46:16 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1400519982-9264-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1400519982-9264-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="rwwTf4fn6MAoVVSRwXkoXhSIE1wIqU3vL"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Put tempfiles in a subdir of
	the build directory
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
X-List-Received-Date: Mon, 19 May 2014 17:46:37 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rwwTf4fn6MAoVVSRwXkoXhSIE1wIqU3vL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/19/2014 11:19 AM, Peter Maydell wrote:
> When libtool support was added to configure, the new temporary files
> were left out of the list of files cleaned up on exit; this results
> in a lot of stale .lo files being left around in /tmp. Worse, libtool
> creates a /tmp/.libs directory which we can't easily clean up.
>=20
> Put all our temporary files in a single temporary directory created
> as a subdirectory of the build directory, so we can easily clean it up,=

> and don't need fragile or complicated code for creation to avoid it
> clashing with temporary directories from other instances of QEMU
> configure or being subject to attack from adversaries who can write
> to /tmp.
>=20
> Since the temporaries now live in the build tree, we have no
> need to jump through hoops with a trap handler to try to remove
> them when configure exits; this fixes some weird bugs where hitting
> ^C during a configure run wouldn't actually make it stop, because
> we would run the trap handler but then not stop. (It is possible
> to get the trap handler semantics right but it is convoluted largely
> because of bugs in dash, so it is simpler to just avoid it.)
>=20
> Note that "temporary files go in the build directory, not /tmp" is
> the way autoconf behaves.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

> =20
> -# NB: do not call "exit" in the trap handler; this is buggy with some =
shells;
> -# see <1285349658-3122-1-git-send-email-loic.minier@linaro.org>
> -trap "rm -f $TMPC $TMPO $TMPCXX $TMPE" EXIT INT QUIT TERM

While we don't need a trap that jumps through hoops, it may still be
nice to have a 'rm -r ${TMPDIR1}' at the end of configure.  Just because
we cleanup a leftover config-temp on start from an earlier aborted run
doesn't mean that a clean run shouldn't clean up after itself.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--rwwTf4fn6MAoVVSRwXkoXhSIE1wIqU3vL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTekNoAAoJEKeha0olJ0NqpVcH/RhJ6AoT75DNi2POG/cENp5b
S2IN1Mif/KlvdIfsqFVrzyPnCDWu3HdcsyKyTujIAEDU1tKcypslliEvhf4tr09o
pxNAy6/hjDl9sfzJzTgHk4NrBThNjKLjfbMeobzcFUu4u9aAC3qZFJAuuTJqC1Bq
FY8/BpTsoJ9fBQ2TVbwbyCja0+OC7qP5OyEAdY9uBIocZ9kg1M3SN2Sr4lbGEDI5
rVc9K9VVKtObIOT0LGXjZaOhymqxCWmdc2sj1dXiwIRyshpLT7vaAVDcolXKhA4S
H+yOx7swnckCBBhuj5/k9WOVLp80SM6pXcivz26b8ievXhd6bv11WsUDg9kDEl8=
=hykL
-----END PGP SIGNATURE-----

--rwwTf4fn6MAoVVSRwXkoXhSIE1wIqU3vL--

