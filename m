Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAyNW-0004xv-25
	for mharc-qemu-trivial@gnu.org; Wed, 17 May 2017 08:48:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dAyNT-0004wE-R1
	for qemu-trivial@nongnu.org; Wed, 17 May 2017 08:48:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dAyNS-0004Ur-U4
	for qemu-trivial@nongnu.org; Wed, 17 May 2017 08:48:31 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33204)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dAyNN-0004Ps-Mu; Wed, 17 May 2017 08:48:25 -0400
Received: by mail-wm0-x241.google.com with SMTP id y10so3363242wmh.0;
	Wed, 17 May 2017 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jq3rjJv743zoE30bfJGhFZxvB/ZCbFWwtbhSJQiLOOU=;
	b=n2xS/H4vZoyh7GhQljgj93qNpOLbG0ZmTXp8LTvHX7kJO29EjbYpbFR0aOib4cwtHM
	T/TMRzuejNun+rbtrA2xyKmmkZQNwLSyjjc5+IhG2rvYCisco5vzM/aUliz5FbdYWkAV
	xTeDlG9g/sQ+izzkvgjGGCrtBv57sks5qHXQAWk5fBhmQU1RKdVB+tl+n0/xbV5dc2XY
	4JCn+j78HYnXde2cH/VNU7w/miu/FFYIIMPxrblpxnxQWI0bHXJJZCWC4KSS9AThwElo
	XxWSW4KgdS/LqMbI3fWxqYkuItN3bbxoQtkWowUBgc8fwoSF+ESk4KwnFnYc6wFYyJtV
	60oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jq3rjJv743zoE30bfJGhFZxvB/ZCbFWwtbhSJQiLOOU=;
	b=mpDdxkv7DGW08oN46powCkdQUxnqYPUXgUxpHBpCebjVp8pRnbUT5+3H+YI0XOM2AK
	9gAyIOl+Cy1/GDY/1mdLaLZgmHUhbXNCOF6NSIHZYnHcwb7ZcwiNTkwqpBsYWoiTSkAj
	9de33Y7w84ilgmtHypdpLgL+AlTmesmbBGjWlbTAH0cmGBQDiCbFdP75OvYUau9bC0Hq
	jQvC+PI7/Nl1VqRNrfuamKlbzfk6wXXABpjd1tCALxgX7zPoRjJX4X5EnV2ogM+yXdKp
	JXSxJxc8ojXnssIDFrZFUyCz+wLhv7tfIiwPIxaJbmut5WZURWUfVEWvIacFk0r7zAAx
	52Lw==
X-Gm-Message-State: AODbwcDorvzVfZswpvX3tg1Ub4lSuicxo9KMWHqr5C7MN1BJXeAPay8i
	QIP3Q3575jDQCA==
X-Received: by 10.28.142.131 with SMTP id q125mr10150210wmd.2.1495025304372;
	Wed, 17 May 2017 05:48:24 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id x9sm2381372wmb.21.2017.05.17.05.48.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 May 2017 05:48:23 -0700 (PDT)
Date: Wed, 17 May 2017 13:48:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Peter Lieven <pl@kamp.de>
Message-ID: <20170517124822.GF8260@stefanha-x1.localdomain>
References: <20170516001150.11508-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline
In-Reply-To: <20170516001150.11508-1-f4bug@amsat.org>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib: strip trailing '\n'
 from error_setg() string argument
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
X-List-Received-Date: Wed, 17 May 2017 12:48:32 -0000


--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 09:11:49PM -0300, Philippe Mathieu-Daud=E9 wrote:
> spotted by Coccinelle script scripts/coccinelle/err-bad-newline.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  util/oslib-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please send multi-patch series with a cover letter and proper patch
numbering ([PATCH 0/2], [PATCH 1/2], [PATCH 2/2]).  git-format-patch and
git-send-email normally do this.  It's important so that patch
management tools and continuous integration systems can track your
patches.

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZHEaWAAoJEJykq7OBq3PIpJoH/0vWGUIn40Ic36J/yaA0wAwk
/CPm7lLd+Rj5LrHdy+rWcU9cSD7hUgVdFo9l4tbcKLHSjTunvIymsWxlLoNYL4g0
sGi7bEhg9jTMjkMsACvJmpO3FMxYkURZBtbkO+IOQsAv8FrH8dWyFttoym7cGciO
8/5WRzTPL8zJjOoxDKtaQkso+pjOrB3/7dEijF49FolVatzy7TqhfSuYuYHCxDCK
XSNrBTMc2rCJjeyrFxb5E8rd5zTre4YT/ZSEjnxAaciOIHxglx7fbxaJbwaspRy6
CfPmQJHYWx6ZzDWTiyfhe4JbuaHqw5WcU75qFLw0ASKG0kCF3xj0A+1JuRrkJpU=
=7koE
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--

