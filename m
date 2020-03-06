Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jACXG-000597-HM
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 07:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1jACXE-000579-1w
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 07:57:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1jACXD-0007jl-5d
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 07:56:59 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35192)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1jACXB-0007VE-20; Fri, 06 Mar 2020 07:56:57 -0500
Received: by mail-wm1-x341.google.com with SMTP id m3so2284704wmi.0;
 Fri, 06 Mar 2020 04:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zA9eCyh8WTRyHUt5GBmEh5haT5ZdTujzs9yEEYEoiq0=;
 b=RFJoMZVc9QoEpNkcUXcbI+kWk1YbV2Y97rDqzOUlLjYskcRVaAE2plyMB/kGmNdewh
 u7iYobZDovk4seehSRphf5KdlTXjzXJ9SooAS06O3uE60dT37/Vtb3bGz8v912QRnu9N
 cB4q+H1Ch2jmNqLFLqauprq/y6eClX6mOH4jgmIHTjZ2VK5WAF7PEg4QYXQyV/c7n0aG
 WJAizQ7fqqvsmsrJ9sfmR6+vwJ6WbR1c49mn5ApfgiBD4t8/pBJBBDJrKc/Y7H9hKGip
 te0gdtaLCejazHvR8+sGZtU7YFQy3bJ1WrHnJBCz+XBmRJFQVPghpNCH/azlbGPO8Q8u
 7GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zA9eCyh8WTRyHUt5GBmEh5haT5ZdTujzs9yEEYEoiq0=;
 b=FXpPY24dH845qMfiQSjJK+hDKBfu2Q6j/+/hOjZnBoA6rld+D2hhd8sydk2NBlb8PV
 rHSSEh2A7HKh1EEIzQ+cAS+6hNq9eJhFUyAB6HAcDbZG0SNUj1l6CTeb1uswo0ZBqcDc
 ByoCDVBwJjluC3Be48aoifqoPo2Hilu6UdAxOpb/5vZhBQaKnPjA4V42r6QgbLwfaI6c
 YeZN/K7nq3YLpBAj98qB+LD8e/D+Dx3jb8fTW9q6F7PIMDox26WGxSCVCZ3rMRnRsGXu
 MkSaeLHmcyKejd++ZoBWoIKRHKE0/ONYKejaCaNp4LyWfaWjZ97BNyC9CR7QAbMXhnsF
 r/5w==
X-Gm-Message-State: ANhLgQ3oq01X5FH4rhfuC/MYhnJ5dXy+d+s1TyPonZUcYD6exi9+Zev2
 cxjldcutFgzWUt9uMhvCPOg=
X-Google-Smtp-Source: ADFU+vuYNseJPxUOuqarIjpXbO9jnM+4q1klHqfsoIswfxdmRzfT5Mgye+kJwm9LLAp1i1spO4K0qQ==
X-Received: by 2002:a7b:cc69:: with SMTP id n9mr151398wmj.175.1583499415889;
 Fri, 06 Mar 2020 04:56:55 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id q1sm6961188wrx.19.2020.03.06.04.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 04:56:55 -0800 (PST)
Date: Fri, 6 Mar 2020 12:56:53 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Nick Erdmann <n@nirf.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix error message output
Message-ID: <20200306125653.GK1335569@stefanha-x1.localdomain>
References: <04df3f47-c93b-1d02-d250-f9bda8dbc0fa@nirf.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VJJoKLVEFXdmHQwR"
Content-Disposition: inline
In-Reply-To: <04df3f47-c93b-1d02-d250-f9bda8dbc0fa@nirf.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Mar 2020 12:57:01 -0000


--VJJoKLVEFXdmHQwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2020 at 01:03:06PM +0100, Nick Erdmann wrote:
> error_setg_errno takes a positive error number, so we should not invert
> errno's sign.
>=20
> Signed-off-by: Nick Erdmann <n@nirf.de>
> ---
>  hw/virtio/vhost-vsock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--VJJoKLVEFXdmHQwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5iSJUACgkQnKSrs4Gr
c8h9ZAf+PA0d8y4ajsSS7IE7cKJGn2/AX14joW9DX9NsiFuI1uHEk0sfE1yhuVGU
HPpyM0A5edMRmrAp505jmZDglbk1ey+406n0j6Ev7XtACVBa3TyXQ/l086LqaATZ
rp1V5AqnqwErQYkO1u0Y7r+RakTklktr6OX6SJ7y8kH/upYZvaons5KMrjdRt5qG
LvL8mSSThHCshzKsZn1zlsSb8BeazMgu8y6ONPzmWEz7cAnJxCiWZdjSXLTCM5nY
CIDP5s5XGxaTf2vPCzvujXZDapnWgiOaSHmJ+leHuzdvwr5oO2JyU0r/qmpRNDH1
J369PXE7nWM6pk2LPqPRJ7Ns9oj3tg==
=RjEJ
-----END PGP SIGNATURE-----

--VJJoKLVEFXdmHQwR--

