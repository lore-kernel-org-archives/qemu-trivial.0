Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgeOv-00027E-I1
	for mharc-qemu-trivial@gnu.org; Fri, 29 Oct 2021 22:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgeOu-000263-8K
 for qemu-trivial@nongnu.org; Fri, 29 Oct 2021 22:47:20 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgeOr-0006Oe-ND
 for qemu-trivial@nongnu.org; Fri, 29 Oct 2021 22:47:20 -0400
Received: by mail-ua1-x931.google.com with SMTP id e10so21665315uab.3
 for <qemu-trivial@nongnu.org>; Fri, 29 Oct 2021 19:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=23aDLnrAl9Rtt/hDLk6KxCjf8FxkkW+q8wT4umMWt6w=;
 b=D8OBSK1tADFGH5uwWpMtIasm0ZCCXEzRC7AAyHUzrYbeWtYqZHqALHmU1g/bk2z8ru
 n1gVXzcVNi6Z8NEyZwn28tAOKYSe2k4zvTNXcuUiooUPTJ5evjN+VWPUl5ejGuO5BVd8
 eVJUEhY4xv5p9MKsvgX7uwSF9Wr6q62ggncCB1ec1UDL0kgAtKvOGH6mliskChI63Tc+
 RrhT6HFrtIiSn606i6/ARBNRp2IpmYNyxtU7jyBZMPqgis8S1CtSucI6HImfZewdGeuE
 0TU/3OOi4f45gdOdUanyhXAuROxKLyoJqeaSNlEDIDRV3C2IB92RtS8iMDCfIteNIgxg
 dSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=23aDLnrAl9Rtt/hDLk6KxCjf8FxkkW+q8wT4umMWt6w=;
 b=m6E+som7YH+pEsg/98EB00tDXtLO6LQ4BjVSyHtYKGRwYNpXZ1wzdj3Ey39kHfarze
 knDo71WjyiKT8pEVBf4v/jnBJFUPlD/fv7kfk0YZI6zfc+tWkxKAWJBVjoJQoiCMhPPw
 ku+lpLg9xU/U989d0f3K6m/i6m6RSLF4c1cVlPzjY6nV+69/FsLbztopqYd9H1hhWsSg
 8bLulEoal6ia/8ExuvePEn3ltoi88P3yj6PqnoLpAEGyKRHBq6+VtbLUhmd5CFtB63iL
 LEItEkNOKyywaQvDteLCjcP8L+fin4ysP32vm60WbO29BqhOEfvAM2PohAJUYVpQK3NP
 S3Fg==
X-Gm-Message-State: AOAM530vzOivHa/zsjLSv1dnPOZ3qUJ0j/t/BZZWf9DT/hKfWh6Y9l9J
 gJsNGe1np0VXVpwQHW0/Uh1q6IF6gO3hO1qyNoVokDKvyNU=
X-Google-Smtp-Source: ABdhPJzhzVrF1sv8LcIWGqEbu2KiM5NooITQ4HAfyq5FVWfSpJbj16+S6m9BiJSi7+I8OQxti1h71FrReRmftvU0yqg=
X-Received: by 2002:a05:6102:5494:: with SMTP id
 bk20mr17572175vsb.6.1635562036414; 
 Fri, 29 Oct 2021 19:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-21-imp@bsdimp.com>
 <446e589d-7c49-f5fc-3891-195ba5a37c0f@linaro.org>
 <CANCZdfoHStsykaxrbUJceBujmAajzmeN_x3ar-cj01SEUM8j4Q@mail.gmail.com>
In-Reply-To: <CANCZdfoHStsykaxrbUJceBujmAajzmeN_x3ar-cj01SEUM8j4Q@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 29 Oct 2021 20:47:07 -0600
Message-ID: <CANCZdfqbmpjHWUCyZB9YkhJzpCVigGP8e0fdNYcFajW8-NjrVQ@mail.gmail.com>
Subject: Re: [PATCH 20/24] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="0000000000003067b305cf88f636"
Received-SPF: none client-ip=2607:f8b0:4864:20::931;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 30 Oct 2021 02:47:20 -0000

--0000000000003067b305cf88f636
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 4:41 PM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Thu, Oct 28, 2021 at 11:25 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 10/19/21 9:44 AM, Warner Losh wrote:
>> > +    regs->regs[TARGET_REG_PC] = ka->_sa_handler;
>>
>> Surely there should be some handling of thumb addresses here.
>>
>
> Yes. I've added code to do this, but haven't run it through (a) our normal
> test suite and (b) don't think I have any code that's normal mode with a
> thumb mode signal handler to test it with... It will be in the next
> iteration
> I send out.
>

FYI: I've fixed it in  the patch stream. I wrote 4 test programs: one in
a32 mode,
one in T32 mode, one starts in A32 and gets a signal in T32 mode and a final
one that starts in T32 and signals in A32 mode. They all work now. Before
all but the A32 one failed.

And the test suite runs about the same as before. I'll have to add these 4
programs
to the test suite :)... So good call. Thanks on this and the other
difficult ones you
flagged.

Warner

--0000000000003067b305cf88f636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 4:41 PM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, Oct 28, 2021 at 11:25 AM Richard Henderson &l=
t;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard=
.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 regs-&gt;regs[TARGET_REG_PC] =3D ka-&gt;_sa_handler;<br=
>
<br>
Surely there should be some handling of thumb addresses here.<br></blockquo=
te><div><br></div><div>Yes. I&#39;ve added code to do this, but haven&#39;t=
 run it through (a) our normal</div><div>test suite and (b) don&#39;t think=
 I have any code that&#39;s normal mode with a</div><div>thumb mode signal =
handler to test it with... It will be in the next iteration</div><div>I sen=
d out.</div></div></div></blockquote><div><br></div><div>FYI: I&#39;ve fixe=
d it in=C2=A0 the patch stream. I wrote 4 test programs: one in a32 mode,</=
div><div>one in T32 mode, one starts in A32 and gets a signal in T32 mode a=
nd a final</div><div>one that starts in T32 and signals in A32 mode. They a=
ll work now. Before</div><div>all but the A32 one failed.</div><div><br></d=
iv><div>And the test suite runs about the same as before. I&#39;ll have to =
add these 4 programs</div><div>to the test suite :)... So good call. Thanks=
 on this and the other difficult ones you</div><div>flagged.<br></div><div>=
<br></div><div>Warner<br></div></div></div>

--0000000000003067b305cf88f636--

