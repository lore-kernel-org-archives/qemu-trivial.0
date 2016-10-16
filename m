Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvifB-0000Fb-O5
	for mharc-qemu-trivial@gnu.org; Sun, 16 Oct 2016 06:27:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bvif9-0000E7-M6
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 06:27:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bvif8-0005ZI-Sm
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 06:27:27 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1bvif4-0005XM-JN; Sun, 16 Oct 2016 06:27:22 -0400
Received: by mail-lf0-x242.google.com with SMTP id x79so20920860lff.2;
	Sun, 16 Oct 2016 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=c8lw3pZ1X6K3jmTNjJRfAgR/LlyDnkyHo+fVitMwTv4=;
	b=LDNKkRyq/YyXmPWoVQ5a//Y5G5KgL49xr0DidNmkFlRYpJH1o7hEibTPgHR/+Yd3+I
	/7CbfFiqX1PZVyFhnzkGY51DgIXhMZeKWbaliFsMqp9aHrAsvgLxN9GWW+DvTJCCHJzl
	6Ubdvmpe9XWzIJYysIq6bJkHHPeqFMgb0wkYFCpkNYrs3tR5c43Fq81u6Vj5phPg5BxJ
	KIsZkO9g2o+icKlOpi14dlCMylVhnDS6jh7vMMwHc4j8jeP4saan2MrLjAt86vnI9MIv
	rnQSKoupLjK/Prc8m3yxaah3X7aLgcLa7a+gIQjbYvwgt1n+vGRjC4ebT/uszGeUejx3
	H5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=c8lw3pZ1X6K3jmTNjJRfAgR/LlyDnkyHo+fVitMwTv4=;
	b=dnSHm1rUfn1M/G1pv8xTn8d6x6REiCd6HY5TnN2yQ0VNb9k6GSU2EOLh9rp2RkbGTN
	bX2LQ21uK3VuyGtiuN158OCAjZzaA9ZlFkeyFHoc5yF+LKO/b6IaWOtpcTw1myTVMlnt
	+Nry4K+OKxaycaCEIpfrli7BOxA3VcmhP+vfFmag383Z5zCq0AuL8vPSeXkTDC3guUnZ
	2nHznWs2mBBLnsPd4rPP5BcEZ/d1cBIrYFR34e41QjB0M/LPf7iBZPmTgOcrdo054ANo
	MY3txJTo5iLNwoB/zWUGYm3tIklCoEGw8k+L2EV9GmZqHjVsiI8N5kToG22wwe0gHgFX
	AD3g==
X-Gm-Message-State: AA6/9RkjG9c0MXEU/JTj7Tr3JgAaj2POWwrwUqsCoyVKdd2OILFW0PRixWSaKljBn+0x1g==
X-Received: by 10.194.93.234 with SMTP id cx10mr8149973wjb.140.1476613641129; 
	Sun, 16 Oct 2016 03:27:21 -0700 (PDT)
Received: from localhost (host109-156-67-175.range109-156.btcentralplus.com.
	[109.156.67.175])
	by smtp.gmail.com with ESMTPSA id f2sm41208020wjr.2.2016.10.16.03.27.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Oct 2016 03:27:19 -0700 (PDT)
Date: Sun, 16 Oct 2016 11:27:17 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Akanksha Srivastava <akanksha.dlf@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kraxel@redhat.com
Message-ID: <20161016102717.GD11739@stefanha-x1.localdomain>
References: <1476390091-6741-1-git-send-email-akanksha.dlf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline
In-Reply-To: <1476390091-6741-1-git-send-email-akanksha.dlf@gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] usb: Change *_exitfn
 return type from int to void
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
X-List-Received-Date: Sun, 16 Oct 2016 10:27:28 -0000


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 14, 2016 at 01:51:31AM +0530, Akanksha Srivastava wrote:
> The *_exitfn functions cannot fail and should not be
> returning int.
> This also removes the passthru_exitfn since this callback
> does nothing as of now.
> This was suggested as a Bite-sized task for code cleanup.
> Signed-off-by: Akanksha Srivastava <akanksha.dlf@gmail.com>
> ---
>  hw/usb/ccid-card-emulated.c   |  3 +--
>  hw/usb/ccid-card-passthru.c   |  6 ------
>  hw/usb/ccid.h                 |  2 +-
>  hw/usb/dev-smartcard-reader.c | 11 +++++------
>  4 files changed, 7 insertions(+), 15 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYA1YFAAoJEJykq7OBq3PIpHEIAJWdbpjskQAeqTZRHy3N8Ybl
/a/MDeByXvlg9/JVqoeaMXvp9+Tbbe70tE+jvu6DyVSmxV7rSEAYYMgB05X9IfEw
USSnR5xrZ7wCFyL9i6uHfsOh26lf3niljB9CZN0nkLbl6N6dTXu9xbP2iEPqFxat
xvzgcJn0QdXiRdehRTLh7iXVwTbqWHM3ep5fX+CP4yanMRe8PMJD0FM5gFDBQgDc
t6G+yuzLpbiE1ct1hNcDdUoyTqp1UXtYru5l7lHRpuvDjWNwse8MPvIB4+p+DYP6
bR25T5rNloXz36vzqDevIcpufDBH80j6CS9I24ruNj7Kn2GY753INLi7Nlr0WtM=
=RMGE
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--

