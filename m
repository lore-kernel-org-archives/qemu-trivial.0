Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQUX-0003lt-7n
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:16:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1dXQUU-0003jF-JB
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1dXQUP-0001Lo-EP
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:16:34 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:35398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1dXQUP-0001LH-8B
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:16:29 -0400
Received: by mail-wr0-x235.google.com with SMTP id w4so23959298wrb.2
	for <qemu-trivial@nongnu.org>; Tue, 18 Jul 2017 04:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=hCdDbXacDtjP3SSECST3KuoNqsZOUYRUNpriwXrO1nk=;
	b=KmBO7m4GqrV9iNm3w9zjnWKcVnxjzeqYGH2w6/ctzuKilXu+GCjO8lodeCSeimsqSu
	t70iZ5K3CZZj5kWxaVAPGrr7vplhD3mf1olwngN7gCTGX66XTq3XSPsgaDW6kMky02hV
	IIFnvUKH+CVD3w5Eme1mD017+M5Jm03+vXk14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=hCdDbXacDtjP3SSECST3KuoNqsZOUYRUNpriwXrO1nk=;
	b=Wmh74q/45POZPFxE6TXuxJvmCmkarf04mbQlt/Q2/u+iQgdDALmnnpSl0XPxZKu8VP
	+i51yEPNcJ8cBXgbL5WcHlVmp/YHrbv1Yhco/lT6qflzQi8EklIA1Q87IPib6eOwfnjq
	jFx+8ExFEyPQX9q/vIHBtwbYvnJ2TsTmptcO0u3D2F5yXueFwOwQorL4bsG9gTrwbxT0
	3icLVUATBFUczgfwIxQKgmvaOo3RnmeTwTINMPCt2oxUQkYYMzPixQ8YswSz+6aDL2pb
	y6XMJ58tRirIsGkQFn0tmAiMcFlL54aSs9tXs26K7eckads5RGrIqGW3sEinAFZH7TP3
	PK2w==
X-Gm-Message-State: AIVw111AfcLKpqkzaR5o7bNb/Fhh0dQbmnuTQfyxoWxdO5YAku4q6Weq
	7Eh9erZE3tLL2Efy
X-Received: by 10.28.150.142 with SMTP id y136mr1402934wmd.51.1500376588018;
	Tue, 18 Jul 2017 04:16:28 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id s2sm5032744wmb.27.2017.07.18.04.16.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 04:16:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0857C3E0128;
	Tue, 18 Jul 2017 12:16:26 +0100 (BST)
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-27-f4bug@amsat.org>
	<CAJ+F1C+WsdUp3Vtx+-FZ9g7URSAQuJWb6h7-w6yJXM+4TKQNjA@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu trival
	<qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>, Richard Henderson
	<rth@twiddle.net>
In-reply-to: <CAJ+F1C+WsdUp3Vtx+-FZ9g7URSAQuJWb6h7-w6yJXM+4TKQNjA@mail.gmail.com>
Date: Tue, 18 Jul 2017 12:16:25 +0100
Message-ID: <87bmoi806u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 26/29] tests/tcg: use
 ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 11:16:35 -0000


Marc-André Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Mon, Jul 17, 2017 at 11:10 PM, Philippe Mathieu-Daudé
> <f4bug@amsat.org> wrote:
>> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/tcg/alpha/test-cond.c | 2 +-
>>  tests/tcg/alpha/test-ovf.c  | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>
> I think those do not include osdep.h
>
> (sigh, tests/tcg would need some love ;)

Pranith has had a couple of revs at this:

  Subject: [PATCH v5 00/19] Cleanup of TCG tests
  Date: Thu,  1 Dec 2016 00:14:14 -0500
  Message-Id: <20161201051433.17168-1-bobby.prani@gmail.com>

We have the cross-compilers available as a fallback via docker although
not every one can seamlessly use it for building stuff. Is getting a
working cross-compiler setup too much of a hurdle fore those that want
to build cross-arch tests?

>
>> diff --git a/tests/tcg/alpha/test-cond.c b/tests/tcg/alpha/test-cond.c
>> index 74adffaa69..e5596f10b8 100644
>> --- a/tests/tcg/alpha/test-cond.c
>> +++ b/tests/tcg/alpha/test-cond.c
>> @@ -77,7 +77,7 @@ int main (void)
>>  {
>>    int i;
>>
>> -  for (i = 0; i < sizeof (vectors)/sizeof(vectors[0]); i++)
>> +  for (i = 0; i < ARRAY_SIZE(vectors); i++)
>>      if ((*vectors[i].func)(vectors[i].v) != vectors[i].r) {
>>        write(1, "Failed\n", 7);
>>        return 1;
>> diff --git a/tests/tcg/alpha/test-ovf.c b/tests/tcg/alpha/test-ovf.c
>> index 01c80e7525..43fc6ebb2e 100644
>> --- a/tests/tcg/alpha/test-ovf.c
>> +++ b/tests/tcg/alpha/test-ovf.c
>> @@ -20,7 +20,7 @@ int main (void)
>>  {
>>    int i;
>>
>> -  for (i = 0; i < sizeof (vectors)/sizeof(vectors[0]); i++)
>> +  for (i = 0; i < ARRAY_SIZE(vectors); i++)
>>      if ((*vectors[i].func)(vectors[i].a, vectors[i].b) != vectors[i].r) {
>>        write(1, "Failed\n", 7);
>>      }
>> --
>> 2.13.2
>>
>>


--
Alex Bennée

