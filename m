Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWSVW-0006EE-Eb
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 16:18:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSVT-0006Bq-Ed
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 16:18:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSVS-0006lO-Ep
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 16:18:07 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42734)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSVO-0006gg-4i; Fri, 22 Jun 2018 16:18:02 -0400
Received: by mail-qt0-x243.google.com with SMTP id y31-v6so7049221qty.9;
	Fri, 22 Jun 2018 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8E+Mv0DHlkzGWdCzqF4H2a2mb7Jgv86rCfgomPd1Dzo=;
	b=Vo31IipKfXqqJ7Kyny8ucyL8cl/PZiQGTvl2UmZvWI7GjTHq2Vae/Xd7V9dLdtwplq
	3fOH3MCsqCUFQCKuLWTbL08HxkcWNKwcrAcnIsKY3wiIppjeYr7eXOnD9fQsZCYrsVQR
	JtNnW9rvJAWfhpwMtGRq+5B9JDQHM7tInFJYpXL7d38tx3zHTfva1RD+ReHE1jAKTw4M
	cmWbUb3r/1+9zcFHLjUFh2uisTcQkC2d360jgnZGdl7T4YWXQeaeu7V1adqrjpGouAGo
	iLMS+b2dl4exVrPwSZGKh9Z0cbFcYT7yMG0u+3Bh+DyHlBUej2iOK7bYU+D4F2OQA4eG
	w3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8E+Mv0DHlkzGWdCzqF4H2a2mb7Jgv86rCfgomPd1Dzo=;
	b=INfKc/xvRruUisAduG+gwM53HkCKPF7L/Cqkm5mGyCUDiUi3td95aGFVMU4g18wFcF
	9cHamg+Hw+OgGpIvXiaKORGCy9TPmmKDrZF5F/RLdycCSBOhRKPnPkPkMEIF/pn59+ZK
	tFSA0liL03tT/YPD64SAgYKXFoSot3CIsQG/D1nlAWC18bk1YtxUGNGQPn4sXS9vgxK6
	kLCK1QHxn3He1ahb2j+8wzay8hrA4+VY/LYlexqkv1YWQ6TRwQpcSwvUx2JpwV1mAQGH
	3+I2QzzEKcz6Dp98mr0yeEWM/YijfCKEk1y25iGzyQqPjY0Lul4rrbwewusU/dazpsgG
	FlTg==
X-Gm-Message-State: APt69E1I4a2OnYW2+d+m9CCdnhJay6Khkeu3m7LD9m9j71RENqWBq3iN
	nlGzU+Qm7bWj9jArlqQ1GYpdChNZ
X-Google-Smtp-Source: AAOMgpdQwLufLzcR9GWoIvFVJIAFaHBROSoos98pXWpgx1AHke5Fs5pK842L7FIFQt0ktUuO2cIi/A==
X-Received: by 2002:a0c:be88:: with SMTP id n8-v6mr2828871qvi.78.1529698681520;
	Fri, 22 Jun 2018 13:18:01 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm4754517qti.7.2018.06.22.13.17.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 13:18:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20180622124716.9179-1-f4bug@amsat.org>
	<CAKmqyKMp8-ZAaTU2nxaMCqoR0JsbXoogR6t6Nq7UwU3B3o1AKw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8ae01d79-ef5e-0036-bd4d-cb667a3e2cf4@amsat.org>
Date: Fri, 22 Jun 2018 17:17:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMp8-ZAaTU2nxaMCqoR0JsbXoogR6t6Nq7UwU3B3o1AKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core/register: Log
 unimplemented access via the 'unimp' debug level
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
X-List-Received-Date: Fri, 22 Jun 2018 20:18:08 -0000

On 06/22/2018 04:49 PM, Alistair Francis wrote:
> On Fri, Jun 22, 2018 at 5:47 AM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/core/register.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/register.c b/hw/core/register.c
>> index d2d1636250..8ed7c6b927 100644
>> --- a/hw/core/register.c
>> +++ b/hw/core/register.c
>> @@ -203,7 +203,7 @@ void register_write_memory(void *opaque, hwaddr addr,
>>      }
>>
>>      if (!reg) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: write to unimplemented register " \
>> +        qemu_log_mask(LOG_UNIMP, "%s: write to unimplemented register " \
>>                        "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
>>          return;
>>      }
>> @@ -232,7 +232,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
>>      }
>>
>>      if (!reg) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "%s:  read to unimplemented register " \
>> +        qemu_log_mask(LOG_UNIMP, "%s:  read to unimplemented register " \
>>                        "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
> 
> I'm not sure this is correct. These can be unimplemented because there
> are gaps in the register memory map, so it is a guest error.

This is exactly what I was wondering, thanks for your comment, I'll
probably add a comment about it.

> 
> Alistair
> 
>>          return 0;
>>      }
>> --
>> 2.18.0.rc2
>>
>>

