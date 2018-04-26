Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBgEd-0004NE-BV
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 08:42:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fBgEY-0004Ix-Cd
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fBgES-00057E-PE
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:42:46 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::9]:10276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1fBgES-00056A-7M; Thu, 26 Apr 2018 08:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524746558;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=oCm2TeTZErRNFulCnnzGm16dZLdj87RgCxSPZM3y+vs=;
	b=sVU2tK9joFaEdVRP03hfM66obRYuuaAL8ggozZKqR9icoX6JnNEeHRKaTXNBzmML62
	OOdkKG0zFkipwhb5I37fo8I/EoLfa0xc0C2LSSxXr/XeFOh+iK85CPljNHjLA/7Zsrn3
	/ZCQEFRXf1Sr/WekPlO1uGMMSP06j8N8v+POG5C68jN9FIemlCDvQWpWYxvlStES+/ao
	U7phNW6knZU1QVIbAVbotY6CyqZ9yuLMoJwisPaAnbpSk8fIkPJNnJePzXqms5pnApMg
	d97/NWzoFwB2oBZftsL+Zu83tCALA4zNVRgoXTfA/DcJatPJMlsbQ4MXbpJe9s7zVhcL
	iX5g==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.6 AUTH)
	with ESMTPSA id 2064f2u3QCga06T
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Thu, 26 Apr 2018 14:42:36 +0200 (CEST)
Date: Thu, 26 Apr 2018 14:42:31 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Peter
	Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Fam Zheng <famz@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20180426144231.64bbfd4b.olaf@aepfle.de>
In-Reply-To: <b976e072-78c5-e12a-ba72-2075b8b635e3@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
	<20180418144433.GV27579@redhat.com>
	<CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
	<c9b7c417-e714-658b-20da-7150c9ec8ab9@redhat.com>
	<20180426140807.4a4a577b.olaf@aepfle.de>
	<20180426121002.GG26812@redhat.com>
	<20180426141140.7d7b39d0.olaf@aepfle.de>
	<b976e072-78c5-e12a-ba72-2075b8b635e3@redhat.com>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/ywkq.VKJ+0B3SUTOAr/eK__";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::9
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
X-List-Received-Date: Thu, 26 Apr 2018 12:42:50 -0000

--Sig_/ywkq.VKJ+0B3SUTOAr/eK__
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 26 Apr 2018 14:39:04 +0200
schrieb Paolo Bonzini <pbonzini@redhat.com>:

> On 26/04/2018 14:11, Olaf Hering wrote:
> > I suggest to revisit that testcase. =20
> That's because Red Hat backported g_realloc_n into RHEL6 :)

So the testcase does not test what it is supposed to test.
Time for a SLE11 docker image.


Olaf

--Sig_/ywkq.VKJ+0B3SUTOAr/eK__
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWuHJNwAKCRBdQqD6ppg2
fr+yAJ4z303HkyDRhu47kACNEkWdS3MQAACg8ymdlelJ0ZiNrW2KTMPKlGat3Fg=
=X4Yr
-----END PGP SIGNATURE-----

--Sig_/ywkq.VKJ+0B3SUTOAr/eK__--

