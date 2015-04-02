Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdaxK-000404-L0
	for mharc-qemu-trivial@gnu.org; Thu, 02 Apr 2015 04:58:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YdaxI-0003xU-HE
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 04:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YdaxH-0001vy-Qu
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 04:58:28 -0400
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:38709)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1YdaxD-0001uh-LI; Thu, 02 Apr 2015 04:58:23 -0400
Received: by wibgn9 with SMTP id gn9so97206569wib.1;
	Thu, 02 Apr 2015 01:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=azDnWYk6Bd+6Cc+RNZ1ZeNqG+FcT3xGW5Y4DJRUnNRs=;
	b=lSQmKqLoFVx7XC1wl4UaI3aBPG2Y35KS1LtMxbeDgz1jPO2X3zmNsxJYNSd6Phy6Wa
	VRrBDuh1oNmyeOredyR/1iHfm+vkazJ+gboGADm2Z7+1nVM+k8ShpFRQECmcfYWzemBa
	oolWXPr0xMrZxuQic6/w0FqlMM4ffJ0cKdvdbovPSb2Tfxy5QhTH4FOtpyKBxu++xbnW
	MoF0hY0V/MNXJ64VxtpoBjiYRQQsBk6kt96cux2MP43CLGjcXsLMdIYUn6zMiJYLDsUh
	GY778Rr2OYvO3h+VP9OswKI5FuIM7uaqu8RS8UkCZyJq7N1FBqUhnzvNp6BQqDc6bIZF
	CU/Q==
X-Received: by 10.194.110.69 with SMTP id hy5mr93842633wjb.121.1427965102919; 
	Thu, 02 Apr 2015 01:58:22 -0700 (PDT)
Received: from localhost (host109-158-220-195.range109-158.btcentralplus.com.
	[109.158.220.195]) by mx.google.com with ESMTPSA id
	dn7sm29058502wid.12.2015.04.02.01.58.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Apr 2015 01:58:22 -0700 (PDT)
Date: Thu, 2 Apr 2015 09:58:18 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ed Maste <emaste@freebsd.org>
Message-ID: <20150402085818.GD20229@stefanha-thinkpad.redhat.com>
References: <1427911118-21905-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline
In-Reply-To: <1427911118-21905-1-git-send-email-emaste@freebsd.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use $(MAKE) for recursive
	make
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
X-List-Received-Date: Thu, 02 Apr 2015 08:58:29 -0000


--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2015 at 01:58:38PM -0400, Ed Maste wrote:
> On BSDs "make" is typically BSD make, while "gmake" is GNU make.
>=20
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Same on Solaris, if I remember correctly.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVHQSqAAoJEJykq7OBq3PInN4H/1HQYR5unaoRtZDAWTG48Mxc
/Ne3cTQ6XGvkZ/qR5fxLG4w9UFvGKU/pVi0I+eS7c3mRIyUOwj+6p/qDfjl2dBKT
3GqdcFtGQxwJYkdZuXDSlMSlP69dGO+e2cpetSAcRYzCdvFWVfu9kfBKlrHxQhOV
hNI3zjKL7da0hGMBXpPKgd6bZxK6FkPj7JaceHa0WjDB1ZVxejwpjFS2jxEq2ngC
R98OQxmJiG3wRWeUTnr6nTkwKne2W0Xlhzip5Zba/yX/WKsugoKb6ig78E3igvFz
rKfd8atSUUZ3eH06aK6HzvxoAOj9I0OFyeTi8VcEE53Ub06r1buOtTV44gBgvKo=
=/33n
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--

