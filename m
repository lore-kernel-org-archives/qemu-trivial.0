Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYmjm-00005u-R9
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 18:51:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYmji-000058-Jv
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 18:51:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYmjf-0002Bs-Gn
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 18:51:14 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:26621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYmje-0002BE-VV
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 18:51:11 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 2290229A;
	Thu, 15 Nov 2012 07:51:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=/SAFt+/srsS322Z1IFUDZAlyxq8=; b=mmO7zRMjtyecSRGJ6QsrXsFxf885
	9ih6LoolyUQ4xqEwHzf18/xIac7fbW5/TDDcbd1Au/UlbSgATWys/iP8VHRkwiTU
	SDbfx/tSzpIAG2blETtWq11bWx8J/bOEWfPGBjJ78cerYub2Ksq/0jruPr6eFwk2
	exw+uXyc2IgkH4g=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id E5B32299;
	Thu, 15 Nov 2012 07:51:07 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAENp7Pt012035;
	Thu, 15 Nov 2012 07:51:07 +0800 (CST) (envelope-from chenwj)
Date: Thu, 15 Nov 2012 07:51:07 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20121114235106.GA11985@cs.nctu.edu.tw>
References: <20121114024954.GA63683@cs.nctu.edu.tw>
	<0E9C0C71-C831-482F-9555-2CC2088B2F27@gmail.com>
	<20121114165607.GB5877@ohm.aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20121114165607.GB5877@ohm.aurel32.net>
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
X-List-Received-Date: Wed, 14 Nov 2012 23:51:17 -0000

Hi Aurelien,

> I don't really understand what this patch is supposed to do compared to
> the original bug report and patch.

  He just replyed to the wrong mail, never mind.

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

