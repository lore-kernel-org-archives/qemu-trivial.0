Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wu1if-0002y6-FV
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jun 2014 11:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mischief@offblast.org>) id 1Wtrzb-00073u-Fg
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 01:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mischief@offblast.org>) id 1WtrzR-0006jQ-Le
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 01:19:35 -0400
Received: from mail-pa0-f54.google.com ([209.85.220.54]:53432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mischief@offblast.org>) id 1WtrzR-0006j4-Gf
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 01:19:25 -0400
Received: by mail-pa0-f54.google.com with SMTP id rd3so320948pab.13
	for <qemu-trivial@nongnu.org>; Sun, 08 Jun 2014 22:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=2/gpYlJ7peoWsnJg0bddMgSvSBADKrQD2pdqXH64KVw=;
	b=GLK+vrm27Qy91bYRljCtmnZZnkSP5pgBeKFIpESu1QO4ahMvj3eVkknCZQUFPY3b8U
	G6zBkYNOhsbqBkjEDa1W+0QOyHnjqoe4f/QNmUGkHlvS4RTYQOeWPpS5gQGGoqvDhCSn
	5EY4oxf6XgnUpKwTBXft0CBkl98MRSFv6k0FK2udpI+j2sRdc13bCNLrXUp12KGkRDj7
	qOQZpSsLHcgcxnoTaW2SQYXd0PDSXZDGMFKDvbfboPXUtGaUlKLkn5lNIszhRCGw6v17
	Uyg1PJ2jDa6ZDD9PHi8CPu9id4K/BCRZtOe+LFF69xW8FcxrWxP64uNd35ISAIRyonJ0
	gOng==
X-Gm-Message-State: ALoCoQmVmVofSneK0BM3vzWDIGrBYnd1MIHdr9UiR9AcE9ezoogzb3LNYz3rY9kF0jG0werggcxk
X-Received: by 10.68.253.73 with SMTP id zy9mr2154397pbc.114.1402291163926;
	Sun, 08 Jun 2014 22:19:23 -0700 (PDT)
Received: from iota.offblast.org (iota.offblast.org. [192.235.78.211])
	by mx.google.com with ESMTPSA id
	ib5sm61653223pbb.55.2014.06.08.22.19.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jun 2014 22:19:23 -0700 (PDT)
Date: Sun, 8 Jun 2014 22:19:17 -0700
From: mischief <mischief@offblast.org>
To: qemu-devel@nongnu.org
Message-ID: <20140609051917.GA17110@iota.offblast.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
User-Agent: Mutt/1.5.22 (2013-10-16)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.54
X-Mailman-Approved-At: Mon, 09 Jun 2014 11:42:43 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] hw: vmware_vga: don't return cursorx when
 the driver asks for cursory register
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
X-List-Received-Date: Mon, 09 Jun 2014 05:19:40 -0000


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hello qemu-*@nongnu.org, this is my first contribution. apologies if
something is incorrect.

this patch fixes vmware_vga.c so that it actually returns the cursory
register when asked for, instead of cursorx.

Signed-off-by: Nicolas Owens <mischief@offblast.org>
---
 hw/display/vmware_vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 9ba47e6..ab54b6f 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -863,7 +863,7 @@ static uint32_t vmsvga_value_read(void *opaque, uint32_=
t address)
         break;
=20
     case SVGA_REG_CURSOR_Y:
-        ret =3D s->cursor.x;
+        ret =3D s->cursor.y;
         break;
=20
     case SVGA_REG_CURSOR_ON:
--=20
2.0.0


--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTlUPUAAoJEAlFY6k1Rs31GQ8P/2mJd09THiDLFLMQKbGRpLxJ
BHRxkBF2fhJEWy4zcddeN/bOmyLji8WhFqYbEmcHHTYgiJHxUxMd99kbvAMOKFao
mDBKPnD9tu6Ojs7aJDodb99yaO/UcvM9eWVxU/zwHv/29/ogEzQby6bl5HpY9rnL
tY9tXcjS84y+Om/IYpujAAzJB+XE7yAJbDv0nGJ5aMMSKbyuH/T+qBpABfftY5GJ
12cXwV/OZSYBAk4n7Tn/A4eKfrz2a5Ao6A1bU1SZUJP4WZj7vdZq63ra6Jww/X1O
xAAJAlOj7Td92B4RiTXNRrLtoiTakoRuA4KC2IXipS8qr+inqFJ1NW3eJsu2rRN7
S0x9MRx1jzyIjF+FKE0vZHtWNVi2wY7vOGI/eFOaimxOid+5ZTCNC5JdJ3IuS8Oi
01kfJjTyG9oWouegIWcCRYbfmNuPQp0CS/hDpR2qMywGbD0z5QCSN8LQKh15u3HJ
g1o9a3um/40rOLtPJknuTw9nqlO5dTirvI/pefDQmbifzdxngkukxzOo24K3K0sO
SoMzUyERwtSW1/NLUC3P9q7DMI5Rp0Y2rJscxguhbmRKyw0itIxswr28DHMHCl/a
P2e0fagK/dHTccxCId3m6uB3+LkCV7gDuagosYd4qQSoIsFaMooNTu+wunVSoZCf
PVF54Si7jOpFBPr+ECs3
=eMAL
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

