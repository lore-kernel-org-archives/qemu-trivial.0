Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guLje-0008Ey-EO
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 13:27:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Sandra_Loosemore@mentor.com>) id 1guLjc-0008D8-31
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 13:27:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Sandra_Loosemore@mentor.com>) id 1guLjb-0003EO-5u
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 13:27:44 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:62236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Sandra_Loosemore@mentor.com>)
	id 1guLjZ-00037o-5b; Thu, 14 Feb 2019 13:27:41 -0500
Received: from svr-orw-mbx-03.mgc.mentorg.com ([147.34.90.203])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1guLjT-0001XS-4c from Sandra_Loosemore@mentor.com ;
	Thu, 14 Feb 2019 10:27:35 -0800
Received: from [127.0.0.1] (147.34.91.1) by svr-orw-mbx-03.mgc.mentorg.com
	(147.34.90.203) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Thu, 14 Feb 2019 10:27:32 -0800
To: Peter Maydell <peter.maydell@linaro.org>
CC: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>
References: <1550008033-26540-1-git-send-email-sandra@codesourcery.com>
	<CAFEAcA8eFexmymsaur-DtgYdKcyJB0ia7dW_vp358hbySsyBDw@mail.gmail.com>
From: Sandra Loosemore <sandra@codesourcery.com>
Message-ID: <fdba9c20-3ffb-7862-51c5-f78852b68238@codesourcery.com>
Date: Thu, 14 Feb 2019 11:27:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8eFexmymsaur-DtgYdKcyJB0ia7dW_vp358hbySsyBDw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
	svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: Send a reply to
 the vKill packet.
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
X-List-Received-Date: Thu, 14 Feb 2019 18:27:45 -0000

On 2/14/19 10:48 AM, Peter Maydell wrote:
> On Tue, 12 Feb 2019 at 21:52, Sandra Loosemore <sandra@codesourcery.com> wrote:
>>
>> Per the GDB remote protocol documentation
>>
>> https://sourceware.org/gdb/current/onlinedocs/gdb/Packets.html#index-vKill-packet
>>
>> the debug stub is expected to send a reply to the 'vKill' packet.  At
>> least some versions of GDB crash if the gdb stub simply exits without
>> sending a reply.  This patch fixes QEMU's gdb stub to conform to the
>> expected behavior.
>>
>> Note that QEMU's existing handling of the legacy 'k' packet is
>> correct: in that case GDB does not expect a reply, and QEMU does not
>> send one.
>>
>> Signed-off-by: Sandra Loosemore <sandra@codesourcery.com>
> 
> Thanks, applied to target-arm.next.
> 
> As an aside, do you know if there is any kind of test suite for
> the remote protocol that implementors of a debug stub can use to
> check that they're conforming to it?

Well, I discovered this problem by running the GDB testsuite (using QEMU 
for nios2-elf target with the other target-specific patches I recently 
posted).  I'm not sure if it's designed to exhaustively test the entire 
remote protocol, but it does a pretty good job of covering user-visible 
GDB features that depend on the remote target doing something 
reasonable, even if it's just saying "Huh?  I don't know how to do 
that."  :-)

-Sandra

