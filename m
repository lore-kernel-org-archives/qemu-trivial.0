Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbTZd-0001Q7-KX
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 12:27:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbTZb-0001PG-Ve
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:27:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbTZa-0003T5-VS
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 12:27:07 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:41140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbTZU-0003RT-Pu; Fri, 06 Jul 2018 12:27:00 -0400
Received: by mail-qk0-x241.google.com with SMTP id d22-v6so6593847qkc.8;
	Fri, 06 Jul 2018 09:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jXWygoV7zDptwCJSMIBJDKav5uLDLnCs6EeoAqTwqkg=;
	b=bsQKnWBRCHrR3TUSvSZgIgGZyt6/016mBtw2o+p4yY1ne3GDz4Sa0Y53p60IA/Ftv3
	ZmhHo9HUbEVRUk3o5ksag6iSr4cShXzUYAyqfrXrC3yf44idlQmpsD797afw8phQKJVR
	CMSvQQ6rDWBvD7z0LYK63Cgejrg1oiHcngjlY2WktoMLtPGbVD6Iu/ZIU439aeN9PytZ
	F2DHPapAfAhJIzicXWqfe2lPaEt3JLnlNwkKenlQGjiOIB/fKBI74lLw7FL1lYpBaZ9g
	9MlBFk5RWsBra4+zUmG03r0sOnKDzZwpNa0WCWy3/NzYj6/FAwhoEU15SB5SZZ9ukh8H
	j1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jXWygoV7zDptwCJSMIBJDKav5uLDLnCs6EeoAqTwqkg=;
	b=S/xFiifun6fj5TdlC8nUuQYRi4CW9C+1P2jopF5shu30oHncLenePgJx2OK4Qrjlr5
	vTsSB+DMEil4AYtdCXG3UN5f4xR+GRxak1ep6YtNEy8lcrbNxY2CQDO1jOTvEmwP7MiR
	nplc+M7cS+xzfank6lj98/r/MK4HIj9Mi8U4iolfHtcujrS2RlJw8JwpWbqJdLrXrx2g
	b25uQhfvETcb1MGfD8yOkYcVSoHVdAMbYkp0pl1faquO/m50IHtlG8RhVsZ2vRJjpXhZ
	95BHbYwuGEOimINDe48C+EtK5cGxVGmDA+qjYnsmVfBUNu0b6ZT+0aduxv6Mgin4T6uA
	iZ5g==
X-Gm-Message-State: APt69E25Fv6PPnApPIHMmuKXakyzXV3dsPZK4vMk/hOtPs26Sba73Ht2
	bEWLbEE2sAMKpxyXM+3zPLJW0bXb
X-Google-Smtp-Source: AAOMgpdwXK9s8ouIw46vsu2BoN59kqxe5yRT6ZTBOLPIyMjwR7q3/DcCzxdEAlxwgy9WHbRLH2a+9w==
X-Received: by 2002:a37:ddd5:: with SMTP id
	u82-v6mr9329288qku.420.1530894420174; 
	Fri, 06 Jul 2018 09:27:00 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	b7-v6sm4067446qkd.56.2018.07.06.09.26.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 09:26:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180706155127.7483-1-f4bug@amsat.org>
	<20180706155127.7483-3-f4bug@amsat.org>
	<CAFEAcA_rKe5MrPt36EAYjxB5TDREb9Ea+vj8u4kVPgamLDFiog@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c5000a69-8309-cb26-feeb-a70d1d9107ee@amsat.org>
Date: Fri, 6 Jul 2018 13:26:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rKe5MrPt36EAYjxB5TDREb9Ea+vj8u4kVPgamLDFiog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.0 2/3] linux-user: Do
 not report "syscall not implemented" by default
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
X-List-Received-Date: Fri, 06 Jul 2018 16:27:09 -0000

On 07/06/2018 01:08 PM, Peter Maydell wrote:
> On 6 July 2018 at 16:51, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> This can still be reported using the "-d unimp" command line option.
>>
>> Code change produced with:
>>
>>   git ls-files linux-user | \
>>   xargs sed -i -E 's/fprintf\(stderr,\s?(".*not implemented\\n")\);/qemu_log_mask(LOG_UNIMP, \1);/g'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/cris/signal.c       | 4 ++--
>>  linux-user/microblaze/signal.c | 4 ++--
>>  linux-user/nios2/signal.c      | 2 +-
>>  linux-user/sparc/signal.c      | 4 ++--
>>  4 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
>> index 0b405247cf..1e02194377 100644
>> --- a/linux-user/cris/signal.c
>> +++ b/linux-user/cris/signal.c
>> @@ -146,7 +146,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>>                      target_siginfo_t *info,
>>                       target_sigset_t *set, CPUCRISState *env)
>>  {
>> -    fprintf(stderr, "CRIS setup_rt_frame: not implemented\n");
>> +    qemu_log_mask(LOG_UNIMP, "setup_rt_frame: not implemented\n");
> 
> Your regex seems to have gone a bit awry here, because it's lost
> the "CRIS" part of the string (similarly below).

Oh I deliberately dropped it when using 'git add -p' after the regex
because I noticed neither nios2 nor sparc arch were using it, and I
don't think this is a relevant information.

Do you prefer I restore them, I reword the commit message, or even add
similar description for the nios2/sparc?

Thanks,

Phil.

