Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk5F9-0004Vk-FI
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 03:03:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQHE-0007Mf-R0
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 13:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQHD-0003NJ-V2
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 13:07:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZiQH7-0003JU-Nl; Sat, 03 Oct 2015 13:07:09 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0A00D4035C;
	Sat,  3 Oct 2015 20:07:09 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E9E69A66;
	Sat,  3 Oct 2015 20:07:08 +0300 (MSK)
Message-ID: <56100B3C.8060002@msgid.tls.msk.ru>
Date: Sat, 03 Oct 2015 20:07:08 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>, 
	qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1442231583-23535-1-git-send-email-armbru@redhat.com>	<87h9mkthx7.fsf@blackfin.pond.sub.org>
	<5603A3B4.1020900@weilnetz.de>
In-Reply-To: <5603A3B4.1020900@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: riku.voipio@iki.fi
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Use g_new() &
 friends where that makes obvious sense
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
X-List-Received-Date: Sat, 03 Oct 2015 17:07:17 -0000

24.09.2015 10:18, Stefan Weil wrote:
> Am 24.09.2015 um 09:06 schrieb Markus Armbruster:
>> Ping?
> 
>> Markus Armbruster <armbru@redhat.com> writes:
> 
>>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also 
>>> safer, for two reasons.  One, it catches multiplication 
>>> overflowing size_t. Two, it returns T * rather than void *,
>>> which lets the compiler catch more type errors.

Applied to -trivial, with a trivial commit message fix.
Thanks!

/mjt

