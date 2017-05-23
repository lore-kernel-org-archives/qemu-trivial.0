Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDADt-0002hp-Qe
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 09:51:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dDADs-0002gT-2r
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 09:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dDADr-0005SL-BV
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 09:51:40 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34537)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dDADm-0005RD-56; Tue, 23 May 2017 09:51:34 -0400
Received: by mail-wm0-x242.google.com with SMTP id d127so39542274wmf.1;
	Tue, 23 May 2017 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LM5+0Z80OFuLxHvWAN/gUGxNueYKTG5cabV51Vg+iM0=;
	b=sOCD6S0xT5+/qJTfxCuG3Qqbu7iJvobfthkELFlXtDncS4VwaB2A7w9S5T5c16W9Th
	ju1KFZ9IvmUvHPrNTdSFVJrq0IvQ38egq1DrgDPmE8UD1LDvOljOGzpB2LSzMaLlzbYT
	DSNtf+cXfpZa9marBXbjrG4J4k9W3Ajtqj67CXJ4T9jCQ8zpYGG4REFbXOurwvpEmx9J
	dPHfvPwrkAN70quoQS2JhoayX/HgkrM6bitGKZyonHlkmQ5OCQAvHGsyW2WdUSMiZ9AC
	pEcdJqPkwRXZyZp0ckg7EDHEbQXPyjVGYif7YXISbNn/GD+PQzozy/KnEQdSe2BYz0kD
	FwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LM5+0Z80OFuLxHvWAN/gUGxNueYKTG5cabV51Vg+iM0=;
	b=muRx8n6g3As4xtuYg0b1GGB1N+LlPurcUu18JrEnLgxSR1umS9hyQ8bAg01HFMR561
	HvBb1TG8FACaysSyv28AnH1lynPmz2hAhVlbqCILn4Q3erE5/0GZl0aWfjRZ7mQ5BMzF
	PAuCzAeBU9HgC0TOZayBHuW5qEigBOuuLEQvplGQJ4PvLZ4NjfTA9Q5Vm5C1frn3dAoR
	ihxR1lzqXDMeq+Uswo1n84YsCM0PYoDNifaS36Nraw+4CWO4+ORAvpl9fVZbq9znUFNj
	h5v7Dd0Uslnup5GNT+J+ZPgyaFITLYpkdr0L+0AILHPJjKXiG4xLrrHQDfch/ycR29gE
	1Kww==
X-Gm-Message-State: AODbwcCIxGBdwJjh7I7kKBtZtBuTgwONlzIm1y1crEmx/cOkuKrOBc9J
	x2p5LaeVfEJs7w==
X-Received: by 10.28.134.3 with SMTP id i3mr2354978wmd.68.1495547493032;
	Tue, 23 May 2017 06:51:33 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	p107sm1118934wrb.64.2017.05.23.06.51.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 May 2017 06:51:32 -0700 (PDT)
Date: Tue, 23 May 2017 14:51:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20170523135131.GF17369@stefanha-x1.localdomain>
References: <1495486409-5197-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline
In-Reply-To: <1495486409-5197-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Move the qemu-ga
 description into a separate chapter
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
X-List-Received-Date: Tue, 23 May 2017 13:51:41 -0000


--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2017 at 10:53:29PM +0200, Thomas Huth wrote:
> The qemu-ga description is currently a subsection of the Disk Images
> chapter - which does not make much sense since the qemu-ga is not
> directly related to disk images. So let's move this information
> into a separate chapter instead.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-doc.texi | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZJD5jAAoJEJykq7OBq3PINS8H/3TggK6bObX9nMJsj/+EaekT
D0h+zHPxgutxyqetAB0SS7t1XAkrf8E1NWqq1AgKF8C8AuUDP39zKKtik64VOTMM
poKBoYpJGJBiLYsLnZfRjEIP/ou8rDL/IJm9kC+aihhN5TDD+rO1+0jBigHeJphl
r720LyUbre6fCnBozLz9QpvzvikC7b3cX3tzZi9Lb5u5pQCdT5eOb2aJLLvIkqSf
m4C44uhXuQutIiTY2RMFhxOQk6ecO4gg8hp6waM65r6EjOQZyxr36nJpXWdYgWAe
BXvdeVEx4WSs5MUwPsmiWOcjCnzQqCpaHUlhXxla5wZyRRqE7irpYeemx2oQniI=
=q0PA
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--

