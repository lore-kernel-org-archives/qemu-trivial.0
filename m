Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzlGf-0000eH-HX
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2019 11:44:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gzlGd-0000cu-L4
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 11:44:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gzlGb-0005Uw-HN
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 11:44:11 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42604)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gzlGZ-0005TP-OV; Fri, 01 Mar 2019 11:44:07 -0500
Received: by mail-wr1-x443.google.com with SMTP id r5so26557667wrg.9;
	Fri, 01 Mar 2019 08:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7uuja/D0mjdrKq8yMxC6qIsAfnDeG1BOm/7NIJsTW+Y=;
	b=PRyTPF1gF7Y5Nzo2YCOMiiZAK8zIfq2E9LTIxKzPw5OHW0ku/4oPp2eYLfQOjQ1Wzh
	Dy0xY5ruxEaGR01J4va1lph9VcnFBwLFtBSE17WbiQr4FaWPnq6K4I3kq/EshIvvDwLM
	/1Xbz5jvQjxJ2DGqzo0gPVyUXVIDnkbz1zGlLo9kg7BULTWQqiLfO2TryPfMILO9QDbS
	GC5ncee389StHsbChZHitc5FmauBLeo7XjNcY1rpuuU1SsD9Nw+suSD6OF97bjUVSt4A
	C3uMIqktKaglxuPpFFzpssuN7T1hR5XgqMAdL5sEULuDYOFAwr/h2JHp69TBBbtqVkcI
	serA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7uuja/D0mjdrKq8yMxC6qIsAfnDeG1BOm/7NIJsTW+Y=;
	b=EYEv4qg1W816ofVX0N7oCrhDQos1YbKa6duTN+FMJke9YD6x+xtd49KWZ2ToegJBQ8
	cS/2pNYnI1puZhq/Ao3jQweDxVy+oZQJ53p8opZ9IPHUduhkfirijhwq1Iw5Pwe3QQpM
	rXofBWmOf5rTdQHj2p8qoAAgklpN9rLc/HpjQiQzQAOc1EbX/dPApjXileD0T+paP0o7
	ZmIru/Lx+4fbc55f1DC97gUeMT/MylERD7xdn57tovwPaO1+tamN9ZLIOWAmVWSwmIjR
	RuyL8MLACzUSEWzBjWI30xQsRX9IAlONKQKmtvTkTTpX5XVVXh3x9jKcaKWOLvPb4AJ1
	7dXw==
X-Gm-Message-State: APjAAAWAPA3dTw3nKgLPQJgMclqrInHyNXpOq5ZkUU+xKaU8QBCpdd29
	Mos9UwSPPKrZMC0V/n0jRHo=
X-Google-Smtp-Source: APXvYqxLLKrLy/XpkL4D3Kn03+UCZ5GAKfVgL38EKMeEhwkbB1DnA//Zl8X0rdNeSWFgmgw7uV1t6Q==
X-Received: by 2002:adf:e487:: with SMTP id i7mr3973625wrm.202.1551458646509; 
	Fri, 01 Mar 2019 08:44:06 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	d21sm62810586wrc.44.2019.03.01.08.44.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 08:44:05 -0800 (PST)
Date: Fri, 1 Mar 2019 16:44:05 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Julia Suvorova <jusual@mail.ru>, eblake@redhat.com
Message-ID: <20190301164405.GD18260@stefanha-x1.localdomain>
References: <63559cf027d4ebd95a844b73b1f20444fb72fb2c.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline
In-Reply-To: <63559cf027d4ebd95a844b73b1f20444fb72fb2c.camel@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-trivial] [PATCH v3] trivial fix of malloc to g_new in
 thunk
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
X-List-Received-Date: Fri, 01 Mar 2019 16:44:12 -0000


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 10:16:57PM +0530, Aarushi Mehta wrote:
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
> Note that since thunking occurs throughout the lifetime of the QEMU
> instance, there is no matching 'free' to correct.
>=20
> ---

Hi Aarushi,
The following formatting is commonly used:

  Subject: [PATCH v3] thunk: fix of malloc to g_new

  Note that since thunking occurs throughout the lifetime of the QEMU
  instance, there is no matching 'free' to correct.

  Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
  Reviewed-by: Eric Blake <eblake@redhat.com>

I changed the subject to include the prefix of the component being
modified.  You can look up the preferred prefix using "git log thunk.c"
to see what other commits have used.

The Signed-off-by: goes at the bottom of the commit description.

Don't worry if it takes a few tries to get the formatting conventions.
There is scripts/checkpatch.pl for scanning patches for coding style
violations but I think it wouldn't have detected these things.

The code change itself looks good:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJceWFVAAoJEJykq7OBq3PIXL0IAKzztJnOQH0wMHMkHZmbGxyJ
TCYFOyxYS5w0fSTv9m14e2n4CsRwvh5XAsUGqtP638FnNcWuwv+gh9FF64NS0G7v
mOzqvCzOULi5NIHmejF4x8Zt7VOMmaB5m5a4Ujaxb6VUzdiFcHiAfqZoIHx3/2U7
9g6nZdnKA31PlCMXxTUSydAJP56OuQC6IW8bGLCMEBSchaTV3pz9UFWZAI4J0vRK
/AljZkBn5zAa5AuB/z5fGSOf2o4+7LUYtVWrP1mongeXvsnP6oKBgtmd+OGnlQiU
J1iYuftoz6FzFAVVNz0GFwVV8qt55ZbPuhOjgW/zhWL3yuLk/PxF6N/S9cQQD6E=
=7B5C
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--

