Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRaYW-0007Gl-PM
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 05:25:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRaYU-0007At-Qf
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 05:25:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRaYR-0006xx-LS
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 05:25:22 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRaYR-0006xM-GC
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 05:25:19 -0500
Received: by mail-wm1-f66.google.com with SMTP id 125so21298942wmh.0
	for <qemu-trivial@nongnu.org>; Tue, 27 Nov 2018 02:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4aD/RjV6v+Qs32EhOGv02RC2vKrMN6jUZ03dt3CQIv8=;
	b=ZTlYpXq7jBns7JWcJtL/z5TKeAZKLOwfE88GN71XfNzOnX3PjaxkvN6pGKZDQ1nQAc
	1u5U6eLpOCFTYfU2sSYTXzgTe2chorM0J7Ra+hoj7ylEeK7qnHtshlxXMt9xRiW+6Ghj
	uEZbVIzZaYGH2ZtpbCMsuBjYB91wS2rBTnhGZQ2nXYK+XcHJeU5W2K8iucIan5u5Hxn5
	pVo1InB0D8I7umlA/2Z81syTWswnoxD66sEK/VpF43+xTny0ycOkiBoFROXMNgILvZIr
	SVEZnhD4M0eM3AnxKRHJek9ey60g3Hvu/bfwqMK6yOg8IprrAJD5RFg1yuwhP05r4kT5
	OygQ==
X-Gm-Message-State: AGRZ1gLApzhGxQQCgM7slw0bRr6sWAar+JUKeqxHguQNKCRVDTWklnWg
	9LMPUYCWWf4opfjUj2C7m/mSy2t7M3A=
X-Google-Smtp-Source: AFSGD/Ws53UzJLuKe86gjATg7G1HgydlClUEFNVdE3V7aL6JgGrqS49b8e0DzLSPiylPiIPphc8XtA==
X-Received: by 2002:a1c:3e84:: with SMTP id
	l126-v6mr26607829wma.57.1543314318227; 
	Tue, 27 Nov 2018 02:25:18 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	n62sm1921484wmd.25.2018.11.27.02.25.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 02:25:17 -0800 (PST)
To: Aleksandar Markovic <amarkovic@wavecomp.com>,
	Thomas Huth <thuth@redhat.com>, Stefan Markovic <smarkovic@wavecomp.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-8-philmd@redhat.com>
	<19bfc512-65ac-9968-3930-8b423efde241@redhat.com>
	<BN6PR2201MB12517471D0B4ADEE146C1414C6D00@BN6PR2201MB1251.namprd22.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1ce06557-1b19-c736-e2d0-674263cf4f79@redhat.com>
Date: Tue, 27 Nov 2018 11:25:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <BN6PR2201MB12517471D0B4ADEE146C1414C6D00@BN6PR2201MB1251.namprd22.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [PATCH for-3.1 07/25] MAINTAINERS: Add a missing
 entry for the Fulong 2E machine
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
X-List-Received-Date: Tue, 27 Nov 2018 10:25:23 -0000

On 27/11/18 10:58, Aleksandar Markovic wrote:

[moving Aleksandar reply down to avoid top-posting on technical list]

> From: Thomas Huth <thuth@redhat.com>
> On 2018-11-25 21:49, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index aa17e9bbd3..81a22b2ccf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -864,6 +864,7 @@ R: Stefan Markovic <smarkovic@wavecomp.com>
>>  S: Odd Fixes
>>  F: hw/mips/mips_fulong2e.c
>>  F: hw/isa/vt82c686.c
>> +F: hw/pci-host/bonito.c
>>
>>  F: include/hw/isa/vt82c686.h
> 
> Please remove the empty line between bonito.c and vt82c686.h - or we
> could use my patch here from last Thursday instead:
> 
>  https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg04526.html

> I like better the patch that Thomas linked to. I think Philippe should
have included Thomas' patch, rather than creating new, overlapping,
patches. Confusion about straitforward things! Aleksandar

Yes you are right, I missed Thomas's patch, so please disregard mine.

Thanks!

Phil.

> 
>  Thomas
> 
> 

