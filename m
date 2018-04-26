Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBfkd-0004tk-8c
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 08:11:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fBfkY-0004qF-EJ
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:11:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fBfkX-0000sd-Ki
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:11:46 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::12]:24225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1fBfkX-0000pr-36; Thu, 26 Apr 2018 08:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524744703;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=npJjka63LQXW3RCH5/UC2aN6YC7HP1aCQlzOpmRYQOw=;
	b=jffQx+FhFnu5115foDRCQdGzwmRONV/mscN2H/JRweThWoSOhcXrlmoOg3oXOEiamO
	Dzazwi7dWIL6fJDgI1gFF4tiMX8UswxbtXoBMGX82Wszd2YHF/MivFnvOx0Q+z7hnqFP
	D1QCOZKM5eHFb9URwW4qz65RI1bmCxTvVFc+RXj/oAYCRKOgrlMD3LeGhjL1OWdp2SYU
	erbDp8VR9Mv3d6OwU6SNk+kxXrz1fkCoNrQ5dPPca+PKu5Hn7PXXXkuUDSVmZHqx868V
	SYTUQPXrkMo6c4QjjwUFuuttLcQhcqMP+T8UvqWYtlGXihshderoUMV+rsrF3IfoV6EZ
	WE4A==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.6 AUTH)
	with ESMTPSA id 3060d3u3QCBg0yl
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Thu, 26 Apr 2018 14:11:42 +0200 (CEST)
Date: Thu, 26 Apr 2018 14:11:40 +0200
From: Olaf Hering <olaf@aepfle.de>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, QEMU Trivial <qemu-trivial@nongnu.org>, Fam
	Zheng <famz@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20180426141140.7d7b39d0.olaf@aepfle.de>
In-Reply-To: <20180426121002.GG26812@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
	<20180418144433.GV27579@redhat.com>
	<CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
	<c9b7c417-e714-658b-20da-7150c9ec8ab9@redhat.com>
	<20180426140807.4a4a577b.olaf@aepfle.de>
	<20180426121002.GG26812@redhat.com>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/2QNB7caxwuAQZoROuDCFB+L";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::12
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
X-List-Received-Date: Thu, 26 Apr 2018 12:11:50 -0000

--Sig_/2QNB7caxwuAQZoROuDCFB+L
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 26 Apr 2018 13:10:02 +0100
schrieb Daniel P. Berrang=C3=A9 <berrange@redhat.com>:

> Presumably the min-glib docker job didn't enable the vfio feature, which
> is what contained the bad code.

It is Linux=3Dy, every following commit would have failed too.
I suggest to revisit that testcase.

Olaf

--Sig_/2QNB7caxwuAQZoROuDCFB+L
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWuHB/AAKCRBdQqD6ppg2
flJnAJ9QxhK91QA3II7a/ILxLzKoy0ztbACdHj+BYeoKw5u2uNoKomZSNaHD7D8=
=BOt7
-----END PGP SIGNATURE-----

--Sig_/2QNB7caxwuAQZoROuDCFB+L--

