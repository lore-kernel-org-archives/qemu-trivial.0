Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fITRq-0007pw-0k
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 02:28:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fITRn-0007om-Sm
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 02:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fITRn-0000hE-3w
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 02:28:31 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::5]:35823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1fITRk-0000fv-Og; Tue, 15 May 2018 02:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1526365706;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=jpMZt9PGOVC9ob78tBcUimpcjwfiMjT48T5A3JUGVc8=;
	b=ZkXYWTrhWpsBpUpj+hYzOLk2QKVJRHafeqcuBpWkI0TRj+ZiF4jQT0sIfAZGBbWQMa
	SHGGn/jCCKb8LVbqtpzOuieHp9ue1Xvxjn4tOPZmYYJOoggZ/H7pUcc7L+bP5IxYYBmj
	6mQdki/NGRjC5N4nQK1yobhj1nq39HIzAp739mQB2iI10hEZRu+HYVIP/Y3REaCMtLnF
	ZGpEnNa8W8n/b/6RfgH0K0zJc0U3X/PfZUg5KI7QitTv+ecoQ+rOfuEE1zbkgAOwzPDt
	Pzm+w8M6r9RbYGlAF4EInYX8JalvQkdVK425eLYHjUVK9GLgTjy4d2ExAfIgMOz0XGxu
	mdXg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsASdya+Vzel3uexBNxWoZbXfZuF5WsSPfv6W59"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.8 AUTH)
	with ESMTPSA id h032f7u4F6SM2Wz
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Tue, 15 May 2018 08:28:22 +0200 (CEST)
Date: Tue, 15 May 2018 08:28:17 +0200
From: Olaf Hering <olaf@aepfle.de>
To: no-reply@patchew.org
Cc: <qemu-devel@nongnu.org>, famz@redhat.com, qemu-trivial@nongnu.org,
	pbonzini@redhat.com, stefanha@redhat.com
Message-ID: <20180515082817.1125f292.olaf@aepfle.de>
In-Reply-To: <152636426980.156.13889592265459743277@1f70390a8372>
References: <20180515055949.6446-1-olaf@aepfle.de>
	<152636426980.156.13889592265459743277@1f70390a8372>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/xxdQ6aQc2Cv6ScX=WE_563q";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::5
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] replace functions which are
 only available in glib-2.24
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
X-List-Received-Date: Tue, 15 May 2018 06:28:32 -0000

--Sig_/xxdQ6aQc2Cv6ScX=WE_563q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 14 May 2018 23:04:31 -0700 (PDT)
schrieb no-reply@patchew.org:

> vfio-helpers.c:525:17: error: assignment from incompatible pointer type=20

Does anyone happen to know what s390x is trying to do here?

Olaf

--Sig_/xxdQ6aQc2Cv6ScX=WE_563q
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvp+AQAKCRBdQqD6ppg2
fnZwAKDS8nHzFVDmrHPzsgVS+BUZHNxCpQCeKj3m6zo6rd+r5tp4V2hyc4l8zbc=
=JKN3
-----END PGP SIGNATURE-----

--Sig_/xxdQ6aQc2Cv6ScX=WE_563q--

