Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh4G2-0003ii-Je
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 16:43:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh4Fw-0003af-J4
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 16:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh4Ft-0000fp-Jd
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 16:43:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uh4Fk-0000Re-4s; Mon, 27 May 2013 16:42:48 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D643541D10;
	Tue, 28 May 2013 00:42:44 +0400 (MSK)
Message-ID: <51A3C543.9020608@msgid.tls.msk.ru>
Date: Tue, 28 May 2013 00:42:43 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: li guang <lig.fnst@cn.fujitsu.com>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51A08422.7030207@msgid.tls.msk.ru> <51A093F6.4070202@suse.de>
	<51A09581.6030105@msgid.tls.msk.ru>
	<1369618853.19028.20.camel@liguang.fnst.cn.fujitsu.com>
In-Reply-To: <1369618853.19028.20.camel@liguang.fnst.cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] debugcon: fix some bugs
 when DEBUG_DEBUGCON
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
X-List-Received-Date: Mon, 27 May 2013 20:43:05 -0000

27.05.2013 05:40, li guang wrote:
[]
>>> NACK. If you want to apply 1-3, okay. But please unqueue 4/4, it makes
>>> no sense as-is (just look at the stderr output to see what I mean) and
>>> it pretends that I suggested that!
>>
>> Actually I did just that, rebuild with DEBUG_DEBUGCON and looked
>> at the output, -- because I didn't know how it works.  And you're
>> right, it's not a good change ;)  But your email come before I was
>> able to reply.  Unqueued.
> 
> Hi, Michael

Hello.  Please excuse me for the long(ish) delay, I was out of the city
when you sent this email and when you pinged me on IRC.

> do you queued patch 1-3?
> if so, I will only send one patch for comments from Andreas,
> otherwise, I will refactor all patches.

Yes I queued your patches 1-3 but not 4.  It can be seen at
http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next

(I just rebased it again on top of current qemu/master, but your 3
patches are there).

Should I replace these 3 with the next set?

But as Gerd correctly say, maybe it's better to just get rid of
these stuff completely, or maybe, just maybe, replace it with
tracepoints.

Anyway, I think the 3 queued-up patches are okay.

Thanks,

/mjt

