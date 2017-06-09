Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJRSu-0005ua-Hp
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 17:29:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRSs-0005tE-FN
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 17:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRSr-0000GE-Mb
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 17:29:06 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRSn-0000F6-Fx; Fri, 09 Jun 2017 17:29:01 -0400
Received: by mail-qt0-x241.google.com with SMTP id x58so17825361qtc.2;
	Fri, 09 Jun 2017 14:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=O4goqAvWegVxieUjVvyGm/bhzONuui00+D2Tx9QWh20=;
	b=t+3o20Co+29bwduZDwd2WsgBH7btyMpv5BN6MwSbzeim/ScJGyO4S/466QD8nnI7sQ
	QLEzngVp8DF7PZjbhn+oxCCFAIN1PxHnRUZcY2hkG/wo/av++apyIwCzoJ68xNCMQXcC
	KkiLOrPEndM0H4SUzL2YIjM80zRvy8256w+lUdf5/qljUmnsnfExKdlwpjER+3P/oY3u
	C7pGbKBu5apOuvw7jdvO/dM5BSAlW/AVgkuorV/+owNXe2lsamCh4+lsdgkxeek9QdPM
	Ovkq7q3X96dqn7P5Lg2z2cvJqcM7uzMSrFZLyXlXezJt4rqgHdp5tfWr/o5RH0rZoI08
	LPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=O4goqAvWegVxieUjVvyGm/bhzONuui00+D2Tx9QWh20=;
	b=QxQNMFVAVjsbqW78Cf5fs+ukBbagdCkEeYDbNl3we/SvlVmX1lgFkpl0Dofoc6psBA
	CpRh+QphYPG4xsyOovFTEn0uy7FF2nDC0/A49yUQkUcxgooKwSc0NvybKwTGzbu7QW3D
	n8Ugb+9jI7BW9A91KNR4VtzrPPdHOad/w2FFOSSD+R2OjS1FwUlByz9SqkzbUMYRF519
	U4K8J7lv3RUMy/KPRTUSfIYuKnweh0VwpaEuesmOuAb5S3Y7u/ag7vfLXc0kWaE4BclE
	ORfupmWDWQ09jBlpLSJ0dBD3gzBqARtyQa+Tc5/Trx0WHpkZ24nsn5qk/gO9bzcQRuoC
	y8+A==
X-Gm-Message-State: AODbwcC6IQH7+8d1l5aI/Y3IZTIc9J8wPFRgXvh1dCslWiJuS89c0Jpc
	uY1Anj8LzffFpquXOwM=
X-Received: by 10.55.127.199 with SMTP id a190mr55970635qkd.100.1497043740675; 
	Fri, 09 Jun 2017 14:29:00 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id w68sm1555133qkb.1.2017.06.09.14.28.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 14:28:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-7-f4bug@amsat.org>
	<79598bed-714f-7c3b-a806-3bf1a4968fd2@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da9abd44-1f8b-2c1c-e63a-3ca706c95865@amsat.org>
Date: Fri, 9 Jun 2017 18:28:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <79598bed-714f-7c3b-a806-3bf1a4968fd2@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH 06/11] hw/arm: removed unnecessary include
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
X-List-Received-Date: Fri, 09 Jun 2017 21:29:07 -0000

On 05/23/2017 11:58 AM, Michael Tokarev wrote:
> 09.05.2017 02:39, Philippe Mathieu-Daudé wrote:
>> "exec/memory.h" already includes it.
>
> I think this sort of include cleanups isn't really necessary.

Some are useful ;)

> For a regular include file, it's better to include it if the
> .c file in question uses definitions from there, no matter if
> other .h files include that header already or not.

Ok. This one was incorrect anyway :( thank for the review!

>
> Thanks,
>
> /mjt
>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/arm/arm.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
>> index a3f79d3379..b9c11d3fb8 100644
>> --- a/include/hw/arm/arm.h
>> +++ b/include/hw/arm/arm.h
>> @@ -14,7 +14,6 @@
>>  #include "exec/memory.h"
>>  #include "target/arm/cpu-qom.h"
>>  #include "hw/irq.h"
>> -#include "qemu/notify.h"
>>
>>  typedef enum {
>>      ARM_ENDIANNESS_UNKNOWN = 0,
>>
>

