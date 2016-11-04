Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c2eRj-0002bo-0h
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2016 09:22:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c2eRg-0002Zo-MQ
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2016 09:22:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c2eRf-0004RW-Si
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2016 09:22:12 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35919)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1c2eRZ-0004IA-77; Fri, 04 Nov 2016 09:22:05 -0400
Received: by mail-wm0-x244.google.com with SMTP id c17so3892685wmc.3;
	Fri, 04 Nov 2016 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xO7rgxcIexGXIqRwXVsXtp+i21gSm6uAUDJn9KdV6jw=;
	b=CrRwp3QXp/jWhiOuLdj5aE70ezyHqz52tSiiOUAqsE64rRXo80wE6fQMedbZ7YBDnc
	CAkkbNsMeYdJRDyx3QVGcMJDx0u72cTmnWOXYO9HLtorFv5ebP2RJuQxCMhtqyE/KuMO
	fG7V/IBChS2IPD2MtKSJ2J5B45k8nKg10no/F9AiyZErPs48m9bm0fEQfKId/Xqlw2X+
	58SLKQhBBG8Er0qABvACoSRZaZC7pM8tkmiEqW49qwvvRzCjdmKI7ZrJmlgCA63ZqBKP
	HJze1mAcyDoE9jTVg9z32Kc04chLn7Avmkb7P2ttx20zywzBb9FVJ0peG1IR+ebMBuTV
	/ndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xO7rgxcIexGXIqRwXVsXtp+i21gSm6uAUDJn9KdV6jw=;
	b=Idr/zllPiFAaReXqertNh+ibc3OxKdudouM9mvSoeeduB0GFGdki27i8oTNEmDij8l
	yynf0k6oOt0c707XAFXEMNxgBtYNzORE9eLaL44VcIwCoapw6HYtFwD/w78bZcAh5OJO
	3FM2ErYEpyMemi9eJuC+b80bmjgQsb6645kA9NW/W5YsVhSj3JktKtcwOay7JApZ1X46
	mPJ/PHwZRioogVftCBKFK6e1ediz9h0F3fHsBnuYr9h2NMw4zSiSI5KiNcVe8kbLIHr9
	l6Gsa3l14c/F4kAKKZ6c96XtYVQBeTqg9Yyd3SnNyXWR+T+6FFUbTKw4Jpe0dyWZ5S0w
	krdQ==
X-Gm-Message-State: ABUngvf2du4fd1ICXSz0ABRLq+J6BkMhb+8KwseXAzFvm40tDeGWYRvyCguxsP8n6kRxog==
X-Received: by 10.28.168.137 with SMTP id r131mr3590563wme.16.1478265276151;
	Fri, 04 Nov 2016 06:14:36 -0700 (PDT)
Received: from localhost (host86-163-92-203.range86-163.btcentralplus.com.
	[86.163.92.203]) by smtp.gmail.com with ESMTPSA id
	125sm4545762wmh.14.2016.11.04.06.14.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Nov 2016 06:14:35 -0700 (PDT)
Date: Fri, 4 Nov 2016 13:14:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, patches@linaro.org
Message-ID: <20161104131434.GB7120@stefanha-x1.localdomain>
References: <1477933290-32248-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <1477933290-32248-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] README: Add linux to macOS
 build info
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
X-List-Received-Date: Fri, 04 Nov 2016 13:22:13 -0000


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 05:01:30PM +0000, Peter Maydell wrote:
> The README lists the URLs for the wiki pages describing
> how to build on Linux and Windows; add the equivalent
> link for building on macOS.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  README | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYHIm6AAoJEJykq7OBq3PI0BAIAKnaYs6Kd3OSHrLD7Di1UoqK
vCNdZ9Du6ozK5bhKWoiPXh/22k3STP7L2I92G3OdnUpdXp7ppbkFY2npgZiXlqvP
5lx3AsZ5eYmuiBIqWzMYE9/X+djFKSBYMMCgZgO9emiRKBJ+VUG2NIzp+ENovlxt
RYmyXIzy/h38jbL4frwMR7eZd0cwf2y49IY0oGITj68MiyeYPdncsqtHn93hPR+I
zwFGFDo7gPU5s9x4u9gjt4kk3qD0rhYvqvGkcL9Z9nCFGy/Z4tP+/bmvAe5ScxUk
myWlAsg5OdXnp+ZQNMgbfXUHKd2asRuHOSQZDGiVrbgGZSePPmV0ME4uiC1hgUI=
=W1vn
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--

