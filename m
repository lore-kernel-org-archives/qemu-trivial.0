Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoZjA-0001oy-Rn
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 10:48:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WoZj3-0001g3-9l
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 10:48:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WoZix-0000kh-LA
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 10:48:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WoZim-0000im-Hu; Sun, 25 May 2014 10:48:20 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5490F42E07;
	Sun, 25 May 2014 18:48:19 +0400 (MSK)
Message-ID: <538202B3.10606@msgid.tls.msk.ru>
Date: Sun, 25 May 2014 18:48:19 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Le Tan <tamlokveer@gmail.com>
References: <1400985853-25594-1-git-send-email-tamlokveer@gmail.com>	<5381FE37.80904@web.de>	<5381FFD4.8080107@msgid.tls.msk.ru>
	<CACrq+iLp07O-r8LLnEG67gFPKVNnh7bMy6g90dPUB_L2cKj18w@mail.gmail.com>
In-Reply-To: <CACrq+iLp07O-r8LLnEG67gFPKVNnh7bMy6g90dPUB_L2cKj18w@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH v3] block: replace fprintf(stderr,
 ...) with error_report()
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
X-List-Received-Date: Sun, 25 May 2014 14:48:43 -0000

25.05.2014 18:45, Le Tan wrote:
> Oh, yes, I may misunderstood it. I just ran ./scripts/checkpatch.pl to
> check files that I touched and fixed those I can fix. So I will send
> the v4 of this patch which just fix the whitespace issues based on v2.
> Is that right? Forgive my being naive. :)

Please stop top-posting.

I told you to use checkpatch against your _patches_, not against the
files you touch.. ;)

Thank you,

/mjt

