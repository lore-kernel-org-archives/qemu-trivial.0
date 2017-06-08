Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIrnf-0007xF-NL
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 03:24:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dIrnd-0007vx-BA
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 03:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dIrnc-0006Kk-DQ
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 03:24:09 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35179)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dIrnX-0006GE-Vy; Thu, 08 Jun 2017 03:24:04 -0400
Received: by mail-wm0-x242.google.com with SMTP id g15so5807586wmc.2;
	Thu, 08 Jun 2017 00:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NhF6aXrRYKwunjzygjtAZIBhv2huP9rvgeGKR4aC30w=;
	b=Z+50sKGa0jzbpudhuiVPf0nz4sA3oawoqb5pUdPTeXAOQ5/PJrFJXN7BZI4APOExrG
	oh0F4ahIlUhaJ1lQo+S33m6dXXeQlJ6IuuB+cenxP0ocAjXbVOoz7qgGE9UoPPCQB6zS
	PSxjjsfsLqOsb5udom8SN4RTsoe6KEqsl8bfdV7dmWBYHGMakY3ngv00IS6WpKSMna7t
	FBkTmeyYRlrAXBvw7HjiAM3zG8c/eVR8ojMlz2UFRlHyGSokagJGRUDYRBsQM68YdJbr
	fCCAlbh6dagqcKWU1ml4Asnr6/EOAlFqD4LDYnQm+zi/1quBAt6VKRY5+Y5RAlw6/l8f
	Hv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NhF6aXrRYKwunjzygjtAZIBhv2huP9rvgeGKR4aC30w=;
	b=XkSF9S1T/FZPGZ60XJxSSQ18izzC1ol4WDT2XpL9TiHi3w+PLztHqlU5vvPNmIFBKO
	8G8m01tp/qFpE99qGCWjcHkxX4i5zjYn1qCb12dOfdgQj96+EwHoq3EquQbHrW9LaMSk
	EoAvh6AMWjBG/wAXaEflM4T8luf2nIaikrKhUnjN2cxDqBtZSgcJrN4+WlTXZrp2yZvH
	U8sdnbs2U1btUny6KtV96c9AIY85Jg5H23PdzeJGSk99Y/qWl+4ZxHTD8Nr3Mv2Wwprs
	GqTCUlUnqD1iVH57M1Q0ycDWtF6cYrnxq8qbM088qJ6X7bIyld7fn8cxVMShmkZspaxm
	X48g==
X-Gm-Message-State: AODbwcDkTlGTQ2u9O5RZuOyoTvHM7h7qR4JTaCIYS2KgFI+GV5fBw9Az
	/ThznDoMtb733g==
X-Received: by 10.80.135.183 with SMTP id a52mr9616895eda.90.1496906642968;
	Thu, 08 Jun 2017 00:24:02 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	e18sm1991424edd.27.2017.06.08.00.24.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Jun 2017 00:24:01 -0700 (PDT)
Date: Thu, 8 Jun 2017 08:24:00 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Manos Pitsidianakis <el13635@mail.ntua.gr>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>
Message-ID: <20170608072400.GB2232@stefanha-x1.localdomain>
References: <20170607224316.6952-1-el13635@mail.ntua.gr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <20170607224316.6952-1-el13635@mail.ntua.gr>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: change variable
 names in BlockDriverState
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
X-List-Received-Date: Thu, 08 Jun 2017 07:24:10 -0000


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2017 at 01:43:16AM +0300, Manos Pitsidianakis wrote:
> Change the 'int count' parameter in bdrv_co_pwrite_zeros and
> bdrv_co_pdiscard to 'int bytes', as they both refer to bytes.
> This helps with code legibility.
>=20
> Signed-off-by: Manos Pitsidianakis <el13635@mail.ntua.gr>
> ---
>  include/block/block_int.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index cb78c4f..06e398b 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -162,9 +162,9 @@ struct BlockDriver {
>       * will be called instead.
>       */
>      int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
> -        int64_t offset, int count, BdrvRequestFlags flags);
> +        int64_t offset, int bytes, BdrvRequestFlags flags);
>      int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
> -        int64_t offset, int count);
> +        int64_t offset, int bytes);

Please also convert all the implementations of these function pointers.
For example, block/qcow2.c:qcow2_co_pwrite_zeroes().

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZOPuQAAoJEJykq7OBq3PIltsH/ia5pjLuN5WXQoinv9cOBAgL
Q6xr6l8URPPzBsTW3Rid2qTxlnmbmV9FoY8gXwCXky6TQpYCZDZEERizm88NCEbP
ph0N2xSZ03wZfUJEsUOQdKQpST8zqKbOQfdC86CROL829UcDfegDsjeb+JKc0o0b
wzQn7S1RJ/M4i5daosgTjwbP9QGGYgi8L4lJjuAmYtD6HzKSY49ix7TrLq/7DYZ1
uXbKh3C0IyyUlkPjOgJzXmU7NlBFEbrSkQASGrg373EMr0lIvpdE1iDFV4Wd9+v2
RPuKLKf+2YQGbYyDLhYLMD1CCRa7R3DY9laa7Fhox9z0IFyR2aKo1gZEKn5i9F4=
=eI7v
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--

