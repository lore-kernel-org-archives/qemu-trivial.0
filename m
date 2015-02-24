Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQIQD-0001gD-34
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 11:33:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YQIQB-0001dz-4u
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 11:33:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YQIQA-0002KJ-2M
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 11:33:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YQIQ5-0002IO-Id; Tue, 24 Feb 2015 11:33:13 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1OGX8PH018481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 24 Feb 2015 11:33:09 -0500
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1OGX7S8008143; Tue, 24 Feb 2015 11:33:07 -0500
Message-ID: <54ECA7C3.4040303@redhat.com>
Date: Tue, 24 Feb 2015 09:33:07 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, =?UTF-8?B?Sm9yZ2UgQQ==?=
	=?UTF-8?B?Y2VyZWRhIE1hY2nDoQ==?= <jacereda@gmail.com>
References: <A24CCA9D-484A-4AD0-A34C-8DFB6D891D7F@gmail.com>
	<CAEgOgz5069y4H1PFTf6-09KNnv3iADrJOGRDgUN5PoB5gFe0Kw@mail.gmail.com>
In-Reply-To: <CAEgOgz5069y4H1PFTf6-09KNnv3iADrJOGRDgUN5PoB5gFe0Kw@mail.gmail.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="f4wxQmEuhCNiCOM6fldcDlJ4BnfwWfELq"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix crash when connecting
 to VNC through websocket
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
X-List-Received-Date: Tue, 24 Feb 2015 16:33:20 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f4wxQmEuhCNiCOM6fldcDlJ4BnfwWfELq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/23/2015 11:09 PM, Peter Crosthwaite wrote:
> The subject should read V2 as this is a resubmit. Use git format-patch
> --subject-prefix=3D"PATCH v2".

Or shorter,

git format-patch -v2

Also, remember that 'git send-email' will take any options understood by
'git format-patch'.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--f4wxQmEuhCNiCOM6fldcDlJ4BnfwWfELq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU7KfDAAoJEKeha0olJ0NqwHQH/RPyy2BVsS2OKvbZX/RbImGa
dklj+aZ9AtNvJsNTsKnsIOajgKYlsmYx4fwmOoqRFwVo0odvhlli3ZzgtBdTCw0v
pKqxxo8H1N0LNFdxwCz5JMn7/p5Z5PrF4E1+5Et9OkPwxTTcSDUPcAjXTK7VjFuf
5j7cip0McyzyyyLJWZVkfXS8F/P+JcJRsbqBnDZwl2gNgEHRpHiTu6eLGQI6qR7w
DAQJWvcHgFsvFyuMHVyNLXCZoC97kIVpf8Bqi6cpwcDhypOds1KG6/15FYp8ub/w
dhtiOoRsWLBF1Pq6rdiXtYLYbwB9Ifol8oY2sck5snigoB665PeA94n+ht5tzVs=
=NeBI
-----END PGP SIGNATURE-----

--f4wxQmEuhCNiCOM6fldcDlJ4BnfwWfELq--

