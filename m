Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db4BT-0002la-BM
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:15:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db4BR-0002jr-Fg
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db4BQ-0008I4-Lp
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:15:57 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:34335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db4BO-0008F1-M4; Fri, 28 Jul 2017 08:15:54 -0400
Received: by mail-wm0-x243.google.com with SMTP id x64so2883026wmg.1;
	Fri, 28 Jul 2017 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TsO8wUeOU5YuQNX4XA02Uwh7muOL/amM0VSfDVYq8qc=;
	b=JxcrWLXaSrwDNtK+pp0ykwyyMI2UEuAZAJPcBgd5c9NpVZ5T3JKmvuOdIrkfUuUnZS
	QEIKtAjS3rlFwxL5PTGXrN+hHAjItH9K6T+jZ0qj4VSKt0RB8/wJcjAKhR1l7jFV7Yvo
	CtTdQs6b+olZ1q6bkGzZxW1OH+I/gPQyC3IMk3m9NQ7qNTi6R02ylzAmkLiuFWnW7m7+
	hO+AeeMFQb+CnLziZUkMafDNqpvmdqtfFmr9W432FT23Tq98Ko3PhtzVqd/arxx2p0SM
	1Or+fryZyLSyq8i0CNkOPEV2df+hOrcoB2S5VBYGRMb4I0VOKjRIW4QZddlgOmpkFmmH
	1b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TsO8wUeOU5YuQNX4XA02Uwh7muOL/amM0VSfDVYq8qc=;
	b=GTpvalmxpCV2PAsFLtKm6Hy/tGGNkwW/FaFT1XGqhQt6eWzjBft+PIC3/LBXobJOiY
	fVyNWnaKafNAGNKHkDHyHmXLivx7IUH7FTkFLL/oJh2PpKfX27pMG/btvYrZr/CroXg9
	7cUf4CF7sHpCHMWVmBVoPypQCcBVlx0RWCgS2L/2zIcUymYOkuGB8tQ1C3J56Ks0QQK1
	f6u8/ZC2HBvCRSEcun7rXnkNoiqDGU8u4otJf1DbZvf2KIG1o7179MQ0KYk0eR/fD+s6
	YpYTF/Lu+NqhLTjsF7OiN9A/u9wLjfWKv39/EhrAXgXdJbxXvc9wnmMMoxaYh+DUtuhr
	Y/bg==
X-Gm-Message-State: AIVw110ycH2WCdXgd3j39eWym17m9FPYt9xppJaOM05PAj588lnr3+Yq
	gDp4hogx5wLOHA==
X-Received: by 10.80.241.8 with SMTP id w8mr6432784edl.245.1501244153761;
	Fri, 28 Jul 2017 05:15:53 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	c57sm3433619eda.46.2017.07.28.05.15.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:15:52 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:15:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170728121551.GH12364@stefanha-x1.localdomain>
References: <20170727120210.6943-1-crosa@redhat.com>
	<20170727120210.6943-4-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1EKig6ypoSyM7jaD"
Content-Disposition: inline
In-Reply-To: <20170727120210.6943-4-crosa@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/5] qemu-iotests: remove
 commented out variables
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
X-List-Received-Date: Fri, 28 Jul 2017 12:15:58 -0000


--1EKig6ypoSyM7jaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 08:02:08AM -0400, Cleber Rosa wrote:
> The variables FULL_MKFS_OPTIONS and FULL_MOUNT_OPTIONS are commented
> out, never used, and even refer to functions that do exist.  The last
> time these were touched was around 8 years ago, so I guess it's safe
> to assume outputting such information on test execution is still on the
> radar.
>=20
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/qemu-iotests/check | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1EKig6ypoSyM7jaD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeyr3AAoJEJykq7OBq3PIoLMH/0k46GD3Ug/f4SaAehmPuqUw
VGlzFXqU39doBv4WzzQsjeS4a7DivzyyXvSxUVsARy/1xKrXQBf3oNHu86i+wDUK
U9rjxS6dKrcH7C0VxnDiyJYb4ksczTmA2DqhcGaWvc8YTeK+WmzPwFf0O2v4hHI0
A7vjq+1mONcdM3hEf506z7A3CmPWJ9N516EaAV5RF0P0mmSS4VDMfDUbFjHJuezT
2pqaMtByioGvd6jJnxboeDKrcYjsAuOtd7MfytP00WEHCmtClWwgL8n/kFbPhNrM
Y8ztLitstPiFh/ffGO96snSrEvfsNzUryvRXBRvuFkRmhLHt04sohLtNmhcsGIw=
=Hfvs
-----END PGP SIGNATURE-----

--1EKig6ypoSyM7jaD--

