Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W34az-00044l-Rl
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 09:03:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W34at-0003v6-S9
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 09:03:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W34ap-0002ms-3b
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 09:03:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W34af-0002jH-BX; Tue, 14 Jan 2014 09:03:37 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BAC26411AD;
	Tue, 14 Jan 2014 18:03:26 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id 6674C608;
	Tue, 14 Jan 2014 18:03:26 +0400 (MSK)
Message-ID: <52D543AE.5010603@msgid.tls.msk.ru>
Date: Tue, 14 Jan 2014 18:03:26 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: William Dauchy <wdauchy@gmail.com>
References: <1386322527-23148-1-git-send-email-kraxel@redhat.com>
	<1386322527-23148-9-git-send-email-kraxel@redhat.com>
	<20131209233334.GC27737@otherpad.lan.raisama.net>
	<CAFEAcA_W7MXEPT7p8M0oqPkHsBe4ZZKcmS5B-r6L1Z-NABUHAw@mail.gmail.com>
	<CAJ75kXYr4Vbq1C0tA+xOvm=815iYjCm-2eNdx=XaD8=tDbc8sw@mail.gmail.com>
In-Reply-To: <CAJ75kXYr4Vbq1C0tA+xOvm=815iYjCm-2eNdx=XaD8=tDbc8sw@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add bios-256k.bin to BLOBS
	on Makefile
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
X-List-Received-Date: Tue, 14 Jan 2014 14:03:56 -0000

14.01.2014 17:45, William Dauchy wrote:
> On Mon, Jan 6, 2014 at 2:13 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Ping -- who's going to take this patch? Maybe it should
>> go via -trivial?
> 
> +1 still waiting for this merge

Sorry guys, I was on a (relatively small) trip and weren't handling -trivial.
I'll pick it up for this week (there aren't many other changes in there).

Thanks,

/mjt


