Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYsMY-0008Iv-DF
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 00:51:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYsMT-00083m-MZ
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 00:51:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYsMQ-0003zk-Jl
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 00:51:37 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:23353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1TYsMJ-0003xo-UW; Thu, 15 Nov 2012 00:51:28 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 7D37686B;
	Thu, 15 Nov 2012 13:51:20 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=UBmJz1BgCy1spXMo/hoQKoUaRJc=; b=Zp3imSTuE5mBTW0VcAsrJ1DAJbZ2
	cEbRzMoXM9O7ABoZKnrftPti2otA12xl6+o5d4+vguFjwmqcycShRXf+YMzq/jVc
	OC+URz5vbnqRmI4inE04xG9S2+z1Ht+G4C+caeCNk/arDsVY1wirmKjS+bSWNSjS
	8BeU6rZ9G1JaQJI=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 6B2C586A;
	Thu, 15 Nov 2012 13:51:20 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAF5pG4u020656;
	Thu, 15 Nov 2012 13:51:16 +0800 (CST) (envelope-from chenwj)
Date: Thu, 15 Nov 2012 13:51:16 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: "Johnson, Eric" <ericj@mips.com>
Message-ID: <20121115055116.GA20526@cs.nctu.edu.tw>
References: <20121115021501.GA15630@cs.nctu.edu.tw>
	<AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>
	<20121115032652.GA17050@cs.nctu.edu.tw>
	<FD6A7462-2EB5-4527-B56C-FDC5DD3A59AD@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <FD6A7462-2EB5-4527-B56C-FDC5DD3A59AD@mips.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Clean up
 microMIPS32 major opcode
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
X-List-Received-Date: Thu, 15 Nov 2012 05:51:41 -0000

On Thu, Nov 15, 2012 at 04:01:32AM +0000, Johnson, Eric wrote:
> Hi Chen,
>=20
> Sorry I must have made a copy paste error.  I access the documents inte=
rnally. I'll double check the link tomorrow.
>=20
> The document I referenced is the MIPS64 not the microMIPS64.
>=20
> Do not change the names. The LD32 and SD32 are microMIPS specific. The =
assembler LD and SD opcodes work for either MIPS64 or microMIPS64.

  O.K., thanks for the help. :)

  How about DADDIU32, should I keep the 32 suffix, too?
I still can't find where POOL32S is.

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

