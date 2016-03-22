Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiOif-0000Vi-W1
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 11:59:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiObv-0006JC-6b
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 11:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aiObp-0000Q3-CR
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 11:52:47 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:32916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1aiObp-0000Pv-6l; Tue, 22 Mar 2016 11:52:41 -0400
Received: by mail-vk0-x22a.google.com with SMTP id k1so260115109vkb.0;
	Tue, 22 Mar 2016 08:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1QNFVSZhemWnrhMRNH2BX85H0Ux7jAoz5LQwDfCWaqs=;
	b=o7D6uz/RrzP1soXgJYzqTHAeK/3Np6Ig0/NsOVnFS8l/dwZSqImxm6bCFrro6sH7E2
	c/3TWvAfQGjWB9XbYDwZyy/1pCV5KH/N5xoSmFRNDWorwMGnTkuBtA+OIgIq6+3juD7t
	lsykv1CzBWubeUpeZEBzq6+EJxaGAJh1u1VqMRLbbRn4xaDTqIuioMEvnumSHfE5yGKs
	x6LmLF2qiF22eC3WjfKRkNDRE00UKD4cpEihpBqYNmuCYgHV6LIylGt+O1gnjAOo9MUC
	CSAFqBKLVXK3aKIkGKqL1jg7k4nV8XEg7dA8wDai1u25U6ZrBC3OAwXLrKbHnRe5xP1H
	akZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1QNFVSZhemWnrhMRNH2BX85H0Ux7jAoz5LQwDfCWaqs=;
	b=CvbFEApyqWpGJuNeyPKe4rHjlnVFTMVzCY5BxwPKAadVSK+diZzuy+a6X/m2GpnusV
	ZE+z36rC5204X0ohbl7dSBgliQG/JJBG4USbGhfqZfJwYbiKnyRMF1a6bZzhNxxbsjPv
	OOuEiWPZvkfu8nKe8mpqHnw5we9wlrXq+Zrws4kxOg+69u+Wk6GAiBOmck8XPcLACTqf
	f5c0n3IpoXyjpOkT7BRTvzhrqjg8HHrZLLwLosOSjysEatADvmBfBSOfCxrYqk2XaRQv
	Fc61WbzaKA68GaQ3m8Y8rOGIbfSGtm1JNaETMzVnbeWxJDvElaTZ3Cu7Hgk89+I9yV88
	XQ9w==
X-Gm-Message-State: AD7BkJIpbWcru1hPOTJZx6D/XkkM0xm4SLS/tmRGJtaDPVYxUmJFJiorXuZdjkvxvTWpeWMtL9BwGdfjR3wr1w==
X-Received: by 10.176.2.55 with SMTP id 52mr4589662uas.30.1458661960676; Tue,
	22 Mar 2016 08:52:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.15.9 with HTTP; Tue, 22 Mar 2016 08:52:21 -0700 (PDT)
In-Reply-To: <CAFEAcA8BVq6uy2-1vyvx0HRV8dapOcUjHsCB_wqB4ecj0XmgrA@mail.gmail.com>
References: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
	<CAFEAcA8BVq6uy2-1vyvx0HRV8dapOcUjHsCB_wqB4ecj0XmgrA@mail.gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 22 Mar 2016 21:22:21 +0530
Message-ID: <CAE_WKMwwyURfHKBh35YYWbHBLLekGMaaamOGZAtv_v2r=cJ-8A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
X-Mailman-Approved-At: Tue, 22 Mar 2016 11:59:44 -0400
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Changed malloc() to
 g_malloc() at places where return value was not being checked
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
X-List-Received-Date: Tue, 22 Mar 2016 15:52:48 -0000

On Tue, Mar 22, 2016 at 8:27 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 22 March 2016 at 14:33, Md Haris Iqbal <haris.phnx@gmail.com> wrote:
>> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
>
> Hi. I'm afraid you can't just change malloc() calls to
> g_malloc() without also changing the corresponding free()
> calls to g_free().

Ok, I will do that.

>
> Also, at least the thunk.c code has had patches and
> discussion on-list regarding its malloc() calls. It's
> often worth searching the mailing list to check you won't
> be repeating work that somebody else is already doing.
>
>> ---
>>  bsd-user/elfload.c | 2 +-
>>  bsd-user/qemu.h    | 2 +-
>>  linux-user/qemu.h  | 2 +-
>>  thunk.c            | 2 +-
>>  ui/shader.c        | 2 +-
>>  5 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>> index 0a6092b..40bd1f2 100644
>> --- a/bsd-user/elfload.c
>> +++ b/bsd-user/elfload.c
>> @@ -1064,7 +1064,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
>>
>>   found:
>>      /* Now know where the strtab and symtab are.  Snarf them. */
>> -    s = malloc(sizeof(*s));
>> +    s = g_malloc(sizeof(*s));
>>      syms = malloc(symtab.sh_size);
>>      if (!syms) {
>>          free(s);

I did that because the other one has a return value check. Which (as
discussed with Paolo Bonzini) should be done in a seperate patch.

>
> It's very odd to have only part of this data structure be
> malloc and part g_malloc. We should convert all of it
> or none of it.
>
>> diff --git a/ui/shader.c b/ui/shader.c
>> index 9264009..43c6f64 100644
>> --- a/ui/shader.c
>> +++ b/ui/shader.c
>> @@ -83,7 +83,7 @@ GLuint qemu_gl_create_compile_shader(GLenum type, const GLchar *src)
>>      glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
>>      if (!status) {
>>          glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
>> -        errmsg = malloc(length);
>> +        errmsg = g_malloc(length);
>>          glGetShaderInfoLog(shader, length, &length, errmsg);
>>          fprintf(stderr, "%s: compile %s error\n%s\n", __func__,
>>                  (type == GL_VERTEX_SHADER) ? "vertex" : "fragment",
>
> Changes to the ui/shader.c code should be in a different
> patch, since they're not related to the linux-user or
> bsd-user code. (Splitting out bsd-user changes would
> also be a good idea.) The idea here is that different
> areas of the code have different maintainers, and so
> review is by different people (and a problem in one part
> of a patch doesn't then hold up an unrelated good change
> in a different part).

Ya, sure. I will split up the patches for different files and send
them. I can cc the seperate maintainer also then.

>
> thanks
> -- PMM



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

