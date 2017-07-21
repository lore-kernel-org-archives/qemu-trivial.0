Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYaiA-0001dB-CV
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 12:23:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dYai8-0001cL-Ur
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 12:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dYai7-0007bO-QH
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 12:23:28 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dYai0-0007ZV-TJ; Fri, 21 Jul 2017 12:23:20 -0400
Received: by mail-qt0-x241.google.com with SMTP id h47so6739941qta.5;
	Fri, 21 Jul 2017 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=z9EGXY0Uz6hnoM7bFY6ebQwbPP6N3kw6GtihImsoYQI=;
	b=m8xApkdt1R7a3xXidZo561WIo3dRrH74QMGTxRMG0b8H7aFYYRh66Y5aszdov8mTDn
	Dy5x/VO8K5L9KbOsao1a8ETMfCOVQwg0cFZrem/YIPgJ+5eeBRs3UJzXJRH1mQyvq1pM
	CBsg0O6itAqf1e3GYjFG6/xwcP/4ExEDJSwitSL54rzUFQqnlxz+v+10WoTeqQEHER1C
	IV1ELXjSROIRNCa4flCDxJLELI/EqfKxalauay8w7+jLHlbvEHAKq1uUDJtOyqIxuUxz
	rNskb92EMww3iUZxMNopWhY7ZUEiQv64Q/lRPGAO11XTpCuJaEcg04VZpwjOfitOEo4P
	Aayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z9EGXY0Uz6hnoM7bFY6ebQwbPP6N3kw6GtihImsoYQI=;
	b=I1EsxJW18sctjkTiktqi71p3beBwvVc3BTkXB18uGVcF/ryjm4vHmZsJHpr9qaG0Ku
	CAkFsa40Upn4agvWWxsHl0jgojRil6lhO0nHWr6ZiogYwuJ982FznUYIwHDAIu2ofg9R
	NXHXELorcr777sRMQnomsSCSk3b130DJupSciYlFVWq1aqWoz1J56nM9nUJsfIfRz7Xo
	ze4Mg4eJipvb2E57yw/VicgmylKUQOD9UMBgPuNgu9rTEM++OChCxFzDT04VS47hWC82
	yRSim1sIzZiOuy0/QmCgPN8EpGXk+Awjfc2E7KQIRz2Vf1/sfMExpTLQELHWarMlwVAE
	8+lg==
X-Gm-Message-State: AIVw111h8lDCvQEFAXPyZsmxAD1GCJ9UvAQEGF3/Q5S2rrzIxj5S+7du
	U7uww+Vw7lpsprDVJ7Y=
X-Received: by 10.200.37.98 with SMTP id 31mr10970617qtn.92.1500654200052;
	Fri, 21 Jul 2017 09:23:20 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t21sm3732637qte.97.2017.07.21.09.23.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jul 2017 09:23:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-11-f4bug@amsat.org>
	<53a83027-dde9-9728-90ab-b90a92484445@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a77b40e7-8483-c298-6707-59e65adaa904@amsat.org>
Date: Fri, 21 Jul 2017 13:23:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <53a83027-dde9-9728-90ab-b90a92484445@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH 10/29] net/rocker: use QEMU_IS_ALIGNED
 macro
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
X-List-Received-Date: Fri, 21 Jul 2017 16:23:29 -0000

On 07/18/2017 02:51 PM, Eric Blake wrote:
> On 07/18/2017 01:09 AM, Philippe Mathieu-Daudé wrote:
>> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/net/rocker/rocker.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
>> index 4f0f6d71e5..55228f2f52 100644
>> --- a/hw/net/rocker/rocker.c
>> +++ b/hw/net/rocker/rocker.c
>> @@ -1419,7 +1419,7 @@ static int pci_rocker_init(PCIDevice *dev)
>>               desc_ring_set_consume(ring, cmd_consume, ROCKER_MSIX_VEC_CMD);
>>           } else if (i == ROCKER_RING_EVENT) {
>>               desc_ring_set_consume(ring, NULL, ROCKER_MSIX_VEC_EVENT);
>> -        } else if (i % 2 == 0) {
>> +        } else if (QEMU_IS_ALIGNED(i, 2)) {
>>               desc_ring_set_consume(ring, tx_consume,
>>                                     ROCKER_MSIX_VEC_TX((i - 2) / 2));
>>           } else if (i % 2 == 1) {
>>
> 
> Given the if chain, I think you don't want this one.

Indeed, dropped. Thanks for your review!


