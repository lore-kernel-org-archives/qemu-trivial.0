Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cGjn4-0008JP-KE
	for mharc-qemu-trivial@gnu.org; Tue, 13 Dec 2016 04:54:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cGjn1-0008Ho-TM
	for qemu-trivial@nongnu.org; Tue, 13 Dec 2016 04:54:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cGjn1-0006eo-46
	for qemu-trivial@nongnu.org; Tue, 13 Dec 2016 04:54:27 -0500
Received: from mail-wj0-f195.google.com ([209.85.210.195]:36731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cGjmw-0006Zp-Kf; Tue, 13 Dec 2016 04:54:22 -0500
Received: by mail-wj0-f195.google.com with SMTP id j10so15539184wjb.3;
	Tue, 13 Dec 2016 01:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Kns/un20cURlq+0bSkHIKlyLnK0eXXsmFqxIYOYQFiY=;
	b=yUehiAGVZXKMaxNLqnHJGXAch5cHEwTrlIOGHwUmCaxvh4bLgj7kcfq36FZKc8a3Vh
	ttVf6otrtk/q0vABCvz5T7AKy9d/TFgTEw8OSEqMnUs7kfrkyIPGll3CmzQ+3jT3YlIr
	6CQkzwcWEd9dROG9svQ8H3Q8InnWmISbQB2du4f7kTClWmdO+Qum2WqpmS6Zvyz0Fm/c
	uRRdkRBrjYkw9JYuMhPiAsOjr03j8PycbFrhjRSNGQDkH5r15SNB8A3bewH2hL5MIILL
	YgJqfUdveh7+d8qDjESpcTGzX/Fj81IjxV7/gDgEX7xvR0fba+Z7u290rHMZbANKM4zs
	oyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Kns/un20cURlq+0bSkHIKlyLnK0eXXsmFqxIYOYQFiY=;
	b=PRBNEgce0PGOcfGu7bqcbM2DRehKTXYojw2IkyQwOF3e12YtsbLw7zVnFO+3O3MV2e
	ir8IVnpSBdDPBWA9vubsPNFwjs3GTpPUAXkMEO0HuSPEE1XTD7DAqAfVXoDB5Lz9OJjt
	Wc+6+9I5ZHnck/rY/1kcRoNQyK/bq1r/dOTIIVtIf3MQpL1iqX2JyTPmQlkbDnzMv1aH
	1ah6ye0Qt7+TgfIvkjLSdN+dwWAvcRIEcgZLkUfJ7X4GZHq/8+cwdEuKfLCV9UBHio5D
	bdmuSuQgNgEzaC07ibSkiTLFc0KSjyCekVqUxwy74roPb/dzDJI62PZYWwQ656Cex2eV
	6IJw==
X-Gm-Message-State: AKaTC01jGmR4CgBesYvPe93rAQKY2qUz6XYjnc7JjkUnjYWajEQYB5Zoe99lEPi2SSvIwA==
X-Received: by 10.194.44.41 with SMTP id b9mr100000507wjm.56.1481622801425;
	Tue, 13 Dec 2016 01:53:21 -0800 (PST)
Received: from localhost (host86-185-39-193.range86-185.btcentralplus.com.
	[86.185.39.193]) by smtp.gmail.com with ESMTPSA id
	g184sm1739185wme.23.2016.12.13.01.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Dec 2016 01:53:20 -0800 (PST)
Date: Tue, 13 Dec 2016 09:53:19 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20161213095319.GB3103@stefanha-x1.localdomain>
References: <20161212221759.28949-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20161212221759.28949-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace-events: spelling fix
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
X-List-Received-Date: Tue, 13 Dec 2016 09:54:28 -0000


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 01:17:59AM +0300, Marc-Andr=E9 Lureau wrote:
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYT8UPAAoJEJykq7OBq3PIR34IAMXavOv6NQn8rJDl38J89GNy
PHqzm4gZlWhwFbAAGbSrlBv9GZ8ig+gNLkCBK3GHU1zxzDdXqkcaG1i/yWGFSpIY
n0Q/gRWptHK/mK1UTAYipvKhfqogVA3ZYZymE87p2MutP31KfEUcHvKcFrO7i5zt
+V1vQqWRvDAiJxrwHZulVb7G2kPte+4xWbbIPp5kbBwX0bAu9iU4zDEdPxhpMZRE
OhPmDw1uam2mF9dC4vr75u+B6DrfTPsGsCsyuubLL508Pw6/J0SlaCxbzguUGRyt
tp0mWZv0hvKD8g0AlVOY8oQ7HNWO+rFXFdiiiyHovKyOmZO7cDDXYu9YhYin4S4=
=RM2u
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--

