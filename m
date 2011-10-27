Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJSZf-0008DR-Id
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2011 12:12:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:35518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RJSZZ-00083k-FH
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 12:12:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RJSZV-0002en-BF
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 12:12:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RJSZO-0002ci-Gm; Thu, 27 Oct 2011 12:12:42 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	709B272834E1; Thu, 27 Oct 2011 18:12:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id BTKaqsMEBdY0; Thu, 27 Oct 2011 18:12:11 +0200 (CEST)
Received: from [192.168.178.20] (p5086FEB8.dip.t-dialin.net [80.134.254.184])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	DF094728349D; Thu, 27 Oct 2011 18:12:10 +0200 (CEST)
Message-ID: <4EA982D0.10902@weilnetz.de>
Date: Thu, 27 Oct 2011 18:12:00 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>
References: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
	<4EA91C16.6050908@redhat.com>
In-Reply-To: <4EA91C16.6050908@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Teach block/vdi about
 "discarded" (no longer allocated) blocks
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
X-List-Received-Date: Thu, 27 Oct 2011 16:12:57 -0000

Am 27.10.2011 10:53, schrieb Kevin Wolf:
> Am 26.10.2011 21:51, schrieb Eric Sunshine:
>> An entry in the VDI block map will hold an offset to the actual block if
>> the block is allocated, or one of two specially-interpreted values if
>> not allocated. Using VirtualBox terminology, value VDI_IMAGE_BLOCK_FREE
>> (0xffffffff) represents a never-allocated block (semantically arbitrary
>> content). VDI_IMAGE_BLOCK_ZERO (0xfffffffe) represents a "discarded"
>> block (semantically zero-filled). block/vdi knows only about
>> VDI_IMAGE_BLOCK_FREE. Teach it about VDI_IMAGE_BLOCK_ZERO.
>>
>> Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>
>
> Thanks, applied to the block branch.
>
> Kevin


Kevin, I don't want to block improvements. Nevertheless
I'd like to see a small modification in this patch:
both #defines should be implemented without a type cast.
Please change them or wait until Eric sends an update.

My favorite is this:

#define VDI_UNALLOCATED UINT32_MAX
#define VDI_DISCARD     (VDI_UNALLOCATED - 1)

This would also be ok:

#define VDI_UNALLOCATED 0xffffffffU
#define VDI_DISCARD     0xfffffffeU

Using the macro names and the definitions (with type cast)
from the original VirtualBox code would also be ok.

Cheers,
Stefan


