Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdZ7R-0000sE-AA
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2020 08:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jdUcW-0004CT-3S
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 04:07:32 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jdUcV-0004zG-7L
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 04:07:31 -0400
Received: by mail-ed1-x532.google.com with SMTP id e10so16884465edq.0
 for <qemu-trivial@nongnu.org>; Tue, 26 May 2020 01:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zmHmUW6Zux4OBp2xftPhiYTtSm2HAz1ZlJz1KMYu5EM=;
 b=ZhD73hPDWmb6Z2x4KjqVDl9oehvieI7mCfZqJaXlXSQR+CWb5kcpKyt6jkNe0xcVpj
 9W6FU7phi13DS3I/rxLxI5tnj68nGpa4FQ/31pwTzeT4DiZJ6dM+LkdPg4UNa3JcI+JU
 qzZcaglthXnD8syK5rN0RwnWP7l/rxNW2m3NI2rA+fBWgpqpQSWKopowrX/kQ4qG4kqE
 q9sJJZxivs4EN8nQWB0pC7brfcD7TtAZ8zeUkFCfa1JbtrNB3xXECfptmhtVMEqnV1EZ
 eb8C8STpvNTtvIxagWQYTn8gn8fFpPLPXtUVPJ54pf2Snk1Xp6hvxSwDa+yxX9ZODRjt
 eAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zmHmUW6Zux4OBp2xftPhiYTtSm2HAz1ZlJz1KMYu5EM=;
 b=out8t9qRVXG/PyGrhS33bf/+GTRfU1hE6msN71J67TkuALSE8SIrDivuzCiIpyImsL
 U5yqYeeOV27FG3uAMU2RABFChOkbi55abZRws/ddG3mVq3WhE/0U/giQcKjUtJIc80pc
 MrjDNmTQgx49Na8gLmm4z7bmmRCzNG212qQqtfL8YPSC5Qdpi5a9fq7c4ZuCL3gSahfv
 gThIy7G/xf8rf2Vq/udI9SvIsYLUUPB03L28sksaDPdoKZq+JzFUcW96KaiBiv2WZhWF
 QnKKNM7NjvCf5/RTnd1J7PqNbbVf1NnBJB57yhWpb/TeVoh0at16C+SUhSw4mFXOLUQF
 cDzw==
X-Gm-Message-State: AOAM533yylLh8Mlj5oYgLZV3KuZqPrLTfXeAMaDDLfZglc/EOfUX/DrG
 rtSbmzLSyeJmC7KHlo33sANDM/mEH5MQ00IFPLYIwfwS
X-Google-Smtp-Source: ABdhPJynpUcRfE8Gv1jga46OH24Xyr7OJv7WJt96H0uuJPSyxIaxYn4+at+Y541LptvM0VQVy/lUTUzZH5ooxtpDCqY=
X-Received: by 2002:a05:6402:31ad:: with SMTP id
 dj13mr19199120edb.232.1590480449256; 
 Tue, 26 May 2020 01:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqyZ9yZjckTcYinCOYqb4ybE6z9vmgcJzue1WEGuZ0NTWA@mail.gmail.com>
 <4e0f6d35-8aa0-b81d-0902-00b76f44b571@redhat.com>
 <CA+XhMqx-Oz_OzyjEaRn0q6s8PiRvuTBQO=JF3WA_UP+0N-FW+Q@mail.gmail.com>
In-Reply-To: <CA+XhMqx-Oz_OzyjEaRn0q6s8PiRvuTBQO=JF3WA_UP+0N-FW+Q@mail.gmail.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 26 May 2020 09:07:18 +0100
Message-ID: <CA+XhMqynizbcnL=Vrkk8BpN-8t=rYdNXk-O8EvwF1ctwTi88qw@mail.gmail.com>
Subject: Fwd: [PATCH 1/1] util/getauxval: Porting to FreeBSD getauxval feature
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=devnexen@gmail.com; helo=mail-ed1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 May 2020 08:55:43 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2020 08:07:32 -0000

---------- Forwarded message ---------
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 26 May 2020 at 08:37
Subject: Re: [PATCH 1/1] util/getauxval: Porting to FreeBSD getauxval feature
To: Thomas Huth <thuth@redhat.com>
Cc: <qemu-devel@nongnu.org>, <armbru@redhat.com>


From 316cbdea0434a523c78d3f18fe7e6697577e4aae Mon Sep 17 00:00:00 2001
From: David Carlier <devnexen@gmail.com>
Date: Tue, 26 May 2020 08:33:12 +0100
Subject: [PATCH] util/getauxval: Porting to FreeBSD the getauxval feature

FreeBSD has a similar API for auxiliary vector.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 configure        | 5 +++++
 util/getauxval.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/configure b/configure
index 2fc05c4465..2c93867080 100755
--- a/configure
+++ b/configure
@@ -5824,7 +5824,12 @@ getauxval=no
 cat > $TMPC << EOF
 #include <sys/auxv.h>
 int main(void) {
+#if defined(__FreeBSD__)
+  unsigned long a = 0;
+  return elf_aux_info(AT_HWCAP, &a, sizeof(a)) == 0;
+#else
   return getauxval(AT_HWCAP) == 0;
+#endif
 }
 EOF
 if compile_prog "" "" ; then
diff --git a/util/getauxval.c b/util/getauxval.c
index 36afdfb9e6..373ed3899f 100644
--- a/util/getauxval.c
+++ b/util/getauxval.c
@@ -33,7 +33,13 @@

 unsigned long qemu_getauxval(unsigned long key)
 {
+#if defined(__linux__)
     return getauxval(key);
+#elif defined(__FreeBSD__)
+    unsigned long aux = 0;
+    elf_aux_info(key, &aux, sizeof(aux));
+    return aux;
+#endif
 }
 #elif defined(__linux__)
 #include "elf.h"
--
2.27.0.rc0

On Tue, 26 May 2020 at 08:21, Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/05/2020 14.09, David CARLIER wrote:
> > Hi here porting qemu_getauxval to FreeBSD. Thanks. Regards.
> >
> > From 5be5e56a59631b28ed7b738d251dda252ba9b03e Mon Sep 17 00:00:00 2001
> > From: David Carlier <devnexen@gmail.com>
> > Date: Sun, 24 May 2020 13:03:32 +0100
> > Subject: [PATCH] util/getauxval: FreeBSD has a similar auxilary vector API
> >
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >  configure        | 6 ++++++
> >  util/getauxval.c | 6 ++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/configure b/configure
> > index 2fc05c4465..545fd2364f 100755
> > --- a/configure
> > +++ b/configure
> > @@ -5824,7 +5824,13 @@ getauxval=no
> >  cat > $TMPC << EOF
> >  #include <sys/auxv.h>
> >  int main(void) {
> > +#if defined(__linux__)
> >    return getauxval(AT_HWCAP) == 0;
> > +#elif defined(__FreeBSD__)
> > +  unsigned long a = 0;
> > +  return elf_aux_info(AT_HWCAP, &a, sizeof(a)) == 0;
> > +#endif
> > +  return 1;
> >  }
> >  EOF
> >  if compile_prog "" "" ; then
>
> That configure check looks wrong. On other systems (i.e. non-Linux and
> non-FreeBSD), this code snippet will now compile successfully and thus
> the configure script sets getauxval=yes. I'd suggest you change it this
> way instead:
>
>  int main(void) {
> +#if defined(__FreeBSD__)
> +  unsigned long a = 0;
> +  return elf_aux_info(AT_HWCAP, &a, sizeof(a)) == 0;
> +#else
>    return getauxval(AT_HWCAP) == 0;
> +#endif
>  }
>
> ... so that it still fails to compile by default on other systems.
>
>  Thomas
>

