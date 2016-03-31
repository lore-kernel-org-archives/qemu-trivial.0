Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alZ2a-0007IU-Ip
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 05:37:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1alZ2T-00078a-Qd
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 05:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1alZ2S-0000fP-Sn
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 05:37:17 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:35282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1alZ2O-0000en-En; Thu, 31 Mar 2016 05:37:12 -0400
Received: by mail-wm0-x22b.google.com with SMTP id 191so119456890wmq.0;
	Thu, 31 Mar 2016 02:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=geL+6pHzJnP0lMYPy2TZUt82+RpN/ZYehI9a7BzgVTM=;
	b=H5g4bS3ThC97STAOxwd/zwajzUS/4VZrtN3TMZcgrM82FkN/5PSuJuwzvRi8/kCog8
	kDM64U1TFcIu1rj4i2rwtbUbT1Vb3K9POWiwPFhtBaBpkN5gi75jHao3QPAEyp0J1Vz4
	G6jtlM8WhwydCyDFbHMmfi2CoPSfk04EatM8JTe7zc/yYwV1ctxNJ3F6yISjGUMlnwlk
	cVvmsn/stj9Dv30pUdbWi4+TBoP1LZxMvMz2vLt4fmjGW3PSvmian5qLMm8I8r0vkXsx
	mJyHt+AOcSz14O/pXHqrRR/70D+KPwl9LSP7jhTp958A3gk1lxBClfKQGNUu2Hr7zUEo
	jrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=geL+6pHzJnP0lMYPy2TZUt82+RpN/ZYehI9a7BzgVTM=;
	b=TOVWS4ttRSc/gp+QxUPEXHDD4JEuXRhUwX7kM9Tk2IwbNkasvPCqrX89MAt5BEraJK
	Y4o4jiGPBFEwmfXOxCHe5N6udr0N2MvNh0YFTiozBrFl6+6Njj+EMu8Zr8fPeUx0VD0T
	Ua3O7633qqjyaSgejQs20JGo2vzGHEALepWyLyaPDtC1ysft0Jp5Eizlpml47g3cRkYI
	eNiDaUFHOZMlignYik1GHE81BDPWfN9G092pHacQmWC71BZ1Kngwh7G3RdJAD5z1He/N
	ixFWkIbVGmHkNDkTmo94m+WUv4XtW82QW9uvyys7P5gIVsvbzKuWMbzUs9Hp8Bhs/tTZ
	moQQ==
X-Gm-Message-State: AD7BkJKr/Q3HvIkDhUvnFAjd8KleK3B5ISQFPT/mw6osGuxdmtZ1CtsvoUjp8n7z9HCNCg==
X-Received: by 10.28.12.80 with SMTP id 77mr15056799wmm.19.1459417031755;
	Thu, 31 Mar 2016 02:37:11 -0700 (PDT)
Received: from localhost (host109-156-68-66.range109-156.btcentralplus.com.
	[109.156.68.66]) by smtp.gmail.com with ESMTPSA id
	w131sm8584013wmd.17.2016.03.31.02.37.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Mar 2016 02:37:11 -0700 (PDT)
Date: Thu, 31 Mar 2016 10:37:10 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20160331093710.GJ32185@stefanha-x1.localdomain>
References: <1458743900-14742-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fU0UwhtRbpo05rnG"
Content-Disposition: inline
In-Reply-To: <1458743900-14742-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
	qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace-events: Fix typos
	(found by codespell)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2016 09:37:23 -0000


--fU0UwhtRbpo05rnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 23, 2016 at 03:38:20PM +0100, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  trace-events | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--fU0UwhtRbpo05rnG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW/O/GAAoJEJykq7OBq3PIEwcH/38r/GIha2FzvkN7czcXEF1X
iv2Q5AaG+SAvu39AOXs+TbJLsDXqbIULU0NfmHwYvSlt1UGebeepjmnvAo5f6JDC
AWSjacsntU7ikO4PnCyrOUWiW8MMePx6/85LuJoCFwfJjmPZjGMaR+xelM8FqFZQ
hesjQ4gcpDMHNDB9iLzTp9zjYaBRZmsI83A/SIrvi2Bg92dOc5AHHI3wn0zWaQ+b
7IigoZBLnzM4azlqqwQPSUecB7y19b+1Do8E0+oOQ1RXTy+qYju3o38fkG2t4Zuf
3lnqudR+KHuAAu0svECD4nuLwZtc4C3tZYAWdi2BMyRsIh6i6Uzp12f3DHQU2hg=
=0Gvx
-----END PGP SIGNATURE-----

--fU0UwhtRbpo05rnG--

