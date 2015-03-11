Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVgWD-00011G-U2
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 09:17:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YVgWB-0000yo-K0
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 09:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YVgWA-0005IT-K8
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 09:17:47 -0400
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235]:35375)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1YVgW2-0005H7-Da; Wed, 11 Mar 2015 09:17:38 -0400
Received: by wesw55 with SMTP id w55so9158568wes.2;
	Wed, 11 Mar 2015 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xL2KXqZKES/eqq+sI2qSSylJbF/cucEmxozqp3C2WGs=;
	b=oAtF7ZM2Joq1LeW+kr38BEGQNs9lKowHIZHPzCD61DhyJv7dRNBY4mSzctHfxhkHz8
	TEIkqcIWPtP32BSrR4Yc7ohEGy1QlotG+6ObRkQJiHnHCZEIqdl2nbTtVAE0yFxAHQ/a
	ybKvOG9Hj1nekBqOv4fnl84oseCTAHQpOj60VnockOlJyA2vyBX6+AAi9q26Rz96G5fb
	vftEzi/k0hMA03CrXsgPeq0lqMkJBD5vri2coB52jcM13Gdti2IxfGso8tQAKI0s4DoO
	6eIW2a73y9T4vEkSMNWB8jxfkWOH3alRU88dewP8/us6acTKl8IL0gdb02E6uekrylmh
	IkZw==
X-Received: by 10.180.35.72 with SMTP id f8mr121956418wij.31.1426079857752;
	Wed, 11 Mar 2015 06:17:37 -0700 (PDT)
Received: from localhost (host81-156-165-240.range81-156.btcentralplus.com.
	[81.156.165.240])
	by mx.google.com with ESMTPSA id p1sm6077610wib.23.2015.03.11.06.17.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 06:17:36 -0700 (PDT)
Date: Wed, 11 Mar 2015 13:17:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150311131734.GC10493@stefanha-thinkpad.redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150310085016.GC3770@noname.str.redhat.com>
	<20150310091759.GC14320@ad.nay.redhat.com>
	<20150310100936.GD3770@noname.str.redhat.com>
	<CAJSP0QWk+KzGuR2e6m8KsCUbMqcU6cReQbp2231zf9+Nt8zF9g@mail.gmail.com>
	<54FEF942.5010602@msgid.tls.msk.ru>
	<20150310140751.GG3770@noname.str.redhat.com>
	<54FF01E8.6040207@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
In-Reply-To: <54FF01E8.6040207@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::235
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Peter Wu <peter@lekensteyn.nl>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block/dmg: make it modular if using
	additional library
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
X-List-Received-Date: Wed, 11 Mar 2015 13:17:48 -0000


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 05:38:32PM +0300, Michael Tokarev wrote:
> 10.03.2015 17:07, Kevin Wolf wrote:
> > Am 10.03.2015 um 15:01 hat Michael Tokarev geschrieben:
> []
> >> That might be useful if module loading will be modified a bit,
> >> like by loadin modules on demand only.  Something like this,
> >> search a "foo" block driver in the registered list, found ->
> >> use it, if not, try to open block-foo.so (maybe after looking
> >> in the "available" internal list before that) and look up in
> >> the registered list again.
> >>
> >> That will make it more useful.
> >=20
> > The problem with that would be that format probing wouldn't work any
> > more for drivers that aren't loaded yet.
>=20
> Probing needed -> run the current "load everything" sequence (maybe
> limiting stuff being loaded to "block" system when other systems
> will be there) before actual probing.  That should fix both worlds.
>=20
> Alternatively, and this might be even better alternative actually,
> the more I think about it, is to have a single probe function
> which recognizes all known formats, no matter if the particular
> driver is being built or not.  This routine will be significantly
> simpler thant the combined "probe" functionality, it might know
> much more formats even if a given format is not supported, etc,
> So that format probing will be its own code which will trigger
> (attempt) to load a detected driver.

Or something like /usr/share/magic or /lib/modules/$(uname
-r)/modules.alias could be used for probing.

For example:
be32 at 0 =3D=3D "QFI\xfb" load qcow2
le32 at 0 =3D=3D "QED\x00" load qed
contains "version=3D2\n" load vmdk
contains "version=3D1\n" load vmdk

QEMU's probe engine matches the rules and loads appropriate modules.

Your suggestions are better though because they are simpler and less
hassle.  In any case, we can solve the probing problem.

Stefan

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVAEBuAAoJEJykq7OBq3PIu50IAIlAz5+oElAuQXBNd7Exzu+O
KS++dI2kiibP5Gyf+lrrSHz80mMIsd5G3Ur/ikUywrVLwJ202k9/Nu1bHLGFWBcr
GSSlbZV/lVxhyvCpysZNfttjINxV73rtVxIjUalwoY43YhzlGmSt2woD8k8Yjeci
l67g047JBsrHf5t1OYwJfYJ7NygsKqCUPSFSlSVKftxKupik/2KzG1UHb5z/6/XY
Yc1MPdWLqzB8qYvDrSiJ09l3M6o0y8kSlbAvl3hxVtTx2iTC5SOC+lMgIOqaI6BY
paf5b9u57CFv1jxocsm8VzR3Rv1gRzMjQkZ+25YejInUSNItFr2h2nJUDZc+q4Y=
=N3er
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--

