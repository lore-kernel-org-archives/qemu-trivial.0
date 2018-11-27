Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRghm-0002u0-8z
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 11:59:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRghe-0002m3-R0
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:59:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRgZC-00076X-42
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:50:34 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRgZB-000768-Ux
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:50:30 -0500
Received: by mail-wm1-f66.google.com with SMTP id n133so6199136wmd.4
	for <qemu-trivial@nongnu.org>; Tue, 27 Nov 2018 08:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=X/xkKfGX/HftLKirSiSbt9uxFqpmvyjJB0J+lykjqW8=;
	b=V/fSTehqbftlV1UjPwud3a8iZ23d5/0+CxZMVVnZ3t3zblpbXgCxaJHx0O/pH2DExT
	P4znvZ4gzOJjx7BoDsX3g225UOef7MqMaBoMtmKBavHrJEGotIb4WLZ2ROevB0pIzWUQ
	zkvz1qXxiql6wJa2hgrwZuVFJEvFFiSCtvgWNr+0JqW9RJu+KyeO1FlAD5xhsIlzeJEF
	VAkunNSlR26dsErv0w0UuxYPFLQy6M7TEzJGgJLmbZAbr7xq/dWiad+ruVqmKWiNden6
	YD5Oys3/+fcKMwwRK0UMPcIBZlhdD72lKplWSyZzTf0HTxQGzJa+NB/VkwWFv9rHZAua
	9tEw==
X-Gm-Message-State: AA+aEWbwm7Aw4URAimG8oPOaJgpEaVQLV9GCfvdmDTTddd4wXOE0LR7l
	T3727ksZ42FZMGijWTapWwKavg==
X-Google-Smtp-Source: AFSGD/XFabR5e2qw9XBMG2hgVdUIP54lhUIHeYx2IGICkC0Kc5XbwBVb+eeHswQJuo9sx996m86Ewg==
X-Received: by 2002:a7b:c245:: with SMTP id b5mr26308355wmj.42.1543337428967; 
	Tue, 27 Nov 2018 08:50:28 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	b131sm4561941wma.21.2018.11.27.08.50.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 08:50:26 -0800 (PST)
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
	Fam Zheng <famz@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-14-philmd@redhat.com>
	<20181127093552.4f53790d@x1.home>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9225e792-010f-4882-4d82-477f6cb393e9@redhat.com>
Date: Tue, 27 Nov 2018 17:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181127093552.4f53790d@x1.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [PATCH for-3.1 13/25] MAINTAINERS: Add missing
 entries to VFIO
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
X-List-Received-Date: Tue, 27 Nov 2018 16:59:18 -0000

On 27/11/18 17:35, Alex Williamson wrote:
> On Sun, 25 Nov 2018 21:49:48 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bfe71f2555..e124792557 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1326,6 +1326,8 @@ M: Alex Williamson <alex.williamson@redhat.com>
>>  S: Supported
>>  F: hw/vfio/*
>>  F: include/hw/vfio/
>> +F: include/qemu/vfio-helpers.h
> 
> This misses util/vfio-helpers.c, both of which are contributed by Fam
> and currently only used by nvme.  I really haven't done anything with
> them, so they should probably be under the NVMe block driver, but if it
> makes more sense for me to look after them, I can start paying more
> attention to them.  I'm not sure signing someone up for new files
> they've never touched counts as trivial ;)  Thanks,

OK (Cc'ed Fam).

Laurent, can you unqueue this patch? (sorry).

Thanks,

Phil.

> 
> Alex
> 
>> +F: docs/igd-assign.txt
>>  
>>  vfio-ccw
>>  M: Cornelia Huck <cohuck@redhat.com>
> 

