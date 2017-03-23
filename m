Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqyjf-0001q2-61
	for mharc-qemu-trivial@gnu.org; Thu, 23 Mar 2017 05:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cqyjd-0001p6-C2
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 05:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cqyjc-00011o-Di
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 05:08:45 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cqyjY-000118-5y; Thu, 23 Mar 2017 05:08:40 -0400
Received: by mail-wm0-x241.google.com with SMTP id u132so15127873wmg.1;
	Thu, 23 Mar 2017 02:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lp3LtrMVuaTWqWAszwrb4xqWde3fLjGZgKZb/aPo6U4=;
	b=qeSBgK7FgRU/tPbW2Zd6KJHUPHqzb2CX7kVoExIPytz4/CHUfZi/jrzaOCc+8WP0z8
	zsFUW5lD5qv+VEon3DEFNVq8njBUdTT6RHmbVsrWWivJU2PBlnLH+xzrKBdljYKKgvB8
	f3t0kJ06KdYOPtWvVLCoN6El+Jd41rIVCRnHgjairBcK1MIitBYw5NBsncxfm/locybr
	YU8C34VQUkyYJKu16t6uOu0pbPMGPMu/nUwzKv04uZpMRMXP/caKsGLnKdu7Mr9TCvYc
	+1jblkqmCCHtogwDwzOKa5JDBB/VX6UhdHlMQBa6Lm+w2WOu96VaA7AzOCXoRbPPMlvB
	3XRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lp3LtrMVuaTWqWAszwrb4xqWde3fLjGZgKZb/aPo6U4=;
	b=ddcy4Xk3sGgEX1tK+M5UjLBD08/+ETSlR4HgguZtQGt0jtCvxA3aOWM8UMqfn6VdFs
	3W3ZqyEnsT7X/JYTPo6VVtGBVEMOeVGecTObOMzGsWwteBdtloMUAZoImmdHs79xYDpd
	cBg97AJXHqRoGEP647lVRj97WqaolWY07iIhaWFGFqwWOa8VAJQzWmuYlRL6GW1hZ0Hd
	+gIRugmPRgCR0sRC0Yfs/kXzwqj7UlKdLpfWpFRNat7ZEWBm5jWm6uigFsdtr0e5PNXu
	OgU8c/ug90XTf+G7961NLGPdCdevTyhYHCgKQWCD19qGLvHSLSiPESOflVV6J2HvLs8k
	UsLQ==
X-Gm-Message-State: AFeK/H0eBq8gJU1O10fDdy94Zdl1yWm7cKfBtWPGBervWwxiVxpigZqcALvTCY9/rF67ug==
X-Received: by 10.28.133.203 with SMTP id h194mr1711063wmd.122.1490260119257; 
	Thu, 23 Mar 2017 02:08:39 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	k190sm3469176wmg.10.2017.03.23.02.08.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Mar 2017 02:08:38 -0700 (PDT)
Date: Thu, 23 Mar 2017 09:08:36 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170323090836.GP16717@stefanha-x1.localdomain>
References: <20170322115241.2810-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4IFtMBbmeqbTM/ox"
Content-Disposition: inline
In-Reply-To: <20170322115241.2810-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc: fix function spelling
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
X-List-Received-Date: Thu, 23 Mar 2017 09:08:46 -0000


--4IFtMBbmeqbTM/ox
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 03:52:41PM +0400, Marc-Andr=E9 Lureau wrote:
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/io/channel.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--4IFtMBbmeqbTM/ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJY05CUAAoJEJykq7OBq3PIxnMH/jocQDIaV6QamRCkrTvoNi7y
oBYrUKlM7VvYljrpX31DHNwxW5BmWcdAfy7j8s7HC2OMFGIC8UUVhXLXLBk+aHN9
Se214BugTJGSwEj7MMq4+yibM5JhcX5sJrmIcacNQVgnRM4ow9T/bj9TAF+h/IW4
xRw9xzkgcangcVHp+QBPoVWIoMuwxBwgAtc6JwjIVMoDMNN2qTUfGnvUnrs4Dxig
x8IzstBb4R/jeDLSyw2zzxDkGXO+oT9u+Q1R0m3mLlH4l+TXPrWR8OWCz3PxEyki
FUm/kyTqq89j9JA3fPlW7kXMU8COgUglTVsGIxMLLi5auPvmbughj6DkhFSkm/w=
=uopM
-----END PGP SIGNATURE-----

--4IFtMBbmeqbTM/ox--

