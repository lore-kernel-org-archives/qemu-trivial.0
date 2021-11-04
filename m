Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mihTD-00013j-1M
	for mharc-qemu-trivial@gnu.org; Thu, 04 Nov 2021 14:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mihTA-00012a-4w
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 14:28:13 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mihSu-0000pe-Ke
 for qemu-trivial@nongnu.org; Thu, 04 Nov 2021 14:28:11 -0400
Received: by mail-ua1-x92e.google.com with SMTP id i6so12580685uae.6
 for <qemu-trivial@nongnu.org>; Thu, 04 Nov 2021 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jdNa0kYxJXzn0cNFRTuC0tDh3IKGzoI63WkwEE70q2U=;
 b=m1m1WJdTTgROBhBNNCkAN/HhEL1ts8UMl7isbSDoiQxV5aKQPHd2vBlvpJzOpltVW+
 5ns5okh5MkIU4VoMxZmK7m8RysyQtwNHGjl3eJNODJ9wNqPNGgmfzRSRRy7upiAKbNzh
 C3eI/tmSZlKZeccMSHnlJwza9pq0dv04SmkrReekf8R6J/l/GPZwMjGepekamxVfyqjd
 7GybTu2Z8KuQeTmcRpUF4AC9799dedcMFuValPEFoitqC6HmjmrOMFf0rLB00V/4CZvL
 p2uyASDJ80GZTjksRkAJzw6RQkXLYiC1RzbSM5+/eoQKvJ6P4WWsogktLdDkQ7SJxiM9
 iMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jdNa0kYxJXzn0cNFRTuC0tDh3IKGzoI63WkwEE70q2U=;
 b=tZ3NIFT9ETC6DorQDhBuclkZABarYGJTKugZPSAE2cdcwe4nFYB/dBDdJS8BhzGFMw
 rJplYIb+SpRn+1JEVGKzvaXHtHY2vNafUipDmBjKpkpn96VGv3/ycpyZeW0RsW1nUzFI
 IJNrzcR1zGer4t6pzqc2SDMW8JbniMEgS/l70oxMvpLswIOXCdKOae7M3Y2NAq5R8VqE
 QZCqxmwAnPmeWwwQ0w+epcMKuefgOo6tA8/RcE6TcZErkX/WAF9bet03covqtO0HaCBm
 0vc/FylapWukFWkR+HK48g7gh08xGQdk1ow0nBXDXIsnEZSQWvVDN3gon6s7ZTZ9Cajn
 nPQg==
X-Gm-Message-State: AOAM533DMS+rBs/pN2Qtjvka6QItiheDvZwr0ursxByzNhTgddSMIUtz
 /SILZjPVvJ0hRYCAu7MPBKFQW8h41L7U3Z4J+CjYvQ==
X-Google-Smtp-Source: ABdhPJw6F6B9io/N4guRp7dfBJKQELIKgbXtUujaxek/v8wJAO8HjK/0g73f0PoH7vhhdkeC3VI156Hv4hIupqr4+9Y=
X-Received: by 2002:a05:6102:10c7:: with SMTP id
 t7mr49239068vsr.44.1636050475287; 
 Thu, 04 Nov 2021 11:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211104140536.42573-1-imp@bsdimp.com>
 <20211104140536.42573-20-imp@bsdimp.com>
 <1262504d-1ce4-4720-31e4-e373d74e2b39@linaro.org>
 <CANCZdfpo_VwtWGrKVM1x=qZrBOMnWy-w6A6PfdswUE0yJH-EcQ@mail.gmail.com>
In-Reply-To: <CANCZdfpo_VwtWGrKVM1x=qZrBOMnWy-w6A6PfdswUE0yJH-EcQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 4 Nov 2021 12:26:10 -0600
Message-ID: <CANCZdfp8gem1_BPa0pv2c49uN8+_uk2vXS0U9ck2j2YGVZ-jCQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/29] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000006a1cda05cffaaffd"
Received-SPF: none client-ip=2607:f8b0:4864:20::92e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Nov 2021 18:28:13 -0000

--0000000000006a1cda05cffaaffd
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021, 11:58 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Thu, Nov 4, 2021 at 11:49 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 11/4/21 10:05 AM, Warner Losh wrote:
>> > +typedef struct target_mcontext {
>> > +    uint32_t    __gregs[32];
>>
>> sys/arm/include/ucontext.h has
>>
>> #define _NGREG          17
>> typedef __greg_t        __gregset_t[_NGREG];
>>
>
There is already a TARGET__NGREG so I'll use that.

With s/32/17/ here,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>
> Will do.
>
> And I'm going to add compile time asserts for the size of mcontext and
> ucontext in a future
> patch series. It won't test for layout, but will keep things like this
> from happening again by accident.
>
> Warner
>

--0000000000006a1cda05cffaaffd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Nov 4, 2021, 11:58 AM Warner Losh &lt;<a href=
=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 4, =
2021 at 11:49 AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@=
linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 11/4/21 10:05 AM, Warner Losh wrote:<br>
&gt; +typedef struct target_mcontext {<br>
&gt; +=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 __gregs[32];<br>
<br>
sys/arm/include/ucontext.h has<br>
<br>
#define _NGREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 17<br>
typedef __greg_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 __gregset_t[_NGREG];<br></block=
quote></div></div></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">There is already a TARGET__NGREG so I&#39;ll use that.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
With s/32/17/ here,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</=
a>&gt;<br></blockquote><div><br></div><div>Will do.</div><div><br></div><di=
v>And I&#39;m going to add compile time asserts for the size of mcontext an=
d ucontext in a future</div><div>patch series. It won&#39;t test for layout=
, but will keep things like this from happening again by accident.</div><di=
v><br></div><div>Warner=C2=A0<br></div></div></div>
</blockquote></div></div></div>

--0000000000006a1cda05cffaaffd--

