Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8oLa-0002yy-V9
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 10:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8oLU-0002t4-3P
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 10:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8oLT-0005ng-DN
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 10:46:04 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::7]:19915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8oLS-0005mD-SG; Wed, 18 Apr 2018 10:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524062760;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=1Z6VxpWI/wXDvToGM47+1KD9105dDuSNhdoUsURYVAk=;
	b=bnnUxxJO6zLKWMBlpBS468F4STXoB033VM48xiQgosXI3U+pXqtc50f3npDmA80CnU
	EZjlBc1h8W96zxBERkJ/yLLN+Y4hJMbnZdtKz3A13tn2pL1sk+90igvhX+vHzs9ZRimi
	ZHV4aM2RMg32cpGiGEUZB/Rxv2k2irdKEpPlDirYRGEPh0bfQjiP91Vw7eR/GkhaZOMg
	FJ2i6Z+iXBE00NDTxf8/VgmJ7P+A7CkyqGHumuQoKqOwn/nq8VfjGy0pMnD4QSxBjws/
	WNXjW1SIGcYsP2t6CGPDoSBnOf40uc71RzRhkdj9GuXNz2Cq+Qs/GX1V/PtYzVcH+cLz
	vzLA==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3IEjw6pR
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 16:45:58 +0200 (CEST)
Date: Wed, 18 Apr 2018 16:45:52 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Fam
	Zheng <famz@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180418164552.74736af5.olaf@aepfle.de>
In-Reply-To: <20180418144538.4aa2f492.cohuck@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418144538.4aa2f492.cohuck@redhat.com>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/GxDFPceTic5jOcVd9zivSdn";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::7
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
X-List-Received-Date: Wed, 18 Apr 2018 14:46:09 -0000

--Sig_/GxDFPceTic5jOcVd9zivSdn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 18 Apr 2018 14:45:38 +0200
schrieb Cornelia Huck <cohuck@redhat.com>:

> Are we ready to give up support for whatever distro is still on 2.22?

This is SLE11, in case it matters for this discussion.

Olaf

--Sig_/GxDFPceTic5jOcVd9zivSdn
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtdaIQAKCRBdQqD6ppg2
fuRZAKCCoO0nWGZgSkaceopUjYsqfhMvOQCfRRwIJ6E0evk4imfbZV6BI7OwuXE=
=5osG
-----END PGP SIGNATURE-----

--Sig_/GxDFPceTic5jOcVd9zivSdn--

