Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axWvK-0001QJ-4V
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 05:47:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axWvC-00018C-9I
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 05:47:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axWv0-00040T-K9
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 05:47:08 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:36452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1axWuz-0003pf-79; Tue, 03 May 2016 05:47:02 -0400
Received: by mail-vk0-x243.google.com with SMTP id u23so1261323vkb.3;
	Tue, 03 May 2016 02:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sj0OJqlD+3b3V/rqSRFaHvjFcuRepv15w31COx5KkWE=;
	b=02bfkc6FPONL/KOyGowwAoBdrnVd0wwjqTkctQxGtNwqsg/CG3j+er4/INpylnpqIT
	0n+jwwLLoJ6rNqQgikU5yHliY3T0hUKrrZ2qGskj6P1/U9duEzy0aeFf/LLAlZp/CevP
	sL93vSqp3VCta1O5+wXOm03U6lwxGl4sbRrSKrtWLgK6I6XB+NcHRZ6wMCf9+QZKw/OU
	ZdxJS21YgeyNBOA2v8MV3PErqvKSaR9iuWdJtVYkwv8uzr2iCxi2UXjuOp2HIJo9BFa1
	siDYrdBUxY7S2jLigXXAXipXJbZAyYMiSTaZ3VpDwjRPozUKfghJxCCieL1SkSCu9jRU
	c0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sj0OJqlD+3b3V/rqSRFaHvjFcuRepv15w31COx5KkWE=;
	b=Gb9wqufSgLdnf+bomClusy695obSXRjYKARLShfDqswGG9tNCSj9KYJ1lZM992YcQD
	aeRLD82vS48dpA5fMHbQcGq4MJEbUAkU2sTsG5UjuNUlJKdy28QIxV4CHNx+a8s5Eo0v
	ba3su0AIlaQlebDGd6ajO5vXy2HQzCdMY+20+hpMEKFjPiv1AGm8u+eh+vmGaGKZJ2LX
	609CKvn6qbkQYyYjJro+Nghy2IB5A9A4h5ySfuU0OHfxWAq2Bc7zzYjHz51wrJCJWbAH
	Qgt2zYspF84x5NyZgjpOlvz/Qegh7Df5NmcicZ3+krvBP7+lDSEA5kk9foHdbroQDEHo
	T//g==
X-Gm-Message-State: AOPr4FU9xVXANKcp+XjG+RlYN04fzrRpH0EMii4SE/cA17R6EhPtgyZRf2/Zm9wkGpitGFBnixljNguRWz+tZw==
X-Received: by 10.31.173.67 with SMTP id w64mr605071vke.17.1462268789674; Tue,
	03 May 2016 02:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.184.134 with HTTP; Tue, 3 May 2016 02:46:10 -0700 (PDT)
In-Reply-To: <1459862499-4768-1-git-send-email-haris.phnx@gmail.com>
References: <1459862499-4768-1-git-send-email-haris.phnx@gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 3 May 2016 15:16:10 +0530
Message-ID: <CAE_WKMx3p0MFJWOamHFgrqiP2pxqmG2hou+pOaVOQq66pMUtAg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, kraxel@redhat.com, 
	Md Haris Iqbal <haris.phnx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to
 g_malloc, free to g_free in ui/shader.c
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
X-List-Received-Date: Tue, 03 May 2016 09:47:20 -0000

Just a reminder. waiting for a review for the previous patch.

On Tue, Apr 5, 2016 at 6:51 PM, Md Haris Iqbal <haris.phnx@gmail.com> wrote:
> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
> ---
>  ui/shader.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/ui/shader.c b/ui/shader.c
> index 9264009..1ffddbe 100644
> --- a/ui/shader.c
> +++ b/ui/shader.c
> @@ -83,12 +83,12 @@ GLuint qemu_gl_create_compile_shader(GLenum type, const GLchar *src)
>      glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
>      if (!status) {
>          glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &length);
> -        errmsg = malloc(length);
> +        errmsg = g_malloc(length);
>          glGetShaderInfoLog(shader, length, &length, errmsg);
>          fprintf(stderr, "%s: compile %s error\n%s\n", __func__,
>                  (type == GL_VERTEX_SHADER) ? "vertex" : "fragment",
>                  errmsg);
> -        free(errmsg);
> +        g_free(errmsg);
>          return 0;
>      }
>      return shader;
> @@ -108,10 +108,10 @@ GLuint qemu_gl_create_link_program(GLuint vert, GLuint frag)
>      glGetProgramiv(program, GL_LINK_STATUS, &status);
>      if (!status) {
>          glGetProgramiv(program, GL_INFO_LOG_LENGTH, &length);
> -        errmsg = malloc(length);
> +        errmsg = g_malloc(length);
>          glGetProgramInfoLog(program, length, &length, errmsg);
>          fprintf(stderr, "%s: link program: %s\n", __func__, errmsg);
> -        free(errmsg);
> +        g_free(errmsg);
>          return 0;
>      }
>      return program;
> --
> 1.9.1
>



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

