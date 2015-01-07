Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8t33-0000CW-Np
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jan 2015 11:01:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Y8t30-00007J-Rt
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 11:01:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Y8t2z-00047g-Ef
	for qemu-trivial@nongnu.org; Wed, 07 Jan 2015 11:01:26 -0500
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b]:33733)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Y8t2w-00046s-U0; Wed, 07 Jan 2015 11:01:23 -0500
Received: by mail-wi0-f171.google.com with SMTP id bs8so7794778wib.4;
	Wed, 07 Jan 2015 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w7A/O55/KmoBkyEjPN0hAWucVo822XPiljN5fL/Tpk8=;
	b=1BsCsaKUvFFrs2eSdV/TeBTGbDiYYFdF4JfdHc/jwgh/tcsdQMQh0c1wcashjRX42d
	2eNhpZn5u5qqZturgcznhDMuZDhHpP5KfwSe+Xw4mUlzLRq339c+ZqVOtN/KFKQYnJsg
	ZcdqlrjIP4AXK9fUs+K2JQvZIRHw2Qcusi/qpxAE5tmhLgftlIkmO+IbMHZW8RKzWF+E
	JLd3b9mqx2yW4E9ACsM3lxcoBYxkUqi2Lug/Lw9iecD/Mi1ECFSOR93T48zDUBnH8Grm
	EJtsEwI4gRqknjWuT2CWHpehbS4brQWQJDjNoVZDOdfpSKnb8BCDtZbTOxBVbXD9eahS
	BRow==
X-Received: by 10.194.71.169 with SMTP id w9mr7401112wju.19.1420646482173;
	Wed, 07 Jan 2015 08:01:22 -0800 (PST)
Received: from localhost ([31.185.131.133])
	by mx.google.com with ESMTPSA id x2sm2642949wjx.9.2015.01.07.08.01.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 08:01:21 -0800 (PST)
Date: Wed, 7 Jan 2015 16:01:19 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20150107160119.GN22440@stefanha-thinkpad.redhat.com>
References: <54909B80.4030602@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Y142/9l9nQlBiaj"
Content-Disposition: inline
In-Reply-To: <54909B80.4030602@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22b
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/net/xen_nic.c: Need free
 'netdev->nic' in net_free() instead of net_disconnect()
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
X-List-Received-Date: Wed, 07 Jan 2015 16:01:28 -0000


--4Y142/9l9nQlBiaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2014 at 04:52:16AM +0800, Chen Gang wrote:
> net_init() and net_free() are pairs, net_connect() and net_disconnect()
> are pairs. net_init() creates 'netdev->nic', so also need free it in
> net_free().
>=20
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  hw/net/xen_nic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to my net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

--4Y142/9l9nQlBiaj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUrVhPAAoJEJykq7OBq3PIJu0H+wQ0gxu04l7QCE/+ESxlun/v
kFNiB+HsQCHKXZO4lm3ju5HYvJRFk4XU7W6/x63/6J3j0jQWbvIh5QXOecOpwHce
yP5b+Z1Fs7duediGDSL3fy7eJUCJKXEns8XDg2DCOV+B/HBpztypD9E1/+SJEU7W
baiwt29H9HFjYOn/2mtvAEV45fopE5bhzxJ3KT3wPSZ0yBOC+Gg2b4gwVc1boYT6
UNRBlmmY6gcopNKfWIcbSF/malu88uxGLI+sDRXD9XA8ZBghYBKm+hiN2IYcOFVE
amkEaXNzwfg8Sy1w0szzFV00hUWz7Tw/wzw8Y9XiTpsSat/w9Uzi9mPcS3QDywM=
=WPkD
-----END PGP SIGNATURE-----

--4Y142/9l9nQlBiaj--

