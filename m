Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d88oM-0005wK-U5
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 13:20:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d88oK-0005wC-0W
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 13:20:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d88oG-0003XO-Oz
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 13:20:32 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d88oG-0003XD-Ks; Tue, 09 May 2017 13:20:28 -0400
Received: by mail-qk0-x243.google.com with SMTP id o85so1062604qkh.0;
	Tue, 09 May 2017 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=lEyTB7at2B5G1fy/HrgAnCK7ErsecEAlL1ZwpVvirds=;
	b=SaDUZgMByfvlAqSrtxo49mvV8szjBKJjXBSHuWK4vxWSfHeqYEn4jlX1XfVazu6wDV
	YywVHM1HWHUfVSlv6KhnUcAWrmnSlDaaqQ0O8YQcfkQj5O8ybUvROSV4pJYdhOOFVq8H
	sXLEerE2jsSQkfId3lfZ8unfKahkj2Om+AddrZpxwwyGzYonceLF3CWFt0mWCQ4j+/eV
	L5UAUeFwofKneZRJKfg665ciOcbc4rJicKQPmj4QsCRhA0eGc/xao17oDyY96BNpCRTV
	zAxPD9iGo3dvlvcMao7imIqTFuwS8+d0rBz7nuedz1Fgll5hb9eATtztL+aeSKRHvaum
	20Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=lEyTB7at2B5G1fy/HrgAnCK7ErsecEAlL1ZwpVvirds=;
	b=RS2T9dXqLRTXNnE5GmKmvoZ8y3tGk9ltpgYbgg/GRjQMb7C1S90jg0XMXHnyQnkVI3
	TOcuBMLbjZAOYEyPVsqgQAFipBCNkooXe/EBQtI5cPkDVroHeg0QsB4y/7s+4cY6aVuT
	bXZgDhm1CL+yq1/lez/MXd4/W0LExTrLln43LRvelQrm4/9tLvsaSyN1D7jaEV0FA8aW
	Fce85j7AW/sio6cIXrqIqM84gcOeOEFFNNS173M2PUraDPxNi2gwAlEm7aq6RiACdZpr
	4dvgRhqvcOVwzqBb6Bh7IqxfGsPYqRSVn5YlC9MLjkJVdL4HpQ50tyfvb2eRpWJceM9e
	sNBA==
X-Gm-Message-State: AODbwcDpefOXZCM4UvijWXULtBKb1rti9llVv0T27MScgz1m04WMHJUw
	2KHdS/tokWHTpg==
X-Received: by 10.55.178.5 with SMTP id b5mr1282986qkf.258.1494350428109;
	Tue, 09 May 2017 10:20:28 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id k64sm349650qkd.49.2017.05.09.10.20.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 10:20:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-4-f4bug@amsat.org>
	<2ad7eaf6-3691-f9f1-4d09-204444adbd19@redhat.com>
	<5b9ad5c0-0bcf-2167-57ba-446d1253cdd1@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bdc0fa6a-a90c-3f7a-a37c-bc901a6022c2@amsat.org>
Date: Tue, 9 May 2017 14:20:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5b9ad5c0-0bcf-2167-57ba-446d1253cdd1@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] hw/misc: add missing
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
X-List-Received-Date: Tue, 09 May 2017 17:20:32 -0000

Hi Eric,

On 05/08/2017 09:56 PM, Philippe Mathieu-Daudé wrote:
> On 05/08/2017 08:56 PM, Eric Blake wrote:
>> On 05/08/2017 06:39 PM, Philippe Mathieu-Daudé wrote:
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  include/hw/misc/unimp.h | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
>>> index 3462d85836..353ee19abf 100644
>>> --- a/include/hw/misc/unimp.h
>>> +++ b/include/hw/misc/unimp.h
>>> @@ -8,6 +8,9 @@
>>>  #ifndef HW_MISC_UNIMP_H
>>>  #define HW_MISC_UNIMP_H
>>>
>>> +#include "qemu/osdep.h"
>>
>> NACK. .h files should not include osdep.h, because the .c file that is
>> using the .h file should have already done so.  This is mentioned in
>> HACKING.
>
> Ok! Indeed my .c doesn't include osdep.h, sorry for the noise.

I attentively read the HACKING after a good night's sleep.

What about the other include, "hw/sysbus.h"?
The inlined function create_unimplemented_device() calls 
sysbus_mmio_map_overlap(). Anyone willing to use "hw/misc/unimp.h" will 
get a compilation failure if he does not include "hw/sysbus.h" and I 
don't think it belongs to "qemu/osdep.h".

Regards,

Phil.

