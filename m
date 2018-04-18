Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8p9S-0001Sp-NM
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 11:37:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8p9Q-0001Qz-GJ
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 11:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8p9P-0002kE-Mj
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 11:37:40 -0400
Received: from mo6-p02-ob.smtp.rzone.de ([2a01:238:20a:202:5302::12]:25256)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8p9P-0002jl-5S; Wed, 18 Apr 2018 11:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524065857;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=EA/8RjO7itjG36Qa1hp5vU55ojKxgzs/EOM2SgNVGpU=;
	b=reL5IbhYGyQ4cZkqsHL3X4a6tETZRcZDVOmuxqmpy2QS+Y5a7k1pDa5GBo2H+09zh1
	cl5asSmy2h5+d56AQILPoB/mU8tScGt5GjhuOAML0JOfiKnLDpGWilB0VId0HoG3IDwG
	DzZam9ck5fyl2JC9GsIHhRS1RJnCtbHjdxqMq0TQvolL2vRby3IiKfkDrEXZR/rP1/W9
	v7fT/aRYM1RjdtxabQLY6hxedriYhoqhWB/f18CSeHP/BetDy9P8ZA//25wOfPbYHdWb
	TswaW6iE4w5fneWIXU/h6ZyaB4cRX67JU4Cr3s/k56AI8TsD2uwi00RB1gMs+tr3sMGQ
	/yEA==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3IFbY76I
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 17:37:34 +0200 (CEST)
Date: Wed, 18 Apr 2018 17:37:33 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Fam
	Zheng <famz@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180418173733.776f7851.olaf@aepfle.de>
In-Reply-To: <7df49e91-aa65-d775-78eb-ddf53676dd7f@redhat.com>
References: <20180418145443.6332-1-olaf@aepfle.de>
	<7df49e91-aa65-d775-78eb-ddf53676dd7f@redhat.com>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/vnM7h09mz1kKubJZjYxExxr";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5302::12
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: require
 glib-2.24 on Linux
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
X-List-Received-Date: Wed, 18 Apr 2018 15:37:41 -0000

--Sig_/vnM7h09mz1kKubJZjYxExxr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 18 Apr 2018 10:04:03 -0500
schrieb Eric Blake <eblake@redhat.com>:

> avoid g_realloc_n()?

I guess there is some global header for this, to prevent further accidents?

extern void *g_realloc_n_can_not_be_used(void);
#define g_realloc_n(a,b,c) g_realloc_n_can_not_be_used()


Olaf

--Sig_/vnM7h09mz1kKubJZjYxExxr
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtdmPQAKCRBdQqD6ppg2
fsgoAJ9Xqi23OaNpm8DnQJjQzHVI8AXIHwCfZFjBJl+87e8Ivolo/pTg1lJMhJY=
=s9nE
-----END PGP SIGNATURE-----

--Sig_/vnM7h09mz1kKubJZjYxExxr--

