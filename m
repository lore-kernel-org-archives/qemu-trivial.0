Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db43F-0001ny-H8
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:07:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db43D-0001nj-Q7
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:07:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db43B-0001Db-2G
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:07:27 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:34560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db43A-0001Ci-SK; Fri, 28 Jul 2017 08:07:24 -0400
Received: by mail-wm0-x235.google.com with SMTP id t138so9383899wmt.1;
	Fri, 28 Jul 2017 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Xh8nPKbBOf0ZNe6JBFxYCx+l7fpmLTbEeP2KUr1bBHQ=;
	b=ipPrkPB0mPAwNgDg56YcL8XCW8/VVE6VnhOYeAeTQPyU9eEUQwf4nvhsjQCRBrcWlo
	0XBJgJHxxRx+lFQcZzLb7hBi3ycZYdYaA9M3RB3ywNwApn0ynT6Qc/WeNAEGZTJ4cnZK
	oX8TPA26izv2QX3TL8S7F9VoXbvRs4u1p0OoC0WwV7V0W6etwfBRCRVpZ6WGZbeRtUYe
	jYDtrwsRMuUNuefihwrUrl7A99Qp2WIfL2lz0b6MNoUKi2Vw/gZVwJJ3Vcq8CAS4V3nn
	pO0jav8NyzWEgpo/brG7rMGjv/mABqS2pPCvFLXet93pibh2icv8LNhC3Xg/TPgMtGr8
	KSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Xh8nPKbBOf0ZNe6JBFxYCx+l7fpmLTbEeP2KUr1bBHQ=;
	b=kaRf6bZPul9pibb1MgBtrzTbdhiMk79dF+cpaWjfydoNFn3Uy/b9YL6G6ci+3FSIcR
	K6XlJLemww9NYsy5mQkreEWjwv66Zi66q3ugqabOzni9/wbr8GbG0mmNL03NVE46NbE/
	JW3s5OY5WEmPX1+hbX7B/IVQiPevUIiQCnp+lfWotJ8YWD7Qoh8DW6EMq5d8nTAlXlgf
	KLRaIRagoc818PcFjVCgOiMurz4VXtF8EgHOjckf5vH+wOl/S75dmQiCYJmM553JhJP1
	q0ehLQ3yWDSlZveIgl8UoqdiULg9h6uGqUm06nlSG1BoSElV4bDDxMbsrZk8M+9nFLyk
	loYA==
X-Gm-Message-State: AIVw110lqEM5ZXW7Hzf7CrRWyw9pDLfL3nHlXJ6XatendYU20sYVXVQW
	WC+Se/rN9DpjWA==
X-Received: by 10.80.142.10 with SMTP id 10mr2481987edw.127.1501243643792;
	Fri, 28 Jul 2017 05:07:23 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id f48sm565643edb.70.2017.07.28.05.07.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:07:22 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:07:21 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20170728120721.GB12364@stefanha-x1.localdomain>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-41-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline
In-Reply-To: <20170728053610.15770-41-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 40/47] MAINTAINERS: add
 missing entry for AIO
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
X-List-Received-Date: Fri, 28 Jul 2017 12:07:28 -0000


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 02:36:03AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeyj5AAoJEJykq7OBq3PI0ycH/jHfAxaal6aEmpqz7J2lVzEE
WBe/rHcaILlgYW3kP5RrpEM9jRmVnuIFzbbpbGz8ov9Ft+24ml8T+v5bJ9ZLoAC0
KK4Ndi/HjyfjdfN+23NncCjztwZGqCdIyNvWLU8Xa8Fc9tZtVjACYqnolpAsBJ2K
66IieFQOaPrnaCkPwc6Y8lmQa/VYle5aJfrhVcDBJBAQnJ0k+Bzbcxk3gIpJmxQV
3Hx9y20UcfmUVBOGDiKj18bS09R75egHEhlZ9BTaZgXp3hNv6tpnGCChWolEFXoL
wl4ncWYLZGAxTgcAdW2FNjJ+lU1magg3zfZr4hNxDka77YA8UciZg5PQsTqA93E=
=m4QZ
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--

