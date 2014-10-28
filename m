Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xj9Cd-0002tR-58
	for mharc-qemu-trivial@gnu.org; Tue, 28 Oct 2014 12:00:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Xj9CW-0002k7-1A
	for qemu-trivial@nongnu.org; Tue, 28 Oct 2014 12:00:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Xj9CQ-0003Tu-Ce
	for qemu-trivial@nongnu.org; Tue, 28 Oct 2014 12:00:51 -0400
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232]:54237)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Xj9CQ-0003Tj-36; Tue, 28 Oct 2014 12:00:46 -0400
Received: by mail-lb0-f178.google.com with SMTP id f15so965625lbj.37
	for <multiple recipients>; Tue, 28 Oct 2014 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lcf6Puv8SjTBqfabRh284R9eyCAan1EMe/MZSsOK6XA=;
	b=kAk+d6ntiBfKHXodT1G+J1ccBTWgdoE8iOLDZKO9rDqk+fK6Z2zjKUeYgAhGMeZCG6
	sfl18hw6++iNfpM3UK0Qd3HAwdvK/uhQPVTPBikzkq9EHb97yBx+6O2gznEDT6O7LKWI
	5ZCVEWeeQtLmfPeKCLbMwdrVwI+L9tzosWWoLRlwDpkWaF/l9U5aQFkLxAEsOtNaIHaL
	qdSnXMjooIUlTa1q0tJZX4Ddkn7lz+QEA7lPJQojsERPH+dIjgvwwmUUbc2vhsE2RbhB
	vIKfVCAg3kcCbpNjv1+G4J3tx2u7E5EECcKtoC19qJP/RCzXYXDgx4ZSjiVHuP8C419H
	SoOw==
X-Received: by 10.112.38.67 with SMTP id e3mr5155066lbk.6.1414512044671;
	Tue, 28 Oct 2014 09:00:44 -0700 (PDT)
Received: from localhost (202.132.125.91.dyn.plus.net. [91.125.132.202])
	by mx.google.com with ESMTPSA id n10sm762374laf.38.2014.10.28.09.00.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Oct 2014 09:00:43 -0700 (PDT)
Date: Tue, 28 Oct 2014 16:00:41 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20141028160041.GA3969@stefanha-thinkpad.redhat.com>
References: <1413984320-28585-1-git-send-email-baloo@gandi.net>
	<5448A656.6030204@msgid.tls.msk.ru>
	<87egtzusaa.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <87egtzusaa.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::232
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Arthur Gautier <baloo@gandi.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vmdk: Fix cylinders number
 during convert
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
X-List-Received-Date: Tue, 28 Oct 2014 16:00:58 -0000


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2014 at 10:03:25AM +0200, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
>=20
> > On 10/22/2014 05:25 PM, Arthur Gautier wrote:
> >> We can not rely on int cast to get a correct number of cylinders. The
> >> cylinders information was wrong in 49.9999% of cases.
> >>=20
> >> This ensures the cylinders always gets the ceiling value.
> >
> > Good thing, especially the good probability :), and also a good patch
> > which comes with a test.
> >
> > But I wonder if anything can break this way?  Migration, windows guest
> > being unable to find its partitions, something else?
> >
> > And more.  What-if our drive size in cylinders will be larger than
> > the size in bytes?  The proposed div_round_up() will increase number
> > of cylinders, so size in CHS will be larger than size in bytes.  Maybe
> > there was a reason why originally the size in cylinders was calculated
> > by truncating extra fractional part?  What-if guest will try to access
> > the very last CHS which is incomplete?
>=20
> Too many questions for -trivial, copying VMDK maintainers.

Fam: What do you think about this change?

Stefan


--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUT72pAAoJEJykq7OBq3PIzMwH/04lCoPx5vP1HokDsqoqi2AL
xrsjjTNrzvzTMhuwp4DjOs8VymeqLZ6RPw/gcsXr1R5RijTi9/zi9xw2JduaY/Dj
l5mmrhwCpcM/fi6Ae5w5dufMHKrL5A7vCwukQo9DP/VT4+RCeHomEsMXCoQlgake
+N+iPC8LVvDwB2yoj/cxcKHOhmMuByMR+J1oVLrP5EX3h+haCiyKcceIEcyTUP20
SLHM3r/hY2k9AAvzgFgHV/pxTAVO2H7PKW7pnKV5cXJ9bm1NDveYp/F2r38ky4LI
+rCQXh/Hx7/FkpWD/y6q9bhtAt/Ha6y18LBT7e6WfFJS0WKT56rQXdV4rQufsjg=
=GMqT
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--

