Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0Riu-0000gz-P0
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 08:27:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0Ris-0000fu-U4
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 08:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0Ris-0005KC-3D
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 08:27:22 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37825)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0Ril-0005Fv-Vl; Fri, 06 Oct 2017 08:27:16 -0400
Received: by mail-qk0-x244.google.com with SMTP id a12so9113524qka.4;
	Fri, 06 Oct 2017 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3UbVle6d7XZT/5ZPOw66swkTJ4BI7ITlXbHvUB0LJ54=;
	b=QmsnTzkM7jBLzEjofHAhHy70TWFkqd5B8KSUjWcZ0yqZRO06MG9/RisEZOw5SSMeKu
	Qa5NmkcDOt/sknzojPUVb+S1e1PfhLrWPieIQTJNny1Ml0wC8p96KOC74HIdz55OJaQb
	jVMQtDA6iS6A7rHjz8+y+VfouhMHV+0ORqFI+oF5pl35tQkF6P5LADubE4QaZT6dtWOD
	XDPUYCRMJXYUOdlQ4prrThTWiGmTgvNGw4KZebtoiZZk1nH3VKSycAPDPaoMBUoPy+8j
	UplOiR5X0QQtfloNuzux78jOVcMlzAvpjTazycZ2jmgcRrhbYjZgiXqz0EDFEAB0m3TX
	qC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3UbVle6d7XZT/5ZPOw66swkTJ4BI7ITlXbHvUB0LJ54=;
	b=fcIfd8JlWhya9evMClHL7bVtwKWoFqyBtgE50XW8GNu3HbxmAT9odA4REQ0xTydTU+
	N44EghJGDIaZYG+EH5Y9Zo3z/TtVPUFPk8PuW7gdvfYllCZn4+SE8cRyL/X3XsuNK6Y5
	cSSv2E36/c2fhlig3T15StvvZTyBvbhVBZmWXc3cR5ACHnogKI+bIXgSz3g5Yb/q1Z30
	QJQVf/nQYCzwKKvMItd9ohEw2vq5FPK5UFvPQbxqEtLyOEJ1Dv3t3XkwrOEDdtMW6n5W
	nQ5vjCF3JqWnV7j5q8AR0H+jkgUZs6idh9Oh4PBV6B462MqpU2XpW8yDSsfA5tB8urba
	ZoPw==
X-Gm-Message-State: AMCzsaUg1TVZbjYszD75Zd8UaZUMrV4biYcmpEA8SVbUz4OXOtDqPQHd
	hl8JbGVU+mr0xQ6dBcSPhRlMJZDS
X-Google-Smtp-Source: AOwi7QDD6JKkUBF5ShNfh7r8B8cjLxpaVElb0E3Up2cCbeW/iMK6hkxdhulPGVxykiThS7Dsy8zPkw==
X-Received: by 10.55.217.82 with SMTP id u79mr5632260qki.106.1507292834824;
	Fri, 06 Oct 2017 05:27:14 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 35sm843201qtx.43.2017.10.06.05.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:27:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	qemu-trivial@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-11-f4bug@amsat.org>
	<CAFXwXrnnvn0MStu=bPvtTVJbE7TXX-j9t6qaKGeqQTL7OnCwBg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3ed2a5a2-e30f-d139-d5bf-e145a8480787@amsat.org>
Date: Fri, 6 Oct 2017 09:27:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFXwXrnnvn0MStu=bPvtTVJbE7TXX-j9t6qaKGeqQTL7OnCwBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 33/34] hw/alpha: remove old
 i386 dependency
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
X-List-Received-Date: Fri, 06 Oct 2017 12:27:23 -0000

On 10/02/2017 04:03 PM, Richard Henderson wrote:
> 2017-09-22 12:01 GMT-04:00 Philippe Mathieu-Daudé <f4bug@amsat.org>:
> 
>> diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
>> index b6d8369ed7..ac685c1c46 100644
>> --- a/hw/alpha/alpha_sys.h
>> +++ b/hw/alpha/alpha_sys.h
>> @@ -5,8 +5,6 @@
>>
>>  #include "target/alpha/cpu-qom.h"
>>  #include "hw/pci/pci.h"
>> -#include "hw/pci/pci_host.h"
>> -#include "hw/ide.h"
>>
> 
> Why are you deleting pci/pci_host.h here?

Indeed it is required since PCIBus is defined there.

> Alternately, why are you leaving pci/pci.h?
> 
> 
>> diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
>> index 8dde637bfe..c370762ea6 100644
>> --- a/hw/alpha/pci.c
>> +++ b/hw/alpha/pci.c
>> @@ -8,6 +8,8 @@
>>
>>  #include "qemu/osdep.h"
>>  #include "qemu-common.h"
>> +#include "hw/pci/pci.h"
>> +#include "hw/pci/pci_host.h"
>>
> 
> One way we have a double-include of pci/pci.h here,
> the other way we shouldn't re-include either.

Please ignore this patch.

