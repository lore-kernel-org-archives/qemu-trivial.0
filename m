Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbFr8-00058s-Lq
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 20:43:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFr6-00050h-4Y
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 20:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFr5-0001nJ-A9
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 20:43:44 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbFr0-0001jC-QG; Fri, 28 Jul 2017 20:43:38 -0400
Received: by mail-qk0-x244.google.com with SMTP id q66so22457082qki.1;
	Fri, 28 Jul 2017 17:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NhoJcxM+Uae92FWYb6iDbZCaXB8hv6oNYwZ01ixjyoQ=;
	b=Ticdhd/Uqlw+1xLXi6nPkUL8E90wMswcnphTfoYnoaNiiFsq9MZKkI6GgHjrkYvLmq
	lpWyQRo83FQeEC3nxzwQmkV/XH0iKTtTKo3EJb8X2/jrXF8sl1+M3KYSlbGqvzVMJ3OR
	o3oPNhefLq2Ci7IGHeiz8e2wCHWDl5CwCMyv7pMfJqYm3XOQNeFolkgvaQxf83NAxgWX
	woNUy1AtBFvypSoGGwS5QJYYceGChkPzw11upHERe4lotmQDaOSMwhX7e+QiMaHpC87L
	pUn2G+8gQ3l9qRr2JP159cS16GqY/+wDTTf/H+KmR7oxNhmHQKmtw1nU5jPzYMxVcNjc
	NyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NhoJcxM+Uae92FWYb6iDbZCaXB8hv6oNYwZ01ixjyoQ=;
	b=ce0418a/77ZpmVpQ8QeZY9rendio41yaGUq9jiInqaVzDIdmw9Dh4Xpj/7IspyQGC1
	D1cpZaEUrTTTD4in56g7U+sXg9TwqC+OOT3msdwIsvgf7PVHxj6OipgNr7a2SbV+QvVi
	ZoRzjQjm7Sapsm/Lo34xPat7PTzSZKsxaMGPFe7fZs89i4vIv+Zxe+c1LbahEdG8gKQp
	/EnvkRz/hKyj9EDqkuRCRB3FOKx2wfVVyokajre5xVgNm46lNYmHMryeeDTmCN5U/c8k
	V1gAfJWFC6EZ0JYiJ2JHoXbgOaonwzvGshlcLYzDkaDtauT+FnfthVrC+3HX1yyb1rlx
	irMA==
X-Gm-Message-State: AIVw112atfL/2xsVupKzxjEjwvgl6ejUfD0cVRlsf4MSkR4+pAHqOSVz
	ANn5npJ+Q+JerwDQbhsHTQ==
X-Received: by 10.55.71.69 with SMTP id u66mr12527134qka.187.1501289017803;
	Fri, 28 Jul 2017 17:43:37 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	p1sm16007749qke.16.2017.07.28.17.43.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 17:43:36 -0700 (PDT)
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
Message-ID: <3d534366-8c19-5cdc-aeff-21800dde5dfb@amsat.org>
Date: Fri, 28 Jul 2017 21:43:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c3c6b7df-6629-982a-3135-a739979c36e7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
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
X-List-Received-Date: Sat, 29 Jul 2017 00:43:45 -0000

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

         M: Mail patches to: FullName <address@domain>
         R: Designated reviewer: FullName <address@domain>

M: is mail of maintainer
R: is mail of reviewer

         S: Status, one of the following:

            Maintained:  Someone actually looks after it.
            Odd Fixes:   It has a maintainer but they don't have time
                         to do much other than throw the odd patch in.
->         Orphan:      No current maintainer

"Orphan" sounds the best fit... Do you want to raise it to "Odd Fixes"? 
This implies having a maintainer... I don't feel confident enough to Ack 
cocci scripts but an incorrect cocci script will not break QEMU so maybe 
I cat take M: for Odd Fixes, and lowering it back to Orphan without 
maintainer is 1 commit easy :)

> 
> Just don't add it to the file.  It doesn't have a specific owner.

Paolo you mean don't add the "S: Status" to the MAINTAINERS file, or the 
"F: *cocci*" entries?

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

