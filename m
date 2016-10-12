Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buE9e-0007vv-Db
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 03:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1buE9c-0007vh-3G
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 03:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1buE9V-0005KA-OB
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 03:40:42 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1buE9V-0005Jz-Fu; Wed, 12 Oct 2016 03:40:37 -0400
Received: by mail-wm0-x244.google.com with SMTP id c78so1059526wme.1;
	Wed, 12 Oct 2016 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=9Un1e/I7NjfVe2IIttXJ4MijEslFdI/WYO1pyPI0+dU=;
	b=o+FWYauO0cvTUFNPHWFJ3IPUsWAO3DhmKdHOvRjIvsDS9CM6+fWsu4AKyNLLzhAF3l
	6NooBktiWvhx9dLfMimq+UIfnk0SZloMokgPF8vjMcYNon6kb87+6IPtleyTWs8zw6jZ
	B+jscvF3Ge0Oz5Mm8NLj+yOjJWWj0Pq1J4aS+ANJbEUy21KxD1hfFzrlQ3U8T0LT2lF2
	t6BLwtTG1QDuLNxdGtGIsGNG2KbZrRhA6YV2YKajJmBmBcTDhdboUXXfIlT+NQtKDU7Y
	sd5YaMNdNpyvlQPnqoqIV9jqLQdONlkQyx6aTSUuigqzqqGQiQ0KeUUrs1qZ0XTymkLY
	l7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9Un1e/I7NjfVe2IIttXJ4MijEslFdI/WYO1pyPI0+dU=;
	b=RRcRmc8UIWd4ihuF0y+dbGzLK3QTJpAay0bdBfLBWYKxrRzoM51zhhxr0TdVPEXlPd
	n3nP30oH0G/jAy0oqntnh/qlHir8YS1FkF+rsu+i9UENe5uerwQTrfXJqasOyRj8H1mA
	eZkn7P0tv7STOabDjK2ZqM/12BcM18RpOv1brq4yRx2JC/LSTKmE3HZjp4YyvXgMhNdg
	dVLmIvUw6OCP37OH8r0bbKmHTsxbYVaH2HSFr0BZ7bli/5Jb+ZB4tLipWhPmnt3xn2UO
	6KWX48CFQcO/mKn5mMqdLvnFe46NdAnLB5bz3tRXYWWjFW4/cOi4wfssvMKVPQxGN+pr
	Fv7A==
X-Gm-Message-State: AA6/9RkahkabvbyRB73csEbgszz2PuuEQ1Yf+ntq9bCjDsC6axns4o481kbd+G3HavVOTw==
X-Received: by 10.28.165.130 with SMTP id o124mr1561969wme.54.1476258036760;
	Wed, 12 Oct 2016 00:40:36 -0700 (PDT)
Received: from [192.168.10.165] (94-39-150-81.adsl-ull.clienti.tiscali.it.
	[94.39.150.81]) by smtp.googlemail.com with ESMTPSA id
	y2sm10919128wji.42.2016.10.12.00.40.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Oct 2016 00:40:35 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1476237901-85376-1-git-send-email-arei.gonglei@huawei.com>
	<14f4caf5-3884-bd5a-0f91-b206d578aa76@msgid.tls.msk.ru>
	<33183CC9F5247A488A2544077AF19020B03F1A53@SZXEMA503-MBS.china.huawei.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"Herongguang (Stephen)" <herongguang.he@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <76eac1cd-4005-417c-8700-430b4cf295c2@redhat.com>
Date: Wed, 12 Oct 2016 09:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <33183CC9F5247A488A2544077AF19020B03F1A53@SZXEMA503-MBS.china.huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [PATCH] mmap-alloc: check before use for ptr
 pointer
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
X-List-Received-Date: Wed, 12 Oct 2016 07:40:45 -0000



On 12/10/2016 09:37, Gonglei (Arei) wrote:
>> -----Original Message-----
>> From: Michael Tokarev [mailto:mjt@tls.msk.ru]
>> Sent: Wednesday, October 12, 2016 2:46 PM
>> Subject: Re: [PATCH] mmap-alloc: check before use for ptr pointer
>>
>> 12.10.2016 05:05, Gonglei wrote:
>>> If ptr mmap failed, we don't need to do a superfluous
>>> calculation for offset variable by ptr (MAP_FAILED).
>>
>> What's the point?  There's no problem in extra calculation
>> if mmap failed, yes, but do we really care?  As of it is now,
>> it is more compact and readable, and works.  I think.
>>
> 
> I just think it's more reasonable because the ptr is checked after
> used. Why do we need a extra calculation?

Another reasonable objection (that however your patch doesn't fix) is
that align is being used before the assertion:

     assert(!(align & (align - 1)));

Paolo

> 
> Regards,
> -Gonglei
> 
>> Thanks,
>>
>> /mjt
>>
>>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>>> ---
>>>  util/mmap-alloc.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>>> index 5a85aa3..577862b 100644
>>> --- a/util/mmap-alloc.c
>>> +++ b/util/mmap-alloc.c
>>> @@ -61,13 +61,15 @@ void *qemu_ram_mmap(int fd, size_t size, size_t
>> align, bool shared)
>>>  #else
>>>      void *ptr = mmap(0, total, PROT_NONE, MAP_ANONYMOUS |
>> MAP_PRIVATE, -1, 0);
>>>  #endif
>>> -    size_t offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
>>> +    size_t offset;
>>>      void *ptr1;
>>>
>>>      if (ptr == MAP_FAILED) {
>>>          return MAP_FAILED;
>>>      }
>>>
>>> +    offset = QEMU_ALIGN_UP((uintptr_t)ptr, align) - (uintptr_t)ptr;
>>> +
>>>      /* Make sure align is a power of 2 */
>>>      assert(!(align & (align - 1)));
>>>      /* Always align to host page size */
>>>
> 
> 
> 

