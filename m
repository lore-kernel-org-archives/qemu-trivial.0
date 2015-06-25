Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z880k-0000qW-96
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jun 2015 10:20:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Z880g-0000le-Ny
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 10:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Z880c-0001KX-6h
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 10:20:10 -0400
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f]:34876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Z880R-00019P-5Z; Thu, 25 Jun 2015 10:19:55 -0400
Received: by wgbhy7 with SMTP id hy7so63955634wgb.2;
	Thu, 25 Jun 2015 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Njj41hzv2+mg5Fk7Prpz+A54bfNtTvjVGEV1CYi4QI4=;
	b=Al5fqHQjJ8nZDqwa2LPUCJxRVo1MNLPzmwQBQ1xC37g6DY5J8U1oPGCWwrj/w8Tg2D
	VaM3N1BXq1Ljk7/m7czLpWHuHcb/YYypy45OGGlEzthVNOi6hzt91NkSNyeMrOYaw0Uu
	Au7eft6IxlXoOXrTj28OBl4LRHAKCkzDOcUVl+ajXdzCM3qcd9Er+CWgbAUMT+cRDXRN
	KSUKGBuqjQNxJphO5fKz63pXEpvcqayqfi2qxjlwUhLC760LCX92NWDLEaxCDcquS6zV
	vvggxDuu86pA1dBDXQneCRjIJqy0YB7cUiLikOAy6eL322IgAfxMsGdGwYz+5L/ID72b
	Qt3w==
X-Received: by 10.180.98.134 with SMTP id ei6mr6044032wib.49.1435241994581;
	Thu, 25 Jun 2015 07:19:54 -0700 (PDT)
Received: from localhost (host86-153-218-221.range86-153.btcentralplus.com.
	[86.153.218.221])
	by mx.google.com with ESMTPSA id fa8sm7851833wib.14.2015.06.25.07.19.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 07:19:52 -0700 (PDT)
Date: Thu, 25 Jun 2015 15:19:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: arei.gonglei@huawei.com
Message-ID: <20150625141951.GM4419@stefanha-thinkpad.redhat.com>
References: <1435213450-6700-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oiL9LJXJsdjS5rzq"
Content-Disposition: inline
In-Reply-To: <1435213450-6700-1-git-send-email-arei.gonglei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22f
Cc: qemu-trivial@nongnu.org, sfeldma@gmail.com, jiri@resnulli.us,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] rocker: fix memory leak
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
X-List-Received-Date: Thu, 25 Jun 2015 14:20:12 -0000


--oiL9LJXJsdjS5rzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2015 at 02:24:10PM +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Meanwhile, using g_new0 instead of g_malloc0,
> refer to commit 5839e53.
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/net/rocker/rocker.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to my net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

--oiL9LJXJsdjS5rzq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVjA4HAAoJEJykq7OBq3PIkA8IALcfc8DI5hoXo2EIlFWBEui3
VY1qSEv/F3PBMyq7zNK/15Ai8K4mJiG71l03bYGF0133tnh02P51cFS99u4XBbph
n6DhP2Yyvdl0TjDABeRD6+LdbI9FUnM1KHFTifZ7rCfKx/WFjM0bFRh37M+Qs3QY
gpumkyRU8eXBDO83Q2fxeNdh78VKEO+tdKavj4W2r5KdJWWvD+nzDgrnCU0vijcF
K+U/0CMRfF8n52HN6c1h69zNhc0fHWo56Qj/52D+l0zvqsygv2FvNwi6D7d31JYG
iyl7jbVLsVFYQeNVTl6BrxxSqaXTD0Vc4wIIyqzhlSM+99a9hISAgB0O/NrSGA0=
=dP00
-----END PGP SIGNATURE-----

--oiL9LJXJsdjS5rzq--

