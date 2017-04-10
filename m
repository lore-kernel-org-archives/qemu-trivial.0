Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cxWTR-0003Na-VW
	for mharc-qemu-trivial@gnu.org; Mon, 10 Apr 2017 06:23:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cxWTP-0003MK-P7
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 06:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cxWTO-0000C6-Tn
	for qemu-trivial@nongnu.org; Mon, 10 Apr 2017 06:23:03 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:35996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cxWTK-0000Ag-CL; Mon, 10 Apr 2017 06:22:58 -0400
Received: by mail-wr0-x243.google.com with SMTP id o21so23415804wrb.3;
	Mon, 10 Apr 2017 03:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Of6h5ieXtjdm5HX+D8MTh5dG120nPI+JjDLs0GupHxQ=;
	b=XOsrHL5jayaygKIVjlkbvyz5Lt/1xNLlXK48opzaClXtHeSuuAq6JPs0TEZRmsl8za
	/tIASdO49VGLxpXBatbUcovMXpBhNOTxV8I9Bzapd8ClJpOtAhf5cQjXVNndhGUWN3EV
	9sbeh/8DyoOeokly+Z+WXGFbNpLkV3i6z0IAw/wWX7oa0HhgFbheU3W9uYnk779D3oaO
	+IN5U089TlCmgYPq5olJWe/2OXSeyFhL9kO6hjtVCHkNDkCQL9JXEP2Am1YmAxBwpW4Q
	2oS/7pXPv1EbGkwMzf1idDLUplFi8FUsVqsLFVGEi34RwXPQUJVNJaNg/FaHQHpk41XX
	35QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Of6h5ieXtjdm5HX+D8MTh5dG120nPI+JjDLs0GupHxQ=;
	b=P66jEtx7rMD0bHXxWgZwkcOoojt4F6z6Va2u1Q2Xkk/7pKiWsVxb2UE5XYeON6h73q
	55pPk+IQe9a8LCIRgwPZ2VTwoLo0IgzLEqRvj2nwAvYPJ5fmgAUOM6siAG1M1rDmbl/I
	Piu5OQGiawNC3IJ5u2aZD3REzzL/d4ZBbeAbdpPbfGktNh8dVoIeaQD5bO6CC2gEGq1k
	KxORw9TY6NMKbC5JegI1HCQZqgJ4590Q/j0aZXa/YYOnvjTg601RezkaGt6OaqG9kFrw
	y2qSrcg1mLvBqa8tfFQ1ZUDLPok+T4QQ4RepDNtvmTmHPABOfYfW5biZ0blmrp1aTlie
	uaZw==
X-Gm-Message-State: AN3rC/5mJxPaljqjHa+iJqsIeCRigv7T1QTUK388lElX0BXtnI79W7uVsKGtK9YRgUrabQ==
X-Received: by 10.223.136.165 with SMTP id f34mr21345008wrf.145.1491819777214; 
	Mon, 10 Apr 2017 03:22:57 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	c202sm5109421wmd.32.2017.04.10.03.22.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Apr 2017 03:22:56 -0700 (PDT)
Date: Mon, 10 Apr 2017 11:22:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ishani Chugh <chugh.ishani@research.iiit.ac.in>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org
Message-ID: <20170410102254.GA20072@stefanha-x1.localdomain>
References: <1491629987-6826-1-git-send-email-chugh.ishani@research.iiit.ac.in>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <1491629987-6826-1-git-send-email-chugh.ishani@research.iiit.ac.in>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Removed trailing newline
 from error_report()
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
X-List-Received-Date: Mon, 10 Apr 2017 10:23:05 -0000


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 08, 2017 at 11:09:47AM +0530, Ishani Chugh wrote:
> Signed-off-by: Ishani Chugh <chugh.ishani@research.iiit.ac.in>
> ---
>  target/arm/kvm64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for the patch!

I have CCed Peter Maydell who maintains this source file.  I also added
the trivial patches mailing list - a patch queue for small patches.

Conventially QEMU commit messages are written like this:

  target-arm: remove trailing newline from error_report()

The "target-arm:" prefix names the subsystem that is affected.  It makes
it easier for maintainer or people searching through patches to find
relevant results.

The commit message is written in the present imperative - "remove X"
instead of "removed X".

You do not need to resend the patch.  The maintainer can fix up the
commit message if they like.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJY61z+AAoJEJykq7OBq3PIMycH/0W7MSXkoBWJeDMP5S1PU6Yz
cPU+eMtUdfaTCbyVSa7A0jePO12x5q1htYZYE0DzxnfQQrKcD90WWuvQFLbP9tc2
/ja1O8h3WPUbLdq6gxCwMy6Uu7qTQ2B9IsSNZkAJQvFdgXyFMd8W8Q+y5oEJBpd8
WKSJfOKtuTR4uwC9OOUyux+O1J7VcJ38ycEwjgtosdMwhH8CEPvKiyF2m6wPIDCs
eXO11YLaV7RPPhCssBQDY954eyBBjPhyj1mL1P5+fYtG6BiU/4ULPrj/WFGXvLyS
KqwnC4XAxkrxhmeLJNT28tzgMk3LkYO2pyYJS/uK1hZOcs5lzWF1UjJYKAVn9U4=
=BhTu
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

