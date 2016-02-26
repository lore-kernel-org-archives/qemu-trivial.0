Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZJmf-0000r2-AC
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 09:54:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aZJmc-0000qE-SB
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 09:54:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aZJmY-0006Po-Pg
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 09:54:18 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:37485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aZJmY-0006O1-Ic
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 09:54:14 -0500
Received: by mail-wm0-x232.google.com with SMTP id g62so73493347wme.0
	for <qemu-trivial@nongnu.org>; Fri, 26 Feb 2016 06:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-transfer-encoding;
	bh=F/weLbyuXPZ1uUFiKZpLjIUmv2s10lvTnSwn19rJyYc=;
	b=GtIsR9o9VqpBL/T0a49QDpnIiX0h6zr7C/JZ8jeUU75sGYLuim/yWFJMPcO5VUE6mm
	VnuAbHe7t08EUh0Vf8eg9ogQ44Q8ROI2fXuRssCp1jvFw+SWDkXxZrVb3PldlqGdqBzr
	dIny5yCEKtDoTLIS6Ogtp1iBNm2cPDGyZXWnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-transfer-encoding;
	bh=F/weLbyuXPZ1uUFiKZpLjIUmv2s10lvTnSwn19rJyYc=;
	b=VuktVGUBeNOxNmMdENqPy4njY7ADnsOdpo+m4TWFZC0plic6FP6HgRdhjouC5ju/ku
	cOtcxxmrKT311W//cXiZjiIFyBgioDkvBN9yE+nexmUS5SsHnuwO/CpoUYgL7+HSuMKj
	HyCeLea3mRquHnrnLr4LnfygmBN/LZ5ahr1uAzPmt+8yv/lyBombN4Wc/Za0VAG7xvTW
	jBDAobkuGtZJWZgSzq9WPc5Djnj7kZW7fKr6J99XN2treZcZXaSlCt/XJON7geeA7KwB
	eAEkMRipVGTdPeqpI3twdsYBTIlHkM/s3zSyK4+9FPZ0KtYC6FBi1TU617QTEABV+P/n
	7XZw==
X-Gm-Message-State: AD7BkJLKifCUsZ2k/tb/Fu4142yRMwNhnLJbEgjCwa//dLxpn4VtEBsoP5x+XLys6K41S8kO
X-Received: by 10.28.156.73 with SMTP id f70mr3922673wme.52.1456498451413;
	Fri, 26 Feb 2016 06:54:11 -0800 (PST)
Received: from [10.19.2.82] ([109.169.56.124])
	by smtp.googlemail.com with ESMTPSA id
	192sm3238251wmw.0.2016.02.26.06.54.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Feb 2016 06:54:10 -0800 (PST)
Message-ID: <56D06712.2030607@linaro.org>
Date: Fri, 26 Feb 2016 22:54:10 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Shannon Zhao <zhaoshenglong@huawei.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com> <56C845B1.3080000@huawei.com>
	<56CE2D33.7020005@redhat.com> <56D04596.7010205@huawei.com>
	<CAFEAcA-nQuKcONE4GZwavB2w55srvHQP4OxLD6epJaZf4b=agA@mail.gmail.com>
In-Reply-To: <CAFEAcA-nQuKcONE4GZwavB2w55srvHQP4OxLD6epJaZf4b=agA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Cc: Wei Huang <wei@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] arm: virt: change GPIO
 trigger interrupt to pulse
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2016 14:54:19 -0000



On 2016/2/26 20:53, Peter Maydell wrote:
> On 26 February 2016 at 12:31, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> So how about below patch? I've tested it and it works both for ACPI and
>> DT. Could you help verify if it works for you? Thanks.
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 15658f4..4d45ea2 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -558,11 +558,20 @@ static void create_rtc(const VirtBoardInfo *vbi,
>> qemu_irq *pic)
>>       g_free(nodename);
>>   }
>>
>> +#define GPIO_KEY_LATENCY 500 /* 500ms */
>
> I don't understand why a 500ms pulse is better than a short one.
>
Oh, I just pick a value which seems like a real latency for pressing a 
button. What's your suggestion?

>> +static QEMUTimer *gpio_key_timer;
>
> This is state, and must be migrated somehow.
>
Ah, yes. So is it fine if we move this timer and the notifier 
virt_system_powerdown_notifier to VirtMachineState?

Thanks,
-- 
Shannon

