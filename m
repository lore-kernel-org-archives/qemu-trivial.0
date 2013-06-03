Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjTqa-0006da-Uk
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 08:26:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UjTqT-0006Ui-G3
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 08:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1UjTqM-0002Wn-Pz
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 08:26:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1UjTqC-0002V9-Or; Mon, 03 Jun 2013 08:26:24 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r53CQNv4018122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 08:26:23 -0400
Received: from [10.3.113.96] (ovpn-113-96.phx2.redhat.com [10.3.113.96])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r53CQMal017786; Mon, 3 Jun 2013 08:26:22 -0400
Message-ID: <51AC8B6E.9040002@redhat.com>
Date: Mon, 03 Jun 2013 06:26:22 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
	<1370249911-19708-3-git-send-email-stefanha@redhat.com>
In-Reply-To: <1370249911-19708-3-git-send-email-stefanha@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2KWDXDAEFFLRLRQFLFMFD"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Cam Macdonell <cam@cs.ualberta.ca>, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] ivshmem: add missing error exit(2)
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
X-List-Received-Date: Mon, 03 Jun 2013 12:26:47 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2KWDXDAEFFLRLRQFLFMFD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/03/2013 02:58 AM, Stefan Hajnoczi wrote:
> If the user fails to specify 'chardev' or 'shm' then we cannot continue=
=2E
> Exit right away so that we don't invoke shm_open(3) with a NULL pointer=
=2E
>=20
> It would be nice to replace exit(1) with error returns in the PCI devic=
e
> .init() function, but leave that for another patch since exit(1) is
> currently used elsewhere.
>=20
> Spotted by Coverity.
>=20
> Cc: Cam Macdonell <cam@cs.ualberta.ca>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/misc/ivshmem.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index a19a6d6..5658f73 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -735,6 +735,7 @@ static int pci_ivshmem_init(PCIDevice *dev)
> =20
>          if (s->shmobj =3D=3D NULL) {
>              fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshme=
m\n");
> +            exit(1);

Reviewed-by: Eric Blake <eblake@redhat.com>

However, I prefer exit(EXIT_FAILURE) rather than exit(1), to make it a
bit easier to grep for known failure exits.  Libvirt has a syntax
checker (taken from gnulib) that enforces such a style, if qemu would
like to adopt that style.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2KWDXDAEFFLRLRQFLFMFD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJRrItuAAoJEKeha0olJ0NquWYH/2rTxMe1WXdux/XEesEYf/n7
6DoTAGhd6IekEkh3bqbArbEcdFzPNioLyxkjURpo0CaBN0qK7VoYzSYWH3seDiyF
Zu/WDguHpH9bLQNmu8XgRp38zRIlCOBW3JAC1hbEGMW2nglHVhTotRlkJ7p2Sjf8
hOPsTYdNcMAKh3T+vFeWxckzo7iPIrMWPomUE+FQGCnspX5AHMvgHhyFRBlJAJl9
8wdCqYnvC2EBt11BRNYwi57O+XuHJ7XV9QopT5MHUencDgUBM9tugEVdJJCspEoX
LBPgGdXxpzN/UEvNl4OMFtYYVGbLS+zZuhla1SFDQhwzE4EI0iPBaLUuYuJ3x2U=
=a+kT
-----END PGP SIGNATURE-----

------enig2KWDXDAEFFLRLRQFLFMFD--

