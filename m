Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7NnC-0006ph-HM
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 08:59:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7HM0-0004Yj-5j
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 02:06:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7HLy-0005yX-Dq
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 02:06:40 -0400
Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a]:34265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7HLy-0005yR-8y
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 02:06:38 -0400
Received: by obbkm3 with SMTP id km3so34705162obb.1
	for <qemu-trivial@nongnu.org>; Mon, 22 Jun 2015 23:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rriZnmjIeLzylVNpw+AftApwKw5wkqr6h4If/WdBA1M=;
	b=tLOpJkKVwWAduJKtjKXF0nyiDVfuYlLCn7HAsLLZ4ylUv2JJpMR5xikjXErhOZQ7RO
	tITjIObxxQLoCw1Obqx59q+E2nYmW+tZ07XoOlqf83ySeNff10dukJDBwLnHGXPN3uBz
	JTH5bUGJhRIz+NxhdPtKt51U63j9/74oUkQb0m1gAPaKGlirSOud5/7IY3ptvc+N0i1b
	NV7XCPL2Yj0hjjwijArXPpO0L0jSELuZb7+W+CzPQGmHh5Z890THtjfPPw6VX1/huXA+
	B8J5VUo9BIhaPdvbWseJPDrbAF6pwj6zvvDlxrlh3ngrQIqlUYWL0Bpy+o9RlUn/USVw
	OdFQ==
X-Received: by 10.60.36.165 with SMTP id r5mr13369410oej.84.1435039597776;
	Mon, 22 Jun 2015 23:06:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.56.212 with HTTP; Mon, 22 Jun 2015 23:06:18 -0700 (PDT)
In-Reply-To: <5588F2A0.8040001@huawei.com>
References: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAE4R7bCCSh6dd_t42rzSiYs_+nEc8FreT2ij1F0iRGem+TjWow@mail.gmail.com>
	<5588F2A0.8040001@huawei.com>
From: Scott Feldman <sfeldma@gmail.com>
Date: Mon, 22 Jun 2015 23:06:18 -0700
Message-ID: <CAE4R7bDLotqqmvhb9z0xydvi-VCw6RcZCp3ZasUj2mNZQD6wPA@mail.gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22a
X-Mailman-Approved-At: Tue, 23 Jun 2015 08:59:08 -0400
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] rocker: Fix memory leak reported by
	coverity
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
X-List-Received-Date: Tue, 23 Jun 2015 06:06:41 -0000

On Mon, Jun 22, 2015 at 10:46 PM, zhanghailiang
<zhang.zhanghailiang@huawei.com> wrote:
> On 2015/6/23 13:23, Scott Feldman wrote:
>>
>> On Mon, Jun 22, 2015 at 6:31 PM, zhanghailiang
>> <zhang.zhanghailiang@huawei.com> wrote:
>>>
>>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>>> ---
>>>   hw/net/rocker/rocker.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
>>> index 4d25842..d06116e 100644
>>> --- a/hw/net/rocker/rocker.c
>>> +++ b/hw/net/rocker/rocker.c
>>> @@ -103,6 +103,7 @@ RockerSwitch *qmp_query_rocker(const char *name,
>>> Error **errp)
>>>       if (!r) {
>>>           error_set(errp, ERROR_CLASS_GENERIC_ERROR,
>>>                     "rocker %s not found", name);
>>> +        g_free(rocker);
>>>           return NULL;
>>>       }
>>
>>
>> I'll post a patch to fix this one this way, to report alloc failure:
>>
>
> Yes, this is another way to fix this problem~
>
>> --- a/hw/net/rocker/rocker.c
>> +++ b/hw/net/rocker/rocker.c
>> @@ -96,7 +96,7 @@ World *rocker_get_world(Rocker *r, enum
>> rocker_world_type type)
>>
>>   RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
>>   {
>> -    RockerSwitch *rocker = g_malloc0(sizeof(*rocker));
>> +    RockerSwitch *rocker;
>>       Rocker *r;
>>
>>       r = rocker_find(name);
>> @@ -106,6 +106,12 @@ RockerSwitch *qmp_query_rocker(const char *name,
>> Error **errp)
>>           return NULL;
>>       }
>>
>> +    rocker = g_malloc0(sizeof(*rocker));
>
>
> It's unnecessary to check the return value of 'g_malloc0', because it only
> return NULL when the size is 0, obviously, here it is not
> zero.(sizeof(*rocker)).

My bad.  I like your version better.  :)  I'll Acked-by it.

