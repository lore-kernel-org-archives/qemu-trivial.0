Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uz9SI-0002Dw-Ro
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2013 13:54:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uz9SG-00028V-9k
	for qemu-trivial@nongnu.org; Tue, 16 Jul 2013 13:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uz9SF-0000pP-46
	for qemu-trivial@nongnu.org; Tue, 16 Jul 2013 13:54:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uz9SC-0000o5-Pq; Tue, 16 Jul 2013 13:54:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3AD224105D;
	Tue, 16 Jul 2013 21:54:23 +0400 (MSK)
Message-ID: <51E588CE.703@msgid.tls.msk.ru>
Date: Tue, 16 Jul 2013 21:54:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
References: <1373894260-57259-1-git-send-email-petar.jovanovic@rt-rk.com>
In-Reply-To: <1373894260-57259-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, qemu-devel@nongnu.org,
	petar.jovanovic@imgtec.com
Subject: Re: [Qemu-trivial] [PATCH] linux-user: declare sys_futex to have 6
 arguments
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
X-List-Received-Date: Tue, 16 Jul 2013 17:54:29 -0000

15.07.2013 17:17, Petar Jovanovic wrote:
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
> 
> sys_futex has 6 arguments, and all of these need to be copied. Fix incorrect
> declaration in the mips_syscall_args array.

Thanks, applied to the trivial patches queue.

/mjt

