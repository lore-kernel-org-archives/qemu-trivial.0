Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dkbIR-0003YZ-ND
	for mharc-qemu-trivial@gnu.org; Wed, 23 Aug 2017 15:26:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dkbIP-0003Vj-C4
	for qemu-trivial@nongnu.org; Wed, 23 Aug 2017 15:26:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dkbIO-0002Oe-JF
	for qemu-trivial@nongnu.org; Wed, 23 Aug 2017 15:26:33 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:44199
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1dkbII-0002LN-Dk; Wed, 23 Aug 2017 15:26:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 9675A82439;
	Wed, 23 Aug 2017 21:26:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKLUyB8BwMyu; Wed, 23 Aug 2017 21:26:25 +0200 (CEST)
Received: from localhost.localdomain (182667ea.cst.lightpath.net
	[24.38.103.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 4093A8137A;
	Wed, 23 Aug 2017 21:26:24 +0200 (CEST)
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair.francis@xilinx.com>, qemu-trivial@nongnu.org
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<27da1dae-1e2f-559a-d8f0-c7e15289363e@adacore.com>
	<d5be8092-dc56-14aa-b950-d82e7f959ec1@redhat.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <ee875a77-c10e-cb36-6932-2dc60bf08365@adacore.com>
Date: Wed, 23 Aug 2017 21:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <d5be8092-dc56-14aa-b950-d82e7f959ec1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-trivial] [PATCH] hw/misc/auxbus.c: Mark the
 aux-to-i2c-bridge device as non-hotpluggable
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
X-List-Received-Date: Wed, 23 Aug 2017 19:26:34 -0000



On 08/23/2017 07:22 AM, Thomas Huth wrote:
> On 22.08.2017 20:15, KONRAD Frederic wrote:
>> Hi Thomas,
>>
>> Looking to this seems there is a second issue:
>> The aux-to-i2c-bridge device should connect on a TYPE_AUX_BUS.
>>
>> I don't think there isn't any on integratorcp..
>>
>> Anyway the patch you sent fix this issue indirectly and as far as
>> I remember I wasn't able to make this I2C bridge an
>> TYPE_AUX_DEVICE as it's a special device and it is internal (only
>> instantiated at the bus creation).
> 
> If it is intended to be completely internal only (i.e. also not for use
> with the "-device" parameter), then it should even be marked with
> "user_creatable = false"! ... if you got some spare minutes, could you
> maybe sent a patch for that? I'm not familiar with that code, so I'm
> always having trouble to give the reasoning for setting a
> "user_creatable = false" somewhere...
> 
>   Thanks,
>    Thomas
> 

Ok will do!

Thanks,
Fred

