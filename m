Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwuG-00017m-FI
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:27:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwuA-0000vf-SZ
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yxwu5-0001nV-VO
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:27:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yxwtt-0001jy-W4; Thu, 28 May 2015 08:27:06 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C38C44272A;
	Thu, 28 May 2015 15:27:04 +0300 (MSK)
Message-ID: <55670998.1030505@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 15:27:04 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>	<5566FCBA.2000500@msgid.tls.msk.ru>
	<87twuwaoju.fsf@blackfin.pond.sub.org>
In-Reply-To: <87twuwaoju.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] docs/writing-qmp-commands: fix a typo
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
X-List-Received-Date: Thu, 28 May 2015 12:27:23 -0000

28.05.2015 15:12, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
[]
>> Marcus: I don't think such obvious and trivial changes needs to be re-sent
>> to -devel. Ofcourse it is better to send things to -devel rigth away, but
>> requiring to resent is a bit over the top.  I think anyway :)
> 
> Patches must be posted to -devel for review.
> 
> If you accept patches sent just to -trivial, then the only post to
> -devel will be your pull request, where it most probably won't get
> review.

Obvious typo fix in comment or doc don't really need a big review.
That's where the "too trivial" border can be drawn.

Just to be clear: I'm not, in any way, against posting things to -devel,
things SHOULD be posted to -devel.  But once a thing has been posted
like this one, just to -trivial, and it really _is_ trivial and obvious,
it is enough to say somehting among "This one is okay, but the next time
please send to -devel too".

Thanks,

/mjt

> Judging from my own experience, no patch is too trivial to screw up.
> Play it safe, post to -devel for review always.  Resending a trivial
> patch isn't exactly a big burden :)
> 


