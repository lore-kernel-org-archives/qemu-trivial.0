Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bO0aH-00016G-Pn
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jul 2016 06:43:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bO0aF-00011K-LB
	for qemu-trivial@nongnu.org; Fri, 15 Jul 2016 06:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bO0aD-0000iG-Ns
	for qemu-trivial@nongnu.org; Fri, 15 Jul 2016 06:43:02 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:35872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1bO0a7-0000hJ-D7; Fri, 15 Jul 2016 06:42:55 -0400
Received: by mail-wm0-x242.google.com with SMTP id x83so1735432wma.3;
	Fri, 15 Jul 2016 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bjCePy08ZBWSmRgdu7UIE/UyTLl9Fkiup06zx418oPw=;
	b=GYzq6iVpNUKhX/Ap6QC9aBeBW7IEtqdZ5evJw39QDOvjsFSa2Fr/S+2UcyUb+VGV5k
	SIHHVcAz5ghEgRtr2PQWRWiZ8gFf6oLCu8uPEIsd2gfjOkGJh3tHHmZ121KRXp2Aw72Y
	W3q0suSyssGkOvLWShHv4ifZreK5+MhxAPzqgm7n1vYz3vN1o0BWqcRY5u14S3M/vnpb
	vPAHl16j57e7HIEDN5q6Yh29ESiAinUCcmeIyOz8b+spivK104VC1SqMko5Mkux2MaP+
	A/tehYH1h+TH0A529gVR4KHdTIfy+rLSaDX8B5ehSb78mW0T/oxwWY57QbcH4BkuQJJO
	t+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bjCePy08ZBWSmRgdu7UIE/UyTLl9Fkiup06zx418oPw=;
	b=BgIyat7qh7jn+ENpivpwAO/k91cmKGKjTaNSx3u1+1nCGu5yVdKwL3CEBxHzDiG6tT
	yk8S3uFOs42bWeyqZf4YahMW13t77ypp1IKuIt8jbCVgrl8fAZwpK/kHtfNG9R8FzdYO
	NUhJVDHuLXOnXTDy83pb0A6s8L2f8SjzPQkWPqZhS/Q+Og93pMw+gIHUAAMuQRlFo478
	GgbnB1EvQywOj1f5499XxCza06ZJfiIhtwlgzrvXwhfPDhsK6QRimW+XnKsHj8sRClHK
	KXFuyXYbIznueO1aVJTBrVrOxciflZ5CwrmW0AdxLGKqXPdbVU7SZzxm8F9sZ/oVmwzs
	6e0A==
X-Gm-Message-State: ALyK8tJJTlihG87bPGszE6Je8PFpUqPm2ced5tRBcwmczlWEEZNxru1+uokez7VOzvmpIQ==
X-Received: by 10.28.142.144 with SMTP id q138mr22977929wmd.30.1468579374695; 
	Fri, 15 Jul 2016 03:42:54 -0700 (PDT)
Received: from localhost (host109-156-64-22.range109-156.btcentralplus.com.
	[109.156.64.22])
	by smtp.gmail.com with ESMTPSA id s3sm86817wjx.11.2016.07.15.03.42.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 03:42:54 -0700 (PDT)
Date: Fri, 15 Jul 2016 11:42:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, famz@redhat.com,
	qemu-block@nongnu.org, stefanha@redhat.com
Message-ID: <20160715104252.GF25692@stefanha-x1.localdomain>
References: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Content-Disposition: inline
In-Reply-To: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] aio_ctx_check: follow
 CODING_STYLE
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
X-List-Received-Date: Fri, 15 Jul 2016 10:43:04 -0000


--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2016 at 09:10:43PM +0800, Cao jin wrote:
> replace tab with spaces
>=20
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  async.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXiL4sAAoJEJykq7OBq3PIlCsH/iF6TeSVTl/bjcCrBcGFSh5D
JDdnhD6xUzV+T5jJtjw29eITeUaK7gwp7G8OyXx9gTVt3zJU8aYh7nWSaSwGVPdm
SEP608n0RXlOyljwSW6sTxmHjEiALwpmWazKMsmVF5FtXRg+ei61jP7kJ5LkfMwR
7covO3H84PuUq/LTaS7HZzim/h6pJyqSjcBV9V+TO5zFjYzDx4LHNsCfkI6Bgrrg
6HP5HFwwCykVtzEUGUOYO9dIr+PNxqe9BmCLuWS/Urs2HlzQnbO9NQTmSKwj/RM2
4Y2OxZuOHa+qZ+deOf2WEoNfpYT8jhTz62orgvx+xVMxRFANwRRuAp5GNL47Zec=
=TMZv
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--

