Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpE2v-0003uT-JN
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:47:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpE2p-0003ml-QO
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpE2o-0003Vs-P4
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:47:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39647)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UpE2m-0003VJ-CA; Wed, 19 Jun 2013 04:47:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 23B8641B1A;
	Wed, 19 Jun 2013 12:47:06 +0400 (MSK)
Message-ID: <51C17009.4050102@msgid.tls.msk.ru>
Date: Wed, 19 Jun 2013 12:47:05 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
	<f65ba24ae67c04af46940c8cc67093894af97871.1371553360.git.peter.crosthwaite@xilinx.com>
	<51C16755.9050700@msgid.tls.msk.ru>
	<CAEgOgz4rOGjnaHEV9v88SiLS3MpWTrpfaf2B7yw9mU-B5GYq9Q@mail.gmail.com>
In-Reply-To: <CAEgOgz4rOGjnaHEV9v88SiLS3MpWTrpfaf2B7yw9mU-B5GYq9Q@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/5] block/nand: Factor
 out common code
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
X-List-Received-Date: Wed, 19 Jun 2013 08:47:16 -0000

19.06.2013 12:13, Peter Crosthwaite wrote:
[]

> All sounds fair. Ill have another look in the context of type
> changing, and factoring out some commonality. Your able to take P2
> without conflict? :)

Thanks!

And sure, either with or without your next reformatting
(block/nand: Formatting sweep) -- either on top of it or
without it -- is okay.

/mjt

