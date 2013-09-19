Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VMhw4-0004Wg-T2
	for mharc-qemu-trivial@gnu.org; Thu, 19 Sep 2013 13:22:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VMhvy-0004WL-8r
	for qemu-trivial@nongnu.org; Thu, 19 Sep 2013 13:22:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VMhvs-0001W8-LQ
	for qemu-trivial@nongnu.org; Thu, 19 Sep 2013 13:22:30 -0400
Received: from mail-ye0-x229.google.com ([2607:f8b0:4002:c04::229]:49182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VMhvs-0001W4-HJ; Thu, 19 Sep 2013 13:22:24 -0400
Received: by mail-ye0-f169.google.com with SMTP id r13so3571118yen.28
	for <multiple recipients>; Thu, 19 Sep 2013 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=XfZATKxUkayGcF3fANPxELTStLYLwJ7oaAEgEwNGRAc=;
	b=tpzfUYFLszfS0AWVsXneMk1G0ahvCusyCTrM1vZwndWBAMz0vt0Y6lLw2L5kSlwI1V
	L22gB9bfzbiuoVhpX8o6hYo0nU5kRVq8+DWZ41nPDYVnt6gcDCZoMyzqd3wgtGqGR6nn
	gBX8eV/mmyIIB9DHNZIaig2J17BMW7uyrmWQVE2szC/Kvuip2LTIpZk7/nGzaiLpbxSf
	iFiJMAj2GD8kGSZVuHoO3582oAfHz3S94Uxvu8VmhlWhXUy0atTp7t6U2wMB3anzB1QS
	am6Yeb1F+ykdh/GLnZRlQL7hJ9NOi20dsCA45jcpqcSKA0GcdmKc7WFC3NcAliRuUIVS
	pQKA==
X-Received: by 10.236.167.165 with SMTP id i25mr1204813yhl.126.1379611343687; 
	Thu, 19 Sep 2013 10:22:23 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-2-39-10-130.cust.dsl.vodafone.it.
	[2.39.10.130]) by mx.google.com with ESMTPSA id
	c44sm12118515yho.20.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 10:22:22 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <523B32DA.3020007@redhat.com>
Date: Thu, 19 Sep 2013 19:22:34 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1379436196-27506-1-git-send-email-sw@weilnetz.de>
	<523B2D6B.9050601@suse.de>
In-Reply-To: <523B2D6B.9050601@suse.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c04::229
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Fix compiler warning
	(-Werror=uninitialized)
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
X-List-Received-Date: Thu, 19 Sep 2013 17:22:35 -0000

Il 19/09/2013 18:59, Andreas Färber ha scritto:
> Am 17.09.2013 18:43, schrieb Stefan Weil:
>> The patch fixes a warning from gcc (Debian 4.6.3-14+rpi1) 4.6.3:
>>
>> block/stream.c:141:22: error:
>> ‘copy’ may be used uninitialized in this function [-Werror=uninitialized]
>>
>> This is not a real bug - a better compiler would not complain.
>>
>> Now 'copy' has always a defined value, so the check for ret >= 0
>> can be removed.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  block/stream.c |    5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/block/stream.c b/block/stream.c
>> index 078ce4a..fc19194 100644
>> --- a/block/stream.c
>> +++ b/block/stream.c
>> @@ -108,7 +108,7 @@ static void coroutine_fn stream_run(void *opaque)
>>  
>>      for (sector_num = 0; sector_num < end; sector_num += n) {
>>          uint64_t delay_ns = 0;
>> -        bool copy;
>> +        bool copy = false;
>>  
>>  wait:
>>          /* Note that even when no rate limit is applied we need to yield
>> @@ -123,7 +123,6 @@ wait:
>>                                  STREAM_BUFFER_SIZE / BDRV_SECTOR_SIZE, &n);
>>          if (ret == 1) {
>>              /* Allocated in the top, no need to copy.  */
>> -            copy = false;
>>          } else if (ret >= 0) {
>>              /* Copy if allocated in the intermediate images.  Limit to the
>>               * known-unallocated area [sector_num, sector_num+n).  */
> 
> Sorry for not spotting this patch earlier. This hunk looks wrong and
> needs to be dropped, I believe. In the ret >= 0 && copy case, there is a
> "goto wait" which would now no longer be able to go from copy == true ->
> copy == false. Not sure if that can happen in practice.

Yes, if the guest writes to the area that the job is copying.  It
wouldn't cause any data corruption, only do useless work on those
sectors.  A better patch would thus remove the initializer and move the
"copy = false" before "if (ret == 1)".

Paolo

> Andreas
> 
>> @@ -138,7 +137,7 @@ wait:
>>              copy = (ret == 1);
>>          }
>>          trace_stream_one_iteration(s, sector_num, n, ret);
>> -        if (ret >= 0 && copy) {
>> +        if (copy) {
>>              if (s->common.speed) {
>>                  delay_ns = ratelimit_calculate_delay(&s->limit, n);
>>                  if (delay_ns > 0) {
>>
> 
> 


