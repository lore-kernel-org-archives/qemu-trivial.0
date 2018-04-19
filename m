Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f941e-0004iD-6A
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 03:30:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f941c-0004go-5K
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 03:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f941b-0007gU-6u
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 03:30:36 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::1]:8827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f941a-0007fc-M2; Thu, 19 Apr 2018 03:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524123032;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=EYgyYLo21LHQBme2cEwF3mlwm71Yp4WL2uSkVMxHSB0=;
	b=JtYIwRvbYdi0raQ7oQRwz5LmMqpganI6Asw/OL8OYYhP64h695NAX7eL1wTND/caOb
	s8IPG0316scItnLzI38sJrRE5sXX/4iIU6sOAEGAlYd5u9paJVNlAqnIEof1vXdOG2Ma
	s1/ySpWPuDHWyU+T2IP1zFDInEzhunvc48llbyOTkMf9Ukgfs/MySX/olDVnfeNpkwnW
	IwJGZCYl4UCkGLimvP19cEvrIHZSFEpHbGJU1gMhe5AiD/VqhYEaXDOlKQlOLw4JVwUz
	cjYzv4FfoSjze10rNtl3rjpABJP851qb6UBkqwEB113nSL/D7GnLDdACs3yGoIMP9BuV
	QHqA==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3J7UUAiF
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Thu, 19 Apr 2018 09:30:30 +0200 (CEST)
Date: Thu, 19 Apr 2018 09:30:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Markus Armbruster <armbru@redhat.com>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Cornelia
	Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Fam
	Zheng <famz@redhat.com>, qemu-trivial@nongnu.org, Philippe =?UTF-8?B?TWF0?=
	=?UTF-8?B?aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "open list\:All patches CC
	here" <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Paolo
	Bonzini <pbonzini@redhat.com>
Message-ID: <20180419093024.27c77433.olaf@aepfle.de>
In-Reply-To: <87sh7rvf27.fsf@dusky.pond.sub.org>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418144538.4aa2f492.cohuck@redhat.com>
	<20180418125545.GN27579@redhat.com>
	<87sh7rvf27.fsf@dusky.pond.sub.org>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/2Z+D0DuBWfubgNZlmcQTGyb";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::1
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
X-List-Received-Date: Thu, 19 Apr 2018 07:30:37 -0000

--Sig_/2Z+D0DuBWfubgNZlmcQTGyb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 19 Apr 2018 09:19:28 +0200
schrieb Markus Armbruster <armbru@redhat.com>:

> > [1]   https://libvirt.org/platforms.html =20
> This policy looks sensible to me

Unless I misinterpret that, noone cares about SLE11 anymore.
So, just wipe that single one developer system with glib-2.22 and move on.

Olaf

--Sig_/2Z+D0DuBWfubgNZlmcQTGyb
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWthFkAAKCRBdQqD6ppg2
fsQsAKC52LDE4Rmca0SaU4bxxQlPcZYr/ACeN4xsFVQY99sG6zhvViPIqxj6LLE=
=u8yC
-----END PGP SIGNATURE-----

--Sig_/2Z+D0DuBWfubgNZlmcQTGyb--

