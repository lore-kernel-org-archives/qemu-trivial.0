Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsmoQ-0007ZF-Hi
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:16:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmoN-0007X9-ST
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:16:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsmoN-0001cp-5M
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:16:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsmoH-0001Zh-Rg; Sat, 08 Oct 2016 04:16:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5D42A40ECA;
	Sat,  8 Oct 2016 11:16:42 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id D4DCEB2A;
	Sat,  8 Oct 2016 11:16:41 +0300 (MSK)
To: Felix Janda <felix.janda@posteo.de>, qemu-devel@nongnu.org
References: <20160930234021.GC5887@nyan>
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <73bfd488-a32b-285a-4211-ad75c59ca811@msgid.tls.msk.ru>
Date: Sat, 8 Oct 2016 11:16:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160930234021.GC5887@nyan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] linux-user: include <poll.h> instead of
 <sys/poll.h>
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
X-List-Received-Date: Sat, 08 Oct 2016 08:16:52 -0000

01.10.2016 02:40, Felix Janda wrote:
> This removes the last usage of <sys/poll.h> in the code base.

Applied to -trivial, thanks!

/mjt

