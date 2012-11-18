Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZvXI-0001HT-8Q
	for mharc-qemu-trivial@gnu.org; Sat, 17 Nov 2012 22:27:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZvXD-00012f-Eb
	for qemu-trivial@nongnu.org; Sat, 17 Nov 2012 22:27:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZvXA-0008L5-CY
	for qemu-trivial@nongnu.org; Sat, 17 Nov 2012 22:27:03 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:20225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1TZvX3-0008KY-TS; Sat, 17 Nov 2012 22:26:54 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 8D0B182B;
	Sun, 18 Nov 2012 11:26:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=2m5HO4fbiwbv7/VC5NSIO+/RqHY=; b=TK8vZmOYNLMDrE+kYupIu3rHLjwm
	oIzxCSJzCg+FQFK++GPU3Q8aiBs7cJa1DYsOORb8A5JCmZL1DesFJ6keXsz2poyx
	WPYWUx9Nojs73adeo89PaEaDy+p7uNiSe5/14VgF4xbeKSVG3QEUeBBXRfiJ92Mq
	Gc7O0Udsna96p28=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 749B482A;
	Sun, 18 Nov 2012 11:26:52 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAI3Qqpq078240;
	Sun, 18 Nov 2012 11:26:52 +0800 (CST) (envelope-from chenwj)
Date: Sun, 18 Nov 2012 11:26:52 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20121118032652.GA87959@cs.nctu.edu.tw>
References: <20121116022947.GA50435@cs.nctu.edu.tw>
	<20121116135930.GE31927@stefanha-thinkpad.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20121116135930.GE31927@stefanha-thinkpad.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, Jia Liu <proljc@gmail.com>, qemu-devel@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>,
	"Johnson, Eric" <ericj@mips.com>
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Add comments on POOL32Axf
 encoding
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
X-List-Received-Date: Sun, 18 Nov 2012 03:27:06 -0000

On Fri, Nov 16, 2012 at 02:59:30PM +0100, Stefan Hajnoczi wrote:
> On Fri, Nov 16, 2012 at 10:29:47AM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB (=
Wei-Ren Chen) wrote:
> >   Current QEMU MIPS POOL32AXF encoding comes from microMIPS32
> > and microMIPS32 DSP. Add comment here to help reading.
> >=20
> >   Please review, thanks.
> >=20
> > Regards,
> > chenwj
> >=20
> > Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> > ---
> >  target-mips/translate.c |   17 +++++++++++++++++
> >  1 files changed, 17 insertions(+), 0 deletions(-)
>=20
> Please send this through Aurelien.  Perhaps there's more to discuss
> about how the various MIPS instruction sets should be organized in QEMU=
.

  Got it. ;)

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

