Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c24Tp-0002NJ-2N
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 18:58:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1c20RZ-0005ji-6t
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 14:39:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1c20RY-0001fe-Ep
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 14:39:25 -0400
Received: from mo6-p00-ob.smtp.rzone.de ([2a01:238:20a:202:5300::8]:23099)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1c20RV-0001ed-RN; Wed, 02 Nov 2016 14:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1478111959; l=721;
	s=domk; d=aepfle.de;
	h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date;
	bh=mdsuuGC4506PylHCIoLfaYi4EbEIZrNIJN4TMki49w4=;
	b=videbPex0zVnYkZAlwzzJkxbNtBkUk7fNFNy6RtEYpfKiqe2vSAHEJLLBzMpWZnHAdH
	3w7HrhwWppZbptazXnW3HYV6vwC/ObVRPqaX4ekKmAsaB4DIR8+oRdEnphB7lOKNLwV0/
	fG8keirnYwRPgpGvFR047ZWJjiGLH+Yufsc=
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+zrwiavkK6tmQaLfsxs2aAREi5Yt4MyS7h5A0q7VYPDcyk4OcYTviIL4IPGT+AR7E/VI=
X-RZG-CLASS-ID: mo00
Received: from probook ([2001:a62:1272:16ff:30fa:77d2:2a61:5f7f])
	by smtp.strato.de (RZmta 39.7 AUTH) with ESMTPSA id 40b7b7sA2Id9OT9
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 2 Nov 2016 19:39:09 +0100 (CET)
Received: by probook (Postfix, from userid 1000)
	id 5276450B76; Wed,  2 Nov 2016 19:39:08 +0100 (CET)
Date: Wed, 2 Nov 2016 19:39:08 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-trivial@nongnu.org,
	xen-devel@lists.xensource.com, xuquan8@huawei.com, emilcondrea@gmail.com
Message-ID: <20161102183907.GA16901@aepfle.de>
References: <1478081958-5803-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <1478081958-5803-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.6.2 (6759)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5300::8
X-Mailman-Approved-At: Wed, 02 Nov 2016 18:57:59 -0400
Subject: Re: [Qemu-trivial] [PATCH] hw/xen/xen_pvdev: Include qemu/log.h for
 qemu_log_vprintf()
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
X-List-Received-Date: Wed, 02 Nov 2016 18:39:26 -0000


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, Thomas Huth wrote:

> Olaf Hering reported a build failure due to an undefined reference
> to 'qemu_log_vprintf'. Explicitely including qemu/log.h seems to
> fix the issue.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Tested-by: Olaf Hering <olaf@aepfle.de>


Olaf

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgaMsUACgkQXUKg+qaYNn6rFQCgnRgd/oloh/8C35DmuMtdYAgL
/cwAoIFEFoN+FE00nVz3fxiHZJK1iie3
=pUik
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

