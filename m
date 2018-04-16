Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f812D-0007Xn-VL
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 06:06:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8129-0007TN-5c
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 06:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8123-0004GY-IU
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 06:06:49 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f811z-0004A0-AQ; Mon, 16 Apr 2018 06:06:39 -0400
Received: by mail-qt0-x242.google.com with SMTP id z23so14640166qti.5;
	Mon, 16 Apr 2018 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cOljJF1H3fKwlDAcD3SOVdnvNeTRcJlaWuHvNTbo2PE=;
	b=ajIAMJnj5D0mK00HwlDixbBpA3GCQDdLLZLucqFrLtKGmMRmAzWlwYUkeePLEfhguT
	A9WIbfkY1cD2tDqMyEsMhgddCYssQpuNmjHpSiOShG53RnRrbyMrg0PSgxE2LaLzOATN
	QzEcyDJ7JpubTGuGP0Chj9yP6b9d/SV8QOliW5dl45zSW6Qhz/KmkPggoPpEp5+LCl35
	zvMOkfucPL5+TnvVetO++2RtpSG18grbF3Ln1Ea+gTJ/HWyJudFrCgwIm8maH104N0wk
	BCDqfJ/kol0U2dKFYI3hOfEA8CwRtrzoTZy5GaCOJQMWzNJDnUe+gdPIlDMhdgmKsQKg
	ScmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=cOljJF1H3fKwlDAcD3SOVdnvNeTRcJlaWuHvNTbo2PE=;
	b=VKtokwDUsE8woBJ033HN9Hbgkf6nRFsw8aa6IctZ5UQsJXJa0Yu0YzkxOAdeINJZZE
	RE6Oy/I+N4eTtElnAro4eejx9iW5rKpcQf5YNAaZcAdGH3v5cC+G+lAlf5AqDlSZQvGu
	EcQVdwut/whkOgcOsNUyKQHjuprhxsgsd8IMHaNcut+pLKRBiptyX2qE8Ak228yPjH+T
	c2bp5BwPEDQmM3ruZJ6srHuKlZ4fU+vQ6VOpj2Hmavq+kpcRnPVaYbNPcT2RBhZfe76s
	m9FcCbTosQEqKSJFF3a9s44TboGKELOdOYcgR0+88Ahxissq1lZ4w5aWn+eJd5Ftvyh/
	jomg==
X-Gm-Message-State: ALQs6tAjco+h29DnzM4b4zH+IAaHibm55GQvhAIZxI3VwDc+rahC9hhD
	S9LVpW/stmoNKGlw8p/KY+YwklD4XgA=
X-Google-Smtp-Source: AIpwx499kaJVBXYMCZmYfX7yeEHhfOguJhySwP0QZwtNgR5SyE/5Yqq8VjCq4LLdbrnQtE8ZmTI7CQ==
X-Received: by 10.200.16.21 with SMTP id z21mr15310188qti.162.1523873198810;
	Mon, 16 Apr 2018 03:06:38 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	u47sm3370803qtc.64.2018.04.16.03.06.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Apr 2018 03:06:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-2-f4bug@amsat.org>
	<a2d59a3a-0176-6065-68ae-60fee97c2332@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <50f40271-11e2-96df-a2f1-58f373cfc656@amsat.org>
Date: Mon, 16 Apr 2018 07:06:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <a2d59a3a-0176-6065-68ae-60fee97c2332@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [PATCH v3 01/41] hw: Clean "hw/devices.h"
 includes
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
X-List-Received-Date: Mon, 16 Apr 2018 10:06:52 -0000

Hi Thomas,

On 04/16/2018 01:53 AM, Thomas Huth wrote:
> On 16.04.2018 01:42, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/devices.h | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/devices.h b/include/hw/devices.h
>> index 861ddea8af..0e27feb0c2 100644
>> --- a/include/hw/devices.h
>> +++ b/include/hw/devices.h
>> @@ -1,13 +1,10 @@
>>  #ifndef QEMU_DEVICES_H
>>  #define QEMU_DEVICES_H
>>  
>> -#include "hw/irq.h"
>> -
>> -/* ??? Not all users of this file can include cpu-common.h.  */
>> -struct MemoryRegion;
>> -
>>  /* Devices that have nowhere better to go.  */
>>  
>> +#include "hw/hw.h"
>> +
>>  /* smc91c111.c */
>>  void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
> 
> IMHO we should rather get rid of devices.h (in a separate patch series)
> and introduce proper small headers à la smc91c111.h for the single
> sections in here... Just my 0.02 €.

Yes, the idea is to QOM'ify those devices and drop this file.

