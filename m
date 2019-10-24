Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNhKU-0003w6-Tj
	for mharc-qemu-trivial@gnu.org; Thu, 24 Oct 2019 13:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNhKR-0003q4-NE
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 13:55:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNhKO-0008GW-KE
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 13:55:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNhKN-0008FI-QY
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 13:55:16 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7B6BBA76C
 for <qemu-trivial@nongnu.org>; Thu, 24 Oct 2019 17:55:14 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id l184so1574896wmf.6
 for <qemu-trivial@nongnu.org>; Thu, 24 Oct 2019 10:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6v+fctnKVl/6fYka3XIVf9fH1YaHhqzuYR56MyK9A60=;
 b=M+X8nt1bdWwO5Xd74JO3k0121qQPO3TcPHqGaglT/CqCWUKw7pDaPcjfRiATnOImxt
 SNG56bkpxYXxBwqv8GBTU8aDS18Z5ypOwHNgt+H5ilPJrgjcqJbDbrJeR1E9PJprD9pL
 c4HMwDNVQvcERUiENXodE44JBZJuD6PbRxTHxKmDP7nZSfShL10vdNZaiwHBwCCyssEi
 8p0sFCKWsGSDPq6VsI/eFQMIRfHSPSbJhPcQZYjIu3/6ualAdtUyfMVxrXib1jnFNC0M
 1H8h1w82lbkD+VILa22YZbu514L2sLT+TBfyPP3Di0pxdpUqnCfZ7r9oBm0HNt1VMuuH
 6TwA==
X-Gm-Message-State: APjAAAV79PC4Rp+O54whD58+nlX/rXwpndNoCI1fGZEItKwNKNkUyg8R
 uFoFx5u9n4hnYLulc5SFqS5/lREYlmmDxA4/L3dNuQLg470kUi9rUCLjYHuJCne86VF5k91kzAh
 BZiIJkn8CRwcLUIp6iw==
X-Received: by 2002:adf:8481:: with SMTP id 1mr5363886wrg.189.1571939713206;
 Thu, 24 Oct 2019 10:55:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDJCsx9Qw7zYvfGHFEcryNWgFO6HIFZ5JybJTxQFAMpUNVQYdTFqK3xVFCKCJaBYCPY3voAA==
X-Received: by 2002:adf:8481:: with SMTP id 1mr5363848wrg.189.1571939712934;
 Thu, 24 Oct 2019 10:55:12 -0700 (PDT)
Received: from [192.168.1.115] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id s13sm2892518wmc.28.2019.10.24.10.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 10:55:12 -0700 (PDT)
Subject: Re: [PATCH v2 00/14] hw: Split RTC devices from hw/timer/ to hw/rtc/
To: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>
References: <20191003230404.19384-1-philmd@redhat.com>
 <CAFEAcA-rmPuKQyv8d-u-1UAMhy6yGAcF3csVDcvYVXMosZysYw@mail.gmail.com>
 <839e9cb5-6fc2-a2b2-df12-abf9dbf6dcdd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <04b0db79-dfb3-9f28-b649-459214728556@redhat.com>
Date: Thu, 24 Oct 2019 19:55:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <839e9cb5-6fc2-a2b2-df12-abf9dbf6dcdd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Oct 2019 17:55:21 -0000

On 10/24/19 7:36 PM, Laurent Vivier wrote:
> On 24/10/2019 17:51, Peter Maydell wrote:
>> On Fri, 4 Oct 2019 at 00:04, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>>
>>> Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03=
334.html
>>> - addressed review comments (described in patches 3 and 4)
>>> - added R-b/A-b tags
>>>
>>> Whole series now reviewed.
>>
>> for the arm parts:
>> Acked-by: Peter Maydell <peter.maydell@linaro.org>
>>
>=20
> I'm going to queue this series in qemu-trivial queue, so I guess your
> Acked-by is for patches 2, 10 and 11?

ARM: 2, 7-11, 13-14:

   hw: Move PL031 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move TWL92230 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move DS1338 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move Xilinx ZynqMP RTC from hw/timer/ to hw/rtc/ subdirectory
   hw: Move Exynos4210 RTC from hw/timer/ to hw/rtc/ subdirectory
   hw: Move Aspeed RTC from hw/timer/ to hw/rtc/ subdirectory
   hw/rtc/xlnx-zynqmp-rtc: Remove unused "ptimer.h" include
   hw/rtc/aspeed_rtc: Remove unused includes

PPC: 3-5

   hw: Move MC146818 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move M48T59 device from hw/timer/ to hw/rtc/ subdirectory
   hw: Move M41T80 device from hw/timer/ to hw/rtc/ subdirectory

SPARC: 6

   hw: Move sun4v hypervisor RTC from hw/timer/ to hw/rtc/ subdirectory

