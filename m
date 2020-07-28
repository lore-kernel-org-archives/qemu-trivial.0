Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0RTk-00036P-G2
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jul 2020 11:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0RTi-00036B-UJ
 for qemu-trivial@nongnu.org; Tue, 28 Jul 2020 11:25:18 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:43866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0RTg-00020O-Rl
 for qemu-trivial@nongnu.org; Tue, 28 Jul 2020 11:25:18 -0400
Received: by mail-oo1-xc43.google.com with SMTP id z10so1011341ooi.10
 for <qemu-trivial@nongnu.org>; Tue, 28 Jul 2020 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=puUEZluVTYddP3iAs7PLgPzAU7pxv47sI3hjBMoxUv8=;
 b=J4rRI+QMf76qHd3H6GI+kt2upGMAvBMVJdXWU8LUx+qeFbLD2PkbguMQBvPgyMrEqw
 9PsY5/z7NlpI1VHJ2BGuCCMSFehCuLyYycghpU4XYehXr1mGwpJLU3sD9PsvVqntCiqi
 fhnlxeqUiTc3M5ngKabaD/TnocsjVyRbFecWDYK9B6T9Zo9gRHGenq8uQINPUdgRdCf9
 QmisLKOPplx/oBAunhDOOwKWGtc+3HGBGmTzeLPFQ80tPolyP9KqvuLMqhzdciEs7+cL
 gnyAHN2JUWwDy5JpiPHg0ZwayYOZrwN2/9a320KrNQL6yfRJJsheuDB0wMlQif9mVdME
 KY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=puUEZluVTYddP3iAs7PLgPzAU7pxv47sI3hjBMoxUv8=;
 b=e7a/AR0tpYxJBxuVwaEQ0C5Q7Qid4Hi4PXnxXRKZpIdVYZrBJSJhNP6JtOSv6syTED
 /TBsWhZ/gwvH1dv2sQJI5RYFB1kqO+EjFN7WZjupGahqQPvI1Z8bPAkPLRxG1w8dyOsk
 C2jyBsShXSR5Y35t2Kn/K5Cug6XjO5/VW3VHun9zQLToKLtwcUY5OM0/GzGh1dgfnzrN
 Do2uDWQpi5NRnIxC0BM2cNaTKLNVDloxKEyYkxVqDuAiN0xI2nYCUGEjMGdJnqaKugrO
 UxaIpHU7PcTfuF3MGdZrRBvzniyNXnmb9IRSQfZG63HYBZo65DXPTRwP8c/N4frsc5ik
 g0ZQ==
X-Gm-Message-State: AOAM530ai5+XFhqLU/nuc6pDjpR+rDaxwP2VbUfXEYaKDVY8RpeDIDsg
 8jmsYXw7nUKoFRpfn7KZ3u+P5ZVy+acb6KJxLvBGhQ==
X-Google-Smtp-Source: ABdhPJxYWgWJXeffKQqCgsclnAvhnZJrJ9o0j8ZncEfUgq+jOHU/rhvrJgmx1bUFusDffTUA3ACHFNhsOt9sQYshYbo=
X-Received: by 2002:a4a:4949:: with SMTP id z70mr22371460ooa.85.1595949915447; 
 Tue, 28 Jul 2020 08:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200716154114.10838-1-peter.maydell@linaro.org>
 <0f8b8fea-2bd0-7616-292b-8fb0f87cec75@redhat.com>
In-Reply-To: <0f8b8fea-2bd0-7616-292b-8fb0f87cec75@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 16:25:04 +0100
Message-ID: <CAFEAcA9ukzKGiaV6Tazu8Aezn39v81DKQik1b=jEy=NLnau05w@mail.gmail.com>
Subject: Re: [PATCH] osdep.h: Add doc comment for qemu_get_thread_id()
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 28 Jul 2020 15:25:19 -0000

On Tue, 28 Jul 2020 at 16:17, Eric Blake <eblake@redhat.com> wrote:
>
> On 7/16/20 10:41 AM, Peter Maydell wrote:
> > Add a documentation comment for qemu_get_thread_id(): since this
> > is rather host-OS-specific it's useful if people writing the
> > implementation and people thinking of using the function know
> > what the purpose and limitations are.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Based on conversation with Dan on IRC, and prompted by the recent
> > patch to add OpenBSD support.
> >
> > Q: should we document exactly what the thread-id value is for
> > each host platform in the QMP documentation ? Somebody writing
> > a management layer app should ideally not have to grovel through
> > the application to figure out what they should do with the
> > integer value they get back from query-cpus...
> >
> >   include/qemu/osdep.h | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
>
> Do we need a counterpart change...
>
> >
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index 4841b5c6b5f..8279f72e5ed 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -515,6 +515,20 @@ bool qemu_has_ofd_lock(void);
> >
> >   bool qemu_write_pidfile(const char *pidfile, Error **errp);
> >
> > +/**
> > + * qemu_get_thread_id: Return OS-specific ID of current thread
> > + *
> > + * This function returns an OS-specific identifier of the
> > + * current thread. This will be used for the "thread-id" field in
> > + * the response to the QMP query-cpus and query-iothreads commands.
>
> ...to the qapi definition of query-cpus and query-iothreads?

Well, that was my question above. Currently the QAPI documentation
says absolutely nothing about what the thread-id values mean
for any host OS (beyond "ID of the underlying host thread"), which
means that any management layer application needs to look in the
implementation to find out what they actually are...

Improving the QAPI docs would probably be something like:
 * add a list of host OSes and semantics to the doc comment
   for CpuInfoFast
 * add cross-references to that definition from everywhere
   else in QAPI that uses a thread-id/thread_id
 * add a comment in the C file to say "if you're adding another
   OS ifdef here please update the QAPI doc comment"

thanks
-- PMM

