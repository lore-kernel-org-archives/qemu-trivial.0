Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRZXw-0006oj-EE
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 04:20:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRZXt-0006mg-VY
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 04:20:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRZXq-0005BF-QA
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 04:20:41 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRZXq-00059v-HP
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 04:20:38 -0500
Received: by mail-wm1-f65.google.com with SMTP id r11-v6so20920701wmb.2
	for <qemu-trivial@nongnu.org>; Tue, 27 Nov 2018 01:20:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RX2KeTWVdsHUhC6yoDeZ2iQ4a5iArND2melyXfLPHKU=;
	b=nsAwxblI7H0gBXmnEoCMLQn7U1SQTzfl9r0Q+gsfYcXztkdDcVrwqme7KkMKs71ntU
	FqGSBpqlcs0tTCqt1RVA0fYCRoDPnYA0Ma0/6X9qhXWxQ0mjVg7jh3Xd8VZBkGLP3RJ4
	jdyeLAJrRuZewg7bj3tWYcUX5LSdFFD+Zc1dhnSAZoK90x92cRR5YEzPOevJ/wyWFvQp
	7VGTqJUp5ULoElrq+MppisCO1AVP5vw8O9YwmI3QkfXXUz27v9pvFlX0oD4HkonkF83z
	AJG5Q/eR+8xKFagYLLJdfrfvNRY0T2AFdYz7qZMHEoT/hCptHeYmhRrwX/+M+H+gW1vh
	exWg==
X-Gm-Message-State: AA+aEWZy6THhyMecqx3DAucIyEUX+6F/B9jvnzdU++RnOrn6oi6cfpwm
	sRVugoZJoRNmmubVJ/tKytN9FA==
X-Google-Smtp-Source: AJdET5fEXn+IoQBkH9Q4Zl9PMvD1RnNyT90hKRuXiBYsAl3Dltm9i0b2LhDCXQZK7dzhVt4yHY90qA==
X-Received: by 2002:a1c:b1d5:: with SMTP id a204mr27278577wmf.32.1543310436795;
	Tue, 27 Nov 2018 01:20:36 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id f2sm3227945wru.14.2018.11.27.01.20.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 01:20:36 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-26-philmd@redhat.com>
	<5fedf421-a138-041a-638b-98f3fd3ffeef@redhat.com>
	<87h8g2uc9f.fsf@dusky.pond.sub.org>
	<16ab3c47-f521-3172-6e49-acb7a3d7d233@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <45adf9ec-e173-0a0e-1b3f-7d12881573d8@redhat.com>
Date: Tue, 27 Nov 2018 10:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <16ab3c47-f521-3172-6e49-acb7a3d7d233@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.1 25/25] MAINTAINERS:
 Remove duplicate entries of qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 27 Nov 2018 09:20:43 -0000

On 27/11/18 10:18, Paolo Bonzini wrote:
> On 27/11/18 09:59, Markus Armbruster wrote:
>>>>  LINUX
>>>> -L: qemu-devel@nongnu.org
>>>>  S: Maintained
>>>>  F: linux-*
> 
> This pattern only matches
> 
> ./block/linux-aio.c
> ./stubs/linux-aio.c
> 
> so it can be removed
> 

OK

>>>>  F: linux-headers/
> 
> For this I propose mst, Conny and myself.

Or remove... I'll let them opinate.

> 
>>>>  POSIX
>>>> -L: qemu-devel@nongnu.org
>>>>  S: Maintained
>>>>  F: *posix*
>>>
>>> I agree that we can remove the "L: qemu-devel" entries everywhere, but
>>> for these subsystems that have no "M:" entry, but "S: Maintained", this
>>> now looks somewhat strange - the subsystem is "Maintained" but has no
>>> maintainer? I think we need somebody who feels responsible to pick up
>>> patches here...?
>>
>> It looks strange because it *is* strange.  If we take the definition of
>> S: in MAINTAINERS seriously, we need to appoint a maintainer (a person,
>> not a mailing list), or downgrade to S: Orphan.
> 
> I can volunteer for this one too, but please change the F: patterns to
> 
> F: os-posix.c
> F: include/sysemu/os-posix.h
> F: util/*posix*.c
> F: include/qemu/*posix*.h

OK, will do.

Thanks Paolo,

Phil.

> 
> Thanks,
> 
> Paolo
> 

