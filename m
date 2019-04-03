Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBear-0006gp-Gy
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2019 08:02:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hBeai-0006cF-JJ
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 08:02:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hBeaa-00013s-00
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 08:02:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1hBeaW-0000VK-HB; Wed, 03 Apr 2019 08:01:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id y7so20923798wrn.11;
	Wed, 03 Apr 2019 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QnrZkudwOW2IVpWcMPnPce4ucDXaQcojfcvcK7TF4Og=;
	b=aEq0R356+o5e55Cqfk8SGOXaBOIVuUrHrvNAFUmXWHcm5T/D+rMXGw8fvHN8eFIMZF
	kSERqHmVuRplBnS5sa5Ua2OOMgqRv36mbJog243oeTRGhwVSvcYRnIAJdOXEsV+WXt5/
	FPaTYbLPDXWOmywSG+AT33bPCP6b6OY8RBf/9wfQvh0cU+aw6J1tabqkTH+sj4Yp2RY9
	zeeKEQuZHDdwqHNvPgBcTn78goDExYCCNi46+8JEA/tagcA8dJplkTdOzX+8MMk3mKOA
	zoq7VpGWmIP65E+pq4HORf6mSVq0/mh+0QhJRWN3VM79bg8oJkykt9jLsEVU1Ewq2Lsa
	KxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QnrZkudwOW2IVpWcMPnPce4ucDXaQcojfcvcK7TF4Og=;
	b=cVQ7dDnxAaybTBng+OAAuw/sGEqcgGlbDKD80Bl031dGW58YDd9y+bprS2W3TcLcnL
	1Zq/pZGARW/ytQ/VtOVGUc4Q8Ge+IHjp+sG+zozvha2Zl7JqMo84wi3hw2B4+n5zFlTq
	s+bgP8p1ZAmqXfULITm5AtXUiRwglMnjRGpp71AynvtARw6RSWey/e+55LI/d0XUtoeH
	kkibpyiB9udSHBeDFjCG2ImCJbHQwrIHWcseXDVQaoGVC/0gCnamdMLqyzwCIyHnGjCH
	CQjSTR0zMKb6GjUz6wEn2r1qlwA02g8vHX9g8QmAkLAa0+31fVexMjsvhSQ9fNQEwpzM
	fgIw==
X-Gm-Message-State: APjAAAVX6zDYpa9L+t/yPbnzuHEVInh1jYN8MrVWjE4RFkEgTrddvw4H
	xRfrxyuwwQ9gA1afZAD3w7U=
X-Google-Smtp-Source: APXvYqxWCG6wX+I3k6KqqQhz6x5A0cAAkOSkY9ZOVUvRa3l5USgyq+JhbqmeTNY8GURODZz08NmcnA==
X-Received: by 2002:adf:e94d:: with SMTP id m13mr25933928wrn.141.1554292904966;
	Wed, 03 Apr 2019 05:01:44 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	w16sm20162940wrt.84.2019.04.03.05.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 05:01:44 -0700 (PDT)
Date: Wed, 3 Apr 2019 13:01:43 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jules Irenge <jbi.octave@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190403120143.GA32425@stefanha-x1.localdomain>
References: <20190330112142.14082-1-jbi.octave@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20190330112142.14082-1-jbi.octave@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util/readline: Add braces
 to fix checkpatch errors
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
X-List-Received-Date: Wed, 03 Apr 2019 12:02:09 -0000


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 30, 2019 at 11:21:42AM +0000, Jules Irenge wrote:
> Add braces to fix errors issued by checkpatch.pl tool
> "ERROR: braces {} are necessary for all arms of this statement"
> Within "util/readline.c" file
> ---
>  util/readline.c | 50 ++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 17 deletions(-)

This file is unmaintained, I'll take this patch through my tree.

Thanks, applied to my block-next tree:
https://github.com/stefanha/qemu/commits/block-next

Stefan

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcpKCnAAoJEJykq7OBq3PIpRoH/2/nrzeVuPzcFDyYiYlPG00F
Y/veZ3CJb7az8QK0f5q4eqsLpXDR1UsBR2HHvOB09TwbMh/3ZkD62zZrU0bQnMJZ
mH/mzQE4zowTZuYRR4v96ALRoOyD8fYihG06FNN+wBZ1sJgg2fWIyVuIrUwxw8zZ
p7dwu0b/yfv1HkqnY34Ssrm4imlpgQdKHQnO9tt1p+7X1k4Umts18QVBWKPd3S9q
RaNy2BXVkPS9BXPNCOKh3c163zx74vnSKftbiZwdY3UcyGjsRlGf2Xc3jUbXEb4w
DoPDz04SyLorwsM5fSBGveqGrfxcXdHgHRF57tc8EWJo2ueuIJOvo8cELZrNztg=
=zwh/
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

