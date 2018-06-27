Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3nk-0003FJ-Pa
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:19:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3nh-00037X-IR
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:19:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3nc-0005rx-SH
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:19:33 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:36497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3nc-0005rD-ML
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:19:28 -0400
Received: by mail-pg0-x243.google.com with SMTP id m5-v6so481607pgd.3
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cmw8s0uI8EACa8XW2KWcCUHvf382H4wQGvoI1DhX2ds=;
	b=TDhHFRBGS+hHFQoFem/shbcsVGZiNvhv9x/KIpWl9HNW18zw8s/C86B9JUxB9dtTLY
	/rkSUqOnWgx6xBuhKgTKmu1lFv+7qCPJ8fBRFjyYjKgj9dfOQu8mj4pHHPsPvvgC17a1
	PzCU6H+c5k6nYnWLgazThSguWQNh7MKn2rYIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cmw8s0uI8EACa8XW2KWcCUHvf382H4wQGvoI1DhX2ds=;
	b=C0cb5XwlTNBtjGSdaDQK4qVlWIZSKPPYrASayaQBOZFVFg0t3fW3lt7TxLJAF/jAta
	xFotwAuAxHCX3dogJZbt52KmiIocLJyOwVISBmwqkuocRGtKp5mPLFkBcX6FPTX36Pkr
	g1iMOG1HmqT4H+VLbQzirzC25J9y4543WqpSfTm5Wg46oh+fDWN+0hRLXWLI0Ccj+9bL
	I31Zgx35ZdD5TBXSklKkhcdGCBHfPDSd9ZUCeg/YjSdRy9X1OfBzcfgzJrrR1u5N9Y6G
	+N1hqMGdTk7B2/nsIfWkIkOyHNw2DIE8RxE/scw+SuoR3K/2WZUpQI4VxFo0N+hu0u3d
	vIAw==
X-Gm-Message-State: APt69E3aaZhH/xfCnxJIPrq2eXOnH324fT/KMUAMClh4xqz+yE87lK2c
	ZFD2f1lshXb/lYxAJrJFqt6c2Q==
X-Google-Smtp-Source: AAOMgpe5sbt4GG1L45wMNFOH0UlUIRr7anr7sSet7XcS4diO0ec1m2PRDPKlQWIsUFfWR3088afpqA==
X-Received: by 2002:a62:e70e:: with SMTP id
	s14-v6mr4559008pfh.131.1530080367771; 
	Tue, 26 Jun 2018 23:19:27 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	j63-v6sm11813515pfk.40.2018.06.26.23.19.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:19:26 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0605e3a5-221b-172b-43d8-b14371345114@linaro.org>
Date: Tue, 26 Jun 2018 23:19:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 24/46] hw/microblaze: Use
 the IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 06:19:34 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
> 
> and modified manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/microblaze/petalogix_ml605_mmu.c      | 7 ++++---
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 7 ++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


