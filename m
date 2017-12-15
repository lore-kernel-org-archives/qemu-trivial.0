Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePn9Q-0006Q1-Pu
	for mharc-qemu-trivial@gnu.org; Fri, 15 Dec 2017 05:23:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePn9J-0006Ij-Vx
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 05:23:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePn9G-0005hC-PE
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 05:23:25 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:40052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePn9G-0005gS-In; Fri, 15 Dec 2017 05:23:22 -0500
Received: by mail-qt0-x244.google.com with SMTP id u42so11439952qte.7;
	Fri, 15 Dec 2017 02:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=faA6XhMxVoPnfxrTB7o1ha05t7EGcDT+rtJoNZzHe8E=;
	b=I0d9bXv1Beufl1ZITWMNXginY2v7285k2COla9CDpSypWiaB34enT8/GKPC7r0gdLA
	lBB9AbpPEa07NQKAx8sGIOJG0g36N3BD0fxRoVM4nnZn5AfGoC/3f6bLoAYSO/E84AFV
	ORRFX+pkeEQcNAR8thcaf6fvaCcVUdv6jihk3NeVMXZFhJ6QJ6PC3R4LSn5kJfAdkQTn
	lKMotLheR+EhAGTDDvqzidc1AsxcT/OoGUG1fHvGluQ9Bjys+GSx36fQoLtFbSaUxHj5
	hJxzKgfUNZtMzi6rtb5G6bYF+N7iALCkzfg8HHyAkuZz/cfOClEtglKyaq9u02D8EW3t
	zr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=faA6XhMxVoPnfxrTB7o1ha05t7EGcDT+rtJoNZzHe8E=;
	b=jC6YoiasvWXj3mavjR4UbACYTbDdWJA0rN6xy+/4YnXYOLYnyE3BckBbcAyQQQe33a
	NwdZ3amBRCgfQ1xPZiFCkvRkSSqvZwx66dA+ZPtINH4XhMwA4eNA8gWPGvD0C7Dlg23y
	02wK4Vm/iu15+KXnw0y63dJePoCqUNW3WNxFxWOii5XLMkkwYP11TlnwaFjc7Q+NI2E7
	A9t5TJ/lafRM9CVe37WLUaa+wf4mqhqgyqKCs9WnJgT5ntaNNlyn3cjeaQv4S4hr7kYV
	5Mw+TcMQR0sD1gvvsQigd2OpMRLlFEWsUnvUjH2UBE0w1Yz/xgoZtZDTY4NNKG++ORU2
	57SA==
X-Gm-Message-State: AKGB3mI9HHWxdbN2JVSPmbyfRR4EiUbzbnzOZ3QtWTcZoZhec6GL1pUV
	MRA52CNPPjaxrWftP3bbHhqGqdEm7ro=
X-Google-Smtp-Source: ACJfBovw74jnntRCmcpE3cJCcVSq6UAejbOQsyYIwgCf9HhkkIr4Im8dMo8pUtVeMZC+uC3VZ/K0AA==
X-Received: by 10.200.36.22 with SMTP id c22mr21364723qtc.207.1513333401860;
	Fri, 15 Dec 2017 02:23:21 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id
	s18sm3898031qtc.25.2017.12.15.02.23.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Dec 2017 02:23:21 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
References: <20171215033015.738-1-f4bug@amsat.org>
	<20171215033015.738-5-f4bug@amsat.org>
	<800d15c5-fe10-56af-083c-501291d245ad@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9db63210-0e85-5463-e420-34327f24e1d3@amsat.org>
Date: Fri, 15 Dec 2017 07:23:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <800d15c5-fe10-56af-083c-501291d245ad@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [PATCH v4 04/43] MAINTAINERS: add an entry for
 the i82378 (superio)
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
X-List-Received-Date: Fri, 15 Dec 2017 10:23:32 -0000

On 12/15/2017 07:17 AM, Thomas Huth wrote:
> On 15.12.2017 04:29, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
>> Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
> 
> Remove the doubled Reviewed-by, or replace the second line with:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Haha ok, thanks :)

I applied this series from a patchwork bundle and didn't notice it would
keep enqueueing R-b from the same reviewer.

> 
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 31c673d60a..4618f9b4db 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -732,6 +732,7 @@ F: hw/ppc/prep.c
>>  F: hw/ppc/prep_systemio.c
>>  F: hw/ppc/rs6000_mc.c
>>  F: hw/pci-host/prep.[hc]
>> +F: hw/isa/i82378.c
>>  F: hw/isa/pc87312.[hc]
>>  F: hw/dma/i82374.c
>>  F: pc-bios/ppc_rom.bin

