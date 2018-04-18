Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8iWb-0003ik-L0
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 04:33:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8iWZ-0003gh-8G
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 04:33:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8iWY-0007Mk-9m
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 04:33:07 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::9]:13810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8iWX-0007LQ-PB; Wed, 18 Apr 2018 04:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524040383;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Type:References:In-Reply-To:Message-ID:Subject:Cc:To:From:
	Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=c4a5uF4PpfC8k8+WFcROS+4vHxBJjy0z+9VpWubIxkg=;
	b=DBtKqYO/RjXiXCTViCV+oW/M7tIdbMfy0ZQAQKDQzvF5AgZk3rys/3TqBHGFbq61Qq
	IDjuibxncH8QQvNbJBmHEx9/hW+hoQ6BTEQFHoKV4kLzbgPCAi6BP/5dnTIWIv7VZGNO
	TEHepesZperXK5YHXSb4D50keqNeAjKvO587yIwb9ns8dYhG4asjQNgEzDmMUSqCbEH9
	tu+Yzn8ew8wsV2VsPjLISD5KTlFPtHTWnS2Y0NLtEb+HkQqe5yQ5WL4H0wtx5GXLaAcX
	J/DAtG6Omak6EPS9q5WmpHtP1dLCdrNhs79PD7RUFONJAsCSrqE4IYl5yerhnCj39XKy
	D2zg==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivsBRtyRe2qcrldJj63vYUTRQR/0RqPSgWq+RVwc
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3I8Wn4Z0
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 10:32:49 +0200 (CEST)
Date: Wed, 18 Apr 2018 10:32:44 +0200
From: Olaf Hering <olaf@aepfle.de>
To: qemu-trivial@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, David Gibson
	<david@gibson.dropbear.id.au>, qemu-devel@nongnu.org (open list:All patches
	CC here)
Message-ID: <20180418103244.6c65fa60.olaf@aepfle.de>
In-Reply-To: <20180418081311.27803-1-olaf@aepfle.de>
References: <20180418081311.27803-1-olaf@aepfle.de>
X-Mailer: Claws Mail 3.16.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/u=NnQqes0uyiGNyvv1=8SbP";
	protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::9
Subject: Re: [Qemu-trivial] [PATCH v1] roms/ipxe: use configured compiler
 for ipxe
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
X-List-Received-Date: Wed, 18 Apr 2018 08:33:08 -0000

--Sig_/u=NnQqes0uyiGNyvv1=8SbP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 18 Apr 2018 10:13:10 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> configure allows to run a dedicated compiler binary, which is stored in
> CC and HOST_CC variables, and overrides the default 'cc' command.
> This command however is not used when building ipxe from source.
> "make -C roms pxerom" invokes ...

Scratch that patch. make -C operates just below 'roms/' and does not use
results from configure. The CC variable built into make(1) happens to be cc.

Olaf

--Sig_/u=NnQqes0uyiGNyvv1=8SbP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtcCrAAKCRBdQqD6ppg2
fg/ZAJ9GKcdLcXaxAI+D8CF7DfoeDxBEVwCg63bNQy6HJCSVYPwsPUMs5y5wcCU=
=rTPu
-----END PGP SIGNATURE-----

--Sig_/u=NnQqes0uyiGNyvv1=8SbP--

