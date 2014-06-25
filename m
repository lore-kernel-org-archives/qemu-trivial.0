Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzwNb-0003RG-4v
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 19:13:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WzvSB-0000o1-Kj
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 18:14:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WzvS2-0005Dr-JB
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 18:14:07 -0400
Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a]:47955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WzvS2-0005Db-6w; Wed, 25 Jun 2014 18:13:58 -0400
Received: by mail-pd0-f170.google.com with SMTP id z10so2171916pdj.15
	for <multiple recipients>; Wed, 25 Jun 2014 15:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=LDihlL0LVSjJwezlOn5tJ9x89Qo+3atx7cgz/6+RDyo=;
	b=aG/M8AUEqi7bM9XR0WYyMf9PR03B316dte3EKD9rSBHR+wnWK5i6t/Ie2oySsM22Lp
	wXXJghalfu01/tX/qL0nB+n3k9l2QAJuY7kkvEj5yPGZvbMz0TCIzh3X6WsPN/ArKOv1
	h0WQs1fSKo07BIME8YD/W6zWVr2ozCY12SYOA+I45B4oYpb2W0EEWno4JT8tuE2sHQqd
	E9UnGbIJPT12863UvDBfki5IMS8hHYqDn3LymAtHgSL/mWHUwXedjzdMo/JvQniYpR1c
	AXRTos9PcCZoUahFP3RJl4gyIWV8hU5+7+5gng3BTL1CZA7dsvGk4yE3bvvHSes4P5hq
	JuWQ==
X-Received: by 10.68.194.134 with SMTP id hw6mr15832328pbc.49.1403734436813;
	Wed, 25 Jun 2014 15:13:56 -0700 (PDT)
Received: from [192.168.1.100] ([223.72.65.93])
	by mx.google.com with ESMTPSA id
	xd11sm24213631pac.8.2014.06.25.15.13.54 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 25 Jun 2014 15:13:56 -0700 (PDT)
Message-ID: <53AB49A4.9030700@gmail.com>
Date: Thu, 26 Jun 2014 06:13:56 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53A84797.9040304@gmail.com>	<20140624104614.GD3458@noname.redhat.com>
	<87d2dywoyn.fsf@blackfin.pond.sub.org>
	<53A9A0A2.9010904@msgid.tls.msk.ru>
In-Reply-To: <53A9A0A2.9010904@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22a
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, famz@redhat.com,
	qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	mreitz@redhat.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial v2] block.c: Add
 return value for bdrv_append_temp_snapshot() to avoid incorrect failure
 processing issue
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
X-List-Received-Date: Wed, 25 Jun 2014 23:13:25 -0000


Thank you for all of your work, if necessary to send patch v3 for it
(may change the comments), please let me know.

Thanks.

On 06/25/2014 12:00 AM, Michael Tokarev wrote:
> 24.06.2014 15:01, Markus Armbruster wrote:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>
>>> Am 23.06.2014 um 17:28 hat Chen Gang geschrieben:
>>>> When failure occurs, 'ret' need be set, or may return 0 to indicate success.
>>>> And error_propagate() also need be called only one time within a function.
>>>>
>>>> It is abnormal to prevent bdrv_append_temp_snapshot() return value but still
>>>> set errp when error occurs -- although it contents return value internally.
>>>>
>>>> So let bdrv_append_temp_snapshot() internal return value outside, and let
>>>> all things normal, then fix the issue too.
>>>>
>>>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>>>
>>> What does this fix?
>>
>> It fixes the return value of bdrv_open() when
>> bdrv_append_temp_snapshot() fails.  Before this patch, it returns a
>> positive value, which is wrong.  After the patch, it returns the
>> negative error code bdrv_append_temp_snapshot() now returns.
> 
> So, what should be done there?   Kevin, maybe you should pick this up
> instead of going -trivial route?
> 
>>> Having both a return value and an Error* object is duplication and
>>> only a sign that a function hasn't been fully converted to the Error
>>> framework yet. We shouldn't introduce new instances of this without a
>>> very good reason.
>>
>> Maybe.  But I very much prefer
>>
>>         ret = foo(arg, errp);
>>         if (ret < 0) {
>>             return ret;
>>         }
>>
>> over
>>
>>         Error *local_err = NULL;
>>
>>         foo(arg, &local_err);
>>         if (local_err) {
>>             error_propagate(errp, local_err);
>>             return;
>>         }
> 
> Yes, this new error propagation is a bit ugly, I dislike it too.
> 
> Thanks,
> 
> /mjt
> 


-- 
Chen Gang

Open share and attitude like air water and life which God blessed

