Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVgLA-00021K-83
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 09:06:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YVgL7-0001xP-D6
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 09:06:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YVgL6-0001b0-23
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 09:06:21 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:35848)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1YVgL1-0001RI-Ia; Wed, 11 Mar 2015 09:06:15 -0400
Received: by wiwh11 with SMTP id h11so28469621wiw.1;
	Wed, 11 Mar 2015 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4uhx3GOTlOPCn7nfKjdOv42L23BDkq1lROEooZ5e+SA=;
	b=MDvk5pzWoriOgBkTu1/E8ruzuT0NtEzvjH1QsV9p5pQdg6tpVDjPW7q5Q54oxlzH5z
	h4to7iOXvEsFpf09x1P1gShTiQSmVAr+3VHBUoGO+JrF/nbQQVI/B4oiuAMZM8tHmO+J
	iqzdsbJ+9eGt8O+pHvwuJzU15Apnihx5YREfnEo6xunG+f4//EvvTSEcc/hxHBrT4auU
	YFvyxbxeN7dE9LSsTNdiWH9d3CHHI8qBr32/MvO6BHv22+mbvhTzCSfwvABs/5EQCEf/
	X5pKBU98jujybIE0i4tC4nJl9EkPVkbCtwEMCONyNBHvJzx9t1662nEpUbZzyKFU7ijd
	l0yw==
X-Received: by 10.180.206.143 with SMTP id lo15mr95542300wic.22.1426079174948; 
	Wed, 11 Mar 2015 06:06:14 -0700 (PDT)
Received: from localhost (host81-156-165-240.range81-156.btcentralplus.com.
	[81.156.165.240])
	by mx.google.com with ESMTPSA id k1sm5401919wjn.9.2015.03.11.06.06.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 06:06:13 -0700 (PDT)
Date: Wed, 11 Mar 2015 13:06:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150311130612.GB10493@stefanha-thinkpad.redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150310085016.GC3770@noname.str.redhat.com>
	<20150310091759.GC14320@ad.nay.redhat.com>
	<20150310100936.GD3770@noname.str.redhat.com>
	<CAJSP0QWk+KzGuR2e6m8KsCUbMqcU6cReQbp2231zf9+Nt8zF9g@mail.gmail.com>
	<54FEF942.5010602@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <54FEF942.5010602@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Peter Wu <peter@lekensteyn.nl>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] block/dmg: make it modular
 if using additional library
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
X-List-Received-Date: Wed, 11 Mar 2015 13:06:22 -0000


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 05:01:38PM +0300, Michael Tokarev wrote:
> 10.03.2015 16:58, Stefan Hajnoczi =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Mar 10, 2015 at 10:09 AM, Kevin Wolf <kwolf@redhat.com> wrote:
> >> Am 10.03.2015 um 10:17 hat Fam Zheng geschrieben:
> >>> On Tue, 03/10 09:50, Kevin Wolf wrote:
> >>>> Am 10.03.2015 um 08:06 hat Michael Tokarev geschrieben:
> >>>> Also, should we consider making some more rarely used image formats
> >>>> modules even if they don't pull in external dependencies?
> >>>
> >>> Sounds reasonable to me. Is the intention to reduce binary size?
> >>
> >> Yes, that and also that it allows compiling out some drivers without
> >> having to mess with the Makefiles. You just don't install all of them.
> >>
> >> Related to that, Peter also mentioned that you (the user, not developer
> >> or packager) could simply disable a single driver, for example as a
> >> temporary hotfix in the case of security problems in a block driver.
> >> That would actually be an argument for making _all_ drivers modules.
> >=20
> > I am for making all block drivers built as modules.
>=20
> That might be useful if module loading will be modified a bit,
> like by loadin modules on demand only.  Something like this,
> search a "foo" block driver in the registered list, found ->
> use it, if not, try to open block-foo.so (maybe after looking
> in the "available" internal list before that) and look up in
> the registered list again.
>=20
> That will make it more useful.

Even if all modules are automatically loaded, it gives packagers the
ability to ship individual packages for Ceph, GlusterFS, etc to reduce
library dependencies.

Dynamic loading has advantages but there is no reason to wait for it.

Stefan

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVAD3EAAoJEJykq7OBq3PIGp8H/1ZP9RThrBYn0EZq93UdKQ2/
+L/p33XAj3uyfEW55D22j78G1FRSZRTQTxBn6WQEmctE7MXFlicdn/XDlH1Bk49c
IWMPCKNarDAq2SHMxtUl1+HsvtvaIM45vGa6x00iqJbTrFh63uuFFCx4Rgos03wf
NR3hSxDIQbcUr61P3yqRUtRatO7PHywDge2guWk2x+X5vwY4SpsN2Xkn0qxKBCYi
LniGqhp75DcF+vjPrGyn12X/A+xUudmR4PDyRpidBbtQXOdZvcAXNi+sGuTR7zw5
lgRf4sc03Uhb3A7pEkFr0cOwmbdD4RME6EG2rrp710rAOwjJ6lvChEuQGtXWgSQ=
=k37z
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--

