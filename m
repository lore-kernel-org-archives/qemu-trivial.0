Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYCkk-0003pc-2a
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jan 2017 09:16:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cYCkd-0003mX-ID
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2017 09:16:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cYCkZ-0000uK-V9
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2017 09:16:11 -0500
Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242]:33026)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cYCkT-0000sz-9g; Mon, 30 Jan 2017 09:16:01 -0500
Received: by mail-wj0-x242.google.com with SMTP id un2so7952895wjb.0;
	Mon, 30 Jan 2017 06:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IIglJwkSnS5eirsT+NN4FMhEr6eQXmJh7/Ypib9dB7M=;
	b=EB1NcYx+CZFZTF0yUrax+A5szRELn5Mv9o4AM/3GghCu1mPfRqhtElsyZPTyfu3JTx
	c9lAATMBgllq6hD13MqCPg1UxPJvMaLuwIxPq6aZQVN7uF6B+bCGvFsONcMsh3RJvN0Z
	Zq2JZ2PoZVLYsTY8s+I5V0aqZEnWS3cvcmxrY1jYuPqKn2+j6/3Qa8AdaNTnZQeM/tFq
	LIYoifpSECKXLURFwZPgjEZVL6QCHTLE0XCJnw5jj2ATw/igetYV0Hd7UMmM26h8vMgv
	WnZ7TdX8rzkvlSYxm6HLvKfxTM3uR+yZ0WfQBfrJgxpsRfm1Tz6p4pLstLsPz3hnuHiq
	Ytuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IIglJwkSnS5eirsT+NN4FMhEr6eQXmJh7/Ypib9dB7M=;
	b=kIvTFm0cGF13SlFtLJPv/zpk5PEjq/I0n8Y4WsB6bdta3a4iMs/J84ZJclcxuxpfu+
	lbIkoYiXf+JOqT1K+s96i1Xq6+vJwXWEltKhq9fkdPu23m7XHToFO9kXV1JHP7mcui3G
	85qiBNYosd1A2D4NpfcUW8qsR6B5M8AnixDm4egnYGqv/MAGFI9by57EWVoWNu5xQd/q
	iHMv/QGUbl6lKEGeuW+3A9i1Pfv8YvDF2XumhIBQuR2KFoj3t/WMZYRYD6M894zcUjOg
	I0ObTEIM+OKkzYfsGjqfwW6NxzF28BleKfC91bL3IVNvr8+i39puQiCX85SlH9YeTj1v
	NtGQ==
X-Gm-Message-State: AIkVDXIrQB4YhfjmMrrkLj68AJWUVbeKFvIafGUvKJJ5rw3bzTYsInJepOSexljl5ZBG+A==
X-Received: by 10.223.166.181 with SMTP id t50mr18793701wrc.80.1485785760264; 
	Mon, 30 Jan 2017 06:16:00 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	w99sm23107626wrb.5.2017.01.30.06.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 06:15:59 -0800 (PST)
Date: Mon, 30 Jan 2017 14:15:58 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Message-ID: <20170130141558.GJ2118@stefanha-x1.localdomain>
References: <20170126132827.7479-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ah9ph+G2cWRpKogL"
Content-Disposition: inline
In-Reply-To: <20170126132827.7479-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c01::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update copyright year
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
X-List-Received-Date: Mon, 30 Jan 2017 14:16:16 -0000


--Ah9ph+G2cWRpKogL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 05:28:27PM +0400, Marc-Andr=E9 Lureau wrote:
> It's still time to wish happy new year!
>=20
> The Year of the Rooster will begin on January 28, 2017!
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Ah9ph+G2cWRpKogL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYj0qeAAoJEJykq7OBq3PIM8AH/3/+vq0VgjZLkMHiBZhXctHV
LYEBC+DQbJJVns1zyGdSMFUAIPZbYO1GJkjOw9/CkeOSoyow40QwEQ8YkV4wzakL
5eD/bcJBzQmzLOg8SnD9F+kEiSTG1bMA93mYR+3eEI523K/LjrvCMq7v73R8/M6n
0dfiw0bwlMgKK4ElvD9VClauMJj1aqotvaU2Cx1L043bihlsnoObvrAFm//r5GB8
jl+l5ur1w+qJ/1UGdZ8LBX3gxUoyXgEXN31AZZnrIdKT+Ux6uHZ2PfYUHxdQrm9Q
xBBE76rqIFX4/dpBUcJ9A2Fpw63zjWZRruLm+v790tYIvET2TX2OMuDWjTiV/eo=
=M9vr
-----END PGP SIGNATURE-----

--Ah9ph+G2cWRpKogL--

