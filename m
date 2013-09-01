Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VG9Ct-0005vH-W4
	for mharc-qemu-trivial@gnu.org; Sun, 01 Sep 2013 11:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9Cl-0005uC-Tc
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:04:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9Cf-0001jt-Qv
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:04:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VG9Cf-0001jc-JE
	for qemu-trivial@nongnu.org; Sun, 01 Sep 2013 11:04:37 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EC17B400BA;
	Sun,  1 Sep 2013 19:04:36 +0400 (MSK)
Message-ID: <52235784.6060205@msgid.tls.msk.ru>
Date: Sun, 01 Sep 2013 19:04:36 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: mrhines@linux.vnet.ibm.com
References: <1376879228-32505-1-git-send-email-mrhines@linux.vnet.ibm.com>
In-Reply-To: <1376879228-32505-1-git-send-email-mrhines@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: yamahata@private.email.ne.jp, aliguori@us.ibm.com, quintela@redhat.com,
	qemu-trivial@nongnu.org, owasserm@redhat.com, mrhines@us.ibm.com,
	pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH for-1.6] rdma: silly ipv6 bugfix
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
X-List-Received-Date: Sun, 01 Sep 2013 15:04:50 -0000

19.08.2013 06:27, mrhines@linux.vnet.ibm.com wrote:
> From: "Michael R. Hines" <mrhines@us.ibm.com>
>
> My bad - but it's very important for us to warn the user that
> IPv6 is broken on RoCE in linux right now, until linux releases
> a fixed version.

Thanks, applied to the trivial-patches queue.

/mjt

