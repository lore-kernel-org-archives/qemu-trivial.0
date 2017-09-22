Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvRIo-0006ZH-HA
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:59:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1dvRIn-0006YR-1h
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1dvRIm-0001le-BM
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:59:45 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1dvRIg-0001jQ-W7; Fri, 22 Sep 2017 12:59:39 -0400
Received: by mail-pf0-x244.google.com with SMTP id f84so679499pfj.3;
	Fri, 22 Sep 2017 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=k25ff+VyNh3IIpglrco+hYD/WBCdhCnJCsnxazCofY0=;
	b=ru43FtK5OUGFfS4X53M8VvKMFeMViVGvKSE3jHAyR0cXcOeH8jxlZIOs5AuT6yoZVA
	unsgDVNMyisTcyf4D3RnaFZ3qGYORTEtvxdR+eWjfbQnbm7AkCFF+Ylo7zmeDNZBKyga
	DUB5Uz5e0wxbJqbZTkPaJES53F7BkmVlFoJIiaEvsUMbeFZocHSQsFZCUQrwanl69aE8
	MvFP3UZCspjauaLTvsuyckOFB1Jasq2HHWYXG1PolOR5TOflVxek70znjdz4R0YOoOiX
	uOJJcfrbCtWm5DQA9sHfSQOWM35goOQnQoKakgrRwJtVABZhVGNTHjgtvHzlDXf+7Irb
	wD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:reply-to:subject:to:cc:references:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=k25ff+VyNh3IIpglrco+hYD/WBCdhCnJCsnxazCofY0=;
	b=k04Nt5qtMylltFLIe9w+QfSVsC0aFiOJHuAQJmzQc0GYcYJU3VOyot1FSB0SRnD5Xt
	3e+h4kYor4AbO2/dX4bHNTGtysZgqB2JKq3SyT8/SiBWr2b05fk/ZFKqfzqJEr6/OpeY
	fKy2pU8asCndhWYzKxftDxe3pk6w8SETq2M8qqUJgwgB55x/vYboxj6kIpgIYobmBHuV
	WpAdKV5UikzrpbNtse1nOx7Fgi/+LCRBtfFU5BBWI78+R2++4NG+iCtS0JLr62TaelWm
	rypdBhZOd0Tn3Wyq5Jkc/kQL1ot5Kcagvp3LDuwzOeI7Ei46n9eODz+dpA+08eDPUeDk
	hQxw==
X-Gm-Message-State: AHPjjUiwJq2p4NIdj5xDHcPJh36fm81IcnrFiSz7YdTOwlek5oiiCJe8
	yBJaqj/9DKoRMNeQn6W7wGVaO1M=
X-Google-Smtp-Source: AOwi7QDd3Mhd0Dj8CErupBux/t7YP2i5JpeK3t6CSTHw1OnoBPjJ2fF66LLMZCu7s9y1oN52VindfQ==
X-Received: by 10.84.234.197 with SMTP id i5mr9941577plt.184.1506099577860;
	Fri, 22 Sep 2017 09:59:37 -0700 (PDT)
Received: from [192.168.27.3] ([47.184.168.85])
	by smtp.gmail.com with ESMTPSA id g16sm337689pgn.62.2017.09.22.09.59.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:59:36 -0700 (PDT)
Reply-To: minyard@acm.org
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@suse.de>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-3-f4bug@amsat.org>
	<CAFEAcA8oovA56LwFtKoY1c-P93zxGoyH+vKAXF+hAK6r9bHxvg@mail.gmail.com>
From: Corey Minyard <tcminyard@gmail.com>
Message-ID: <25cd440f-8331-0ecd-ad8f-0e75e99d77ca@gmail.com>
Date: Fri, 22 Sep 2017 11:59:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8oovA56LwFtKoY1c-P93zxGoyH+vKAXF+hAK6r9bHxvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 02/34] hw: remove
 "qemu/osdep.h" from header files
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
X-List-Received-Date: Fri, 22 Sep 2017 16:59:46 -0000

On 09/22/2017 11:07 AM, Peter Maydell wrote:
> On 22 September 2017 at 16:39, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> while here, add entries for ppc4xx_i2c in MAINTAINERS
>>
>> applied using ./scripts/clean-includes
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
> This is doing two things at once and would ideally be
> two patches. Still,
I agree.
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
I applied this series and did some basic testing, so

Reviewed-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
> thanks
> -- PMM
>


