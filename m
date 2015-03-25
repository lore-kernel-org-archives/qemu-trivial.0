Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YanPU-0003Eo-IL
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2015 11:40:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1YanPS-0003CI-NA
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:39:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1YanPN-0000Ch-JJ
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:39:58 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:51214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1YanPC-0008Ki-Np; Wed, 25 Mar 2015 11:39:42 -0400
Message-ID: <5512D6BC.8010300@mail.uni-paderborn.de>
Date: Wed, 25 Mar 2015 16:39:40 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Stefan Weil <sw@weilnetz.de>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1426945498-29777-1-git-send-email-sw@weilnetz.de>
	<5512D220.2020303@msgid.tls.msk.ru>
In-Reply-To: <5512D220.2020303@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.2.0.2453472, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2015.3.25.152723
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-tricore: Fix check
 which was always false
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
X-List-Received-Date: Wed, 25 Mar 2015 15:39:59 -0000



On 03/25/2015 04:20 PM, Michael Tokarev wrote:
> 21.03.2015 16:44, Stefan Weil wrote:
>> With a mask value of 0x00400000, the result will never be 1.
>> This fixes a Coverity warning.
> Might be a bit risky if the whole thing wasn't a complete no-op.
> I wonder maybe the whole this if statement should be removed..
>
> But anyway, applied to -trivial, thank you!
>
> /mjt
>
Thanks. The statement is just an indicator for a trap which needs to 
happen there. I'm working on this right now, so it won't stay like this 
for long :).

Cheers,
Bastian


