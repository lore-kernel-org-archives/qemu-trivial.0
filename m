Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiOyf-0001MN-RI
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 12:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiOyd-0001MG-Fk
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiOyc-0007p2-7l
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 12:16:15 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1aiOyc-0007ov-0S; Tue, 22 Mar 2016 12:16:14 -0400
Received: by mail-vk0-x236.google.com with SMTP id e6so260860282vkh.2;
	Tue, 22 Mar 2016 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y5zfjvk4rqSAg7rxPiBmohU92BWGTZu6FSB9lOevxrQ=;
	b=qU4Na30hdOAvguj9+u5O82ZzvA8Y7EXb1NTz/ZJODY/wtRjsLe+NHNGtasBy2ox8SA
	JmpZtTs+WL8tOFVRK5addZCLF4haaXoPSpkvjuivuGFxCEnheoj+J7wFO1ruPBTeMllx
	9+D02azhMJCxDgo2JIrIzjprygQRv7COMLlUlIhVYSElPG0UBb1BxIBmA7Olxyyx9lFm
	DpyOxZ8H3KwqlcbGaCjIN0CgmMa9XtRy1bptoWJKy66c/k21B8qdCtge751yBCDwBlIG
	nBC+L+hZ/lfNxd4ugO/7VFdM+yNhKPAOzhn9zTJ+AQo5XM0122wJCHz8+2HQ+rAq6VoD
	FUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y5zfjvk4rqSAg7rxPiBmohU92BWGTZu6FSB9lOevxrQ=;
	b=DWVYyEdoHusdY4tWT7iJcGRKAviaDI7p3FdPRizFwGSBGbS3DekA+qkfVmC/I2+6Q3
	+0e+aJ4eoPsAaOaYEi1TmmSspctIh7t27OPphJbc76iwSJ/m9h0Vj/cSymwoGUYGzGzF
	ng0+sU0vmlS7h8PhDgih2jpwz0gTXhTKkyoQAcKeOBTRZu83bKKVwl7sVW/e1WS/UE87
	OLgg3JEkc4FSIJeR7xVDVbHIBKWmrVx2Vv9pXEIhe+GoxK2iNISe4jm8bdlyEMptOYIM
	DEyRBwaKTbKARLmOXZBovbrwye7Kn2BOqzPfv4QKCnMdWof7HK2E2ra504nrx57NkK4h
	TsYw==
X-Gm-Message-State: AD7BkJK3JmG32Ay8frcr54L+JzImNulMzHeHI+ufjDY4r08BR0MFHA2AoRR1yYdXjynpKt0Lkt858up+2CtEPA==
X-Received: by 10.176.2.231 with SMTP id 94mr4155751uah.106.1458663373559;
	Tue, 22 Mar 2016 09:16:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.15.9 with HTTP; Tue, 22 Mar 2016 09:15:54 -0700 (PDT)
In-Reply-To: <56F16D42.1030108@redhat.com>
References: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
	<CAFEAcA8BVq6uy2-1vyvx0HRV8dapOcUjHsCB_wqB4ecj0XmgrA@mail.gmail.com>
	<CAE_WKMwwyURfHKBh35YYWbHBLLekGMaaamOGZAtv_v2r=cJ-8A@mail.gmail.com>
	<56F16D42.1030108@redhat.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 22 Mar 2016 21:45:54 +0530
Message-ID: <CAE_WKMyzdUMEaxiqT2+gkPoxEY6Z3ZOsbHBcvhyWkC-_mfXdSg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
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
X-List-Received-Date: Tue, 22 Mar 2016 16:16:17 -0000

On Tue, Mar 22, 2016 at 9:35 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 22/03/2016 16:52, haris iqbal wrote:
>> On Tue, Mar 22, 2016 at 8:27 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 22 March 2016 at 14:33, Md Haris Iqbal <haris.phnx@gmail.com> wrote:
>>>> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
>>>
>>> Hi. I'm afraid you can't just change malloc() calls to
>>> g_malloc() without also changing the corresponding free()
>>> calls to g_free().
>>
>> Ok, I will do that.
>>
>>>
>>> Also, at least the thunk.c code has had patches and
>>> discussion on-list regarding its malloc() calls. It's
>>> often worth searching the mailing list to check you won't
>>> be repeating work that somebody else is already doing.
>>>
>>>> ---
>>>>  bsd-user/elfload.c | 2 +-
>>>>  bsd-user/qemu.h    | 2 +-
>>>>  linux-user/qemu.h  | 2 +-
>>>>  thunk.c            | 2 +-
>>>>  ui/shader.c        | 2 +-
>>>>  5 files changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>>>> index 0a6092b..40bd1f2 100644
>>>> --- a/bsd-user/elfload.c
>>>> +++ b/bsd-user/elfload.c
>>>> @@ -1064,7 +1064,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
>>>>
>>>>   found:
>>>>      /* Now know where the strtab and symtab are.  Snarf them. */
>>>> -    s = malloc(sizeof(*s));
>>>> +    s = g_malloc(sizeof(*s));
>>>>      syms = malloc(symtab.sh_size);
>>>>      if (!syms) {
>>>>          free(s);
>>
>> I did that because the other one has a return value check. Which (as
>> discussed with Paolo Bonzini) should be done in a seperate patch.
>
> In this case you can convert syms to g_try_malloc.

Great. I will do that.

>
> Paolo
>
>>>
>>> It's very odd to have only part of this data structure be
>>> malloc and part g_malloc. We should convert all of it
>>> or none of it.
>>>
>>>> diff --git a/ui/shader.c b/ui/shader.c
>>>> index 9264009..43c6f64 100644
>>>> --- a/ui/shader.c
>>>> +++ b/ui/shader.c
>>>> @@ -83,7 +83,7 @@ GLuint qemu_gl_create_compile_shader(GLenum type, const GLchar *src)
>>>>      glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
>>>>      if (!status) {
>>>>          glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
>>>> -        errmsg = malloc(length);
>>>> +        errmsg = g_malloc(length);
>>>>          glGetShaderInfoLog(shader, length, &length, errmsg);
>>>>          fprintf(stderr, "%s: compile %s error\n%s\n", __func__,
>>>>                  (type == GL_VERTEX_SHADER) ? "vertex" : "fragment",
>>>
>>> Changes to the ui/shader.c code should be in a different
>>> patch, since they're not related to the linux-user or
>>> bsd-user code. (Splitting out bsd-user changes would
>>> also be a good idea.) The idea here is that different
>>> areas of the code have different maintainers, and so
>>> review is by different people (and a problem in one part
>>> of a patch doesn't then hold up an unrelated good change
>>> in a different part).
>>
>> Ya, sure. I will split up the patches for different files and send
>> them. I can cc the seperate maintainer also then.
>>
>>>
>>> thanks
>>> -- PMM
>>
>>
>>


One more question. About tracking down g_free(). I thought of
submitting for linux-user/qemu.h first. As it is done in a function
called lock_user(), which is called by many other functions (around
144, too many to be checked manually). The interesting part is, the
free is done by a pair function called unlock_user(). I just want to
ask if all those lock_user() calls has a matching unlock_user() call
to free() the malloc(), or there is a hidden free somewhere else also?
This would save a lot of time. Thanks.

(PS. I saw in the MAINTAINER file that qemu-devel@nongnu.org should be
queried for questions regarding linux-* files. So mailing here.)


-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

