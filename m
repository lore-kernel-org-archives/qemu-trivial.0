Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnVzl-00037D-BI
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 11:32:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UnThp-0005ti-8a
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 09:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UnThk-0002NT-6e
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 09:06:17 -0400
Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a]:42986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UnThk-0002N8-0G
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 09:06:12 -0400
Received: by mail-bk0-f42.google.com with SMTP id jk13so260041bkc.1
	for <qemu-trivial@nongnu.org>; Fri, 14 Jun 2013 06:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=tafjcKcdDOrjgo1hdbh/8TATAnQ5uLWf9U+HdzUc14I=;
	b=G95D+wCn3B2wwpJbLjaSre9ERuYVA2dOovdjiEoE0uUWcSGyKkAcCf8ZNYWtW9TaF3
	AwQUtOyG2zsZWJM7mILmzrL+Ad/q31b79k0w4BjGmiEE/Wrp3KpysaKnIX9xZrHaZSxo
	F5sjecRNqPo4bsjEy2vANHqJtH2Qy5m/Y99Rb9BgEYCqfjtGAn3PNv6qqtiVkQ96hC9g
	wSw5qv/HeYBAdn6ujHLc4ooXWQwUMHkU+WcyNrc3s2rASfLyzvFg8h+hM71Pv8Ps4zGi
	QsnHq/xzzfm0SdRUhosr97v1lUvA9wt2100eCZAQzAKrrQxbTwkYMGhB04FSNTfhidP0
	X6xg==
MIME-Version: 1.0
X-Received: by 10.204.191.132 with SMTP id dm4mr335892bkb.66.1371215171115;
	Fri, 14 Jun 2013 06:06:11 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Fri, 14 Jun 2013 06:06:11 -0700 (PDT)
In-Reply-To: <20130614070921.GG13787@G08FNSTD100614.fnst.cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
	<1371120709-18923-3-git-send-email-hutao@cn.fujitsu.com>
	<20130614070921.GG13787@G08FNSTD100614.fnst.cn.fujitsu.com>
Date: Fri, 14 Jun 2013 23:06:11 +1000
X-Google-Sender-Auth: pMP-fkb-vWjB20-s1xX3kfBJIoY
Message-ID: <CAEgOgz6j7mFZHATJ_AOoTgOBvW77s1KS8uJ6H3MmR_ZyV1hfUA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Hu Tao <hutao@cn.fujitsu.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQlCxsPyNfcHTUhKwoiHoW/+8QTMaRAiyTCgaz4n6iS7l7LYFKYlvUYO7+MiYOIvBWuQWQUF
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22a
X-Mailman-Approved-At: Fri, 14 Jun 2013 11:32:54 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] remove call to
	type_initialize in object_new_with_type
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
X-List-Received-Date: Fri, 14 Jun 2013 13:06:21 -0000

On Fri, Jun 14, 2013 at 5:09 PM, Hu Tao <hutao@cn.fujitsu.com> wrote:
> On Thu, Jun 13, 2013 at 06:51:49PM +0800, Hu Tao wrote:
>> Since it's called in object_initialize_with_type later.
>>
>> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
>> ---
>>  qom/object.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/qom/object.c b/qom/object.c
>> index 803b94b..38dc45e 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -406,9 +406,6 @@ Object *object_new_with_type(Type type)
>>  {
>>      Object *obj;
>>
>> -    g_assert(type != NULL);
>> -    type_initialize(type);
>> -
>>      obj = g_malloc(type->instance_size);
>
> Well, type->instance_size has to be initialized before this.
>

Missed this reply. Thanks for catching. Sorry for the noise.

Regards,
Peter

>>      object_initialize_with_type(obj, type);
>>      obj->free = g_free;
>> --
>> 1.8.2.3
>>
>

