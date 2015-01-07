Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8t3B-0000RI-6m
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jan 2015 11:01:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Y8t36-0000Ij-HO
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 11:01:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Y8t31-000481-2J
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 11:01:32 -0500
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:60008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Y8t2t-00046B-CX; Wed, 07 Jan 2015 11:01:19 -0500
Received: by mail-wi0-f175.google.com with SMTP id l15so7793047wiw.8;
	Wed, 07 Jan 2015 08:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+rNpvEDZRvX3RBYq0HOYOOBgHrk0pzNYU06KeKqexTY=;
	b=i3Lb5IIfk3nIxbxKqGIulPg9yENZ+ii+lNdvd9la1szMbHmL5G08S5etgl4xCxsjft
	vZgn7BbyWt3AS6JOMzD2cIY+gN/M4y5yJ/O4ahqv8EwpGWChvGZ4VCSwKtjPyraZSEBj
	5GqTkgLPdfN5RIon4p2O+VTlzVTP0D+dQg3wJZvXooOQBigV2vPDSke8//78yn4y7Xiw
	zqTMx/LJq5sLOgrq6iwTWhAo/baGQ+R7Ovx598tFti3qnPg7OX4WLsvuJzrOC3IT1pEI
	UktOgYOztYSqtsdrWbphDoY3DFy6trYyqiMFhQAibPYNZXV+PYbJfczIlgAvucwx2md5
	FAQQ==
X-Received: by 10.194.200.1 with SMTP id jo1mr8030963wjc.64.1420646477907;
	Wed, 07 Jan 2015 08:01:17 -0800 (PST)
Received: from localhost ([31.185.131.133])
	by mx.google.com with ESMTPSA id uq1sm2636381wjc.14.2015.01.07.08.01.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 08:01:16 -0800 (PST)
Date: Wed, 7 Jan 2015 16:01:15 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20150107160115.GM22440@stefanha-thinkpad.redhat.com>
References: <54909AB6.7020705@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Aaj1jBvBEV7KRjLi"
Content-Disposition: inline
In-Reply-To: <54909AB6.7020705@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22f
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/net/xen_nic.c: Free
 'netdev->txs' when map 'netdev->rxs' fails
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
X-List-Received-Date: Wed, 07 Jan 2015 16:01:36 -0000


--Aaj1jBvBEV7KRjLi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2014 at 04:48:54AM +0800, Chen Gang wrote:
> When map 'netdev->rxs' fails, need free the original resource, or will
> cause resource leak.
>=20
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  hw/net/xen_nic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Thanks, applied to my net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

--Aaj1jBvBEV7KRjLi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUrVhLAAoJEJykq7OBq3PIUkAH+QG0jGxdMzKE0M3EwjSxUE2B
lPEKukOvHhWPXh8NeDIg9xi/Spt/9cEbCKcu+w1FdAASQmCpdsHWWhVnWUBTsl8/
500Za3lyML8rMhFm8vsS0sWpkE8hZSSBUW7zw3EdkIcAaTxVNqKSXDt/73jwaxxt
rp61n9aMBVLFEIVhLjKeHEWDN1J8EV3R7PolqBN13DZ2C2XQnAC4gSKb/dL0S070
GlgWSJvVUkz2shXdKVfAxtbn40qYQbJPSOonggY/cWwAMbt3I1ZWNn1ngGuMNa05
yd+i3BaOBi/VYmcWFHga3lazYFpF9VVkMMgOt2KOpXF/43EQT7dYO2qAr6bp34s=
=yTGQ
-----END PGP SIGNATURE-----

--Aaj1jBvBEV7KRjLi--

