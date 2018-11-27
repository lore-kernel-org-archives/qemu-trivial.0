Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRc5q-0006RU-JO
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 07:03:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRc5o-0006Pk-53
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 07:03:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRc5k-0006tG-Em
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 07:03:52 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41277)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRc5k-0006sO-8U
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 07:03:48 -0500
Received: by mail-wr1-f66.google.com with SMTP id x10so22409719wrs.8
	for <qemu-trivial@nongnu.org>; Tue, 27 Nov 2018 04:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nOe9ilNFzlf2v+QcXii12gCDw5O7nFvh6CdMy30t/s8=;
	b=q8ghxrEBHxvoMjseG1flcQfoetH0FWjMRwGkEl0KecXIHCLyUFDBgnfQejMr6mtuNz
	Fj4fT59YtrCMROleUW0BdbV1qS9Pf4dwYy89YfSkrcn/itR3ksNz50y4xodxAD3x0tPL
	szugnf1Iri8VV0ijygFKKj/risHCKdSzJdLDgE8xc318DOoUBrTYBavFCa/kJXR/eQmN
	YfrxO00gpFNjy05vKP579bE2N4KdZtamZAy2/HQ+3tMKzOA3EqfFroL9kKTZ9sWBx/eG
	AgEogL7DMuAIwaf9aExt2Fp6lf+UWKVqgxc/RHBpwX9gNSwPAuHMOoXturqajqExCOwH
	1D7A==
X-Gm-Message-State: AA+aEWbuW9jcx0DAljF7qAi8PX2ZHQcOtQ3Jtp9swAdLCLe8/fq/Csgj
	khMwGt1UaQVmv33xbDHPr65Xrg==
X-Google-Smtp-Source: AFSGD/VO8qTg7LtW72p7VO3rwPHWgnx0sd1t2C4e++X7I1zAvUDWxNmQzTXuMQelPQBAz64eBnmakg==
X-Received: by 2002:adf:b783:: with SMTP id s3mr17064998wre.274.1543320227224; 
	Tue, 27 Nov 2018 04:03:47 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	v189-v6sm5707536wmd.40.2018.11.27.04.03.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 04:03:46 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-7-philmd@redhat.com>
	<bbd65041-d216-f063-8d94-a11db5d730c9@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b4cfce9d-91bf-2085-71dd-4c1c1a5f17b3@redhat.com>
Date: Tue, 27 Nov 2018 13:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <bbd65041-d216-f063-8d94-a11db5d730c9@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [PATCH for-3.1 06/25] MAINTAINERS: Add a missing
 entry for the Xilinx S3A-DSP 1800 machine
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
X-List-Received-Date: Tue, 27 Nov 2018 12:03:54 -0000

On 27/11/18 12:37, Laurent Vivier wrote:
> On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4e396cbe71..aa17e9bbd3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -822,6 +822,7 @@ petalogix_s3adsp1800
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>  S: Maintained
>>  F: hw/microblaze/petalogix_s3adsp1800_mmu.c
>> +include/hw/char/xilinx_uartlite.h
>>  
>>  petalogix_ml605
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>
> 
> I've added the missing 'F:' field.
> 
> Applied to my trivial-patches branch.

Thanks Laurent!

