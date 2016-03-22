Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiOoS-0005VU-QQ
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 12:05:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aiOoN-0005SA-7n
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aiOoJ-0004Pi-U7
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:05:39 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:33402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aiOo9-0004Nz-DQ; Tue, 22 Mar 2016 12:05:25 -0400
Received: by mail-wm0-x229.google.com with SMTP id l68so199295629wml.0;
	Tue, 22 Mar 2016 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Goe2/4Xo5RfQS5ua83bYBTQ4Ll1d3GhDceI+SnyJd4M=;
	b=KgQztyrdk69lWRFIlBCyPSpnApKOq16aZlGp0mHUck2XQ6EXizQ0yG9e3iXZooYqFV
	V6fmsIHmO5h61V+vTfjOzvNWpI4r2dnkPdZ0bwxUb/83PYwj7OP5K3Xmdx9M/Oc7mN1G
	Va7H01NUDDynqCXsEMUPZQ06SpiDyVuuEFt82YaF82yEfECH4sZGyKbz+OLjZ+6iFetX
	3nht0Ea1XIMtlMinYhZw/f61wZgp7HjREGkPaRR5L+L2ZRw7/jgClw8VgiMPXAJDw3s0
	8a9l60zM3VIpIBxmLoqyPp66uKrBkOhv1ZjAIzjeZUk7EE9LGdTARu+FOHfjUvQF9tJ4
	bcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Goe2/4Xo5RfQS5ua83bYBTQ4Ll1d3GhDceI+SnyJd4M=;
	b=eiNlejPyRskQ6kRzEgd7K2aBx3pECWycZtAQWcha6nFAMNtKuONPlaT1f+wXBE152R
	aphzdzp74cCyIubIJ+mzWEQvMgiqmiZiRcIROoMd+Hr2mGcPkjrDT0vTulscWPypCr/D
	0qincmis+P8mWW96F6/335GBx02S6gKQr9HI1LdOi74PA7rlYPQtj+Ci4b2ufnvxuOgz
	F/bqYb1Vs4UofflawhcPvTr9jwFlkvetCDzQwTn95y0Eq1c3OUvly4cINCXcT8saBubz
	tUW820fzw3P4RW1bw9fq18WlKOXEwffUU8aluDe7reLroVfVEipDp1qURJ/AoJqvlu0E
	jbhw==
X-Gm-Message-State: AD7BkJKcBho7rrw0+Ji0i2XC13S1lEt2LkuYPueDOOZ1W6E6riTL8zrj69lra6vY/jyuVw==
X-Received: by 10.28.45.132 with SMTP id t126mr19895963wmt.86.1458662724557;
	Tue, 22 Mar 2016 09:05:24 -0700 (PDT)
Received: from [192.168.10.165] (94-39-161-17.adsl-ull.clienti.tiscali.it.
	[94.39.161.17]) by smtp.googlemail.com with ESMTPSA id
	s66sm18144516wmb.6.2016.03.22.09.05.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2016 09:05:23 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: haris iqbal <haris.phnx@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
	<CAFEAcA8BVq6uy2-1vyvx0HRV8dapOcUjHsCB_wqB4ecj0XmgrA@mail.gmail.com>
	<CAE_WKMwwyURfHKBh35YYWbHBLLekGMaaamOGZAtv_v2r=cJ-8A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56F16D42.1030108@redhat.com>
Date: Tue, 22 Mar 2016 17:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAE_WKMwwyURfHKBh35YYWbHBLLekGMaaamOGZAtv_v2r=cJ-8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Changed malloc() to g_malloc() at places
 where return value was not being checked
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
X-List-Received-Date: Tue, 22 Mar 2016 16:05:43 -0000



On 22/03/2016 16:52, haris iqbal wrote:
> On Tue, Mar 22, 2016 at 8:27 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 22 March 2016 at 14:33, Md Haris Iqbal <haris.phnx@gmail.com> wrote:
>>> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
>>
>> Hi. I'm afraid you can't just change malloc() calls to
>> g_malloc() without also changing the corresponding free()
>> calls to g_free().
> 
> Ok, I will do that.
> 
>>
>> Also, at least the thunk.c code has had patches and
>> discussion on-list regarding its malloc() calls. It's
>> often worth searching the mailing list to check you won't
>> be repeating work that somebody else is already doing.
>>
>>> ---
>>>  bsd-user/elfload.c | 2 +-
>>>  bsd-user/qemu.h    | 2 +-
>>>  linux-user/qemu.h  | 2 +-
>>>  thunk.c            | 2 +-
>>>  ui/shader.c        | 2 +-
>>>  5 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>>> index 0a6092b..40bd1f2 100644
>>> --- a/bsd-user/elfload.c
>>> +++ b/bsd-user/elfload.c
>>> @@ -1064,7 +1064,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
>>>
>>>   found:
>>>      /* Now know where the strtab and symtab are.  Snarf them. */
>>> -    s = malloc(sizeof(*s));
>>> +    s = g_malloc(sizeof(*s));
>>>      syms = malloc(symtab.sh_size);
>>>      if (!syms) {
>>>          free(s);
> 
> I did that because the other one has a return value check. Which (as
> discussed with Paolo Bonzini) should be done in a seperate patch.

In this case you can convert syms to g_try_malloc.

Paolo

>>
>> It's very odd to have only part of this data structure be
>> malloc and part g_malloc. We should convert all of it
>> or none of it.
>>
>>> diff --git a/ui/shader.c b/ui/shader.c
>>> index 9264009..43c6f64 100644
>>> --- a/ui/shader.c
>>> +++ b/ui/shader.c
>>> @@ -83,7 +83,7 @@ GLuint qemu_gl_create_compile_shader(GLenum type, const GLchar *src)
>>>      glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
>>>      if (!status) {
>>>          glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
>>> -        errmsg = malloc(length);
>>> +        errmsg = g_malloc(length);
>>>          glGetShaderInfoLog(shader, length, &length, errmsg);
>>>          fprintf(stderr, "%s: compile %s error\n%s\n", __func__,
>>>                  (type == GL_VERTEX_SHADER) ? "vertex" : "fragment",
>>
>> Changes to the ui/shader.c code should be in a different
>> patch, since they're not related to the linux-user or
>> bsd-user code. (Splitting out bsd-user changes would
>> also be a good idea.) The idea here is that different
>> areas of the code have different maintainers, and so
>> review is by different people (and a problem in one part
>> of a patch doesn't then hold up an unrelated good change
>> in a different part).
> 
> Ya, sure. I will split up the patches for different files and send
> them. I can cc the seperate maintainer also then.
> 
>>
>> thanks
>> -- PMM
> 
> 
> 

