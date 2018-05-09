Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGHuC-0001A4-Qh
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2018 01:44:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fGHuA-00019o-EX
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 01:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fGHu9-0003pj-HP
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 01:44:46 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::11]:19119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1fGHu9-0003lg-15; Wed, 09 May 2018 01:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1525844682;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=OyiELwZLl7E0hIYXuFCpKHsKoT5JmI8BrXSIyr2VZMU=;
	b=JQI/Cg9SUPzXit36LnH+a4Hp2p//CWYdT+woY6/tv7NnwNBd0xSZvBZZFWib/6j3Zz
	T8urjAQC5VbqdWWEpHC1fREvMkcjNW1bnQOqG3L51fTkOX1CZ4sscWOW8h4WxFeD92YQ
	NMhlJk2j1yRe47oNAzN6N6XMf0JfIvPUn8hCqB82KR4y9oyRCbe+tECrbAkzrQnBraP8
	/LbPWAbYuLTpUylVdvdLCnwK2MwForOPqxEnrqalBuv3IciOtE4x50BtVJjimF5qro4B
	cNh+e/S2TYPkMYKbU0r8fnh7RX4i8a0p9siff6cB5BtRJxje06v52bC4B5Cw4/1N7z4p
	O2/w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivIERtGSRdxtdnr43b5S4EgWWHFDa4aT+cyv2g0v4w=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.8 AUTH)
	with ESMTPSA id h032f7u495idVgd
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 9 May 2018 07:44:39 +0200 (CEST)
Date: Wed, 9 May 2018 07:44:34 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, "open list:All patches CC here"
	<qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Fam
	Zheng <famz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Philippe
	=?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20180509074434.23de9dab.olaf@aepfle.de>
In-Reply-To: <d058d5e6-710b-2f34-9828-9ddde18069a1@redhat.com>
References: <20180418075045.27393-1-olaf@aepfle.de>
	<41df38a4-dc02-7c17-4877-26541fddd209@redhat.com>
	<d058d5e6-710b-2f34-9828-9ddde18069a1@redhat.com>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/Zizk_pDCJTyPFH+BLkmoTU2";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::11
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: recognize
 more rpmbuild macros
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
X-List-Received-Date: Wed, 09 May 2018 05:44:47 -0000

--Sig_/Zizk_pDCJTyPFH+BLkmoTU2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 9 May 2018 00:15:42 +0200
schrieb Paolo Bonzini <pbonzini@redhat.com>:

> Actually, --program-prefix=3D and --exec-prefix=3D have a meaning, they
> cannot just be ignored.  For now I've removed this line; what is the
> exact incantation used by SUSE Linux?

Like in every other rpm.rpm I guess:

/usr/lib/rpm/macros:%_exec_prefix               %{_prefix}
/usr/lib/rpm/macros:    --program-prefix=3D%{?_program_prefix} \\\
/usr/lib/rpm/macros:    --exec-prefix=3D%{_exec_prefix} \\\

Are you saying your %configure is different from my %configure?
In any case, qemu has to tolerate both options.

Olaf

--Sig_/Zizk_pDCJTyPFH+BLkmoTU2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvKKwgAKCRBdQqD6ppg2
fodZAKDpoJorrDF+gP1OOyOT2nG74aQ/0gCgimOEXUjsevDUxTm7B4BBxZ80wG0=
=0MLq
-----END PGP SIGNATURE-----

--Sig_/Zizk_pDCJTyPFH+BLkmoTU2--

