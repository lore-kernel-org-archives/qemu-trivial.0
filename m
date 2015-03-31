Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ycwr7-0000hw-AA
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 10:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ycwr0-0000aR-U0
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 10:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ycwqz-0005nF-OH
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 10:09:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53342)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Ycwqq-0005lL-Aw; Tue, 31 Mar 2015 10:09:08 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 6AAEDAE5A4;
	Tue, 31 Mar 2015 14:09:07 +0000 (UTC)
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2VE96gP022457; Tue, 31 Mar 2015 10:09:07 -0400
Message-ID: <551AAA82.9090608@redhat.com>
Date: Tue, 31 Mar 2015 08:09:06 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
References: <1427808437-535644-1-git-send-email-stefanb@linux.vnet.ibm.com>
In-Reply-To: <1427808437-535644-1-git-send-email-stefanb@linux.vnet.ibm.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="on8wxxKWXDpop714T2qNu4FW3bmHubfXE"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tpm_tis: fix format for
	64bit variable
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
X-List-Received-Date: Tue, 31 Mar 2015 14:09:24 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--on8wxxKWXDpop714T2qNu4FW3bmHubfXE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2015 07:27 AM, Stefan Berger wrote:
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>  hw/tpm/tpm_tis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index 815c8ea..52e0148 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -814,7 +814,7 @@ static void tpm_tis_mmio_write_intern(void *opaque,=
 hwaddr addr,
>              tis->loc[locty].state =3D=3D TPM_TIS_STATE_COMPLETION) {
>              /* drop the byte */
>          } else {
> -            DPRINTF("tpm_tis: Data to send to TPM: %08x (size=3D%d)\n"=
,
> +            DPRINTF("tpm_tis: Data to send to TPM: %08lx (size=3D%d)\n=
",

NACK.  When printing uint64_t val, you HAVE to use PRIx64, not lx, for
the sake of 32-bit platforms.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--on8wxxKWXDpop714T2qNu4FW3bmHubfXE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVGqqCAAoJEKeha0olJ0Nq3LoH/jBPKq/PHprX2Fo3qQw6U0Cx
U4MPxicRDd680hrUN+2nP2HYFGll6HZD3EDsNu9lotznhdB0yYCPEfSQLt5pyMHc
+YJGn4IzkX+Jf2W7XrUcKTkEa9YhBa6w7gmAm2TuaI2tz8kkPjRJR7VSS86c8lpG
ISKU+xUjK/1JqwdKLBA9boVroajKJCZ60kYGELZpVwqm/v489Nrzrk9h1Q6Ii61M
lGiY4tWbk8WIQA0j47xRccTVMYAESIwJAARdBoUi8md1thxBECx9W33VYGbxvkYj
CaDoWHesYAIdzwAKjPVVSOS0UiIV2QDD0faL8h/3YcMlTMTlPnurBGvtrkkKpKE=
=AdCa
-----END PGP SIGNATURE-----

--on8wxxKWXDpop714T2qNu4FW3bmHubfXE--

