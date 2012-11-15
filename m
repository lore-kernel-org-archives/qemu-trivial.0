Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYo5D-0002N8-5r
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 20:17:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYo58-0002ML-FK
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 20:17:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYo55-00089O-DK
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 20:17:26 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:16380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYo54-000899-SW
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 20:17:23 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id BC18C3F6;
	Thu, 15 Nov 2012 09:17:20 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=YmJO1Ud3oykFm0fLMSUA5UhOn9E=; b=Ohmb6n8wyGGXbRsC3mpeDNzNdjjM
	UscGFLPCD8aotxoKWv60VI6kFbPxBmeWs6kb0mK2dje01QGyhfpWLMHMw3qCgqDY
	pLbDI+28puDm+einXQHKFcuxRv/Da891sS9gm9BnwgnO36Entm8vb6EUfdk5Cc6i
	14zy2r22NsmldyU=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 90D9E3F5;
	Thu, 15 Nov 2012 09:17:20 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAF1HKiS014434;
	Thu, 15 Nov 2012 09:17:20 +0800 (CST) (envelope-from chenwj)
Date: Thu, 15 Nov 2012 09:17:20 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20121115011719.GA13562@cs.nctu.edu.tw>
References: <20121114024954.GA63683@cs.nctu.edu.tw>
	<20121114164521.GA5877@ohm.aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20121114164521.GA5877@ohm.aurel32.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, Jia Liu <proljc@gmail.com>,
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
X-List-Received-Date: Thu, 15 Nov 2012 01:17:29 -0000

Hi Aurelien,

  off the topic. Do you happen to know if GCC or whatever compiler
support microMIPS? I don't see any option used to produce microMIPS
code on GCC manual [1]. Thanks.

Regards,
chenwj

[1] http://gcc.gnu.org/onlinedocs/gcc/MIPS-Options.html

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

