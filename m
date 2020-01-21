Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itvDf-0004wl-LG
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2020 10:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1itv45-0006wf-T2
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 10:03:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1itv41-0005MU-H2
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 10:03:37 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:42997)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1itv41-0005KA-8C
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 10:03:33 -0500
Received: by mail-lj1-x243.google.com with SMTP id y4so3115261ljj.9
 for <qemu-trivial@nongnu.org>; Tue, 21 Jan 2020 07:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TzqKfwD/PW+oYsUJMo1neA0G+XqzarcdrQtmMVi1wCo=;
 b=DgCGKjqCKB5rbHARnsMEggvpTOMAikb1wKkNSQBcwXfGEVkV2tLkSoQWemvBionkT2
 P158aK5mQ+MeTyShUxmmQCThjelBpvPCwF7FY9PjXp6auRctgoIAe7HAUzHiuw5BPCpq
 6GAPJwOjtZoguNY+BUzbaRYf+Jqs5gAZGh4kW5Dx0ArLIb0TG0Yt72PBi216rmSDebNm
 Y4nlTDrGx37VPh/jZCFOkntcm0g2mvPbj5HoQACcd8RJIbZWMeTQTlFmk62n44FOZQ4O
 Dk3e4ui9cfjnINbGf4XidPMMc9io6bWdWPkzc6BeQIxX2byvlqzBj3Dq3khHkj8TH9xO
 PCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TzqKfwD/PW+oYsUJMo1neA0G+XqzarcdrQtmMVi1wCo=;
 b=mDf2hAvAy+J+kx11CS+yGEm01YWZBG7SBGdFGAGjQonhR+PhSOIT1uIIeRi0EYidDn
 TH7PTQ1d/OPrVKzRHNN6q8Akcr+RqadJhzXg/7xZfsqCpjANvUwmquTI6YIYihLF8UMq
 np2U8GKxr1XmDIKEpn3V1vSKIo6r5zX/c/fN0bgEBt77IjZ+PYOZUGBMVTEF8qX/J/Nl
 kCaSgpXWm8IIIYs9WPH2lNhEycZI46AOdft0aoyEYWmyqWvUYYztK4osCWY27a6RA06F
 /cb/59oPHfDrGrylyptij7Yg7L/CtK3pNqWLbB+7dmlK0IRTduvXGE7rDUZVdfR+XT6x
 4t1A==
X-Gm-Message-State: APjAAAWZEK9CyU1gyOYj6kEaI/qg2Nggzp6XMKZWua36Icw2bQMi3w/J
 vHDvSXJQ0qAhT2cCpiwWZReIA9OtI0Tc59pBj0hoXA==
X-Google-Smtp-Source: APXvYqwXC26EqZbhCD4fWWYVZPWe9S/Jh+QXCAeTZ0gwRzyFAHBRXA4lg3aN84Xx5M7btRKoOMaQlaZQW9Iwnbn1JIU=
X-Received: by 2002:a2e:b61a:: with SMTP id r26mr2893853ljn.72.1579619009516; 
 Tue, 21 Jan 2020 07:03:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579598240.git.mrezanin@redhat.com>
 <63b0fcedf7dfe799c8210b113e5dccf32414a89d.1579598240.git.mrezanin@redhat.com>
 <14ba746f-97c3-1ae3-c836-ad2e3e213756@redhat.com>
In-Reply-To: <14ba746f-97c3-1ae3-c836-ad2e3e213756@redhat.com>
From: Robert Foley <robert.foley@linaro.org>
Date: Tue, 21 Jan 2020 10:03:18 -0500
Message-ID: <CAEyhzFuJoFYy_aE6fq1ieHcEcgWQCUkwHmGNQ0gJiazusH3BAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] test-logging: Fix -Werror=maybe-uninitialized warning
To: Thomas Huth <thuth@redhat.com>
Cc: mrezanin@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
X-Mailman-Approved-At: Tue, 21 Jan 2020 10:13:30 -0500
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
X-List-Received-Date: Tue, 21 Jan 2020 15:03:42 -0000

Good catch.
Reviewed-by: Robert Foley <robert.foley@linaro.org>

On Tue, 21 Jan 2020 at 04:58, Thomas Huth <thuth@redhat.com> wrote:
>
> On 21/01/2020 10.28, mrezanin@redhat.com wrote:
> > From: Miroslav Rezanina <mrezanin@redhat.com>
> >
> > Checking for uninitialized variables raises warning for file path
> > variables in test_logfile_write and test_logfile_lock functions.
> >
> > To suppress this warning, initialize varibles to NULL. This is safe
> > change as result of g_build_filename is stored to them before any usage.
> >
> > Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> > ---
> >  tests/test-logging.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/test-logging.c b/tests/test-logging.c
> > index 1e646f0..6387e49 100644
> > --- a/tests/test-logging.c
> > +++ b/tests/test-logging.c
> > @@ -114,8 +114,8 @@ static void test_logfile_write(gconstpointer data)
> >      QemuLogFile *logfile2;
> >      gchar const *dir = data;
> >      Error *err = NULL;
> > -    g_autofree gchar *file_path;
> > -    g_autofree gchar *file_path1;
> > +    g_autofree gchar *file_path = NULL;
> > +    g_autofree gchar *file_path1 = NULL;
> >      FILE *orig_fd;
> >
> >      /*
> > @@ -157,7 +157,7 @@ static void test_logfile_lock(gconstpointer data)
> >      FILE *logfile;
> >      gchar const *dir = data;
> >      Error *err = NULL;
> > -    g_autofree gchar *file_path;
> > +    g_autofree gchar *file_path = NULL;
> >
> >      file_path = g_build_filename(dir, "qemu_test_logfile_lock0.log", NULL);
>
> Right. The glib documentation clearly states that "the variable must be
> initialized", see:
>
> https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#g-autofree
>
> So this is the right thing to do here!
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>

