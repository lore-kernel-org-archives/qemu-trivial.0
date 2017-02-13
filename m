Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdHAv-0000Al-Hm
	for mharc-qemu-trivial@gnu.org; Mon, 13 Feb 2017 09:00:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cdHAt-00007P-7U
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 09:00:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cdHAs-0005Ta-BK
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 09:00:15 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36029)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cdHAm-0005Pk-R8; Mon, 13 Feb 2017 09:00:08 -0500
Received: by mail-wm0-x244.google.com with SMTP id r18so19735940wmd.3;
	Mon, 13 Feb 2017 06:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QGTScuYUk4eAXS+7ixOlZlWcbhIfW2I97Mh0+eEQkdU=;
	b=HH6U36J0ofCRisOrg6S5b1Dm5TLoxFEF6ebt21UV3sHQZ77OqWGMxXQKKMue+tMCLb
	R6iI5gtBxQ/d2RWYftaGt5gPL318QV11rzOuNU1ozzWCk43o4rL3Ybl7flHSUvvmKZvh
	Ufv6rW8rSP0B5T27XlqctXE78t3CfSlDG7HZazQokmv2Kb7I2ovJ2/yqQkyM/YX0AU7w
	yrviuUKqIPuCogOsjfJqRkY1+o3aUDftvUPfMOUsbrKRy6kplzH2vzx+9BThdv+Fb5ro
	1QlgWLbf8F+Wzoupx2p3e8q97UrhCUOpqcGsZitGeMQaI6NZ+o3NnNWTqTQGaBCjRnJW
	HXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QGTScuYUk4eAXS+7ixOlZlWcbhIfW2I97Mh0+eEQkdU=;
	b=h1vfvLECSj78M97r7P7PYV+IOcMWZkbm+GoGj6fIwy+ZbWzReQBqSud9acRHzxIZw4
	0Wr731Kxl789bRww8oZtmsSqJ+q7/upT29npn1PpBSasymACssQy4a6SEnZiz61HNGsi
	3f1c/4m9w/bYYRJo5tIbr9my5y9jdjT8tH3pHgWcFL8Jzr1Bh4FS8o3XvcjP6zfaKIJP
	Hx8WYZaKgdJ9oo4TCjbunHlhoM5Pt9pYsMPzZbDHayYGEVk0IQglARLahsFjqF7nyJnJ
	pH2+O3yvgzaTg+SIVsg8iisNj0YuBXLSp3PXKJ6UpYMcF/sLoz+p1Sw0fvdx4PV+qNl1
	X6Kw==
X-Gm-Message-State: AMke39mWitw3mEgDXB0sPU9EBJWtcJLiWLdQJRWw43ALAl4dpJcr+P0oGua1OoGasn7+xw==
X-Received: by 10.28.63.15 with SMTP id m15mr40981462wma.119.1486994407630;
	Mon, 13 Feb 2017 06:00:07 -0800 (PST)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id b87sm5517339wmi.0.2017.02.13.06.00.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Feb 2017 06:00:06 -0800 (PST)
Date: Mon, 13 Feb 2017 14:00:05 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170213140005.GD10361@stefanha-x1.localdomain>
References: <20170203170729.12399-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline
In-Reply-To: <20170203170729.12399-1-pbonzini@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] test-vmstate: remove
 yield_until_fd_readable
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
X-List-Received-Date: Mon, 13 Feb 2017 14:00:16 -0000


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 09:07:29AM -0800, Paolo Bonzini wrote:
> The function is not needed anymore now that migration is built on
> top of QIOChannel.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/test-vmstate.c | 11 -----------
>  1 file changed, 11 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYobvkAAoJEJykq7OBq3PI9i0H/iBkcR5s4f8p/82Y1Uk0Segg
U62m4Z8stdohGEBSYbkbRxshGp74elESlEX4jZ0NX6+MIfHFrcyfmF2L1XzRtsDM
GvOvQM1tis18bwGbbrYJzahyrVWvGKUIrDSvFl+VitkCCxgEIRMz40lODiKs+3iO
knlKWpFjgHALYKt/R6dFcSUkWssVHcGWAMRaA1nW3a+8pILiWWyUkQ5eU+LcMIjQ
BLJYFnQMBRIkGCn4OR8S0NYz/Li1K4e+shtjwFD3lqX8jlLF8x5lgS6rZxI+bkop
4ibtOc9saErYHiOzgCe8JXaUySTGDOjHPjLFjhwxqqn8kWco7jMyXBlhloo5Xzk=
=tu2Q
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--

