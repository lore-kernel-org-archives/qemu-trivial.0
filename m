Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S0Pb6-0007mS-Ad
	for mharc-qemu-trivial@gnu.org; Wed, 22 Feb 2012 22:44:00 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1S0Pb3-0007mG-RQ
	for qemu-trivial@nongnu.org; Wed, 22 Feb 2012 22:43:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1S0Pb2-000359-Gm
	for qemu-trivial@nongnu.org; Wed, 22 Feb 2012 22:43:57 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:25251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1S0Pay-0002x1-Ps; Wed, 22 Feb 2012 22:43:53 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 54193543;
	Thu, 23 Feb 2012 11:49:02 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=sm3e3DfSNtz44jxWbb36OfYzvgU=; b=eemLPCHDR16cr56VC0yoagaCdTQ2
	AiabdX8SJRPcKL8IiI0yK+GbptCrvmhEgVTPZcLHUNi9AEOk0mJKWa/VEZudrwgm
	EqbkYMtltC2YCdO8D8MvScNVS1a7GuolSS1zX4Sr8c1uQLfd8T6wAZDuDwbylA+g
	aQhBntXfnPR/y3w=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 36FA7542;
	Thu, 23 Feb 2012 11:49:02 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id q1N3hcac034947;
	Thu, 23 Feb 2012 11:43:38 +0800 (CST) (envelope-from chenwj)
Date: Thu, 23 Feb 2012 11:43:38 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: stefanha@gmail.com
Message-ID: <20120223034338.GA33288@cs.nctu.edu.tw>
References: <20120222020705.GA10972@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20120222020705.GA10972@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Fix dependency issue
 introduced by commit 7b93fadf3a38d1ed65ea5536a52efc2772c6e3b8
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
X-List-Received-Date: Thu, 23 Feb 2012 03:43:59 -0000

Hi Stefan,

  Peter already fix this issue [1]. Please ignore my patch, thanks!

Regards,
chenwj

[1] http://patchwork.ozlabs.org/patch/142306/

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

