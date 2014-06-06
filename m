Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wt1lZ-00021A-0N
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 17:33:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Wt1lS-0001tk-G1
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 17:33:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Wt1lN-0000uH-Am
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 17:33:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60709)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Wt1lD-0000qP-83; Fri, 06 Jun 2014 17:33:15 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s56LXC1V012028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 6 Jun 2014 17:33:13 -0400
Received: from [10.3.113.102] (ovpn-113-102.phx2.redhat.com [10.3.113.102])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s56LXCvj006968; Fri, 6 Jun 2014 17:33:12 -0400
Message-ID: <53923397.8030505@redhat.com>
Date: Fri, 06 Jun 2014 15:33:11 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1402072328-6871-1-git-send-email-armbru@redhat.com>
	<1402083032-13852-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1402083032-13852-1-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FHFwafb7QQ15Li88wNKUUGwFoWX51Dsp5"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, alevy@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/1] libcacard: Clean up
 dead stores before g_free()
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
X-List-Received-Date: Fri, 06 Jun 2014 21:33:35 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FHFwafb7QQ15Li88wNKUUGwFoWX51Dsp5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/06/2014 01:30 PM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  libcacard/vcard.c   | 4 ----
>  libcacard/vreader.c | 2 --
>  2 files changed, 6 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--FHFwafb7QQ15Li88wNKUUGwFoWX51Dsp5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTkjOXAAoJEKeha0olJ0NqGR4H/25MhsQMhd/UsrCiRZ42y4cl
EivLgYbw6amkQYrX7hV8miBRCA02o5fXG55N6BE69sc5F+3BMZG3WHYoB5WfFjkt
7QH/eaAFzn+zjL+mn8mXtYl6aDxbZ3iIF93ROWrW+sCLPe2GBuj7UkiOeR3SilIQ
h0SIFCp/MXeBvpGglCJnWCLsJ8ltD1n1vOKpMJt+mmSA4Qaumr8FEyVnJWO4UvA1
lfha0qUUCfWm1Itpj2aLM/0OMBUJp+tXnqKsE5D7vaIErgfdFyrOIw6ZwSQAphsQ
mpJFVNpDXYZLkcyNuPA60nQqbo6VKd27qEkDxMcauZUpG60xTqNI92X4Z9CNLDo=
=Z3/s
-----END PGP SIGNATURE-----

--FHFwafb7QQ15Li88wNKUUGwFoWX51Dsp5--

