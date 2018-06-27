Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYAnI-0000VZ-U1
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 09:47:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYAnF-0000Sw-UA
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 09:47:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYAn9-0000Ms-SZ
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 09:47:32 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:38617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fYAn9-0000M9-Jm
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 09:47:27 -0400
Received: by mail-pf0-x244.google.com with SMTP id j17-v6so1000093pfn.5
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FDRDZb1QsEWB9owvvKGBtE9HItGiJboNauvAXTxz8oo=;
	b=V0Rje5UqdnlXyQ664NK+s8LIHnQJVjxLI3pw6WHiIgvTp0NvaUK+RBPSiRByMQzApk
	Nre8T/NPLWzZhhzVvl4U+Yw2WNP3SN7OOrPU6jzhkNOYSdc7xsapwA6NiRbXDENC3nLb
	bOzo1L4MyKFaVa5wS/ccrKPKtYcF1w4PVBalY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FDRDZb1QsEWB9owvvKGBtE9HItGiJboNauvAXTxz8oo=;
	b=CBTTpnKCnf15pcxSrWMIHt0PbomAvbMnIRLWfeRKJw6S5D6Gej7t8284CVIy0GuN7n
	QXQy05WRAS9EAJ+zp2af5KYYXYjsiO3wgBuQdyjKHYJv7p0UPgnTsmq9qNmySqzxvOdq
	M9Fi2EeAVwnCHjTnKbAGBNmU7NnyXZ29AsPJKbARqNLKKnp1U+rR9TnZWvHu2FiYe/TN
	QTAWZGRkR2MZkK/BTOaga7ssiHF/WeIgJQQuFwlxRf6Ay5/1Xigq82OoQsxl2hlYH2Wy
	HJUKrtADTPSCNw4D+LxUeWAuAea0/czwUgEb2swbFzka3/DGr+K/Zxq/09c+LS6nBc7f
	tVwg==
X-Gm-Message-State: APt69E2k099siG6d6WWFiTf42OX/qsEl1EprW7XcAiv5JZq/jA/wgJNn
	vZiPfWshjqExhFlpKDEbScqUvtQhdrk=
X-Google-Smtp-Source: AAOMgpcEGL3VWWNqOI0NERGB18klN/ftIe8acvBQXaVfUAbTJ6tNUBrNQLaypauWaRas7hl0s4nNXQ==
X-Received: by 2002:a62:152:: with SMTP id 79-v6mr2987744pfb.74.1530107246462; 
	Wed, 27 Jun 2018 06:47:26 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	y15-v6sm6607222pfm.136.2018.06.27.06.47.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 06:47:25 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-36-f4bug@amsat.org>
	<3c5eef2f-115c-9c6d-2dba-0407fcebcdc4@linaro.org>
	<45330ee3-4dcf-3c9c-6781-2db11ff4e8c5@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c487ad94-5a1c-64da-5e26-61202e0e6d69@linaro.org>
Date: Wed, 27 Jun 2018 06:47:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <45330ee3-4dcf-3c9c-6781-2db11ff4e8c5@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 35/46] hw/usb: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 13:47:35 -0000

On 06/27/2018 06:03 AM, Philippe Mathieu-Daudé wrote:
> On 06/27/2018 04:04 AM, Richard Henderson wrote:
>> On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
>>> -#define VSCARD_IN_SIZE 65536
>>> +#define VSCARD_IN_SIZE      (64 * KiB)
>>>  
>>>  /* maximum size of ATR - from 7816-3 */
>>>  #define MAX_ATR_SIZE        40
>>> @@ -276,7 +277,7 @@ static void ccid_card_vscard_read(void *opaque, const uint8_t *buf, int size)
>>>  
>>>      if (card->vscard_in_pos + size > VSCARD_IN_SIZE) {
>>>          error_report(
>>> -            "no room for data: pos %d +  size %d > %d. dropping connection.",
>>> +            "no room for data: pos %u +  size %d > %ld. dropping connection.",
>>>              card->vscard_in_pos, size, VSCARD_IN_SIZE);
>>
>> Did you test this with i686 host?  %ld doesn't look right.
> 
> Yes...
> 
> $ uname -m
> x86_64
> $ make hw/usb/ccid-card-passthru.o
>   CC      hw/usb/ccid-card-passthru.o
> $

Ah, no, I mean 32-bit i686, not x86_64.


r~

