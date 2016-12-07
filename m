Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cEeXb-0008Dk-OD
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2016 10:53:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cEeXZ-0008Bo-70
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 10:53:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cEeXY-0003GG-F2
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 10:53:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cEeXQ-0003DI-Hr; Wed, 07 Dec 2016 10:53:44 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C2BC624C4;
	Wed,  7 Dec 2016 15:53:43 +0000 (UTC)
Received: from [10.10.66.44] ([10.10.66.44])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB7FrgFC022770; Wed, 7 Dec 2016 10:53:42 -0500
To: Frediano Ziglio <fziglio@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20161207123959.4565-1-fziglio@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <61c44ab2-01c7-4187-7a5a-6c498f70e31c@redhat.com>
Date: Wed, 7 Dec 2016 09:53:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161207123959.4565-1-fziglio@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3slJwEJIqtUMOs0Q4Rw7nqaxnmANIkICu"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 07 Dec 2016 15:53:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: Fix typo in
 documentation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2016 15:53:54 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3slJwEJIqtUMOs0Q4Rw7nqaxnmANIkICu
Content-Type: multipart/mixed; boundary="8rN6lOVMCNd3iR3qg61A5Cg0ajCkWspK3";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Frediano Ziglio <fziglio@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <61c44ab2-01c7-4187-7a5a-6c498f70e31c@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] usb: Fix typo in documentation
References: <20161207123959.4565-1-fziglio@redhat.com>
In-Reply-To: <20161207123959.4565-1-fziglio@redhat.com>

--8rN6lOVMCNd3iR3qg61A5Cg0ajCkWspK3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/07/2016 06:39 AM, Frediano Ziglio wrote:
> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>

Mentioning 'simliar' in the commit message would make it easier to pick
out which word is being changed, when not using a colored-by-word diff.

This patch can also go through qemu-trivial (cc'd).

Reviewed-by: Eric Blake <eblake@redhat.com>

> ---
>  docs/usb-storage.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/docs/usb-storage.txt b/docs/usb-storage.txt
> index fbc1f2e..551af6f 100644
> --- a/docs/usb-storage.txt
> +++ b/docs/usb-storage.txt
> @@ -34,7 +34,7 @@ with tree logical units:
>  Number three emulates the classic bulk-only transport protocol too.
>  It's called "usb-bot".  It shares most code with "usb-storage", and
>  the guest will not be able to see the difference.  The qemu command
> -line interface is simliar to usb-uas though, i.e. no automatic scsi
> +line interface is similar to usb-uas though, i.e. no automatic scsi
>  disk creation.  It also features support for up to 16 LUNs.  The LUN
>  numbers must be continuous, i.e. for three devices you must use 0+1+2.=

>  The 0+1+5 numbering from the "usb-uas" example isn't going to work
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--8rN6lOVMCNd3iR3qg61A5Cg0ajCkWspK3--

--3slJwEJIqtUMOs0Q4Rw7nqaxnmANIkICu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYSDCEAAoJEKeha0olJ0NqTyYH/ilgBCPnyyW2gFDna3cC+Qg7
sm0SmDVD3VxpQKU//yj0yiACSG9S4B3xEXwSNbOFry5WCBHKvwjjRErO1aw8lNKk
WlslPstfqos/ka8Gv3O49euGgZs4Ak26Wi6cdwzIwZLPdBbLg9Q5357HPIKeZWrh
PhPvaVrKA2fQP+3e9EBBXlM/TcaC0LDtOzJegD04Gv1LxtQN7Llt7p8x29ali5EY
gEjaXz5ZbgkzCfMBs68hgEMAHp8DDbgrAFcgr9UtUav2gjJvp+fmRa1jGfNZgJpX
w/U2dd4rJggXBC9Jz7VAAH+muomYUSA7T0m1U90z34qJQ260/yytWmVKBYtcdhA=
=dys6
-----END PGP SIGNATURE-----

--3slJwEJIqtUMOs0Q4Rw7nqaxnmANIkICu--

