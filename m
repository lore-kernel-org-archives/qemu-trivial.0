Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZAhv-0000kU-75
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 20:26:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZAhq-0000kN-Pz
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 20:26:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZAhn-0007N5-Nv
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 20:26:54 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:28045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZAhn-0007Lk-5y
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 20:26:51 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id A24806E2;
	Fri, 16 Nov 2012 09:26:41 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=QGfvLFR2GvHBBrv9nuRu60A/si4=; b=oe8q9Wd1IL6L0SCLM9vsMofaoRHr
	StwW4TlXUbPFZ7R7orUOeaczMzw7pga35EM8m+KBz0WzTZE/RumcwBI0BsRDjwPy
	vkJck3qexzDVd8u12/DZZl3/kwg0wPdQlbtn+Y2vXELZ19oxZqVslAkyYP8W0EhP
	wSNY4Dl1qdQie1I=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 8C4866E1;
	Fri, 16 Nov 2012 09:26:41 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAG1QeZI047694;
	Fri, 16 Nov 2012 09:26:40 +0800 (CST) (envelope-from chenwj)
Date: Fri, 16 Nov 2012 09:26:40 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20121116012640.GB47041@cs.nctu.edu.tw>
References: <20121114024954.GA63683@cs.nctu.edu.tw>
	<20121114164521.GA5877@ohm.aurel32.net>
	<20121114235704.GB11985@cs.nctu.edu.tw>
	<20121115135338.GA21046@ohm.aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20121115135338.GA21046@ohm.aurel32.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH] Possible wrong microMIPS opcode encoding
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
X-List-Received-Date: Fri, 16 Nov 2012 01:26:58 -0000

On Thu, Nov 15, 2012 at 02:53:38PM +0100, Aurelien Jarno wrote:
> On Thu, Nov 15, 2012 at 07:57:04AM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB (=
Wei-Ren Chen) wrote:
> > On Wed, Nov 14, 2012 at 05:45:21PM +0100, Aurelien Jarno wrote:
> > > On Wed, Nov 14, 2012 at 10:49:55AM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB=
 (Wei-Ren Chen) wrote:
> > > > Hi all,
> > > >=20
> > > >   While reading microMIPS decoding, I found a possible wrong opco=
de
> > > > encoding. According to [1] page 337, the bits 13..12 for MULTU is
> > > > 0x01 rather than 0x00. Please review, thanks.
> > > >=20
> > > > [1] MIPS Architecture for Programmers VolumeIV-e: The MIPS DSP
> > > >     Application-Specific Extension to the microMIPS32 Architectur=
e
> > >=20
> > > This is indeed correct, but I guess the page you meant is 166. Page=
 337
> > > refers to the original MULTU instruction from the MIPS Architecture=
 for
> > > Programmers Volume II-B: The microMIPS32 Instruction Set.
> > >=20
> > > On the other the microMIPS32 encoding for DSP instruction is not ye=
t
> > > supported.
> >=20
> >   Maybe we can start cleanup it a little bit. ;) Is this OK to commit=
?
> >=20
>=20
> My point was that the patch what correct, but not the comment. I have
> committed it after fixing the comment.

  I saw your commit, thanks. btw, I found codesourcery MIPS GCC has a
option called "-mmicromips". Would you mind confirm this option does
work for me?

Regards,
chenwj
=20
--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

