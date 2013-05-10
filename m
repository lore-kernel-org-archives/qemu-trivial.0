Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UapQq-0002TR-Nf
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2013 11:40:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>) id 1UapQm-0002Oc-No
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 11:40:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>) id 1UapQj-0004qA-AS
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 11:40:24 -0400
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f]:59664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>)
	id 1UapQc-0004pD-Gu; Fri, 10 May 2013 11:40:14 -0400
Received: by mail-la0-f47.google.com with SMTP id fh20so4055004lab.6
	for <multiple recipients>; Fri, 10 May 2013 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RZTq67FnzP8xxFsmqAkdZNNQ5w0PX6ZGMWmRkVE6bmM=;
	b=C3r45IR7XBzM7W5GtQ2zlvpyhF5tYChF5oZwd8YUzXl0DNR9BHdN9Uy8k3RQdpWSWw
	qQM+zsGh66OujvudByYZCWpgpL/O6oj+QGQPJQGT9UJ2rO4blxOszq11x8/DHgJIgYMY
	eqAym0RpzTmSgtQonffQJHexF5lJ0AWMiOSC2f4HKVtQ6eKav6qGqzy9giqWQ7AemYCy
	5+YyffjLHr7d7gxKGm6QcznSrOk/OGsjG0hieNiVZFlyPMXJV19sA5pfZsbDb/O3Kq/q
	MDMprnbFbenLq6jgt6BNfxPU5qnKi6LWIWn5fLjWJnFTKH7luriM7oJ8VbtRMtPCtVVy
	LWVw==
X-Received: by 10.152.27.170 with SMTP id u10mr787852lag.45.1368200413388;
	Fri, 10 May 2013 08:40:13 -0700 (PDT)
Received: from localhost.localdomain ([79.164.42.118])
	by mx.google.com with ESMTPSA id w9sm1061876lbe.6.2013.05.10.08.40.11
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 08:40:12 -0700 (PDT)
Message-ID: <518D14D8.9040300@gmail.com>
Date: Fri, 10 May 2013 19:40:08 +0400
From: Igor Mitsyanko <i.mitsyanko@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1368198990-44941-1-git-send-email-i.mitsyanko@gmail.com>
	<CAFEAcA_zpWNN0uPb3pYUxGw4USX8+NFS4_+b4MO8uBdwDEDLwA@mail.gmail.com>
In-Reply-To: <CAFEAcA_zpWNN0uPb3pYUxGw4USX8+NFS4_+b4MO8uBdwDEDLwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22f
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, aliguori@us.ibm.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] osdep.h: include
 sys/types.h for ssize_t definition
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
X-List-Received-Date: Fri, 10 May 2013 15:40:27 -0000

On 05/10/2013 07:24 PM, Peter Maydell wrote:
> On 10 May 2013 16:16, Igor Mitsyanko <i.mitsyanko@gmail.com> wrote:
>> This fixes build for mingw32
>>
>> Signed-off-by: Igor Mitsyanko <i.mitsyanko@gmail.com>
>> ---
>>   include/qemu/osdep.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index 42545bc..17946a3 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -163,6 +163,8 @@ int qemu_create_pidfile(const char *filename);
>>   int qemu_get_thread_id(void);
>>
>>   #ifndef CONFIG_IOVEC
>> +#include <sys/types.h>
>> +
> This is quite a long way down to have a system #include.
>
> Can we just take the existing include of sys/types.h at
> the top of the file out of its current #ifdef __OpenBSD__
> guard ?
>
> (http://hacks.owlfolio.org/header-survey/ has a full row
> of greens for sys/types.h so this should be safe.)
>
> thanks
> -- PMM

Nice link.
Long way, yes, but there's "#include <sys/uio.h>" even further down in 
this file. But I guess taking existing sys/types.h is still better, I'll 
resend it.

