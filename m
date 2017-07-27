Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daoId-0006jK-2D
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 15:18:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daoIa-0006hJ-2Q
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 15:18:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daoIZ-00011H-30
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 15:18:16 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daoIV-0000zV-AK; Thu, 27 Jul 2017 15:18:11 -0400
Received: by mail-qk0-x244.google.com with SMTP id v76so7608867qka.5;
	Thu, 27 Jul 2017 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=GrjyORiPYmA0uSlhCZOkzJpSMkUDFxPFuBxtUmDeQew=;
	b=bUS85/GNX0SdhuN6itEuZuKsIC/ndI3rUOvFTSAFhJ3EoLNfIf16MzJXYbStmLQlO/
	sXmNo2ohkpKeWfQpFqf8ZCmT4o1zxOJTny4rM22rvbF3uBpdW1JqcpwzU0jcl6TumY3s
	Fw77w83TcT28+YclzuWovxg9xIBATqpkOS67zp3+H3yCqFoZmuJJIoRricCSVVXyi/Ef
	RkgJN7rW55jzGIpLbKcOltWrF31gl5qlQSfF4iNiqO91HCKtQHi1xeuzDDB2SX5JHLLE
	kFuz8+u9d8pDLMyp7Z0LH1KoiIBQgAL3Qm8QhcAyERflLbxlyAzyyReuqKKvsxBhivbE
	b8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GrjyORiPYmA0uSlhCZOkzJpSMkUDFxPFuBxtUmDeQew=;
	b=DDK4n/jFZAxX0YieYiQPEgx5516pKE8NY9ax0+EMRJqH1ccFtgo7yDn54vQGek2GR1
	ZIvVBeDl3wpl+oX0iK7+cjwjOk6SrQ4gdbFnfzduU4tipavv6JLBoPvsUGaHDQ+mJkh6
	8OUG8ZoAZE1UxukHlbh9HQdIWU/xXYvdgkGLbQCiMEIkUrrYBPMxk6VnyHXNDuNvEdfe
	7IyY5GJeAyYNtN4aIaN5/CpiZWQW9NsZiyyNKDJOycwdvMwlRRZhVXTfZh0RIi6vT4Dz
	gc19aTxXE0z0+olOOcPjsNwiE2rB5a5JuFKPNzKIkAbtn0kIR2Ge+bDdTgHJfbhREeI1
	FiZw==
X-Gm-Message-State: AIVw112/JLeAzcbIu9oi6A5fMiYJ7ZwuyPVyEWDg0LAicQAYbvzJ1Tcd
	rjTLfXPZh6a2lw==
X-Received: by 10.55.169.134 with SMTP id s128mr6980852qke.69.1501183090727;
	Thu, 27 Jul 2017 12:18:10 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id c19sm4160630qkg.6.2017.07.27.12.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 12:18:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, "Aneesh Kumar K . V"
	<aneesh.kumar@linux.vnet.ibm.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-18-f4bug@amsat.org>
	<20170727134005.76e74eb6@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <96837087-e5a3-3c8c-63f3-fab1f821274a@amsat.org>
Date: Thu, 27 Jul 2017 16:18:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727134005.76e74eb6@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 18/20] 9pfs: avoid sign
 conversion error simplifying the code
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
X-List-Received-Date: Thu, 27 Jul 2017 19:18:17 -0000

On 07/27/2017 08:40 AM, Greg Kurz wrote:
> On Wed, 26 Jul 2017 23:42:22 -0300
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Now, I'm not sure this can be merged during hard freeze since it is
> more code cleanup than actual bug fixing...

Hmm the commit message is probably not enough.
The problem is this code can send broken packets, see inlined:

> 
>>   hw/9pfs/9p.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
>> index 333dbb6f8e..0a37c8bd13 100644
>> --- a/hw/9pfs/9p.c
>> +++ b/hw/9pfs/9p.c
>> @@ -945,7 +945,6 @@ static void coroutine_fn v9fs_version(void *opaque)
>>       v9fs_string_init(&version);
>>       err = pdu_unmarshal(pdu, offset, "ds", &s->msize, &version);
>>       if (err < 0) {

if err == -1

>> -        offset = err;

here this sets offset = (size_t)(-1) = SIZE_MAX

>>           goto out;
>>       }
>>       trace_v9fs_version(pdu->tag, pdu->id, s->msize, version.data);
>> @@ -962,13 +961,12 @@ static void coroutine_fn v9fs_version(void *opaque)
>>   
>>       err = pdu_marshal(pdu, offset, "ds", s->msize, &version);
>>       if (err < 0) {
>> -        offset = err;
>>           goto out;
>>       }
>> -    offset += err;

here offset += SIZE_MAX which wraps, so this equivs to offset -= 1

>> +    err += offset;
>>       trace_v9fs_version_return(pdu->tag, pdu->id, s->msize, version.data);
>>   out:
>> -    pdu_complete(pdu, offset);

now we have offset = 7 - 1 = 6, since 6 > 0 pdu_complete() does not 
marshal the error code but 6 bytes of crap from pdu?

Maybe I missed something.

>> +    pdu_complete(pdu, err);
>>       v9fs_string_free(&version);
>>   }
>>   

Regards,

Phil.

