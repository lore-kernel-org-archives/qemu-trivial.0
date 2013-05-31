Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiOyH-0008HA-WB
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 09:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas@schwinge.name>) id 1UiOyC-0008GW-4q
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 09:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas@schwinge.name>) id 1UiOy3-00025r-GS
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 09:02:12 -0400
Received: from smtprelay02.ispgateway.de ([80.67.31.25]:47310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas@schwinge.name>) id 1UiOy3-00025d-6T
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 09:02:03 -0400
Received: from [217.84.5.141] (helo=stokes.schwinge.homeip.net)
	by smtprelay02.ispgateway.de with esmtpa (Exim 4.68)
	(envelope-from <thomas@schwinge.name>) id 1UiOy1-0001gv-6v
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 15:02:01 +0200
Received: (qmail 3148 invoked from network); 31 May 2013 13:01:31 -0000
Received: from feldtkeller.schwinge.homeip.net (192.168.111.172)
	by stokes.schwinge.homeip.net with QMQP; 31 May 2013 13:01:31 -0000
Received: (nullmailer pid 22943 invoked by uid 1000);
	Fri, 31 May 2013 13:01:20 -0000
From: Thomas Schwinge <thomas@codesourcery.com>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	pbonzini@redhat.com
In-Reply-To: <CAFEAcA9LomV1rkJPPctUgxG0aJzCHiGr6VYSsSmaGytvQv9hUQ@mail.gmail.com>
References: <1369993154-17690-1-git-send-email-thomas@codesourcery.com>
	<51A89273.8010400@msgid.tls.msk.ru>
	<CAFEAcA9LomV1rkJPPctUgxG0aJzCHiGr6VYSsSmaGytvQv9hUQ@mail.gmail.com>
User-Agent: Notmuch/0.9-101-g81dad07 (http://notmuchmail.org) Emacs/23.4.1
	(x86_64-pc-linux-gnu)
Date: Fri, 31 May 2013 15:01:10 +0200
Message-ID: <87ppw7fgmh.fsf@schwinge.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
X-Df-Sender: dGhvbWFzQHNjaHdpbmdlLm5hbWU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 80.67.31.25
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fpu: Simplify
	floatx80ToCommonNaN function.
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
X-List-Received-Date: Fri, 31 May 2013 13:02:17 -0000

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, 31 May 2013 13:34:12 +0100, Peter Maydell <peter.maydell@linaro.org=
> wrote:
> On 31 May 2013 13:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> > Hmm. And where's the simplification?  Here's context diff for the same:
> >
> > *** fpu/softfloat-specialize.h.orig     2013-05-31 16:02:51.614710351 +=
0400
> > --- fpu/softfloat-specialize.h  2013-05-31 16:02:59.838820308 +0400
> > ***************
> > *** 936,946 ****
> >       if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_inv=
alid STATUS_VAR);
> > !     if ( a.low >> 63 ) {
> > !         z.sign =3D a.high >> 15;
> > !         z.low =3D 0;
> > !         z.high =3D a.low << 1;
> > !     } else {
> > !         z.sign =3D floatx80_default_nan_high >> 15;
> > !         z.low =3D 0;
> > !         z.high =3D floatx80_default_nan_low << 1;
> >       }
> >       return z;
> > --- 936,945 ----
> >       if ( floatx80_is_signaling_nan( a ) ) float_raise( float_flag_inv=
alid STATUS_VAR);
> > !     /* Replace a Pseudo NaN with a default NaN.  */
> > !     if (!(a.low >> 63)) {
> > !         a.low =3D floatx80_default_nan_low;
> > !         a.high =3D floatx80_default_nan_high;
> >       }
> > +     z.sign =3D a.high >> 15;
> > +     z.low =3D 0;
> > +     z.high =3D a.low << 1;
> >       return z;
> >
> >
> > Yes, your version is 3 lines shorter, because it
> > does not have extra else{} (2 lines) and the
> > remaining if() construct is one line shorter too,
> > due to moving z.low=3D0 construct into common place.
> >
> > But I don't think your version is more readable, --
> > before it was easy to understand what is going on,
> > we had two easy case with all right stuff done for
> > each case.  Now we do some preparation before, so
> > the common case works.
>=20
> I think you could make a reasonable argument for this
> change being an improvement, because it makes it clear
> what we're doing: if what we have is an x86 pseudo-NaN,
> we replace it with the 80-bit default NaN, and then
> proceed to do 80-bit-to-canonical conversion in the
> usual way. The comment also explains why this if()
> exists for the 80 bit case when it doesn't for the
> equivalent 32 bit and 64 bit functions. As a code
> change I actually quite like it.

Yes, this exactly is my reasoning: first, convert a x86 Pseudo NaN into a
generic NaN, then do the floating-point type conversion itself).  I
thought this would be obvious (and hence the patch trivial) -- hey, I
even added a comment! -- but apparently what is obvious/trivial to one
isn't to the other.  :-)


> That said, I think any new patches to fpu/ need to
> come with an explicit statement that they can be
> licensed under the softfloat-2a license or GPLv2
> or BSD (etc etc) so they aren't an obstacle to
> the softfloat-2a-to-2b conversion that is in the works.
> [cc'd Anthony so he can correct me if I'm wrong.]

I hereby place this one contribution (which I think wouldn't constitute a
copyrightable change anyway) into the Public Domain, allowing any kind of
usage.


Gr=C3=BC=C3=9Fe,
 Thomas

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJRqJ8XAAoJENuKOtuXzphJcrIH/iJYe6JkzkGG96BG1IrsdM5Y
QaBVDYWmdSIDHC2MuLLcB2KKcyRCCwOcLHZymPxlAfyDYLMjFoQfcfwUxPAPWuqD
KA/W/1Uo7kDpJc2AS123tHptkdUeLsCk20bu6MiiQSzDfGzXS5kNdXpGdDs/LcMs
8dgVM8K2WGa4GiGFbOnvb+1dudWQ9zVoH3SI4jXcwga0/NBdY8P2A/xZRfyLpddh
x8ursDOB5/i1gsxIiAXI+MRZXjCJn+Ciyrz9zmiBPn7YQQm36usbdsxNCaBW3OUk
3McbUpILpNfHNyc+TQT0ydsqYk+X2fSNGj99U6bBofHAm317TjY2j1k19dcdnVg=
=3GrY
-----END PGP SIGNATURE-----
--=-=-=--

