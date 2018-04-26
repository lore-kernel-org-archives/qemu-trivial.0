Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBfhH-00035w-7i
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 08:08:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fBfhC-00035i-1B
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:08:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fBfhB-0007XD-43
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:08:17 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::8]:10356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1fBfhA-0007VL-Jz; Thu, 26 Apr 2018 08:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524744494;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=jMZjf9QCql96NW6CaTExzh+h47vsZtlwywou+WDMWfk=;
	b=X4OV7eeilgGcVB4gwsOXpR8JJ02+REeQ0drsDPitzdMMX+XqyEb1mvJBFEqryLQy3b
	y/pdYD3P2vD6ZMmpJhYx5IpqrHa8QOdiP+NqLxjDTh8OWdNJagwoKLLLwMzqKJDzcfSS
	KRme1C0LguKYFPA383sG362upFcZg2Qsig4Us3G4QxPGitr5DbIZGOf7nskHCOhjYJHs
	Uw/03/LILmvhEsQL800OwB7y+2WSXXrJX882nocRHMQ0qimdA6zwiId1+0udSN7Kb7vM
	qYN5EgTEXBd6wZPlYvvGm0ZbpRxSIOYWqb9c5EAK+dI5M7sB/2eiP8LD74q8JBGABj/A
	mKgw==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.6 AUTH)
	with ESMTPSA id 3060d3u3QC8C0xG
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Thu, 26 Apr 2018 14:08:12 +0200 (CEST)
Date: Thu, 26 Apr 2018 14:08:07 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel P. =?UTF-8?B?QmVy?=
	=?UTF-8?B?cmFuZ8Op?=" <berrange@redhat.com>, QEMU Trivial
	<qemu-trivial@nongnu.org>, Fam Zheng <famz@redhat.com>, Philippe
	=?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "open list:All patches
	CC here" <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20180426140807.4a4a577b.olaf@aepfle.de>
In-Reply-To: <c9b7c417-e714-658b-20da-7150c9ec8ab9@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
	<20180418144433.GV27579@redhat.com>
	<CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
	<c9b7c417-e714-658b-20da-7150c9ec8ab9@redhat.com>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/b.SFpbX6pshrYvbZdBJ1/=S";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::8
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
X-List-Received-Date: Thu, 26 Apr 2018 12:08:22 -0000

--Sig_/b.SFpbX6pshrYvbZdBJ1/=S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 26 Apr 2018 13:52:04 +0200
schrieb Paolo Bonzini <pbonzini@redhat.com>:

> min-glib Dockerfile is using glib 2.22

Why did it not prevent the bad commit from entering 2.12?

Olaf

--Sig_/b.SFpbX6pshrYvbZdBJ1/=S
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWuHBJwAKCRBdQqD6ppg2
fvxeAKD7H/DPyFKkGZSRsnMEyFOt4GsmmACg+wX8z8Dq6EPgXljo1lkD3EkgYVY=
=EwyO
-----END PGP SIGNATURE-----

--Sig_/b.SFpbX6pshrYvbZdBJ1/=S--

