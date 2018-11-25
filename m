Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR3OL-0005Gi-9Q
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 18:00:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR3OI-0005Fg-Q6
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 18:00:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR3OE-0000Pv-QB
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 18:00:38 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gR3OE-0000Oq-JV
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 18:00:34 -0500
Received: by mail-wr1-f66.google.com with SMTP id j10so17019947wru.4
	for <qemu-trivial@nongnu.org>; Sun, 25 Nov 2018 15:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=h49mXQD/6evJzFcdAia785pdtgQ2K6zvVG6xgxtTHmw=;
	b=JE5JSl/8K22tkT/QnllXOtpr9ASeG2IuX2DlS4rmixyttlMvzr7GysPrIZxAegj90o
	BFkPhFBnztJJObbM7DVX6TXBYsoEKWghEGxipN18s7B3imlQDGcmFTRe9CwAg6fyed1h
	rErO6LSUFTXgC7Hemi3CH4WsFhMxbK731/4W5+PeKi63EPUgtyPwvAFK4IOZbIVRPpzo
	cB5qduO09i1HiUf6a+ZdDJV1JPrQghetX2wH3hshZYGmrggjG7ngZzMtjbO8scSY1aS7
	vHVC+/+m9RR80EE00WzdW/Tiuqj2yUpmMgwWY1eccKcX4+dHR0px7WBPRPxgRvUcH+m7
	tARQ==
X-Gm-Message-State: AA+aEWb6mCv4tAtCk0hoMQSe2fOjF0OfWdsjnkfVJENNzWiM5+hXlacD
	kSvwSUxBGLNpdehXQTixMTzaCQ==
X-Google-Smtp-Source: AFSGD/VvKTRIAFWL5AJ+r61MrnF4obBiwIqMB0vgSgi9hFW2tU9P28h7oqBoE890xiQrw4hIX7mqbA==
X-Received: by 2002:adf:c846:: with SMTP id e6mr2574085wrh.243.1543186833560; 
	Sun, 25 Nov 2018 15:00:33 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	125sm20166822wml.35.2018.11.25.15.00.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 15:00:32 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-7-philmd@redhat.com>
	<CAFEAcA_ujDFu_X0cm5gVppESYeZ4KfNwjJkVKrsCNRgBeeQ1OA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c29d16dc-5d6a-19d2-d024-8c5877e21f36@redhat.com>
Date: Mon, 26 Nov 2018 00:00:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ujDFu_X0cm5gVppESYeZ4KfNwjJkVKrsCNRgBeeQ1OA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [PATCH for-3.1 06/25] MAINTAINERS: Add a missing
 entry for the Xilinx S3A-DSP 1800 machine
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
X-List-Received-Date: Sun, 25 Nov 2018 23:00:39 -0000

On 25/11/18 23:50, Peter Maydell wrote:
> On Sun, 25 Nov 2018 at 20:51, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4e396cbe71..aa17e9bbd3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -822,6 +822,7 @@ petalogix_s3adsp1800
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>  S: Maintained
>>  F: hw/microblaze/petalogix_s3adsp1800_mmu.c
>> +include/hw/char/xilinx_uartlite.h
> 
> Missing the leading "F: " ?

Argh... If there is no need to respin, maybe the maintainer taking those
patches is willing to fix this mistake... :)

Thanks btw!

> 
>>  petalogix_ml605
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> 
> thanks
> -- PMM
> 

