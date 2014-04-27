Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeL7h-0006BB-Tp
	for mharc-qemu-trivial@gnu.org; Sun, 27 Apr 2014 05:11:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeL7a-000608-Nj
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 05:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeL7U-0003re-Iq
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 05:11:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58957)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeL7H-0003fe-Lc; Sun, 27 Apr 2014 05:11:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1897D42F06;
	Sun, 27 Apr 2014 13:11:19 +0400 (MSK)
Message-ID: <535CC9B6.1080000@msgid.tls.msk.ru>
Date: Sun, 27 Apr 2014 13:11:18 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, Mike Frysinger <vapier@gentoo.org>,
	qemu-devel@nongnu.org
References: <1397929197-21234-1-git-send-email-vapier@gentoo.org>
	<5352E3F2.4000209@redhat.com>
In-Reply-To: <5352E3F2.4000209@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, aneesh.kumar@linux.vnet.ibm.com,
	Tim Comer <comer0@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] virtfs-proxy-helper: fix call to accept
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
X-List-Received-Date: Sun, 27 Apr 2014 09:11:45 -0000

20.04.2014 01:00, Paolo Bonzini wrote:
> Il 19/04/2014 13:39, Mike Frysinger ha scritto:
>> From: Tim Comer <comer0@gmail.com>
>>
>> The current code calls accept() without initializing the size parameter
>> which means the accept call might write too much to the stack.

Applied to -trivial, thanks!

/mjt

