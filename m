Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyP6v-0004dK-IF
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2013 10:53:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thardeck@suse.de>) id 1TyP6s-0004Tx-9v
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 10:53:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thardeck@suse.de>) id 1TyP6k-0001fw-E2
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 10:53:02 -0500
Received: from cantor2.suse.de ([195.135.220.15]:48418 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thardeck@suse.de>)
	id 1TyP6V-0001TN-QW; Thu, 24 Jan 2013 10:52:40 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id B6E14A4EB7;
	Thu, 24 Jan 2013 16:51:57 +0100 (CET)
Message-ID: <51015892.5000301@suse.de>
Date: Thu, 24 Jan 2013 16:51:46 +0100
From: Tim Hardeck <thardeck@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1358961360-15623-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1358961360-15623-1-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.4.6
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig9473377017D7860FC87AB3B4"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vnc: Clean up
	vncws_send_handshake_response()
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
X-List-Received-Date: Thu, 24 Jan 2013 15:53:05 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig9473377017D7860FC87AB3B4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On 01/23/2013 06:16 PM, Markus Armbruster wrote:
> Use appropriate types, drop superfluous casts, use sizeof, don't
> exploit that this particular call of gnutls_fingerprint() doesn't
> change its last argument.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Tim Hardeck <thardeck@suse.de>

Regards
Tim

> ---
>  ui/vnc-ws.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
> index 9ccdc19..de7e74c 100644
> --- a/ui/vnc-ws.c
> +++ b/ui/vnc-ws.c
> @@ -120,8 +120,8 @@ static char *vncws_extract_handshake_entry(const ch=
ar *handshake,
>  static void vncws_send_handshake_response(VncState *vs, const char* ke=
y)
>  {
>      char combined_key[WS_CLIENT_KEY_LEN + WS_GUID_LEN + 1];
> -    char hash[SHA1_DIGEST_LEN];
> -    size_t hash_size =3D SHA1_DIGEST_LEN;
> +    unsigned char hash[SHA1_DIGEST_LEN];
> +    size_t hash_size =3D sizeof(hash);
>      char *accept =3D NULL, *response =3D NULL;
>      gnutls_datum_t in;
> =20
> @@ -133,7 +133,7 @@ static void vncws_send_handshake_response(VncState =
*vs, const char* key)
>      in.size =3D WS_CLIENT_KEY_LEN + WS_GUID_LEN;
>      if (gnutls_fingerprint(GNUTLS_DIG_SHA1, &in, hash, &hash_size)
>              =3D=3D GNUTLS_E_SUCCESS) {
> -        accept =3D g_base64_encode((guchar *)hash, SHA1_DIGEST_LEN);
> +        accept =3D g_base64_encode(hash, hash_size);
>      }
>      if (accept =3D=3D NULL) {
>          VNC_DEBUG("Hashing Websocket combined key failed\n");
>=20


--=20
SUSE LINUX Products GmbH, GF: Jeff Hawn, Jennifer Guild, Felix
Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
T: +49 (0) 911 74053-0  F: +49 (0) 911 74053-483
http://www.suse.de/


--------------enig9473377017D7860FC87AB3B4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQEcBAEBAgAGBQJRAViVAAoJENur/L6EMd67WKwH/joWcze0GNvRprGYLULIQLwn
cnv/vPdHlTPPWLKSPqA4OMYtbEyors+b+AzyuDHzlPYd0l5HH/IeGk2HauFUp3eL
90l4zNjkRSCVA37I8SS8nfJ0B3A9PCbey3uZMiz/PtZAHHXoR/bIR2j1U8kPcc5d
LGgtwYl9nLmikcZPvsIObwK+D+Pp+JRsjHEBmOSWSG3TjYX9ag9H1sTmykqg+/f4
ZIrqZa5IHEXDk11Y/xA7t/dOnYgt9QAXZqHZag4iKMewlLqIMRCphsnUTGShmqJ4
gp/NK51UMnQlxjsx+R9O5W6vhVmWzU1QA/ayfYW/UIfNSnX4qaZIlrGl1jV6CP4=
=MIou
-----END PGP SIGNATURE-----

--------------enig9473377017D7860FC87AB3B4--

