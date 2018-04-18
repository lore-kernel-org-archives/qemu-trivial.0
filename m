Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8mm7-0003Z3-27
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 09:05:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8mm5-0003Xp-AG
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:05:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8mm0-0005Tc-P4
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 09:05:25 -0400
Received: from mo6-p02-ob.smtp.rzone.de ([2a01:238:20a:202:5302::3]:33797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8mlt-0005OV-AB; Wed, 18 Apr 2018 09:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524056711;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=a/3yDEEHIiZNZZkzbZJJmjtmmWXdszjq+zAZc+5hkVk=;
	b=moai1ENAgEA+5G4plBeNsAqKTRQpfWbYHb7Vq+eT3IgCk36KZzRmS9BHdMCePljP9S
	J8S7kS+iWsvEo9ZaHvmlVYWMTfN0LD0Xa+JLyohK73wrd9tvTYoMvk+LnIw7c/5NjB0L
	M39z8anz6hzmpp9VpL6WJLfiSByS03gpdlCmd2eM738FVp5Yo9RxuKOY1V+tksdFnWci
	74yopvM7SDYmHvzmsWDZasnI/hqK4PFHlM+7FufUX9p69WlOhe/OLUAiJPmfHrDd1933
	ClnmemTMGTxfU6AnpDOfPNACN3l6FWSX1VPORaClj2mziTnx35HtGWzOe79Q3CewYDxr
	Nt6Q==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3ID4p6DB
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 15:04:51 +0200 (CEST)
Date: Wed, 18 Apr 2018 15:04:49 +0200
From: Olaf Hering <olaf@aepfle.de>
To: no-reply@patchew.org
Cc: <qemu-devel@nongnu.org>, famz@redhat.com, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org, f4bug@amsat.org, kraxel@redhat.com,
	pbonzini@redhat.com
Message-ID: <20180418150449.0cefd440.olaf@aepfle.de>
In-Reply-To: <152405603679.1932.900049084322274960@71c20359a636>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<152405603679.1932.900049084322274960@71c20359a636>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/=.VWlI_aO1xeAccL12h9kWX";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5302::3
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
X-List-Received-Date: Wed, 18 Apr 2018 13:05:26 -0000

--Sig_/=.VWlI_aO1xeAccL12h9kWX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 18 Apr 2018 05:53:58 -0700 (PDT)
schrieb no-reply@patchew.org:

> This series failed docker-build@min-glib build test.

I guess that test must be fixed either way because it does not test what it=
 is supposed to test...

Olaf

--Sig_/=.VWlI_aO1xeAccL12h9kWX
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtdCcQAKCRBdQqD6ppg2
fqg6AJ0WOoSQgXga0Mkg4PKSc2ZKDxmjsQCgm8GzRqD4YAENlWcZnTrzuZq1BI4=
=LSgf
-----END PGP SIGNATURE-----

--Sig_/=.VWlI_aO1xeAccL12h9kWX--

