Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4xl4-0006bn-8U
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 13:33:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T4xl0-0006Pz-Hm
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 13:33:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T4xkz-00054l-1B
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 13:33:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T4xkr-00053V-DR; Fri, 24 Aug 2012 13:33:09 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	81698728002B; Fri, 24 Aug 2012 19:33:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 2FHWw+RT98+3; Fri, 24 Aug 2012 19:33:06 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086EC37.dip.t-dialin.net [80.134.236.55])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	D4B6F7280028; Fri, 24 Aug 2012 19:33:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1T4xko-00015z-Gs; Fri, 24 Aug 2012 19:33:06 +0200
Message-ID: <5037BAD2.5060909@weilnetz.de>
Date: Fri, 24 Aug 2012 19:33:06 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1345437900-8001-1-git-send-email-sw@weilnetz.de>	<20120824105436.GC10867@stefanha-thinkpad.localdomain>	<CAFEAcA8K=DxK6PbX+LzqN5+2qSxxs=7N+=7JiwwGX11FD3H9JA@mail.gmail.com>
	<CAJSP0QWSg9B2_H6QBtZHDsJQdeZL+oW=AK7aYZw_AzKnHZq9Vw@mail.gmail.com>
In-Reply-To: <CAJSP0QWSg9B2_H6QBtZHDsJQdeZL+oW=AK7aYZw_AzKnHZq9Vw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, imammedo@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-common: Declare
 qemu_irq earlier
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
X-List-Received-Date: Fri, 24 Aug 2012 17:33:20 -0000

Am 24.08.2012 13:56, schrieb Stefan Hajnoczi:
> On Fri, Aug 24, 2012 at 12:06 PM, Peter Maydell
> <peter.maydell@linaro.org>  wrote:
>> On 24 August 2012 11:54, Stefan Hajnoczi<stefanha@gmail.com>  wrote:
>>> On Mon, Aug 20, 2012 at 06:45:00AM +0200, Stefan Weil wrote:
>>>> This allows using qemu_irq in the target specific cpu.h.
>>>>
>>>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>>>> ---
>>>>   qemu-common.h |    3 ++-
>>>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>>
>>> I'm not sure if there's a reason why qemu_irq was previously hidden from
>>> cpu.h but the code change itself is fine and no one else has commented.
>>>
>>> Thanks, applied to the trivial patches tree:
>>> https://github.com/stefanha/qemu/commits/trivial-patches
>>
>> Consensus seemed to be that it was better to move qemu_irq
>> into hw/irq.h, as discussed in this mail thread:
>> http://lists.gnu.org/archive/html/qemu-devel/2012-08/msg03463.html
>> rather than just doing a move of the typedef within this header.
>
> Fine by me.  I won't send a pull request with this patch yet.
>
> Stefan Weil: Are you happy to use the hw/irq.h patch instead of this?
>
> Stefan

Stefan H., that's OK.

Cheers,
Stefan


