Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZvUK-0008BQ-CU
	for mharc-qemu-trivial@gnu.org; Sat, 17 Nov 2012 22:24:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZvUE-0007tn-PX
	for qemu-trivial@nongnu.org; Sat, 17 Nov 2012 22:24:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZvUB-0007dS-NM
	for qemu-trivial@nongnu.org; Sat, 17 Nov 2012 22:23:58 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:51595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1TZvU4-0007c3-UJ; Sat, 17 Nov 2012 22:23:49 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 6C898822;
	Sun, 18 Nov 2012 11:23:43 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=MpFRz7HQXaMlBgW2inkPy2p7kKU=; b=B7/fOKgDT/YAOhgxHx7OANj81evo
	/qUAubxzcqwzQcvtq+KqWDLl1I2TGSNdfU82NJzd6BmcUAv96JMNUFG6WN5kUiCO
	sr18k6W0pniWMKcp9qTiEX25mCcnF/kReXIHba6kWlrD5q5YuXoc6Z6kMTmF8gQg
	PtzHqTBSGvWznLg=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 56981821;
	Sun, 18 Nov 2012 11:23:43 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAI3Ndv5048913;
	Sun, 18 Nov 2012 11:23:39 +0800 (CST) (envelope-from chenwj)
Date: Sun, 18 Nov 2012 11:23:39 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20121118032339.GA54670@cs.nctu.edu.tw>
References: <20121116020552.GA48755@cs.nctu.edu.tw>
	<20121116135545.GD31927@stefanha-thinkpad.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20121116135545.GD31927@stefanha-thinkpad.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, Jia Liu <proljc@gmail.com>, qemu-devel@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>,
	"Johnson, Eric" <ericj@mips.com>
Subject: Re: [Qemu-trivial] [PATCH v2] target-mips: Clean up microMIPS32
 major opcode
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
X-List-Received-Date: Sun, 18 Nov 2012 03:24:02 -0000

> Please send this through Aurelian as maintainer for target-mips/.  The
> discussion on previous the thread show this isn't qemu-trivial material
> :).

  O.K., I'll remove this from qemu-trivial if I need to send revision
next time. Thanks, Stefan.

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

