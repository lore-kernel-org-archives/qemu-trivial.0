Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XosVZ-00011l-5i
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 06:24:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XosVR-0000tW-ND
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 06:24:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XosVM-0000AW-8Q
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 06:24:05 -0500
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236]:51438)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XosVB-00007u-4m; Thu, 13 Nov 2014 06:23:49 -0500
Received: by mail-wg0-f54.google.com with SMTP id n12so16566994wgh.27
	for <multiple recipients>; Thu, 13 Nov 2014 03:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qAW4y7gKnpmo3atFsV9lAl/mBoeKda8H/4mumAXdcio=;
	b=YniIpQs22pNngUGVG6m6fcLus/8l5W6RCccb9FOa5hY2xBJ8sgLjde29JHbSfweuTV
	rNJALUjBSOHMPHtv76T3oc1LWd5Jub5f7Cvj0vtgenWv1BwzRXxosXRGrvQQd9MewOEn
	JgzF04Fn7pRENrGfhInn8ml8HCsXfRi9/oXK/Bk0v6m9arg32R1KF3fCr8hxaFpM+lDP
	C7Kwl31+GFtQne0mDcXEYr0F62IR+Mzb0R2Zs8Tl5/QL/MNJdjQKS22+fEAcCEVba0UY
	85BesjSOoolQeprk5x5mNyuZ598Stfi/m50KKlgcgBPLOQAw6CVWBNUwf3gsxjbGTOS4
	7OWA==
X-Received: by 10.194.2.141 with SMTP id 13mr2997435wju.9.1415877828460;
	Thu, 13 Nov 2014 03:23:48 -0800 (PST)
Received: from localhost ([212.159.126.148]) by mx.google.com with ESMTPSA id
	wr9sm35122345wjb.42.2014.11.13.03.23.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Nov 2014 03:23:47 -0800 (PST)
Date: Thu, 13 Nov 2014 11:23:45 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: arei.gonglei@huawei.com
Message-ID: <20141113112345.GM7462@stefanha-thinkpad.redhat.com>
References: <1415846372-12756-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UUMz/kfoogzZ9WLZ"
Content-Disposition: inline
In-Reply-To: <1415846372-12756-1-git-send-email-arei.gonglei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::236
Cc: qemu-trivial@nongnu.org, mst@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-bus: avoid breaking
 build when open DEBUG switch
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
X-List-Received-Date: Thu, 13 Nov 2014 11:24:11 -0000


--UUMz/kfoogzZ9WLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2014 at 10:39:32AM +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/virtio/virtio-bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--UUMz/kfoogzZ9WLZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUZJTBAAoJEJykq7OBq3PIx1sH/0mPNwv//5sBLMMCsTpXhnM/
WeSvPqJSrgqgRcPxzP5m+YmVFJXzXCrnU9nMCnqp47z5Nv1S5ETCUb3/B6BP5Jsr
+wF2nWTHanN8iIuE9VwxEw+fg2vJZAMrrOfL+QPfZogrHT/x57MMZPrhJ4lJxcyy
zSQmJ8f4gPeHbwR9QCipBv2IU7Bpl0cvgwOWKupgZtApFcwaArxVY1YVWJB+VC4v
hZm4hpjdTE6PHlIkG3m1Q769O3wgcszVAwFCEk1gNWdoaH2mFBVfQLyUhfZ+Bx0O
GVNr1TUfpBIDcNAGMIrWuqba7eoj17umDtTl3+h/EG2GhCbOxRlKm+h7SpoTz04=
=6mke
-----END PGP SIGNATURE-----

--UUMz/kfoogzZ9WLZ--

