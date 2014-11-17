Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqPb9-0007Pw-RD
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 11:56:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XqPb1-00079M-OW
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 11:56:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XqPaw-0001XH-BM
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 11:56:11 -0500
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:63952)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XqPak-0001PF-UY; Mon, 17 Nov 2014 11:55:55 -0500
Received: by mail-wg0-f42.google.com with SMTP id z12so7269568wgg.1
	for <multiple recipients>; Mon, 17 Nov 2014 08:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1If1+uqJjZdDq6cy1zaTUtoG9lUJ/X7ohMzHkIv3tEg=;
	b=biEctXzlCnSsnOh7KSa+PNa7t9gRSfNA4mYLty7UlyD0yXVoSBueqwqTMd+yydbu1u
	IZnuthQ5autWrRxZzYLczMCZCbwUAVI6Azb3UG7e8KCC9TCn+mkSdP3IGREHfeDd517J
	8aB8ex94P4x38VEeE1dVC12ROUmqH0N/bzoNHWhxm2Lnosh0nuWbTVZvUIjJXQD+UoMI
	VR0IHyXqH7vKoyupMDfymVRXwFSNxD2blV8tKse+I1UfX1ytOMQZSeYe3StqSWaiz/Yo
	h+i7vZrcEhlTthjdqh0BJW4jQfVkaerew71ssEinsDJxgQezCMzVFcBCdJaPN6090kaa
	1tfQ==
X-Received: by 10.180.99.163 with SMTP id er3mr32306166wib.18.1416243354071;
	Mon, 17 Nov 2014 08:55:54 -0800 (PST)
Received: from localhost ([212.159.126.148])
	by mx.google.com with ESMTPSA id wm6sm52276722wjb.5.2014.11.17.08.55.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Nov 2014 08:55:53 -0800 (PST)
Date: Mon, 17 Nov 2014 16:55:50 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: arei.gonglei@huawei.com
Message-ID: <20141117165550.GN16192@stefanha-thinkpad.redhat.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-6-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ll0BBk1HBk/f94B0"
Content-Disposition: inline
In-Reply-To: <1416046008-7880-6-git-send-email-arei.gonglei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/9] nvme: remove
	superfluous check
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
X-List-Received-Date: Mon, 17 Nov 2014 16:56:17 -0000


--Ll0BBk1HBk/f94B0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2014 at 06:06:44PM +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Operands don't affect result (CONSTANT_EXPRESSION_RESULT)
> ((n->bar.aqa >> AQA_ASQS_SHIFT) & AQA_ASQS_MASK) > 4095
> is always false regardless of the values of its operands.
> This occurs as the logical second operand of '||'.
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/block/nvme.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Ll0BBk1HBk/f94B0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUaiiWAAoJEJykq7OBq3PI1ywH/13plAcDGgXRrsbb8a3u+7Mo
mZ1UpK2oImsHY/yJMJI5mQQjHcIreOhzchnnibeiy+pK44RpnEihh8SGkBQa14CB
iTrhZfmkZlv/7aih2gw5guIErxFh9uxOhG51qXFk1t7s9/3wjjNDvzK/au7LFYGr
9hIYudGutPGgr/EQUSkRAWmZ+pnt1UUIyv2jzNrnGicIAxsjox4FTLmnrt2cYiaI
WNrE0Ruu/Hjtkoh3wqtIUtNns0lpBAAEIa53gZpV0SS/GxD+ISVzLz9ViWZsMWMN
dOXs+y2NyLyK9ovgG/CADK6/LSidghNgdEDdyXih+/+qsSavVq0BVt96Ho/Fvzw=
=fhU9
-----END PGP SIGNATURE-----

--Ll0BBk1HBk/f94B0--

