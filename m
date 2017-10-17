Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Ula-0005yQ-FI
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4UlX-0005vr-V0
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4UlX-0004c7-8w
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:30:51 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:54587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4UlT-0004XY-Do; Tue, 17 Oct 2017 12:30:47 -0400
Received: by mail-qk0-x242.google.com with SMTP id n5so2764845qke.11;
	Tue, 17 Oct 2017 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RV8vRpJt32j8G9bq/Udr4MGJyFfjl/M5y/v9qT1g8Fc=;
	b=cCpJObAIMXCV65kstJ50lGfI0mn5f2c4Vf94/wzDxi++t5zu+e8AKnZq+qvfEHeC2P
	dNupKDPp8mPC0iltMdycIi7J/35Vo4cSbFQM0OQV+F6OeIVqNvlim/IjQBB76qolsA1I
	7tRTZXaWPOrOFlxmPEyI6lVcv4ZVDOpKx3sVDUJnbvJA3ft/TWJ+KuQFNArXSGel8J4S
	VEx2BN+T7V24uhlD9Q1GViyejhpjWK7lN903PYaa6IWwIS26IpEfH6mknjcOF5HtGkjO
	/J0ar5L4XWKn3Bmb1zCCNvjtt5y4+IfJl4f+6la6CrdlANXyR3d2i9MY07zAtbvei6bL
	7QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=RV8vRpJt32j8G9bq/Udr4MGJyFfjl/M5y/v9qT1g8Fc=;
	b=XY1G/SRUxMR0L5EPQUTYFyauw3nlP+wSD6MXR8gQ7vhLklg4WNeqBk8y6pblZuWH4u
	3e5vfQb3xX9z0CZ5O28ytgw97M1I7qDgcNOGpiMWzy0aCT0nL7MLpCKQaN2dtMr9IQSj
	k9OkV5LJYU7SDbdVq4wiIHFRZQB6CbGkTjlXlAdzHscWfqe9TqpD6HMaqw2bU5rk6Tx5
	hA5x3Juw/znrvPkM+Xrd1d4f7Q+O3Lxc6sgSN4gCmXXjFqflbgQsvGTIb27EvK1hKk4M
	6LW3piJn+1Eynssc1JTopfdxq20KWKyiibdZbq7jTENz4WeN5/nKK61uTvRZIsPAvpg4
	fdWQ==
X-Gm-Message-State: AMCzsaXiJs5BrQD8KCeKGoz0xqkTTjRjD39lC6hTbonHrd23w/hFUOT4
	9jPpZaME8IZaDBrzTEGampE=
X-Google-Smtp-Source: ABhQp+SBgrdgV69cw+xI+9p82eG4PkdwDPBF6mWOhrkna7Y4OifZ9PaqiYRWBhb0tyajSqynRbbK/w==
X-Received: by 10.233.230.10 with SMTP id z10mr18197170qkf.8.1508257846836;
	Tue, 17 Oct 2017 09:30:46 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	p52sm6696158qtc.44.2017.10.17.09.30.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:30:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-3-f4bug@amsat.org>
	<50725210-1e77-a987-b9fc-6185597b5c57@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ff89ea97-0528-20d8-f6b2-595e015ec94e@amsat.org>
Date: Tue, 17 Oct 2017 13:30:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <50725210-1e77-a987-b9fc-6185597b5c57@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 02/39] MAINTAINERS: add
 entries for dma/i82374
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
X-List-Received-Date: Tue, 17 Oct 2017 16:30:52 -0000

On 10/17/2017 03:59 AM, Thomas Huth wrote:
> On 17.10.2017 02:11, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  MAINTAINERS | 2 ++
[...]
>>  sPAPR
>> @@ -854,6 +855,7 @@ F: hw/misc/pc-testdev.c
>>  F: hw/timer/hpet*
>>  F: hw/timer/i8254*
>>  F: hw/timer/mc146818rtc*
>> +F: include/hw/dma/i8257_dma.h
> 
> Does not match $subject. And the file does not exist yet (you just
> create it in patch 39). And I think you should CC: the corresponding
> maintainers so that they have a chance to say yes or no.

Oops... fair enough ;)

