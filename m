Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Qqt-0001RS-RA
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 10:13:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QCy-0002XH-5L
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:31:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QCv-00060m-1F
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:31:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39369)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8QCu-0005ww-Mp
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:31:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id 61-v6so12829072wrb.6
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 06:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9sLEqkQYatXIoM2w2hsoiNOMXxEF3yP44HLq4JnKQdQ=;
	b=B3kahJ3iIourwUMikY62tWvSMLg0w80FZCqBhkZSN5x6ssUQPa/ZJ4yjHc7q+hM0Ll
	cIhKXzY0ua7+UP76MRj/IsszoAFMNQoH5/1Kvk04WjlNm36uGmU4owEftJkdTk6AzAIX
	zSWiqTkIWRmuZELoRFwkYaIf54WkosXRenVT/zDyP17Kzf2lA4wyHPU7kEfbkD0C/pFq
	TprT/QFuH6b3LL+YpnbQOqh+uS53JkEfswC5pVi1uEheyHAANOVwUPGpYjtXWZUT5uJ1
	DbetUDyAtY3U0mtMt0vUNl43ZR5pGxNVJLUbXEK8JjCgcYYWOJZ72/6MtdXHuaX4RFMA
	6img==
X-Gm-Message-State: ABuFfogdOTKithCv+SZWlUyX8VgyKryHJM/ioGBzZVaUpjlSmczXgCS7
	gPKMgJyzPfz1c+tGLMBc60MKUQ==
X-Google-Smtp-Source: ACcGV60gRwrRkMkAATNQCgxWF9/GlBtOmsdq6ta7tv/5+EJJm7N9jUYdWLG04mTzFKEqJ+wZTc6dhw==
X-Received: by 2002:adf:afdd:: with SMTP id
	y29-v6mr8862784wrd.176.1538746311587; 
	Fri, 05 Oct 2018 06:31:51 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	y7-v6sm2297850wmy.27.2018.10.05.06.31.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 06:31:50 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-2-crosa@redhat.com>
	<5616e4d4-938c-4e5f-6fe0-64e52d2fe6a7@redhat.com>
	<0a405ae6-d69a-8e04-e3dc-3b7883447248@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e5944b57-0778-b8ae-6805-0678970a12fa@redhat.com>
Date: Fri, 5 Oct 2018 15:31:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <0a405ae6-d69a-8e04-e3dc-3b7883447248@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
X-Mailman-Approved-At: Fri, 05 Oct 2018 10:13:08 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/10] qemu-img.c: comment
 typo fix
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
X-List-Received-Date: Fri, 05 Oct 2018 13:31:58 -0000

On 04/10/2018 18:53, Cleber Rosa wrote:> On 10/4/18 12:48 PM, Eric Blake
wrote:
>> On 10/4/18 11:18 AM, Cleber Rosa wrote:
>>> A trivial comment typo fix.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>   qemu-img.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/qemu-img.c b/qemu-img.c
>>> index b12f4cd19b..a96b76c187 100644
>>> --- a/qemu-img.c
>>> +++ b/qemu-img.c
>>> @@ -1085,7 +1085,7 @@ static int64_t find_nonzero(const uint8_t *buf,
>>> int64_t n)
>>>   }
>>>     /*
>>> - * Returns true iff the first sector pointed to by 'buf' contains at
>>> least
>>> + * Returns true if the first sector pointed to by 'buf' contains at
>>> least
>>
>> NACK.  You're not the first person to propose this change.  However,
>> "iff" is an English word (albeit archaic) which is shorthand for "if and
>> only if", which has a distinct logical meaning separate from the weaker
>> "if".  Spelling it out in longhand instead of calling it a typo is
>> probably acceptable, though.
>>
> 
> Wow, thanks for the explanation.  I agree that spelling it out is a good
> option, as it'll probably prevent other people from falling into the
> same "language trap" as I did.

https://lists.gnu.org/archive/html/qemu-devel/2011-06/msg01269.html

https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg04200.html

;)

