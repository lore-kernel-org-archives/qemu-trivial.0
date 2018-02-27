Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eqi60-0000zz-Ik
	for mharc-qemu-trivial@gnu.org; Tue, 27 Feb 2018 11:27:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1eqi5y-0000yq-Oq
	for qemu-trivial@nongnu.org; Tue, 27 Feb 2018 11:27:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1eqi5x-0004f1-SQ
	for qemu-trivial@nongnu.org; Tue, 27 Feb 2018 11:27:14 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:35357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1eqi5t-0004ca-8o; Tue, 27 Feb 2018 11:27:09 -0500
Received: by mail-wr0-x242.google.com with SMTP id l43so25531293wrc.2;
	Tue, 27 Feb 2018 08:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SHTi1ptFg4tj3FN7MGUs7sLtaP//gJml1zOSaC2b4J0=;
	b=Wm2BGxxxUnEtI4B6ZLo2m19wfN8ZTN3CSdShu5Fr45csvA2sbzRJ+quuaDX+t9mO3g
	JuNsPsFhHxgqPsGDw03Iwi6HacciHfPtLfs2I2c9EMZwf43CbCxq3KicR+xgqYEsd8Li
	WtnfxirJmExti4F20qaH8coGy1CguT6TXm770ZfvZ/Tllbhkvk1n4Lb0hvREsfwtP+8f
	8dUF31o56Hyepy9EVQuGhWZrnNJqNDw50veYpBf47KOxIz1X2ygsLS8h3u8BAUROMKdb
	Op8JALOaUSfAAsl37m0RV393SGIrLJPmyiBomNW6kqBYBGJ9bp22FBOQ/ooXhA8Xikwb
	P75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SHTi1ptFg4tj3FN7MGUs7sLtaP//gJml1zOSaC2b4J0=;
	b=nCQEKrNK6c9nwhQzlwdnDsD4DE/vrIN+GDpAf3SgSGlWi8Ccq32EEmKnHjd/H4nS29
	rRHuA0BtF9jsB0bmm3n+QRSxBZ25JYiM4Ctk+2ub6FOoPpx32ygOBJ+OPNrGRv4zDJ1m
	OjNLHNfue9Xs91DLNS/9+ombPWqX5IaQBwnFH9op1ce2nr9ioeVrat8ru31natt1dnUm
	MGkm8vwzjw6z9Mio6DoD6HT8ihg/XVhoSVpympt3KW2AamX4fJN5kEvJbQ3EPp5v2fg8
	UBh2aUXLRjyMUtPFCoXjOGsPbteTIAAKaD61hsdkIIC7LBFmSFLRHfoL1E/LZaf3Yp28
	tS5g==
X-Gm-Message-State: APf1xPDigmoEdeS4xy3HOSd2jga1Jo6IKkUAaINujO71hZmTXAn4tR8D
	k7OtK1rsJO7os67QGBYxoaE=
X-Google-Smtp-Source: AH8x227VKOLZpyFPoh/Br2eEqLRHdba/6iFiIF6aOmWwEalhyzkGzAgub/oSn81pWaZWIzy8MzoHOg==
X-Received: by 10.223.164.221 with SMTP id h29mr14268358wrb.259.1519748828280; 
	Tue, 27 Feb 2018 08:27:08 -0800 (PST)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id v4sm9641873wme.43.2018.02.27.08.27.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 08:27:07 -0800 (PST)
Date: Tue, 27 Feb 2018 16:27:06 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180227162706.GE32480@stefanha-x1.localdomain>
References: <1519713884-2346-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline
In-Reply-To: <1519713884-2346-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/libqos: Check for
 valid dev pointer when looking for PCI devices
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
X-List-Received-Date: Tue, 27 Feb 2018 16:27:15 -0000


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2018 at 07:44:44AM +0100, Thomas Huth wrote:
> dev could be NULL if the PCI device can not be found due to some
> reasons, so we must not dereference the pointer in this case.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/libqos/virtio-pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

There is no maintainer for tests/libqos/virtio-pci.c in MAINTAINERS so
I'll take this patch.

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJalYbaAAoJEJykq7OBq3PIeWYH+wQc1uvX6qBxs7PR/wAKFLcJ
uVXFMxSX1rjTOVtmYqmt6/OvYVBwiichpDPhq8ScG38DRgGuMbysPsOzIRABSTPZ
aKGjmcywA/a2gjzPMDnjaYPJAmOsDbe7BU+AuFRry8AVZNzuq6boJHdKDnF0U5Ok
xonBXSKXvQwcodgai/PdhkTKLXHQ/MmVqn9aohxZDlqQ1c/pSJylWgfZ10/s16jL
lcOJ80sRSOIC1TvUTkB9d9BB110I6u7QByMraV+Q341+kCyHqUAPptfcuCNt92+q
C/MTGTTso2c4CrYylu635pMTzoJXhUVPI85cs2RUA5iQy9j2HtahSX4qGgBFSkY=
=/65K
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--

