Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UGK6h-0001hE-4c
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2013 22:10:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UGK6b-0001ed-Oo
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 22:10:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1UGK6X-00054I-A6
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 22:10:49 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:53257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1UGK6K-000533-Cu; Thu, 14 Mar 2013 22:10:33 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 6CADE3C1;
	Fri, 15 Mar 2013 10:10:29 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=ZGUpQ0SlfknAWzq15TinZw0Num4=; b=h4hl7SOw4HRpPtb+aWMx+CE2kscd
	W48b3fKswm21zgWxt9oi2nxP/mgojlN2QdjYVHGAEcyGSwlIS+gRhmXlHpwptCyQ
	wj42EWVb6aX80gbGLrfS1VWIFMRip/R9t1vDOvGJdRyQOEiOkakuqm6B3nZgkkno
	idVIIABrG6pTAe4=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 425AA3C0;
	Fri, 15 Mar 2013 10:10:29 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id r2F2ARMC054075;
	Fri, 15 Mar 2013 10:10:27 +0800 (CST) (envelope-from chenwj)
Date: Fri, 15 Mar 2013 10:10:27 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130315021026.GA54017@cs.nctu.edu.tw>
References: <20130314080646.GA28398@cs.nctu.edu.tw>
	<CAFEAcA815a9QE-y_JSApC0o9MSt6TrjQc+Hgo83uxEUD8KTHjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA815a9QE-y_JSApC0o9MSt6TrjQc+Hgo83uxEUD8KTHjw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH v2] Use proper term in TCG README
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
X-List-Received-Date: Fri, 15 Mar 2013 02:10:54 -0000

  Thanks, Peter.=20

On Thu, Mar 14, 2013 at 09:03:15AM +0000, Peter Maydell wrote:
> On 14 March 2013 08:06, =E9=99=B3=E9=9F=8B=E4=BB=BB (Wei-Ren Chen) <che=
nwj@iis.sinica.edu.tw> wrote:
> >   In TCG, "target" means the host architecture for which TCG generate=
s
> > the code. Using "guest" rather than "target" to make the document mor=
e
> > consistent.
>=20
> Thanks. I've tweaked the wording a little in one sentence below;
> otherwise it looks good.
>=20
> > Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> > ---
> >  tcg/README | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/tcg/README b/tcg/README
> > index 934e7af..00d4751 100644
> > --- a/tcg/README
> > +++ b/tcg/README
> > @@ -14,6 +14,9 @@ the emulated architecture. As TCG started as a gene=
ric C backend used
> >  for cross compiling, it is assumed that the TCG target is different
> >  from the host, although it is never the case for QEMU.
> >
> > +In this document, we uses "guest" to specify what architecture we ar=
e
>=20
> "use".
>=20
>=20
> > +emulating, and "target" means on what machine we are running QEMU.
>=20
> "emulating; "target" always means the TCG target, the machine on which
> we are running QEMU."
>=20
> > +
> >  A TCG "function" corresponds to a QEMU Translated Block (TB).
> >
> >  A TCG "temporary" is a variable only live in a basic
> > @@ -379,7 +382,7 @@ double-word product T0.  The later is returned in=
 two single-word outputs.
> >
> >  Similar to mulu2, except the two inputs T1 and T2 are signed.
> >
> > -********* 64-bit target on 32-bit host support
> > +********* 64-bit guest on 32-bit host support
> >
> >  The following opcodes are internal to TCG.  Thus they are to be impl=
emented by
> >  32-bit host code generators, but are not to be emitted by guest tran=
slators.
> > @@ -521,9 +524,9 @@ register.
> >    a better generated code, but it reduces the memory usage of TCG an=
d
> >    the speed of the translation.
> >
> > -- Don't hesitate to use helpers for complicated or seldom used targe=
t
> > +- Don't hesitate to use helpers for complicated or seldom used guest
> >    instructions. There is little performance advantage in using TCG t=
o
> > -  implement target instructions taking more than about twenty TCG
> > +  implement guest instructions taking more than about twenty TCG
> >    instructions. Note that this rule of thumb is more applicable to
> >    helpers doing complex logic or arithmetic, where the C compiler ha=
s
> >    scope to do a good job of optimisation; it is less relevant where
> > @@ -531,9 +534,9 @@ register.
> >    inline TCG may still be faster for longer sequences.
> >
> >  - The hard limit on the number of TCG instructions you can generate
> > -  per target instruction is set by MAX_OP_PER_INSTR in exec-all.h --
> > +  per guest instruction is set by MAX_OP_PER_INSTR in exec-all.h --
> >    you cannot exceed this without risking a buffer overrun.
> >
> >  - Use the 'discard' instruction if you know that TCG won't be able t=
o
> >    prove that a given global is "dead" at a given program point. The
> > -  x86 target uses it to improve the condition codes optimisation.
> > +  x86 guest uses it to improve the condition codes optimisation.
> > --
> > 1.7.12.3
>=20
> -- PMM

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

