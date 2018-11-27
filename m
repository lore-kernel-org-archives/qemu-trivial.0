Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRZdz-0000VN-34
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 04:26:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRZdw-0000V4-Sc
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 04:26:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRZdt-00027H-Ne
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 04:26:56 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36331)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRZdt-00026j-IF
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 04:26:53 -0500
Received: by mail-wr1-f67.google.com with SMTP id t3so21878272wrr.3
	for <qemu-trivial@nongnu.org>; Tue, 27 Nov 2018 01:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZcstNKZkK1xRe8SQRyLcoBtelBTK2KYOb4fljriZB5w=;
	b=CruXnJyXaT21mf+F4Lpko5k697h3vPl6CpfaDBihTP8aW0LqWjeRzHCdXr0ZxcenK0
	ALHUeXtaBTvNDh3SJYGcJGOsmQAQbOgZHRbJVWj6FCrVuqEFjtErgTfKTZbnncswtKYH
	AnX/jfZhkuU15HXnqkUak0J8nfFQy64gqqhiKFTmxU2S49sRqwWCxHf2aBBqkhdp2uu0
	bscbYlTdAdg9AW60Co7jy8GKwwKNU0pQzt1em4N4X5xYc6/JezZI3KEjqc1zmahOp2wM
	ZayknC/2RNEL+9zPGUojb8WKLeVrYsHDOm1GMLY/9AYxgE3dabd6HLww6lf1Bw8cA0n3
	9bNg==
X-Gm-Message-State: AA+aEWZ+n+7JqVZnMAXFUbSEMYt5sVBUHQCScntCaCy1JElHOcsxtHl/
	xtUnzqQNpXtJOAcly/dbXmWkRQ==
X-Google-Smtp-Source: AFSGD/VydpNeQR1F+nODCHrwFTU6GknPVFZuu/7ZO+ZZPw2N6K1A5Wx7EsAOjo3oPlTIQld2Vpxzxg==
X-Received: by 2002:a5d:454f:: with SMTP id p15mr28692007wrr.39.1543310812446; 
	Tue, 27 Nov 2018 01:26:52 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	x79sm8368209wmd.42.2018.11.27.01.26.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 01:26:51 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-23-philmd@redhat.com>
	<1fc0d0cb-dead-be57-e4d1-590eed9929a7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <65812dfc-9c6d-5a82-482a-6cf9843f426a@redhat.com>
Date: Tue, 27 Nov 2018 10:26:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1fc0d0cb-dead-be57-e4d1-590eed9929a7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [PATCH for-3.1 22/25] MAINTAINERS: Add a missing
 entry to the New World machines
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
X-List-Received-Date: Tue, 27 Nov 2018 09:26:58 -0000

On 27/11/18 8:22, Thomas Huth wrote:
> On 2018-11-25 21:49, Philippe Mathieu-Daudé wrote:
>> The CHRP NVRAM has his own section, but since the New World
>> section contains the mac_nvram.c, it makes sens to also monitor
>> the corresponding header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 92691589b1..a248c8c564 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -930,6 +930,7 @@ F: hw/nvram/mac_nvram.c
>>  F: include/hw/misc/macio/
>>  F: include/hw/misc/mos6522.h
>>  F: include/hw/ppc/mac_dbdma.h
>> +F: include/hw/nvram/chrp_nvram.h
> 
> I don't see the point why we should add duplicated entries here? The
> header is also used by the Sparc machines, so why should this be added
> additionally to the Mac machines only here, too? I suggest to drop this
> patch.

OK, will drop.

