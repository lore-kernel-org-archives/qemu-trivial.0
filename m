Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQcpw-0006QR-Kq
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 13:02:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQcpu-0006Pw-ID
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 13:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQcpr-0001LP-DG
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 13:02:34 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQcpr-0001L6-9Y; Thu, 29 Jun 2017 13:02:31 -0400
Received: by mail-qt0-x243.google.com with SMTP id c20so12012725qte.0;
	Thu, 29 Jun 2017 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DP3mQQw+Nri7ApYmHGfeE7+7/h3I9XDaC7Xu8T/sEM8=;
	b=oh0mZX/0LXf8VHpEcj28gt4u8pvyrlz37g4nnkvRoTfTOfvqcXt3Z6RDzx2hcTUfXZ
	7dWK4kpdPjTPHXrQmXvxViWmXWzOswdwNtFuR5u3t5tU5bhwppzBfPznewEGHCJHyh7s
	i6rGoMkBfZzg2of0gFmKpbox/W3qh/EhEMPKiTrm/v9P/1xpYZ8rIHTNVJNi7TxrIH8N
	sWYKABnUylOHpWhLObwHZQ7LXllFXYjQes1Xu8yJCQmzJWoydKmlbuCYxphzrrSttfOh
	msCkHpS+dC6ILhEOgwlTY8Iq3ip6oQnQk46gJaMMNJtsXjX2NCzy/Q+1+zjE7FMjye1F
	P7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DP3mQQw+Nri7ApYmHGfeE7+7/h3I9XDaC7Xu8T/sEM8=;
	b=q/y5anB3LXty3IAFgE/YPrY7LdcNImo9psOXghyX1wfZx9fsFouPcz6M6TiyesJF4w
	6XnZm6mjOXUpxtp3zGMyH7FMNkrRk/OMkXF2efMpc2ZAGT4+b8JSfw4WeCmLYBJ6x/98
	UdQBthj6vl3Sh4/MKsMY/RSLFO6/8zGH7jQp79hOzYyIHR3Y0TktQnRIMWBA/FTZQvFa
	sh0zObDrboxA3J2iX+4NPnCr8z3OW/lia+M3E+esZVaRq575sYqmQT3cCwW300c9A3eE
	sbA8noKcTpzq+DveP+A6BJqwTdC7wI40dWnIOqnz+CJcxn9fRrxoSykcvtaXwKqyPgvy
	koSg==
X-Gm-Message-State: AIVw112gIR0UpO0DLH2nFIBoILXNDjAnYRzT1X7aKa5Z2tVQrV2hmIsR
	JjsjLFgv925IVNvoR1Eliw==
X-Received: by 10.200.40.34 with SMTP id 31mr7705834qtq.22.1498755748996;
	Thu, 29 Jun 2017 10:02:28 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	x55sm4694235qtc.44.2017.06.29.10.02.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 10:02:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Stefan Weil <sw@weilnetz.de>, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, "Emilio G . Cota" <cota@braap.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20170629010300.2848-1-f4bug@amsat.org>
	<20170629010300.2848-6-f4bug@amsat.org>
	<9403a3d0-41f6-add2-04fd-12034fe7699a@redhat.com>
	<ecb12a15-5b0c-67ef-18ad-e627b591148e@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <280da99b-50a7-85fe-8f3e-0432adf8bed6@amsat.org>
Date: Thu, 29 Jun 2017 14:02:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <ecb12a15-5b0c-67ef-18ad-e627b591148e@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 5/8] tcg/tci: enable
 bswap16_i64
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
X-List-Received-Date: Thu, 29 Jun 2017 17:02:35 -0000

On 06/29/2017 01:52 PM, Stefan Weil wrote:
> Am 29.06.2017 um 18:29 schrieb Eric Blake:
>> On 06/28/2017 08:02 PM, Philippe Mathieu-Daudé wrote:
>>> remove some copy/paste leftover, code seems sane.
>>>
>>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Double-sob seems odd.
> 
> Maybe that double SOB can be cleaned by qemu-trivial (cc'ed).
> 
>>
>>> ---
>>>   tcg/tci.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>
>> Otherwise,
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>
> 
> Note from the author: it's not a copy/paste leftover, but was
> there on purpose: that code part was simply never executed
> before, and I only removed the TODO() statements from tested
> code.

I'll reword the commit message in my tci-fixes-for-2.10-v2 series.

> So you are the first one who found a test case. Congratulations.

Oh nice :)

> Reviewed-by: Stefan Weil <sw@weilnetz.de>

Thank.

