Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLUr-0004mK-1o
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:28:05 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLUo-0004du-PC
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:28:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLUn-0002Fi-Lz
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:28:02 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:64381)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNLUl-0002FA-Vj
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:28:01 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id A8EF531B;
	Mon,  7 Nov 2011 17:26:03 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=CauSnpWKF99D1PxA4DQyaKV/gZk=; b=Aeqos56Toek3AYTw3vYCMe+MW5/Y
	Bhx2ur5syVQF+SowsB2L1TOnFlXVgVOeO5g2L9Cm8MY3m33QFNScf1kZ1ALy9gup
	sDEf7lFVwFBkMwSOzColAEcogycXZM1b7GDw0n8tVevjYuaG3qE7u1PC6OjdZFyp
	TIc78SsVgqeFY4s=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id A4ABB31A;
	Mon,  7 Nov 2011 17:26:03 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA79RpSq014554;
	Mon, 7 Nov 2011 17:27:51 +0800 (CST) (envelope-from chenwj)
Date: Mon, 7 Nov 2011 17:27:51 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20111107092751.GA8377@cs.nctu.edu.tw>
References: <20111104171444.GA85143@cs.nctu.edu.tw>
	<20111107081152.GC9450@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20111107081152.GC9450@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH] qemu-tech.texi: Update default code
 cache size
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
X-List-Received-Date: Mon, 07 Nov 2011 09:28:03 -0000

> >   Update the document since the default code cache size is 32 MB now.
> >=20
> > Signed-off-by: chenwj <chenwj@cs.nctu.edu.tw>
> > ---
> >  qemu-tech.texi |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> Can you point me to the place in the code where we use 32 MB?

  In exec.c,

#define DEFAULT_CODE_GEN_BUFFER_SIZE (32 * 1024 * 1024) <--- HERE

#ifdef USE_STATIC_CODE_GEN_BUFFER
static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
               __attribute__((aligned (CODE_GEN_ALIGN)));
#endif
=20
=20
Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667

