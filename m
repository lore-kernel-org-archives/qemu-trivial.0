Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBKsL-00077P-5d
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 04:31:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBKsE-00071T-Pc
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBKs2-0007Mj-Qo
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:31:38 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:54845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VBKs2-0007MF-Ko
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:31:26 -0400
Received: by mail-lb0-f172.google.com with SMTP id o7so2796314lbv.17
	for <qemu-trivial@nongnu.org>; Mon, 19 Aug 2013 01:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=s9GJdDHZT+dfoVT0Gcyv9H2Tjq1eXf2ZR92+I+8aOf8=;
	b=G2XMcsH4gs3oU1Yc7Ac6/x3BEOx2JPtK+Y5FAgmtjfysVyDC09qC77++cYM0VfqiBZ
	I531xII8QWXkvQivn5I+ZhBvqCP4shXkmEp9TtTw+9h9OeK7+ADZZdO2Kv7uwx2ZEg72
	RKvA6gOpVHfMN4E5zrjdZsRQGB9PzjoNmwu8fIejpBUjtqlJUlIrkEX2vtTQ/VNl7yXl
	5uv54JaAjQ/XafnvBeO9GsLNAQz5Vi6QFtkQ3KM9Da5T9w35Xw8BXEe4Lin3/nKB+PKk
	g8vJwuLzbd2Kw2IkauDJk5iCFZYqzLvym07pLohU/8LntQEMMLtMVpZBotzUa6Evrm8W
	IVeQ==
X-Gm-Message-State: ALoCoQlfM2DDgK9afxwuJ2nG+WASNzOvfZqwXE9G3eVq9f2IoCxSwgOoqhi9WQCpnIpUlgH6Xc8I
X-Received: by 10.152.2.4 with SMTP id 4mr11268781laq.0.1376901085083; Mon, 19
	Aug 2013 01:31:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Mon, 19 Aug 2013 01:31:05 -0700 (PDT)
In-Reply-To: <5211D6C3.2000609@adacore.com>
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
	<1375447708-14545-2-git-send-email-chouteau@adacore.com>
	<5211D6C3.2000609@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Aug 2013 09:31:05 +0100
Message-ID: <CAFEAcA8rOis5qsqL-Oq-PCKR9icBsxsL1tJGGsLJfJtgXwL2UQ@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Add ARM registers
	definitions in Monitor commands
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
X-List-Received-Date: Mon, 19 Aug 2013 08:31:44 -0000

On 19 August 2013 09:26, Fabien Chouteau <chouteau@adacore.com> wrote:
> Any comments?
>
> Regards,
>
> On 08/02/2013 02:48 PM, Fabien Chouteau wrote:
>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
>> ---
>>  monitor.c |   17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/monitor.c b/monitor.c
>> index 5dc0aa9..78e93af 100644
>> --- a/monitor.c
>> +++ b/monitor.c
>> @@ -3167,6 +3167,23 @@ static const MonitorDef monitor_defs[] = {
>>      { "cleanwin", offsetof(CPUSPARCState, cleanwin) },
>>      { "fprs", offsetof(CPUSPARCState, fprs) },
>>  #endif
>> +#elif defined(TARGET_ARM)
>> +    { "r0",     offsetof(CPUARMState, regs[0])  },
>> +    { "r1",     offsetof(CPUARMState, regs[1])  },

Rather than adding yet another entry to this target-ifdef
ladder in common code, maybe we can abstract this out to be
a method/field of the CPU object?

Andreas can probably suggest the best approach.

thanks
-- PMM

