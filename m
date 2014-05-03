Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgVW8-0004xo-Qi
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 04:41:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVW1-0004pL-GA
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 04:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVVv-0005c6-BL
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 04:41:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgVVi-0005Ta-Pl; Sat, 03 May 2014 04:41:30 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1A2314027E;
	Sat,  3 May 2014 12:41:30 +0400 (MSK)
Message-ID: <5364ABBA.10703@msgid.tls.msk.ru>
Date: Sat, 03 May 2014 12:41:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, quintela@redhat.com, 
	owasserm@redhat.com, pbonzini@redhat.com, mst@redhat.com, 
	Eric Blake <eblake@redhat.com>
References: <53624BEB.7030605@gmail.com>
In-Reply-To: <53624BEB.7030605@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] arch_init: Be sure of only one exit
 entry with DPRINTF() for ram_load()
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
X-List-Received-Date: Sat, 03 May 2014 08:41:55 -0000

01.05.2014 17:28, Chen Gang wrote:
> When DPRINTF() has effect, the original author wants to print all
> ram_load() calling results. So need use 'goto' instead of 'return'
> within ram_load(), just like other areas have done.

Applied to -trivial, thank you!

/mjjt

