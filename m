Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNanf-0002rC-UR
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 20:48:31 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNand-0002jn-UM
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 20:48:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNanc-0007S5-TB
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 20:48:29 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:59988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNanc-0007Rv-HN
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 20:48:28 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 5935C7AC;
	Tue,  8 Nov 2011 09:46:38 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=bnNqgpkY/36MTZd/HGpXQMpDpLY=; b=F6RSONs+7DZTst3g6OB8Au9xDP56
	IJN5X6DyFtZQBUZ+e8zbAoOAb5RdGDQ7W25za/PKNT3FzdsgEvF6M9SDvXJL0MIY
	XCXO8RiaGhYiD7cBkftu73o+5KL2t0c6pQa8hkCaeEU3Bvf06blrmYhpLA/4+owP
	ma8BqQ1GjbqQ29k=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 3BF557AB;
	Tue,  8 Nov 2011 09:46:38 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA81mRhN071936;
	Tue, 8 Nov 2011 09:48:27 +0800 (CST) (envelope-from chenwj)
Date: Tue, 8 Nov 2011 09:48:27 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20111108014827.GA66800@cs.nctu.edu.tw>
References: <20111104171444.GA85143@cs.nctu.edu.tw>
	<20111107081152.GC9450@stefanha-thinkpad.localdomain>
	<20111107092751.GA8377@cs.nctu.edu.tw>
	<20111107161827.GA14396@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20111107161827.GA14396@stefanha-thinkpad.localdomain>
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
X-List-Received-Date: Tue, 08 Nov 2011 01:48:30 -0000

> Thank you.  I don't work on TCG and after a little bit of unsuccessful
> grepping I figured it would be easiest to ask you :).

  You're welcome. :)

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667

