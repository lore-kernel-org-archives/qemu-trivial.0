Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvSDj-0004PV-Nq
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 13:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvSDh-0004OI-KZ
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 13:58:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvSDe-000618-Dj
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 13:58:33 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvSDe-00060k-AI; Fri, 22 Sep 2017 13:58:30 -0400
Received: by mail-qk0-x242.google.com with SMTP id r66so1092794qke.4;
	Fri, 22 Sep 2017 10:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xcyJSBKs0gKaM3LgguRWe3UJApDgdSLQtgymVn9xcgM=;
	b=t7zWu2Db9HZQEwxzN/8MAJeJa/dYhlefDXNiVlS2PAYjPn/lvu+Ub4qocLB0nJ1pJi
	dNESKQWlEYE6X53RYLka/LoopjVW0T0w/mvdvR2tTwDzH6qamQyFEECyUDCOicuFUBeH
	h+QmivMjmCrz8c8MFq3jH6Ez0gJcmDsR3+bddF1CL0AUN8B7jN25xpWWMaJxWiczGz5s
	YT3vv985rEp4ZaAAAH+AzDVV3s4ncMVvrvEkimq62jmN2ZzmMzeBqo4Eh8u/KYqIZsM+
	n+2CrDytMVcFDiXZc14opWPHCntP/+9xAxezx7dT3C6xO8OfO/Yp94otPxi76DbvmsaA
	aPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xcyJSBKs0gKaM3LgguRWe3UJApDgdSLQtgymVn9xcgM=;
	b=JjyoD6eUE07aCLsgwoXgdtmDpdwtxkHhyD+cwm3A1/ys2NHVthh8umg3s/fYid1VhD
	N7Xp4JCcnqdSlrFHaIg31GGsNZQs7AI5gfIfyrY+l+6JettRYbdwjxCgP+SIRdy4UDR7
	jdjZbMXQyHA6IIyLXYR3T261hGs+e6mQAoYkaRfD13/hJjLWLuNnoz/1ajAjswKI1bKm
	n/YyUJHR/muh7I2nvqYpvu9llk6QRhnUwAO9Ohgopw7IRhc2yJCZMtMsxqDTwkL5epao
	vT1eTwsNXlnUtKMUdjJsrLM5SERK37dKR63/p2UaOKFIn9eJZ6vYR47e7SIvFob5vDHl
	VzyQ==
X-Gm-Message-State: AHPjjUg/icCUV9XFd7u0UUZ2zmbRiLlDA2+6yhyTxbgPDEMTdahylLJB
	yY3oWlBGOsEmUR4TXApHV/PYxJQMe0o=
X-Google-Smtp-Source: AOwi7QCyDcjEJaqjytd4lpBaZPhc0GI7MmW+8sNE/8GrhWReoATXxMe7s6yfnuWdX2PdAlg/vURCiA==
X-Received: by 10.55.42.5 with SMTP id q5mr9304236qkh.71.1506103109502;
	Fri, 22 Sep 2017 10:58:29 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id k7sm275495qkf.61.2017.09.22.10.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 10:58:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, 
	Corey Minyard <minyard@acm.org>, Balaton Zoltan <balaton@eik.bme.hu>,
	Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-3-f4bug@amsat.org>
	<CAFEAcA8oovA56LwFtKoY1c-P93zxGoyH+vKAXF+hAK6r9bHxvg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6f5d2c42-21b0-6741-deb7-e154163fc0bb@amsat.org>
Date: Fri, 22 Sep 2017 14:58:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8oovA56LwFtKoY1c-P93zxGoyH+vKAXF+hAK6r9bHxvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [PATCH 02/34] hw: remove "qemu/osdep.h" from
 header files
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
X-List-Received-Date: Fri, 22 Sep 2017 17:58:34 -0000

On 09/22/2017 01:07 PM, Peter Maydell wrote:
> On 22 September 2017 at 16:39, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> while here, add entries for ppc4xx_i2c in MAINTAINERS
>>
>> applied using ./scripts/clean-includes
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
> 
> This is doing two things at once and would ideally be
> two patches. Still,

OK I'll split "while here" patches.

> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

