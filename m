Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKm5D-00061O-IF
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:24:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKm56-0005pM-6c
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:24:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKm4z-0002Fm-2V
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:23:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKm4g-00026y-8z; Sat, 14 Sep 2013 05:23:30 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EE65741074;
	Sat, 14 Sep 2013 13:23:28 +0400 (MSK)
Message-ID: <52342B10.5020708@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 13:23:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Tobias Markus <tobias@markus-regensburg.de>
References: <5219DA56.4090702@markus-regensburg.de>
	<52331BA9.4000906@markus-regensburg.de>
In-Reply-To: <52331BA9.4000906@markus-regensburg.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	qemu-devel@nongnu.org, =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] PING Re: [PATCH v3] target-i386:
 Fix segment cache dump
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
X-List-Received-Date: Sat, 14 Sep 2013 09:24:02 -0000

13.09.2013 18:05, Tobias Markus wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08/25/2013 12:20 PM, Tobias Markus wrote:
>> When in Long Mode, cpu_x86_seg_cache() logs "DS16" because the
>> Default operation size bit (D/B bit) is not set for Long Mode Data
>> Segments since there are only Data Segments in Long Mode and no
>> explicit 16/32/64-bit Descriptors. This patch fixes this by
>> checking the Long Mode Active bit of the hidden flags variable and
>> logging "DS" if it is set. (I.e. in Long Mode all Data Segments are
>> logged as "DS")

Thanks, applied to the trivial-patches queue.

Andreas: if you think it should go to i386 queue instead please
just reply to this email saying so, before I'll send a pull request
to Anthony.  Before a pull request it is really trivial to remove
one patch from a queue.

/mjt

