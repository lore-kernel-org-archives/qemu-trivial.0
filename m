Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqPX0-0007cd-U3
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 11:52:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XqPWu-0007Rd-GG
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 11:52:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XqPWo-00006p-QE
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 11:51:56 -0500
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:36788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XqPWd-00005M-Jm; Mon, 17 Nov 2014 11:51:39 -0500
Received: by mail-wi0-f172.google.com with SMTP id n3so2291467wiv.11
	for <multiple recipients>; Mon, 17 Nov 2014 08:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zy2gJtu/cPY6p5org4yoUWQ6tFO+VJbhEVEcDAMzyzs=;
	b=TwNn+fjFora316wSMRWv4GxDHLGN14nlKryIL8GxSnhxNSmodjCuxhcoAvvyDDSV9c
	z45KUex5glm/5s2VeaoaiwfiS3LAURj1phRP8WZgTyPENBaLIFdvuwSPiBC33fXx8ur8
	15VK+YEdu0g/LCMsnpgCKhqdltD42ghpZYdg737z6cEiKzdp4q4iVg2psBJVVQH7yraE
	QJsOmqeVRcc+R/cr4btnn12KIkVHQgmOUfmHgjxE1lPm4vCF2sWQ3QsSsBR3e0xIkVow
	DnKZets23Ey9pVjyROuJqOidtBrgiLMQOKjjAwypj+O0/5ajG1dZ1GL1NG0kYEwYU+Iz
	gGjg==
X-Received: by 10.180.11.65 with SMTP id o1mr33217558wib.22.1416243098069;
	Mon, 17 Nov 2014 08:51:38 -0800 (PST)
Received: from localhost ([212.159.126.148])
	by mx.google.com with ESMTPSA id ce1sm52259627wjc.2.2014.11.17.08.51.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Nov 2014 08:51:36 -0800 (PST)
Date: Mon, 17 Nov 2014 16:51:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: arei.gonglei@huawei.com
Message-ID: <20141117165134.GM16192@stefanha-thinkpad.redhat.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-2-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zHDeOHGDnzKksZSU"
Content-Disposition: inline
In-Reply-To: <1416046008-7880-2-git-send-email-arei.gonglei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/9] l2tpv3: fix fd leak
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
X-List-Received-Date: Mon, 17 Nov 2014 16:52:02 -0000


--zHDeOHGDnzKksZSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2014 at 06:06:40PM +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> In this false branch, fd will leak when it is zero.
> Change the testing condition.
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  net/l2tpv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zHDeOHGDnzKksZSU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUaieWAAoJEJykq7OBq3PIMokH/2SGYAarIC6K2gnEXgcXP8Re
ghSvdPCSAdj80MDhsDv+iUxLeOXptz6Z0HXhmkkeb3BoQEF5+IauyrHSIDM2dCrc
zsZmfJ48sXi1Z9pIGynqtqjDBeOZ4t2e0SUM+1IMdKLYPqzWnePYXPHtjMCyGXvk
qj/Xl3F68YtC+haScZ0iij1OStAE/fYI0C2ecfY5jPoDYRlGUViR58HLwWbwE6mM
fDYPdqIyvGTsfuPnQ4zzXajzSD3jaH/4W72EtUNYIwxcf/99+4aVM+8KkUH743mb
XPEbE02kLU2CDVabI0mSfQ5TF52G1L30SBv28tDHsuwqyqN4xJXByTLGSrdITJM=
=LjZY
-----END PGP SIGNATURE-----

--zHDeOHGDnzKksZSU--

