Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEA2-0004R5-Ri
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:09:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEA0-0004OB-71
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:09:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE9z-0007qA-CQ
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:09:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwE9s-0007hQ-GZ; Sun, 24 Sep 2017 17:09:48 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D570141C78;
	Mon, 25 Sep 2017 00:09:47 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id BEDB53C3;
	Mon, 25 Sep 2017 00:09:47 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, qemu-ppc@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
References: <1505293637-10450-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <bf1d186c-0489-caa8-7da0-f91c8c20b08b@msgid.tls.msk.ru>
Date: Mon, 25 Sep 2017 00:09:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505293637-10450-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/isa/pc87312: Mark the device with
 user_creatable = false
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
X-List-Received-Date: Sun, 24 Sep 2017 21:09:57 -0000

13.09.2017 12:07, Thomas Huth wrote:
> QEMU currently aborts if you try to use the device at the command
> line:
> 
> $ ppc64-softmmu/qemu-system-ppc64 -S -machine prep -device pc87312
> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
> qemu-system-ppc64: -device pc87312: Device 'parallel0' is in use
> Aborted (core dumped)
> 
> It uses parallel_hds in its realize function, so I can not be
> instantiated by the user again.
> 

Applied to -trivial, thanks!

/mjt

