Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c98lf-0001Xn-P3
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2016 05:57:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c98le-0001WO-6i
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2016 05:57:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c98ld-0001H2-AX
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2016 05:57:38 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1c98lW-0001Dp-QN; Tue, 22 Nov 2016 05:57:31 -0500
Received: by mail-wm0-x242.google.com with SMTP id a20so2895320wme.2;
	Tue, 22 Nov 2016 02:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aZ4IlzoXucLRLs27clcJbnMk6DabOLLWJkQLAit+J00=;
	b=xbOVvLyN/7U5+LV8ObBIi5B+s5cADM5poPzGDYQWfCxBYN8683tJmenv1HKNab2NrS
	7PgBwUc+DhyP0UB3Lv+W0z++T2rO55ybxWztSVy6jEwg205J8w/BV4oPvyw0XmBKEcCb
	4a8y1sKkw1XL8f3ii8neju9dj55VcjKlA/K7c8Y5hXurNFvgzrf+htId7THzh9ZnGzi8
	PJcCBCiqaCS+NK+ngKu6YGi7ENAUzz9o9Oq4xXme8zm4AeivJlfCEYZbmexp3Rwxy/eI
	vsrgPAUVunD113SoFVzEugoWdhsWGjpqOuwO2+vv7Td8sVQyd9ArJctnh0erNtylGzsu
	CigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aZ4IlzoXucLRLs27clcJbnMk6DabOLLWJkQLAit+J00=;
	b=RI+k0k+USMJl4ZZY5fCJb8f5dsFY5C1RsGgaSAl3r8DFGTl308vUivkJfI4VzPmg9j
	RSfvFQfgcQtKeK5eoJe6dKenV98vTbrmHHpXj5UMdSRuGJCW8D4qtHJ2j2iGG3utEWJC
	C0c2hgDP1IshV4fjlo0vuqSfpaKypIBeZzuP2WIsfRwRW2IFS3Sehk3QYCtYyhmWtHsx
	J3+kCNsfq8V3HmteNRPjmqTLACOOrBfi4Va1iGFzYx5AE6IDjweUrahsTqnfeGKJWSe9
	qni37Dq8sCabnqbCp1cO/4HHZW8MVCwbKvaMlD59i/qjaReyHUvLAQtx1PoqA7pE1ZH1
	qlcA==
X-Gm-Message-State: AKaTC00BNRujoQWgJSaCZ9yTDQP/rYMacD+V65HLiWPQMFzX5aiBy65ez6w+zqQGkEym5g==
X-Received: by 10.28.60.5 with SMTP id j5mr1849596wma.119.1479812246925;
	Tue, 22 Nov 2016 02:57:26 -0800 (PST)
Received: from localhost (host109-156-64-108.range109-156.btcentralplus.com.
	[109.156.64.108]) by smtp.gmail.com with ESMTPSA id
	i15sm30170163wjs.16.2016.11.22.02.57.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 02:57:26 -0800 (PST)
Date: Tue, 22 Nov 2016 10:57:25 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ed Maste <emaste@freebsd.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20161122105725.GD5970@stefanha-x1.localdomain>
References: <1479778365-11315-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline
In-Reply-To: <1479778365-11315-1-git-send-email-emaste@freebsd.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix FreeBSD (10.x) build
 after 7dc9ae43
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
X-List-Received-Date: Tue, 22 Nov 2016 10:57:39 -0000


--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2016 at 08:32:45PM -0500, Ed Maste wrote:
> Include sys/user.h for declaration of 'struct kinfo_proc'.
> Add -lutil to qemu-ga link for kinfo_getproc.
>=20
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  configure          | 2 ++
>  util/oslib-posix.c | 1 +
>  2 files changed, 3 insertions(+)

Thanks, this looks relevant for QEMU 2.8-rc1 so I applied it to my
staging tree:
https://github.com/stefanha/qemu/commits/staging

Stefan

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYNCSVAAoJEJykq7OBq3PIrdkH/jJqIjWtaNdnXkOqz+uOm8vM
kU0W630rKSu1K/uyi4HkaUcZ3Eiw/mOW65Rgm2itcQiumIEJ/MY2QL9v1f4EgMB1
83LiLlE+sy0GDKyURUQgfn9NrJ58VwJuiqLbxy/d+7X2taAfy7gIMIJTNBTCMHnN
A1z/6GvQn2dQuzWdc6wqFSxdh1uIOk6McXBVz+70tFmi/t7ThoHolWm8Cf/EZxf0
pNtwAJTNh2Ca2JxurP3TjV6OqeXLn/VYg3AzGQX1TbFpnWYqwZPowitp747nfZvr
5fkJtqMLIkaQCsSvWvKasQDCxLYwWUaJCtgomJFtt38uPbnpQdGq9/RYGjqlwUM=
=QOR3
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--

