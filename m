Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHrDN-0008LR-MI
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 05:20:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XHrDI-0008FN-NE
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 05:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1XHrDE-00039V-8J
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 05:20:52 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:38804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1XHrD3-0002uM-VH; Thu, 14 Aug 2014 05:20:38 -0400
Received: by mail-wi0-f176.google.com with SMTP id bs8so8613439wib.3
	for <multiple recipients>; Thu, 14 Aug 2014 02:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Oj7XPSiMs1EJMFpm63NqWwV0KsEA3uo/Rt1eCmXzhJk=;
	b=WRzQitTSqijGPCSpuIHDQXjz2R+5f5GUjwcFpuYCZShSCk+lKxkgQz92tIw1UAUrcr
	6zhOXQMyXNAtU9CxDKjSQ89f126KR4seMXw/KEHrECOn+fJX5P36BCfgskGLmywsMFn7
	ARyrM8eDnuVg906KXPM0wbKRVjZLY7VskS3LIDhkvc5McTbPVVnho5p5AZxHXW1fQhbR
	s8EY5fUtLQyMKvkaknmy39h/jhinwKwnk+M8xlsRKSQXTSLnCR8lKYogPJYOKpgDgntw
	UEpaTL+ifT/2J8PJBFK7qrF8CDK8KTsNt6kc3h4f7peCGnWYlQDzvxjBo+Lir4b4sGKB
	t4yA==
X-Received: by 10.180.92.104 with SMTP id cl8mr43891934wib.43.1408008036211;
	Thu, 14 Aug 2014 02:20:36 -0700 (PDT)
Received: from localhost ([84.93.52.21]) by mx.google.com with ESMTPSA id
	xn12sm77532371wib.13.2014.08.14.02.20.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 02:20:35 -0700 (PDT)
Date: Thu, 14 Aug 2014 10:20:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140814092033.GC9874@stefanha-thinkpad.redhat.com>
References: <1407914611-10516-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline
In-Reply-To: <1407914611-10516-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] ide: only constrain read/write
 requests to drive size, not other types
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
X-List-Received-Date: Thu, 14 Aug 2014 09:20:57 -0000


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2014 at 11:23:31AM +0400, Michael Tokarev wrote:
> Commit 58ac321135a introduced a check to ide dma processing which
> constrains all requests to drive size.  However, apparently, some
> valid requests (like TRIM) does not fit in this constraint, and
> fails in 2.1.  So check the range only for reads and writes.
>=20
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJT7H9hAAoJEJykq7OBq3PIPaoH/0ulBUaDKC2r7kYhrpj+85FU
fkpAJ/uAcPyeviK/cuofvjxj/ivMMuG7fg84Lm/h9CnJ9BAKG5DC7vkp1J1G/lIH
IRpNPs56ytu7zd6l84UoPr5Za+Juj6bjls9yPeo1fJAr7likdINByewAqSP5dIOx
4AC2/VtUhYzhMDiL51nZPoui5ChfV5GH3AZSwMjxZfgT82gBBBpfey2vS8xA4BfB
4I+pplb6iPETT5+gryArc5aM+58vJYnanw/PRiPTI9Jm+sWj17LSJTz4cPY4sA4F
8pSy9OApgX8aYgMFC/6UTewpxTcBoK8cbHKM9sHO5nuibv5goHSCNdI2v2byuUc=
=MRES
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--

