Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yd288-0003g3-Ur
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 15:47:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yd286-0003c9-50
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 15:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yd285-00057A-5z
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 15:47:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yd280-00056D-Qf; Tue, 31 Mar 2015 15:47:13 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2VJlAmx002199
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 31 Mar 2015 15:47:10 -0400
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2VJl9MC030979; Tue, 31 Mar 2015 15:47:10 -0400
Message-ID: <551AF9BD.5050001@redhat.com>
Date: Tue, 31 Mar 2015 13:47:09 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
References: <1427827750-610946-1-git-send-email-stefanb@linux.vnet.ibm.com>
In-Reply-To: <1427827750-610946-1-git-send-email-stefanb@linux.vnet.ibm.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="eT1g9xJQGkx6bXlTbB9sltD6XbWQwN1cd"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] tpm: Cast 64bit
 variables to int when used in DPRINTF
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
X-List-Received-Date: Tue, 31 Mar 2015 19:47:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eT1g9xJQGkx6bXlTbB9sltD6XbWQwN1cd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2015 12:49 PM, Stefan Berger wrote:
> Cast 64bit variables to int when used in DPRINTF. They only contain
> 32bit of data.
>=20
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>  hw/tpm/tpm_tis.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

The --cover-letter option is nice when sending a series (so that it
becomes obvious whether I'm replying to the series 0/2 or to an
individual patch 1/2).

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--eT1g9xJQGkx6bXlTbB9sltD6XbWQwN1cd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVGvm9AAoJEKeha0olJ0NqlR0IAK5ww5gGxw6jfjWEm5vqWJ+2
5sUO3IGnOMGHJprRBU2+8CaTouIMl0RElCHfiB392KCaQj53cNjjHsS0+UYw2iJN
0nvgZjr2Um+behMxYvnOm+eG6W5etRuIyKbI1KdTTdospswyNC8h0DvgpSQkr1qO
4Ebc8DK9/1fGmO1CuBJ5Srnj/FaOWSz6AxYXbOhoGFwZxa4jpPnW3s+oK2Lo2VBE
nEUfujFhe0YmTWMXP8X7BOVkYKmMcw+KBkY6iNdM7NpCCk1VJhfqq+WtfcmVRSPC
AAwtTvoUh2cnEp+uxmrVvJc/JmVTAVwTT0CzjgqS+xVH6husuO3spUWiWV+PoEA=
=4cN+
-----END PGP SIGNATURE-----

--eT1g9xJQGkx6bXlTbB9sltD6XbWQwN1cd--

