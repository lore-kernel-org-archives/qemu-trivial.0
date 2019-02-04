Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqXS4-0002tq-Sd
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 01:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gqXS2-0002sO-Nq
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 01:09:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gqXS1-0006jq-Sm
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 01:09:50 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gqXRz-0006ZI-J3; Mon, 04 Feb 2019 01:09:47 -0500
Received: by mail-pf1-x42a.google.com with SMTP id b7so6267109pfi.8;
	Sun, 03 Feb 2019 22:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=po6D+ajiTz9qeqzs86Tz1PZKMa0pTcwN6A4PxCPSp3k=;
	b=o3zOzYRJpt0eRwJBgTHB8SMYzms5dqT83zvLJqYgcN7/4VdLwD/F4NdQlwouzcN5to
	5YzPLQLr20PFrmAmP2Vj0XlN3SkSARjpg/eIpFD4g24R2UMbpFjNZQI5ruuSK706d9Gc
	sz4KK1fu9wu3HQAhaeEet8mudyyv027E9o0TgdFJlzwS+GNRY6HWj+NSou7o4hkpIca7
	BG4OyhjtCnQPbzw2RpZtuB8rTfuJzJa+HeUtVEz6qjybt++Tw8QkSid0kqWZDKx+gLQQ
	riQnYVoBVsu3va61polO4ZTGnSfXCs+o1+c05rIGrnq6WcYrOaAYU0q+2eK+FUgyOsHG
	JfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=po6D+ajiTz9qeqzs86Tz1PZKMa0pTcwN6A4PxCPSp3k=;
	b=swFsGMTvmkKJ8E3NGPGah2eOjVKy/Jvtc3RxQEoqfUB+q+oWy9GiInZz05tqArIGWQ
	l31elG4+4dcHwdnoGgILGCU2wcUu8v/eLvtmsEUqItzNhhs1Be9hFOnjTQEJMeCcQ+92
	iwgNh1GBH0VJFFggqbJQUuaT+mz2y+8FMIrGYHhL5CQkrMLikdr7Zm2kYteTYdLKmNOm
	hpgENI66m3HaclG4GT/hgZHIFuACR3Z9VHAEczQEnaQIqeCyR0zE5qEXq6VZSvxccdYW
	/R0AZK3g6XcElIc97EAqxjw/bvjPDlEHCDwdXlN9dYR5j+QxHbJaJN+sJOYFfgPJIXOw
	NvKA==
X-Gm-Message-State: AHQUAua6WQW4xzTDp3ZCOSwsNCl1xb5hdM/OAdukCjisZTA+QqD77k4j
	UKbjMzMSNNLzQ9handtBWw/t866gLbTFDw==
X-Google-Smtp-Source: AHgI3IYXfurt2YiK6tygPTWPWwKaesYbLBhW5XOsBlZbqfBsHdVK1niaGKDdobKW1I+i790UEWHKRA==
X-Received: by 2002:a65:63d3:: with SMTP id n19mr12015866pgv.179.1549260574220;
	Sun, 03 Feb 2019 22:09:34 -0800 (PST)
Received: from localhost (42-3-94-015.static.netvigator.com. [42.3.94.15])
	by smtp.gmail.com with ESMTPSA id
	d21sm18788262pfo.162.2019.02.03.22.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 03 Feb 2019 22:09:33 -0800 (PST)
Date: Mon, 4 Feb 2019 14:09:26 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20190204060926.GG29758@stefanha-x1.localdomain>
References: <20190201173655.4567-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Content-Disposition: inline
In-Reply-To: <20190201173655.4567-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-common.h: Update
 copyright string for 2019
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
X-List-Received-Date: Mon, 04 Feb 2019 06:09:51 -0000


--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 05:36:55PM +0000, Peter Maydell wrote:
> Update the copyright string we use in version/help output,
> since we're well into the new year now.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Better than last year, where we didn't get round to doing
> the year bump until September :-)
> ---
>  include/qemu-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcV9cWAAoJEJykq7OBq3PI6zEH/1912mGp48wodlIZ8UGU72tN
HmbHv2ue/UJDFfy/rKqoZomrRx9PQMNX6CAxvZN8LS3QXiJh7tAOkhePwYNtARwO
4ROR2i2CvuzELwPPCZ5JlJVms07RhzkznrD1tf/J25bLRoiYtG7BEeXWixoGLxtr
HU54xTa2jRbXIpyIyyNtjIKoq8K3sqgWYgmilfz4vdTxQDKifHkJxRvQzpZ4AQLV
8wSdIS5X1HZ0OmdJR/V2CtmQhD+zlbqQWyhvjrYyoUW0tWmKBe/aAApFyUv+LPz4
5VZJeRjtJ9armJhDIV2o3IioBmcgrpG0+ln/t0k/klxWrFN+fhDsOBlMinxAMz8=
=JvNR
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--

