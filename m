Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW6CP-0000Cy-FU
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 12:43:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YW6CN-0000Ak-8X
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 12:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YW6CI-0001Bj-J4
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 12:43:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YW6CI-0001BC-BK; Thu, 12 Mar 2015 12:42:58 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2CGgujR027539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 12 Mar 2015 12:42:56 -0400
Received: from [10.3.113.70] (ovpn-113-70.phx2.redhat.com [10.3.113.70])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2CGguZA016886; Thu, 12 Mar 2015 12:42:56 -0400
Message-ID: <5501C20F.4060407@redhat.com>
Date: Thu, 12 Mar 2015 10:42:55 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1426172243-7830-1-git-send-email-pbonzini@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="jBxPEf7dP4nSTLw2dPGEGPnBJP45wV1em"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: fix resource leak with
	monitor_fdset_add_fd
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
X-List-Received-Date: Thu, 12 Mar 2015 16:43:04 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jBxPEf7dP4nSTLw2dPGEGPnBJP45wV1em
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/12/2015 08:57 AM, Paolo Bonzini wrote:
> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
> command add_fd).  Free it.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  vl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--jBxPEf7dP4nSTLw2dPGEGPnBJP45wV1em
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVAcIQAAoJEKeha0olJ0Nq6kQH/jhQK4sDp/dlLg3rt8pTVKVo
hhmGX7IC7iDRxvSyhNbE8nXKBLCGWb+6skurUwYU01HeVJO8GBYLAvf8WLea3VnT
2bpTFYXCSxaO5tkj6lPPci5zeWBOOc6AkBueCdCmDKtw9FvCAflJxUPx4rlllJ+Z
Nkfd5E6wfZ08ooV96/5oh6w61hdkh9C3I0KxpH5YYjQgKkrGv7pm6Rw8/rRWj1yI
+hfHU4GaozWJaUowLA3riEnfRaAv+/1tR5lCEvw5AQyV6uQi0beSyl+kDUaE7aoz
4e2Bmw71CcWCAEoNz3GErRGYpuFfGeNU0vxwCrrnin74EE5+rVzo5jaFW/SIYqc=
=Nku+
-----END PGP SIGNATURE-----

--jBxPEf7dP4nSTLw2dPGEGPnBJP45wV1em--

