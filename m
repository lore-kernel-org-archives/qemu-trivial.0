Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfS0x-0000fb-A3
	for mharc-qemu-trivial@gnu.org; Wed, 09 Aug 2017 10:31:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfS0v-0000eH-7S
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:31:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfS0u-0002dH-2l
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:31:13 -0400
Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241]:34902)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfS0p-0002XX-7L; Wed, 09 Aug 2017 10:31:07 -0400
Received: by mail-ua0-x241.google.com with SMTP id d29so3983713uai.2;
	Wed, 09 Aug 2017 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Q0ld29Bg03eVspEZEub+4zG2SUNY/v3X9jG9g+vuxvE=;
	b=cjfB6ulxKhq8JgSwRCmc7O2B5oicpTnJzlqj04u5o4zLQphE8lDMaKBs+Ju5yY2CJx
	CFJ2GJUUIMqCqUC5ezlMTImjDu2b38FzBs/OR6jMutDccAgCSrFnbpF4JJdNfQ5PpPz3
	0eYljOiJnUj38sBmYGjnKW0IYsGIPq9aMLsTNOAXLZoi6n3dXuKf/IYRmQ0kN4iPjn1m
	rGxoMSMTzft5daoOE5VYNded9WXgJwa0EQ0AMdWHqugIZNoEpVyGOFohf0XSrHcy1OAl
	JhjDB3VLndbE47ip7FCNiUDwu/u3F6ENSGjjdETuRzl9GwJVL4pyxyP7OXN13n5vjSWx
	2gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Q0ld29Bg03eVspEZEub+4zG2SUNY/v3X9jG9g+vuxvE=;
	b=Xvqwi3iGqUI9mptJ79JreiCimmzrorvwtTX3vn32DpNUt8jnyhvcFMRDqd4HjPgr/K
	/H9wFFnpeRGya7d+kSoG2pgcvTIE0vIU4wc31Kw2v4oht4lqJqSkaEs/3aixKZEjNK8E
	r1LZRGS4ELM8vP+TY8nSZYA5MHzMGuE2OpU5ljlPvJvGejJw987jbZ7QlhVvvlb3eJ0C
	lC8SVAYJyV5F+WsOlW9T3NRmdPr6gD7fHAnCyXLSA+2c5aZYl9N+NVu594If9mKIK6ra
	9FMDs/bCze7yOdRQ11+6x4yt7pyWp3zNkGAEc3k6t/jgtmQ94gHsdZjSMN5rnN1NhKRr
	W82g==
X-Gm-Message-State: AHYfb5h/dlYX+1W1KwsSP2PDHheK3to7OuWhxrUJQdmk8TPM67Wk0vwo
	baMbbPhlkLHWkmfa5FI=
X-Received: by 10.159.61.17 with SMTP id l17mr5746302uai.78.1502289066313;
	Wed, 09 Aug 2017 07:31:06 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	z23sm1552338uab.45.2017.08.09.07.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:31:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <famz@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
	<lvivier@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-47-f4bug@amsat.org>
	<20170728062426.GQ5117@lemon.lan>
	<c3c6b7df-6629-982a-3135-a739979c36e7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <68e8b9be-17e0-479f-3ec1-84fad488dbc0@amsat.org>
Date: Wed, 9 Aug 2017 11:31:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c3c6b7df-6629-982a-3135-a739979c36e7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 46/47] MAINTAINERS: add
 missing entries for Coccinelle scripts
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
X-List-Received-Date: Wed, 09 Aug 2017 14:31:14 -0000

Hi Paolo,

On 07/28/2017 08:50 AM, Paolo Bonzini wrote:
> On 28/07/2017 08:24, Fam Zheng wrote:
>> On Fri, 07/28 02:36, Philippe Mathieu-Daudé wrote:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 224890643d..7854792765 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1537,6 +1537,12 @@ Checkpatch
>>>   S: Odd Fixes
>>>   F: scripts/checkpatch.pl
>>>   
>>> +Coccinelle scripts
>>> +R: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> +S: Orphan
>>
>> "Orphan" sounds like we don't care much anymore but I suppose this is not the
>> case. But I don't have any better idea either.
> 
> Just don't add it to the file.  It doesn't have a specific owner
I thought an entry with F: but no M: was incorrect but apparently 
get_maintainer.pl works and report it as "unknown" status, as for the 
"Coroutines" section:

$ ./scripts/get_maintainer.pl -f util/coroutine-ucontext.c
Stefan Hajnoczi <stefanha@redhat.com> (unknown:Coroutines)
Kevin Wolf <kwolf@redhat.com> (unknown:Coroutines)
qemu-devel@nongnu.org (open list:All patches CC here)

So to enjoy the R-tag I'll remove the S-tag in v2 and see if Eric is ok 
with it :)

Regards,

Phil.

> 
> Paolo
> 
>>
>> Fam
>>
>>> +F: scripts/cocci-macro-file.h
>>> +F: scripts/coccinelle/
>>> +
>>>   Migration
>>>   M: Juan Quintela <quintela@redhat.com>
>>>   M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> @@ -1970,4 +1976,3 @@ Build system architecture
>>>   M: Daniel P. Berrange <berrange@redhat.com>
>>>   S: Odd Fixes
>>>   F: docs/devel/build-system.txt
> 

