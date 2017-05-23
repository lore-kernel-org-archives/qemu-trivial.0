Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDADe-0002WZ-HP
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 09:51:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dDADc-0002Vb-85
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 09:51:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dDADb-0005Pa-MK
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 09:51:24 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dDADW-0005OP-JG; Tue, 23 May 2017 09:51:18 -0400
Received: by mail-lf0-x241.google.com with SMTP id 99so8180223lfu.2;
	Tue, 23 May 2017 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+/qcrPTiVrUurGj6QvLfGUoT8T8krgSQ7w8o6MU/Cr0=;
	b=md6phWgtuqAIhUPxZElntqsHzHH+KCN3sQyYHGiY58N0FQf/rvKq6aUKJqKBVPYB08
	WZ7JqCQBHW8TBumhchEncqPJSFzA7F/rUyL2lFyQ4CCxpcq1fxKzsJfMfUqJgzIQBSlX
	Sb6OxJfaY68YHDtX5tw4X+CS+7A4V8jnpcv2wNyI1ImnYGDbd0rnIcTeXQX7u9yl1evM
	bo5NhpUOZoGJnHp/+AlUj8DEzHxspfRyV1x7DLuhxMXtLF+FFnpT5h7OoPE5mF7jWZWu
	xLoAU6nt7AaZfSF5yjXH0BHaoOKed+TRgOuuKxxHsOinE1s1J3Kb97bnlkq2mF/aiRAi
	j/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+/qcrPTiVrUurGj6QvLfGUoT8T8krgSQ7w8o6MU/Cr0=;
	b=WDK5IdZ1/KKyVRXk5cgJeTgBSznNKXxrDIVBO+9kMzjbFG5hdfe+uLQxB4LmxneOQd
	42+w9AcAYIb53KXvszetJfOoYHrlEqS1ejspNxHtVZZ1VJnq+FPQO+UFu7vuFeuvJcaJ
	jdwzbghyAl4Idd3LaLpUkdw/DEoqwFI0P+EDI0xc37iB45sv+k+0K9OB0KazAEenIWb5
	lpH/AQ3o8oUdU3OhfO6yP2J293ASPcxnpMUEiDAvOEN69Uj5+n+kSfHIV02JymDooaVg
	LBgTd9Pb9QL3YVOo94cRtIknLVodv3jHGzkvyUYN0URYJod2YvHEO0Y++BdYTRdYYZZL
	WH4g==
X-Gm-Message-State: AODbwcBajGdxk803dVNjYdKXSVfsCtro5X70ZWVidq2mMvYtNyhl9z5B
	VKk0+fmhQO/vkw==
X-Received: by 10.223.132.163 with SMTP id 32mr16101257wrg.154.1495547476802; 
	Tue, 23 May 2017 06:51:16 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id 39sm1115961wru.50.2017.05.23.06.51.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 May 2017 06:51:15 -0700 (PDT)
Date: Tue, 23 May 2017 14:51:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170523135114.GE17369@stefanha-x1.localdomain>
References: <1495484805-4201-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Content-Disposition: inline
In-Reply-To: <1495484805-4201-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Add hyperlinks to
 further license information
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
X-List-Received-Date: Tue, 23 May 2017 13:51:25 -0000


--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2017 at 10:26:45PM +0200, Thomas Huth wrote:
> Add a link to the GPLv2 and a link to the LICENSE file in the
> QEMU repository to fix the two TODO items in this appendix.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-doc.texi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZJD5SAAoJEJykq7OBq3PIUX0H/1TwPrPt3yq39mlXyGTPNfMU
v+kHNAAbJBI9KulIncLuoQt00Uy6cbwHHimrbnYon7sOIbPqlKjrsoJPUPYdOUvI
ui0MoXS8UXTisTrZ23caLypVaRN+T7vYntmAmz4tmr4oYXRNa8XbYH2GXFsP3fod
O8JEgVDCURygy6BA2BpGxVjyB+FXc4aXM/KcXFc5iEHhrz27WcofrEo1Z/P9KiBG
VzxQm+eWeUUT67Ggqx+ARFb3s4eIOhPiyBTv4n/eQJjwUf6TR1nHShYk8e5Ci2qr
mPM544oZmn+ZGXjfheENFyvnDFKkkBYWHBjfj/fdPjrFOQIUTpkR7MiwMOegLjI=
=cv3Q
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--

