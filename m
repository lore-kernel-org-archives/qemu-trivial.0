Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bSnGL-0007NL-AL
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jul 2016 11:30:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bSnGJ-0007KO-IH
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 11:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bSnGH-0003ss-NK
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 11:30:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bSnGC-0003o7-AL; Thu, 28 Jul 2016 11:30:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 23339429BB;
	Thu, 28 Jul 2016 18:30:06 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1467973897-13734-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: bonzini@redhat.com, qemu-trivial@nongnu.org, rth@twiddle.net,
	crosthwaite.peter@gmail.com
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <1b460515-9da0-4653-19cf-209f985d97e7@msgid.tls.msk.ru>
Date: Thu, 28 Jul 2016 18:30:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467973897-13734-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] timer/cpus: fix some typos and update
 some comments
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 15:30:16 -0000

Applied to -trivial, with the following change:

>  /* enable cpu_get_ticks()
> - * Caller must hold BQL which server as mutex for vm_clock_seqlock.
> + * Caller must hold BQL which serve as mutex for vm_clock_seqlock.

 ..which serveS as a mutex...

here and in one more place.

/mjt

