Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNIWy-0004JJ-PA
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jul 2016 07:40:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bNIWw-0004HB-Ty
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 07:40:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bNIWv-0005IU-F6
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 07:40:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52425)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bNIWp-0005Hy-TA; Wed, 13 Jul 2016 07:40:36 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17F96155E3;
	Wed, 13 Jul 2016 11:40:35 +0000 (UTC)
Received: from [10.36.112.66] (ovpn-112-66.ams2.redhat.com [10.36.112.66])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6DBeVuM018216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 13 Jul 2016 07:40:33 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1468400796-30474-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<4b36498b-a15f-1da3-0792-40709c2c230d@redhat.com>
	<578628A0.60400@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aaf97fcf-e706-7305-08a0-3c1e99887456@redhat.com>
Date: Wed, 13 Jul 2016 13:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <578628A0.60400@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 13 Jul 2016 11:40:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-timer: remove unnecessary code
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
X-List-Received-Date: Wed, 13 Jul 2016 11:40:43 -0000



On 13/07/2016 13:40, Cao jin wrote:
> 
> 
> On 07/13/2016 06:21 PM, Paolo Bonzini wrote:
>>
>>
>> On 13/07/2016 11:06, Cao jin wrote:
>>> When passed argument 'ns' is 0, macro DIV_ROUND_UP will return 0 also.
>>
>> It's potentially slower though.
>>
> 
> Is it because the function in the i/o loop path, so the potentially
> extra arithmetical instructions matters?

It is quite common for ns to be zero, for example if a bottom half has
to be invoked.

However, qemu_timeout_ns_to_ms is not used in the really important path
(which is aio_poll in aio-posix.c) so I guess your patch is okay.

Thanks,

Paolo

>> Paolo
>>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>>> ---
>>>   qemu-timer.c | 6 +-----
>>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/qemu-timer.c b/qemu-timer.c
>>> index eb22e92..cfe0893 100644
>>> --- a/qemu-timer.c
>>> +++ b/qemu-timer.c
>>> @@ -285,12 +285,8 @@ int qemu_timeout_ns_to_ms(int64_t ns)
>>>           return -1;
>>>       }
>>>
>>> -    if (!ns) {
>>> -        return 0;
>>> -    }
>>> -
>>>       /* Always round up, because it's better to wait too long than
>>> to wait too
>>> -     * little and effectively busy-wait
>>> +     * short and effectively busy-wait
>>>        */
>>>       ms = DIV_ROUND_UP(ns, SCALE_MS);
>>>
>>>
>>
>>
>>
> 

