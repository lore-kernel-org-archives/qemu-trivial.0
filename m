Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cEM0G-0001Dx-Vq
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2016 15:06:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cEM0F-0001CJ-1M
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2016 15:06:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cEM0D-000645-SR
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2016 15:06:14 -0500
Received: from mail-wj0-f195.google.com ([209.85.210.195]:35182)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cEM09-00062S-9F; Tue, 06 Dec 2016 15:06:09 -0500
Received: by mail-wj0-f195.google.com with SMTP id he10so31699560wjc.2;
	Tue, 06 Dec 2016 12:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LVHp+MPBCwsPMZfYPRcCeLCgXozfCRrRs+UnNjq/LPQ=;
	b=ujSGU3KiK0H+vKY7Xox7YSS5TenOxx1NdUzGxzhSFmW1+0fzY7f1lcAlnjqABg+/M2
	s8iro7SkM0SlDynBLoYMK4YQT3GelFjk9f7DdXXAXkYnbz4NbcjQwWoPrdE4/GD4bIq5
	tFgcnEcbJCK1tLpGGWD6MmJTnh/40/fqfnKVTSPr5JYf0LkBW3VFDBZtIZuaWa10jPoh
	SlDkBb2nxap+O82K2qAWPj3gSbrvBj0QvzkunAKgpUxOfq3ZAIzv7hKa5+RvjNropy0P
	kYKsxhb07t+S2JxSaXWBqNb5uwFiNRY4kwCc/MWjtxY/V0qTUNLlitW0SonhpLgt81Us
	8RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LVHp+MPBCwsPMZfYPRcCeLCgXozfCRrRs+UnNjq/LPQ=;
	b=GlOl4XEMHjuRL9r5KwFqUzAr3d8gNxRWf1KFz1801N0tOEuOXKiPk8Y0BjLe9W7aMg
	vqGHNVywQgbcFkAuYrdFHf0TalfRwalPvwMrM+ctLTG2Fc0MnaMWzW/kUrgGnJwRaSvM
	DgB1XvK8ayZDqUFYyXp6ZSmGfS29bnv/VsrKalvEDkJHKU1y2BBxroYumoRAauNpqjQC
	KPhiPoDGS+wWTO2N6V3M6XlpiPFY2rDjhDo68dJuGkOrOo21JgctVRFiShgA4cd6y0K2
	puacn/uKqvUmtZQclJRUF93URJ60DLTzWlqpoQpkcDZ/nNiry92O+Cten6nGRzbg33bY
	lcvQ==
X-Gm-Message-State: AKaTC02DdPchRQ2MTznMtFoi6m4btj2QEBN8QmrlZVN/1uSPiNJJkD61lLWYNtbKo/CPrA==
X-Received: by 10.194.171.66 with SMTP id as2mr67033676wjc.77.1481054708165;
	Tue, 06 Dec 2016 12:05:08 -0800 (PST)
Received: from localhost (host86-185-39-193.range86-185.btcentralplus.com.
	[86.185.39.193])
	by smtp.gmail.com with ESMTPSA id l67sm5721679wmf.0.2016.12.06.12.05.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Dec 2016 12:05:07 -0800 (PST)
Date: Tue, 6 Dec 2016 20:05:05 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Cc: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20161206200505.GA2521@stefanha-x1.localdomain>
References: <1478494765-13233-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <1478494765-13233-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore: Ignore
 test-char
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
X-List-Received-Date: Tue, 06 Dec 2016 20:06:16 -0000


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2016 at 12:59:25PM +0800, Changlong Xie wrote:
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to my staging tree:
https://github.com/stefanha/qemu/commits/staging

Stefan

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYRxnxAAoJEJykq7OBq3PIyBEH/R+gpqH0jDddj9K+LdnlQCkD
9HZF/L3shwF7YvaBQidDai7Qa8Z/XEyK9rMGVz0aBfqjgsoOLRRcP/A7ZhxCSqEC
NlFM801xQb5+q3TuXomIbNbhj+/z4OsXOGy8dZgSfSWzEQgP39/brrjYDYA2bueD
7bOAofABdTc+Sf81ho+LLtNmtJdVkRG01+ZlJDDRYipujEmcpzPzn68rtoBD9jMO
8jPbhKXGKXFnmmnPU4fOwgaiRjzNyIbKFhgNzzqBBKEeo3iO4eSSgwpNrO+FPa0G
V5X4FtYe37Nv4iAJfvUIPctY5FIotzKCKvBaJZiVEqIuo9AwRNcHK2bsXNQ4I4A=
=Xkrw
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

