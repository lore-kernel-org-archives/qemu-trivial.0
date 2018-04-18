Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8mhl-0001qF-NS
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 09:00:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8mhk-0001pu-0t
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8mhe-0003NV-75
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:00:56 -0400
Received: from mo6-p02-ob.smtp.rzone.de ([2a01:238:20a:202:5302::5]:19246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8mhd-0003MN-Lr; Wed, 18 Apr 2018 09:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524056447;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=qqUEI0hErtYU5QPJ0cWiqydOw/OLtQ3Z4gYH6ZjJsq0=;
	b=dE8/dyzpa2pKSSboD6agXJgs2qj5cxLY6bubqV9e8xmfweUeFFNvPIjDaUBE8TcDfV
	J9V1Ghl6oSeTB7cYlGInu8VU+5JASciziZ9a1mjCEgXtuh0l4ZESxGyVqPWAjMMpl9Z2
	jIlcwPW/Yhvosn51WA59877CNVkydSeR7dXEBYUR4wal67KzkMz7t7Rdj14n8pAFuUJx
	4W7L/xguSzC6NHj/UmxDXEwM8Vznt+pbkVmsofSeXu+PmGIJYpDa6nXnpiwmhmeJqAsU
	rSWT7X2n40q8zpEdJiJqN5kUNeA5kWcKVNgaXeL/is/YO64f6slgN17JStAEgenAk8Fd
	bIPw==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3ID0j6BI
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 15:00:45 +0200 (CEST)
Date: Wed, 18 Apr 2018 15:00:40 +0200
From: Olaf Hering <olaf@aepfle.de>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Fam
	Zheng <famz@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180418150029.30c5d1bb.olaf@aepfle.de>
In-Reply-To: <20180418124753.GM27579@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/DN7LZlIsuduvQZTnacYL_7M";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5302::5
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Wed, 18 Apr 2018 13:00:57 -0000

--Sig_/DN7LZlIsuduvQZTnacYL_7M
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 18 Apr 2018 13:47:53 +0100
schrieb Daniel P. Berrang=C3=A9 <berrange@redhat.com>:

> IIRC, one of Peters desired build targets required 2.22, but I guess we
> missed this bug because that platform would not enable vfio functionality=
 ?

Does the check in configure need a wrap "if Linux", just as the Makefile do=
es?

Olaf

--Sig_/DN7LZlIsuduvQZTnacYL_7M
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtdBeAAKCRBdQqD6ppg2
focNAJ4+3ZKIBxbc+HcMpF2RNI2LO9uyfQCdG2wu3phutai9uuGECZrd/WnNyo0=
=I1vq
-----END PGP SIGNATURE-----

--Sig_/DN7LZlIsuduvQZTnacYL_7M--

