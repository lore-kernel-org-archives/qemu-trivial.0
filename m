Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfRdn-0006A2-4u
	for mharc-qemu-trivial@gnu.org; Wed, 09 Aug 2017 10:07:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfRdh-000657-Q5
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfRdg-0005c0-OX
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:07:13 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:33442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfRdX-0005Uj-Ev; Wed, 09 Aug 2017 10:07:03 -0400
Received: by mail-qk0-x233.google.com with SMTP id a77so36382241qkb.0;
	Wed, 09 Aug 2017 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JKDf+mBevBTGPNqQsYAFfBR/4w7ohTMoy3k5ejnvVeI=;
	b=LYTwJHzwqUY9J1JQQlH5FrOcExWaC4WZob50+Xzj1zAOR7HMpXqOW/8rqByw5LJMNY
	39BwlWm9KjDRXWenBO0BVX7SvzSzNKOFK7pKD+uSAULyeNBjwnjTkdCPUKtluue8flMv
	32EetrVo8kgxtB2vAE5gktgyZFHatmAyQpfFPeb2ldng8QwfvnWa0kltAh53G93Qy1ej
	LbZDmmSPk+fhJcEKdskHFXr+Lx7QwdvIklyQileeHX9xCJTYPrNdHNKvKsebo2eAmzEx
	BysX3mcfTy2zJrZdlUBwKoxFk9W3eT01TxzINkqFp6JbuQMa4jQzYK+Ce8Dfv5fhS6CP
	0J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JKDf+mBevBTGPNqQsYAFfBR/4w7ohTMoy3k5ejnvVeI=;
	b=DpccVfWqzZR5RtBAbqDSpbrUCFwDGAPeLybH6tLfb4ppN3qPuHBPep9jwxbbVoRQJB
	7NW4uq4ez6AVNei9Oilkxpkez2S+1V98MbycvMARsUtDIRwFKaY+kbySi1Su987EjhFs
	mLub7ICIqX+vfxxiTaYJQb59YJbqsgmS8c85aXLRZ3ptAb18OKaUamij6wzrBHCP1vM6
	yGNAnAYvjKlX169dqYzGm5rJATZfZp8qu6l1vwmbie82TbvLrl+AGdNRlhbVOdZyPPJU
	GTdWaemwk8FOH+MQjDAwzFspEZOSgErFFHyvL+fIupHPZBEVdUuqwoRFsa9r4HF8lzEa
	AeBw==
X-Gm-Message-State: AHYfb5i+S6SQzyh//j2EXSHlOLy4+VI/whV7bwQotv7oMZ0V4OuHXQEd
	5GSTWvfvBhCGgQ==
X-Received: by 10.55.91.70 with SMTP id p67mr9983913qkb.237.1502287622757;
	Wed, 09 Aug 2017 07:07:02 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	x49sm2128233qtc.96.2017.08.09.07.07.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:07:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-19-f4bug@amsat.org> <87mv7aumav.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
Date: Wed, 9 Aug 2017 11:06:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87mv7aumav.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 18/47] MAINTAINERS: add
 missing TCG entry
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
X-List-Received-Date: Wed, 09 Aug 2017 14:07:18 -0000

On 08/08/2017 12:11 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
[...]>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8cb94af6c5..6b83dac812 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1633,6 +1633,7 @@ Common code
>>   M: Richard Henderson <rth@twiddle.net>
>>   S: Maintained
>>   F: tcg/
>> +F: disas.c
> 
> Is this really TCG only? Can't the monitor call monitor_disas in any
> mode?

Indeed, this doesn't seem TCG only.

Do you think there should be another entry in "Block QAPI, monitor, 
command line"?
or this file (and related include) rather deserves an own section 
(possibly tagged Odd Fixes) to unburden Richard?

