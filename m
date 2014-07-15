Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X73Xn-0005o2-KC
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jul 2014 10:17:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1X73Xg-0005ap-M5
	for qemu-trivial@nongnu.org; Tue, 15 Jul 2014 10:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1X73Xc-000357-8y
	for qemu-trivial@nongnu.org; Tue, 15 Jul 2014 10:17:16 -0400
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234]:65177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1X73XT-0002op-48; Tue, 15 Jul 2014 10:17:03 -0400
Received: by mail-wg0-f52.google.com with SMTP id a1so4866513wgh.11
	for <multiple recipients>; Tue, 15 Jul 2014 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Mke71dx2loCJF90kNHq312XsPZm1wjpHXHW2o6zsuZ8=;
	b=Nd9l3igD9Wry8WxhEA2wqXvjZBGPkC/liOpZ0QevfX56gjFxh8lTlnJjIIDSKIACbb
	gH0nt1dbnQ0FqkfiWeBSNXapbvb78XRPknYfLaQ+btU3oFSGxzrhsldtZR0LDS7TX3GJ
	E5/9UWWMFGlaQgef4hRa3ga874YPCmXQzSObtMM1ttBAgG8aY/fwgo3HBpE/sJyFTAht
	hQk4meKLU2tl3jJT7JVx+8uqH4UbcQndrEbodbV95KPsksoDyoQ+vJr+SP5EhyH/rxXH
	ijxZGvXVLz2xdls6kgLwMx7p+d4zYBlx+7EruXv7cBM2EpbxCr3x1v3Md1hOwB0nYDQ+
	6lSQ==
X-Received: by 10.180.94.104 with SMTP id db8mr5802967wib.23.1405433822124;
	Tue, 15 Jul 2014 07:17:02 -0700 (PDT)
Received: from localhost ([89.15.239.185])
	by mx.google.com with ESMTPSA id h3sm26110964wjn.10.2014.07.15.07.17.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 07:17:00 -0700 (PDT)
Date: Tue, 15 Jul 2014 16:16:58 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hu Tao <hutao@cn.fujitsu.com>
Message-ID: <20140715141658.GB9837@stefanha-thinkpad.redhat.com>
References: <1403775290-22307-1-git-send-email-hutao@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <1403775290-22307-1-git-send-email-hutao@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::234
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: explicitly state
 version requirements to devel packages
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
X-List-Received-Date: Tue, 15 Jul 2014 14:17:21 -0000


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2014 at 05:34:50PM +0800, Hu Tao wrote:
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
>  configure | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Thanks, applied to my block-next tree:
https://github.com/stefanha/qemu/commits/block-next

Stefan

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJTxTfaAAoJEJykq7OBq3PIcCkH+gPedyp4HdiKljAO3WmPCojz
DygFPlFzCwJiLwUkdClvvuOOPHWx0B9oVLSW1Qr+0ieKtWQmJZBWtaBpDbAM3yXw
ag+A9F0pu+F/4uFVZ0Qe8nWj9VVZ0Dm7EJ3tUxLu6dI4Kg7fhxH54sfMDg3vkljO
stltFzgN0zxoBLrLfe/pxNfbtM3rRpuHSkh3lSB7r4Gc4Oofkq4QrDTxZ2ReBHMe
m7oXoHeSfmE60564wTIPYHgnutlo81UfnZ25PedY+PLq67QgAUYSj927tHMWWxAU
dOnGwWxnzioDxtQo0OR4lbPIcfQ1FIB1HIMNnHXruEndfDL+B+IIeTZb+/M+Hkk=
=rut9
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--

