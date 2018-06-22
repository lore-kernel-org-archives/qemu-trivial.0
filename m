Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWM22-0007uE-B0
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:23:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM1y-0007sD-Q4
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM1x-00059u-WB
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:23:14 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:46529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM1p-00053E-Qx; Fri, 22 Jun 2018 09:23:05 -0400
Received: by mail-qk0-x241.google.com with SMTP id o2-v6so3622646qkc.13;
	Fri, 22 Jun 2018 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZW4HvlzcY5Xc2TRp91BW/YIucMX2WLbM95X0e8eVsu0=;
	b=O8c2XrG2p3DngMwsxqBfLR3hdprPOjflFHkkpxnl9hw8BtK85SThUIQ4jKUA+sEscE
	aWkav5V7UkXRpUfMsKBddX287xvQ7HJbwqDoAhs5lznaV6vNRxlv40S/Ggjc0txi5yeF
	mQVLjBMujO7AnWx1xqtkjVWqC6ZTVaJZBbzJiiyyzebBYLw1lLwhVqolAj11hbEKuD7b
	7p903GUSeUG+QlPfEraJ8NrfXSrMTHUIKuSIO4qTszv6vCKxCvKyNyaOrwMJiprpC3zG
	6kIPF+KgA0vWjWufhyzFmxqPnT8Me1ZJu/pOy52D4h8ik4f45gazIelWqC0daccIYU5l
	4RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ZW4HvlzcY5Xc2TRp91BW/YIucMX2WLbM95X0e8eVsu0=;
	b=ROkEPJpDM+hD1EMgDlB4i7qlFBk0K0JeyHc75qtBP3OLSjjSVKFv5k6KxkQZBejp7W
	v28rsX4nb8pqd+/7oMtONNDlxSylWV/S0ILfvuRrSdiH4ZB4sD8ZwSgtcjwpRfJSeZZW
	9bFRqU72qhbdtZRiKWrJVdIfqcrBN4xu1WxJRmEr2wP0V9DKPlTpE9nW9YTN0w7SATo/
	GmvdHqyMoHxfPfuyZWMUXs9tq6+MJYZD72YR38oxbznEQ6oeCO44W4EAqstJKvwd7Ys3
	ugfRwrTGOeuCvVGEiXCA8WHo1k0Ubc+Do9fiEzZZDjx0pjPAWHKT00otScs3Li7A+f0c
	hbZQ==
X-Gm-Message-State: APt69E3g56JLTWuVUKqAKAMkJbO2VZikAwujD3tbXLJR/BAxZEvb8tWn
	3nfxxfcbrMskqi3VDAeBwjBmT10h
X-Google-Smtp-Source: ADUXVKL9x5FPf1SmWfsQB8d5qCLnZI5CkcF63VmcCEvnKjpo/PK6gXxOZNUFY+PEaUyDfkzEwX1qag==
X-Received: by 2002:a37:4cf:: with SMTP id
	198-v6mr1239415qke.186.1529673785152; 
	Fri, 22 Jun 2018 06:23:05 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k6-v6sm4455139qtm.30.2018.06.22.06.23.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:23:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180621180224.8312-1-f4bug@amsat.org>
	<20180621180224.8312-5-f4bug@amsat.org>
	<cbfadf4b-e3ef-e7bc-921b-2926c270f51f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aa4f6d42-7784-a462-3110-f88b0ff64970@amsat.org>
Date: Fri, 22 Jun 2018 10:23:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <cbfadf4b-e3ef-e7bc-921b-2926c270f51f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/11] hw/dma/omap_dma: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
X-List-Received-Date: Fri, 22 Jun 2018 13:23:15 -0000

On 06/22/2018 05:24 AM, Thomas Huth wrote:
> On 21.06.2018 20:02, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/dma/omap_dma.c | 66 ++++++++++++++++++++++++++++++-----------------
>>  1 file changed, 42 insertions(+), 24 deletions(-)
> [...]
>>      case 0x78:	/* DMA4_GCR */
>>          s->gcr = value & 0x00ff00ff;
>> -	if ((value & 0xff) == 0x00)		/* MAX_CHANNEL_FIFO_DEPTH */
>> -            fprintf(stderr, "%s: wrong FIFO depth in GCR\n", __func__);
>> +        if ((value & 0xff) == 0x00) {
>> +            /* MAX_CHANNEL_FIFO_DEPTH */
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: wrong FIFO depth in GCR\n",
>> +                          __func__);
>> +        }
>>          return;
> 
> Not sure, but doesn't that MAX_CHANNEL_FIFO_DEPTH comment rather belong
> to the if-statement than to the print statement? If so, could you please
> leave it at the end of the line?

OK ;)

