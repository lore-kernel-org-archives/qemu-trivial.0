Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goVO2-0004xS-GN
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 10:33:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1goVO0-0004vZ-Fo
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:33:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1goVNy-0001kh-8G
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:33:16 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35989)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1goVNy-0001RZ-0L; Tue, 29 Jan 2019 10:33:14 -0500
Received: by mail-ed1-x541.google.com with SMTP id f23so16311187edb.3;
	Tue, 29 Jan 2019 07:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=47fjy4QOp1oJhwTXkKaXiKQKi8czgLhEcqtY7CCzv0Y=;
	b=W+QJeP5WA0SpeuelERXyU31mdweZjxOjPEoE1/Uxm60eSdszeW4Y4PhW3brM5Z4h/y
	yyTJfnHHS3mZTtsn4d3tgt8UFXp3ugDmuFX6C3V57u1VmcIkupw69DGwhf/zGRRZl+Qh
	cLrcxpi0kBXQJdVAhtI5LwWBVDQ2Eqbe93oItzpWrO4GNReEVEBKg+AN7AATf0tmsk8N
	VFkvcHeA3xVCvV0DKSn+HQ8z8dcMdxZ1QrGNwAobor8PGF5EQn9s4uuF2V8VOPDRxcUU
	84StGalclyx5OYzBmuufggbehZLSs9whcDvx9OI+yfJGSIAS/LfORLaf1ISht2u1RkdM
	M75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=47fjy4QOp1oJhwTXkKaXiKQKi8czgLhEcqtY7CCzv0Y=;
	b=EWQ9oScBkwzdMmW7wcXGcKmLBbD7oMXtpeqwffX2v+P8BBrYJ+wJP4kktQNffkxMiB
	ugKm/paexoAaaJkjIN/umC9wvNjA+awelVXFCf69qWt6LyPjfU6a+blpA7mYCTq4pmC3
	yzc0H7yMaSOCiJy5enmbrhC92mcSPS1BA7VLGzlPTBYH01cMVH1Z22hC22X4UmyKCTKh
	3nYfQKebCf1zgYKu7X5b3lmJPUZV2i0X5y9Vh+qtkDtAqrlhDq8R2iSEVqUzT5nTurhq
	4ZJu36TZ1apf6V+w567Dt+k/NIH31pU0VE0FkKtm1PWCyXj+2E6m8GEzsQNRCit0t3kL
	hbiA==
X-Gm-Message-State: AJcUukd0Y6tBWhHA3Am+cx4rxlkXnt+2KvaCBUVX6UXTIgp8ucJDvjVz
	vp3mIht5yw7DSKz0O3KQ3hQ=
X-Google-Smtp-Source: ALg8bN6GnRC4OpTalPKrripYah9lB74b4oVR3YTUCPlMIJsu0Zp+uk5Cb5TDmQzhOAD1hAVnyIcIBQ==
X-Received: by 2002:a50:b0e5:: with SMTP id j92mr24555309edd.188.1548775976184;
	Tue, 29 Jan 2019 07:32:56 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	j4sm14459702edh.69.2019.01.29.07.32.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Jan 2019 07:32:55 -0800 (PST)
Date: Tue, 29 Jan 2019 15:32:54 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Message-ID: <20190129153254.r7y2vto4ltxsivpj@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<feb8687e-0d0c-a20a-9b37-c8284aaae9f5@redhat.com>
	<20190129080455.GA10084@richard>
	<91c53c72-8e9c-f68d-1dc8-f6320ed3dfc0@redhat.com>
	<f6f1703e-1c77-055e-1906-300df3c79479@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6f1703e-1c77-055e-1906-300df3c79479@vivier.eu>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/3] Trivial cleanup in
 hw/acpi
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
X-List-Received-Date: Tue, 29 Jan 2019 15:33:17 -0000

On Tue, Jan 29, 2019 at 09:43:20AM +0100, Laurent Vivier wrote:
>On 29/01/2019 09:23, Philippe Mathieu-Daudé wrote:
>> On 1/29/19 9:04 AM, Wei Yang wrote:
>>> On Tue, Jan 29, 2019 at 07:56:54AM +0100, Philippe Mathieu-Daudé wrote:
>>>> Hi Wei,
>>>>
>>>> On 1/29/19 1:08 AM, Wei Yang wrote:
>>>>> There are several functions/variable which are not used anymore.
>>>>>
>>>>> This serials just remove those without functional change.
>>>>>
>>>>> Wei Yang (3):
>>>>>   hw/i386/pc.c: remove unused function pc_acpi_init()
>>>>>   hw/acpi: remove unused function acpi_table_add_builtin()
>>>>>   hw/acpi: remove unnecessary variable acpi_table_builtin
>>>>>
>>>>>  hw/acpi/core.c         | 10 +---------
>>>>>  hw/i386/pc.c           | 27 ---------------------------
>>>>>  include/hw/acpi/acpi.h |  1 -
>>>>>  include/hw/i386/pc.h   |  1 -
>>>>>  4 files changed, 1 insertion(+), 38 deletions(-)
>>>>>
>>>>
>>>> Please do not post iterated series in reply to previous version, but as
>>>> new thread:
>>>> - patches are parsed by scripts
>>>> - some email clients can tag a thread as "reviewed, skip" and replies to
>>>> this thread will be masked.
>>>>
>>>
>>> Well, do I need to repost it in a new thread?
>> 
>> It depends who will take this patchset and his mood :)
>> Let's wait and see.
>> 
>
>No need to repost if they go through the trivial branch.

Thanks :-)

>
>Thanks,
>Laurent

-- 
Wei Yang
Help you, Help me

