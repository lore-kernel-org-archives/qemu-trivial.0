Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLnL-00083y-Er
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:47:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLnI-00083o-Jk
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:47:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLnH-00054j-AH
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:47:08 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:62757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLnH-00054e-0P
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:47:07 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 49F6D34C;
	Mon,  7 Nov 2011 17:45:17 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=kkpEI3oB0hnjkSRs/3+ldtg7ePk=; b=axr91+lcl6tdbprJjRPMIU7YCtAy
	Zq1e/SSpWYEN738Y3SqRB2p+EPyJr+WNA6euecG68fxgL5VnU3fRabKsYoupUglV
	J1UFc0cbUrfBIBww+R2oWoGoBo7VoCIzFnUQE/n1yr6MjvqpoUwIdTde6nUQfzrl
	RaTigL9g++noAXI=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 4135634B;
	Mon,  7 Nov 2011 17:45:17 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA79l5OY021897;
	Mon, 7 Nov 2011 17:47:05 +0800 (CST) (envelope-from chenwj)
Date: Mon, 7 Nov 2011 17:47:05 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20111107094705.GA20921@cs.nctu.edu.tw>
References: <20111105010654.GA79132@cs.nctu.edu.tw>
	<20111107081801.GE9450@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20111107081801.GE9450@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH] qemu-tech.texi: Remove libqemu from QEMU
 generic features
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
X-List-Received-Date: Mon, 07 Nov 2011 09:47:09 -0000

On Mon, Nov 07, 2011 at 08:18:01AM +0000, Stefan Hajnoczi wrote:
> On Sat, Nov 05, 2011 at 09:06:54AM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB w=
rote:
> >   According to [1], libqemu is not available anymore. Remove libqemu
> > from QEMU generic features.
> >=20
> > [1] http://www.mail-archive.com/qemu-devel@nongnu.org/msg49809.html
>=20
> Then perhaps we should get rid of tests/qruncom.c too?

  I think so. But I don't know if anyone object this. Is it O.K. cc
this to qemu-devel@nongnu.org ?

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667

