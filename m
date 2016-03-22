Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiNkR-0006QK-9b
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 10:57:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiNkP-0006QA-7m
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 10:57:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiNkK-0001hB-8T
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 10:57:29 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiNkK-0001h5-1u
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 10:57:24 -0400
Received: by mail-vk0-x22a.google.com with SMTP id z68so22638372vkg.3
	for <qemu-trivial@nongnu.org>; Tue, 22 Mar 2016 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xh7TYDJWOCp7gBU5vKwb8v6+X2yPkUq3WMKNEmzBrYQ=;
	b=TivVvMBWqhyIwrMF5BVrq4wSY/0tXCpGncLZdyVgTUUdhm/L7TFf2alH6AQbzQd52i
	Hytcxpw6SDKgSVqUfxaMUSYEiVhct/FleVEPP9YeVjU8N1joK65ySiI9pv9WjDV+/48Y
	XB2yE8XYB8S0Eq759Bn69oZj8wjyn0wcBlKVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xh7TYDJWOCp7gBU5vKwb8v6+X2yPkUq3WMKNEmzBrYQ=;
	b=UuAPNQMmIpLXo1Q9QM/J4twMuPdiUeDhrwdnWb+cT+9mU4D/ijGNsWAXWJwRRCm8Qz
	JmMNAuRqtJZ4AyRTCUFBEQzD6pL71BLAVgz9XHcEIJVB8K41Op7qSx2oLZMMsoYC1KR4
	hxFCRfv5X3QwkHDq7wuNpcU2r+RkDWxIcgr5kiSdMddKewRbjky16AyFCvSUnEhi2Rsm
	dq4+wGYGatpYTQWlOBZq5nfRsKPE4Z2rEUH1eGJKT4HPCYCAirn1bIRJiverCciXQ4F0
	gyF4o7hCOMCeaEpe3qbH8mRzZfxqwgnnqwoei7cT5UYPdVSxC9VJ8sZX93nru7o+ubsz
	zasg==
X-Gm-Message-State: AD7BkJLS41EMXLcq3xoPqYHfryhGhCKEbIqi128anXL3gi2MgLo2/NHB+QGvxUn32ewfULdxbF6l/daUbObFEmFg
X-Received: by 10.159.36.72 with SMTP id 66mr4397193uaq.125.1458658643468;
	Tue, 22 Mar 2016 07:57:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 22 Mar 2016 07:57:04 -0700 (PDT)
In-Reply-To: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
References: <1458657219-12156-1-git-send-email-haris.phnx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2016 14:57:04 +0000
Message-ID: <CAFEAcA8BVq6uy2-1vyvx0HRV8dapOcUjHsCB_wqB4ecj0XmgrA@mail.gmail.com>
To: Md Haris Iqbal <haris.phnx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
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
X-List-Received-Date: Tue, 22 Mar 2016 14:57:30 -0000

On 22 March 2016 at 14:33, Md Haris Iqbal <haris.phnx@gmail.com> wrote:
> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>

Hi. I'm afraid you can't just change malloc() calls to
g_malloc() without also changing the corresponding free()
calls to g_free().

Also, at least the thunk.c code has had patches and
discussion on-list regarding its malloc() calls. It's
often worth searching the mailing list to check you won't
be repeating work that somebody else is already doing.

> ---
>  bsd-user/elfload.c | 2 +-
>  bsd-user/qemu.h    | 2 +-
>  linux-user/qemu.h  | 2 +-
>  thunk.c            | 2 +-
>  ui/shader.c        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 0a6092b..40bd1f2 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -1064,7 +1064,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
>
>   found:
>      /* Now know where the strtab and symtab are.  Snarf them. */
> -    s = malloc(sizeof(*s));
> +    s = g_malloc(sizeof(*s));
>      syms = malloc(symtab.sh_size);
>      if (!syms) {
>          free(s);

It's very odd to have only part of this data structure be
malloc and part g_malloc. We should convert all of it
or none of it.

> diff --git a/ui/shader.c b/ui/shader.c
> index 9264009..43c6f64 100644
> --- a/ui/shader.c
> +++ b/ui/shader.c
> @@ -83,7 +83,7 @@ GLuint qemu_gl_create_compile_shader(GLenum type, const GLchar *src)
>      glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
>      if (!status) {
>          glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
> -        errmsg = malloc(length);
> +        errmsg = g_malloc(length);
>          glGetShaderInfoLog(shader, length, &length, errmsg);
>          fprintf(stderr, "%s: compile %s error\n%s\n", __func__,
>                  (type == GL_VERTEX_SHADER) ? "vertex" : "fragment",

Changes to the ui/shader.c code should be in a different
patch, since they're not related to the linux-user or
bsd-user code. (Splitting out bsd-user changes would
also be a good idea.) The idea here is that different
areas of the code have different maintainers, and so
review is by different people (and a problem in one part
of a patch doesn't then hold up an unrelated good change
in a different part).

thanks
-- PMM

