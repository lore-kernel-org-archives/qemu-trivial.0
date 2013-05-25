Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgAm6-0006yX-Kp
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 05:28:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgAlz-0006oj-QV
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgAlt-0004sI-F7
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:28:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UgAlg-0004kE-Ct; Sat, 25 May 2013 05:28:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A4684197B;
	Sat, 25 May 2013 13:28:03 +0400 (MSK)
Message-ID: <51A08422.7030207@msgid.tls.msk.ru>
Date: Sat, 25 May 2013 13:28:02 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 0/4] debugcon: fix some bugs when
	DEBUG_DEBUGCON
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
X-List-Received-Date: Sat, 25 May 2013 09:28:30 -0000

24.05.2013 06:47, liguang wrote:
> when enable DEBUG_DEBUGCON, there are some message
> printing bugs, so fix them.
> 
> this patch-set based on previous 3 patches,
> http://comments.gmane.org/gmane.comp.emulators.qemu/212550
> http://comments.gmane.org/gmane.comp.emulators.qemu/212551
> http://comments.gmane.org/gmane.comp.emulators.qemu/212552
> 
> cover-letter and patch [4/4] are new, no changes
> for other 3.
> 
> Li Guang (4)
> 	 debugcon: fix always print "addr=0x0, val=0x0" bug when use DEBUG_DEBUGCON
> 	 debugcon: make debug message more readable
> 	 debugcon: fix compiler warning when open DEBUG_DEBUGCON
> 	 debugcon: use fprintf(stderr...) instead of printf

The subjects and commit messages are a bit inaccurate, and
as Andreas says, these may have been merged together, but
the inaccuracy is small (and mostly due to language barriers),
and the result is good anyway, with one patch doing one thing.

So.. thanks, applied to the trivial-patches queue.

/mjt


