Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UG1e3-0001IW-Bc
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2013 02:28:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UG1dv-00017H-UC
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 02:28:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UG1dt-0000Gf-0e
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 02:27:59 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:64074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1UG1dl-0000Em-Pq; Thu, 14 Mar 2013 02:27:50 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 7037B47B;
	Thu, 14 Mar 2013 14:27:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=ArwsniNzUKTekZNpPF2EZ0KoV3o=; b=eKFG/+hHnEhRaAVEreJ3uYAjJ69r
	Wvk30o3+6oDZWRvR7kT+pmqkoEj6D81XkK0qkVGpCR9+99/vVsLnYC3w8yoCDvX8
	a3nOPQCZDmSV5XzU4S5XuuUzhcgcVXaHYwy8TkDszdFn8po8nupCQqUzevlBGBc0
	XOgA8JI3pCHbxOI=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 4770F47A;
	Thu, 14 Mar 2013 14:27:44 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id r2E6RcJn025698;
	Thu, 14 Mar 2013 14:27:38 +0800 (CST) (envelope-from chenwj)
Date: Thu, 14 Mar 2013 14:27:38 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20130314062738.GA25684@cs.nctu.edu.tw>
References: <20130307033301.GA48996@cs.nctu.edu.tw>
	<20130308092102.GD9597@stefanha-thinkpad.redhat.com>
	<CAFEAcA_2JCrZOVTmg8d=YHSPD0-txcXNmjmjvc0AFYihabyfcQ@mail.gmail.com>
	<20130308101324.GA32107@stefanha-thinkpad.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20130308101324.GA32107@stefanha-thinkpad.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use proper term in TCG
	README
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
X-List-Received-Date: Thu, 14 Mar 2013 06:28:05 -0000

On Fri, Mar 08, 2013 at 11:13:24AM +0100, Stefan Hajnoczi wrote:
> On Fri, Mar 08, 2013 at 05:29:29PM +0800, Peter Maydell wrote:
> > On 8 March 2013 17:21, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > On Thu, Mar 07, 2013 at 11:33:01AM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB=
 (Wei-Ren Chen) wrote:
> > >>   In TCG, "target" means the host architecture for which TCG gener=
ates the
> > >> code. Using "guest" rather than "target" to make the document more=
 consistent.
> >=20
> > >> @@ -379,7 +379,7 @@ double-word product T0.  The later is returned=
 in two single-word outputs.
> > >>
> > >>  Similar to mulu2, except the two inputs T1 and T2 are signed.
> > >>
> > >> -********* 64-bit target on 32-bit host support
> > >> +********* 64-bit guest on 32-bit host support
> > >>
> > >>  The following opcodes are internal to TCG.  Thus they are to be i=
mplemented by
> > >>  32-bit host code generators, but are not to be emitted by guest t=
ranslators.
> > >
> > > Review from TCG experts please.
> > >
> > > It seems we have multiple meanings for "target" (e.g. ./configure
> > > --target-list=3D does not mean "the host architecture for which TCG
> > > generates code"), if this is really the way TCG uses the term then =
fine.
> >=20
> > Yes, this is an unfortunate terminology clash, but in a TCG context
> > 'target' does mean 'host architecture which the backend compiles for'
> > (see the tcg/README definition in section 2). This is partly because
> > of TCG's history as a C compiler backend, where 'target' is unambiguo=
us
> > and may be different from the 'host' architecture the compiler itself
> > executes on.
> >=20
> > There are several places in tcg/README which use 'target' in the
> > sense 'QEMU target, ie guest' (as well as lots of uses in the
> > 'TCG target, ie host' sense), not just this one; it might be a good
> > idea to put a note in the Definitions section that this document uses
> > 'guest' when it means what in other areas of QEMU is often referred t=
o
> > as the 'target', and fix the places where we've accidentally used 'ta=
rget'
> > and 'guest would be better.
>=20
> Wei-Ren, can you please convert the other instances in tcg/README where
> 'target' is used in the 'guest' sense, too?

  I will look into the tcg/README again. :)

Regards,
chenwj=20

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

