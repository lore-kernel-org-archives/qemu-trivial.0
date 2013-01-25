Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tyf6F-0006ML-HQ
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 03:57:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thardeck@suse.de>) id 1Tyf68-00064H-9W
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 03:57:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thardeck@suse.de>) id 1Tyf64-0002KN-1N
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 03:57:20 -0500
Received: from cantor2.suse.de ([195.135.220.15]:51171 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thardeck@suse.de>)
	id 1Tyf5o-0002HM-UU; Fri, 25 Jan 2013 03:57:01 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id D423AA38EA;
	Fri, 25 Jan 2013 09:56:59 +0100 (CET)
Message-ID: <1359104210.6884.5.camel@Thinktank.site>
From: Tim Hardeck <thardeck@suse.de>
To: Markus Armbruster <armbru@redhat.com>
Date: Fri, 25 Jan 2013 09:56:50 +0100
In-Reply-To: <1358961360-15623-1-git-send-email-armbru@redhat.com>
References: <1358961360-15623-1-git-send-email-armbru@redhat.com>
Organization: SUSE LINUX Products GmbH
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-pBoVSdmiNyj5iXsu+GCT"
X-Mailer: Evolution 3.4.4 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 25 Jan 2013 08:57:26 -0000


--=-pBoVSdmiNyj5iXsu+GCT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

thanks for your input.

On Wed, 2013-01-23 at 18:16 +0100, Markus Armbruster wrote:
> Use appropriate types, drop superfluous casts, use sizeof, don't
> exploit that this particular call of gnutls_fingerprint() doesn't
> change its last argument.

your patch does work fine but if we expect gnutls_fingerprint to change
the hash_size there has to be an additional check if the hash_size is
bigger than SHA1_DIGEST_LEN.

For example:

diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
index de7e74c..e64c895 100644
--- a/ui/vnc-ws.c
+++ b/ui/vnc-ws.c
@@ -132,7 +132,7 @@ static void vncws_send_handshake_response(VncState
*vs, const char* key)
     in.data =3D (void *)combined_key;
     in.size =3D WS_CLIENT_KEY_LEN + WS_GUID_LEN;
     if (gnutls_fingerprint(GNUTLS_DIG_SHA1, &in, hash, &hash_size)
-            =3D=3D GNUTLS_E_SUCCESS) {
+            =3D=3D GNUTLS_E_SUCCESS && hash_size <=3D SHA1_DIGEST_LEN) {
         accept =3D g_base64_encode(hash, hash_size);
     }
     if (accept =3D=3D NULL) {


--=20
SUSE LINUX Products GmbH, GF: Jeff Hawn, Jennifer Guild, Felix
Imend=C3=B6rffer, HRB 16746 (AG N=C3=BCrnberg)
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
T: +49 (0) 911 74053-0  F: +49 (0) 911 74053-483
http://www.suse.de/

--=-pBoVSdmiNyj5iXsu+GCT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQEcBAABAgAGBQJRAkjVAAoJENur/L6EMd675kUIAJ0aC3W9fzcWLLZuxU7taELf
nvs4j5FXAQsrtsrTRZhrJcCV3aeoZ/AsM3P6JK65+p0vU0QSOd8+Ca+ddG8CxZ2B
/EID3VrzgI76cN0N3Z3ydPnND/1VpX/Ba9PNzh5K6FobcelzLmJBujYVwbqwJaI9
LjD4DkKTKMAy5ODtuKB7K8EJrS1L4HUOOCTcrdKrcW86U4JxmWxnAmOVtsozSpJy
7lXqfZ1tk/lQ4h7NXrzFFkjk+5QbYx9l66UZvHxmRJyu6QKgbzCeg1VGkSUorXhB
WA17fL4r/K7d7RaI8kjtaqk1BFTcJMxCvMU+eN2mqB24pfs1cc4Fx9UJtsQzv3o=
=dj1J
-----END PGP SIGNATURE-----

--=-pBoVSdmiNyj5iXsu+GCT--


