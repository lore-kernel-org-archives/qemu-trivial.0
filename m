Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R1hHz-0008IK-AJ
	for mharc-qemu-trivial@gnu.org; Thu, 08 Sep 2011 12:17:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1R1hHw-0008Al-8d
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2011 12:17:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1R1hHv-0002Lx-48
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2011 12:17:16 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1R1hHt-0002CL-7V; Thu, 08 Sep 2011 12:17:13 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1E12E72818A6; Thu,  8 Sep 2011 18:17:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id UyGybwHB+BNf; Thu,  8 Sep 2011 18:17:09 +0200 (CEST)
Received: from flocke.weilnetz.de (p54ADA0D2.dip.t-dialin.net [84.173.160.210])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	8DD0A72818A1; Thu,  8 Sep 2011 18:17:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1R1hHp-0004Zf-4b; Thu, 08 Sep 2011 18:17:09 +0200
Message-ID: <4E68EA84.3020204@mail.berlios.de>
Date: Thu, 08 Sep 2011 18:17:08 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110818 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1311143248-29509-1-git-send-email-weil@mail.berlios.de>
	<87aac9wakl.fsf@linux.vnet.ibm.com>
In-Reply-To: <87aac9wakl.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] virtio-9p: Fix syntax error in debug code
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
X-List-Received-Date: Thu, 08 Sep 2011 16:17:17 -0000

Am 20.07.2011 11:44, schrieb Aneesh Kumar K.V:
> On Wed, 20 Jul 2011 08:27:28 +0200, Stefan Weil <weil@mail.berlios.de> 
> wrote:
>> This error was reported by cppcheck:
>>
>> qemu/hw/9pfs/virtio-9p-debug.c:342:
>> error: Invalid number of character ({) when these macros are defined:
>> 'DEBUG_DATA'.
>>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
>> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
>> ---
>> hw/9pfs/virtio-9p-debug.c | 2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/hw/9pfs/virtio-9p-debug.c b/hw/9pfs/virtio-9p-debug.c
>> index 4636ad5..96925f0 100644
>> --- a/hw/9pfs/virtio-9p-debug.c
>> +++ b/hw/9pfs/virtio-9p-debug.c
>> @@ -295,7 +295,7 @@ static void pprint_data(V9fsPDU *pdu, int rx, 
>> size_t *offsetp, const char *name)
>>
>> if (rx) {
>> count = pdu->elem.in_num;
>> - } else
>> + } else {
>> count = pdu->elem.out_num;
>> }
>>
>
> Applied.
>
> We also need to update virtio-9p-debug w.r.t the new co-routine
> series. With co-routine we can have multiple 9p handler started
> simultaneously.
>
> -aneesh

Maybe this patch can be applied via qemu-trivial.
I simply would like to get it out of my list of open patches.

Thanks,
Stefan W.


