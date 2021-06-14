Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsn7k-0006CI-Mb
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jun 2021 09:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsn7i-00065S-Ce
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 09:59:30 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsn7g-0007q9-Lb
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 09:59:29 -0400
Received: by mail-lj1-x234.google.com with SMTP id c11so20340599ljd.6
 for <qemu-trivial@nongnu.org>; Mon, 14 Jun 2021 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ETcKhjqQSMJE95yvwSw8qo+CKwKD0zHr0lDCUCf+mYc=;
 b=nYdG6qUPs0Q2sXjbpyEmqAyE6SH821yKHC5aVjnsqCee3TN/mVuSajZCpShyM8v39L
 6r91eQvhhjgem7R+ONV1PnEjv+NX48hdzTI6fnf0wHMwfhPZPVkaWmdDzLOJBji2sYI9
 AvIYbfJECjY4E45vKKpKhYHJ/ZuzIQQ2dmH6yLn9V33aMcVqK6xciLAO/ZPe1s5BRxQ/
 3JWxcsd7TqzwaJuUbFk2MkUUBEem7Mpbxq5ZLVEMeYwcFQ5eon146HG59m/hRb76xaIh
 K8zePbfpx8EDYnlkAArmsJAaVDI+etReDCh973sTKXB1zeuMFl4J7ofVCwBwUFcckAdC
 EJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETcKhjqQSMJE95yvwSw8qo+CKwKD0zHr0lDCUCf+mYc=;
 b=bbGpbuWk0x/Vm3fKas2xI1/deM+EwbSd8zKQr7Z/wNnQqc1PoC0KpMvAArkRVYlgjf
 17aIzh5b/NNMRCBmcL3zsefLWX6C+0FeWQ4iNL43LKvP3G4o6zU0kmHyxoJpksF2x36Q
 nSUO5PRUkuEWVYM+1ZOby6WJ3FX0ZkGoCjwXifzsONTz7IXEFWpGV3KeCC+0RSMVPcSy
 PbgSeuIzfiqp4zOaOVTHMmYPwNbnCRVTEfeYGx7641d3MGxLcQwvXa+61FuTmmigmsmV
 qjUqeA2SljLZGq11J5qjD8Km5LKYoW8TYvTAheibfBS6kOQ86+JWhumcvM7GIx7SHm+y
 Q+Vg==
X-Gm-Message-State: AOAM533+kYt+OWcVeLQzE8kAiunJGI2zVfnTinkJiWM81NBXFZFkIDcK
 2JzqYxlCXHfnQ/MyV/Qb6pPEKPRjPKD7xImVbvj1Gw==
X-Google-Smtp-Source: ABdhPJxT0vZlXRYi19mKdmeD1gpcPQ9/7OkuCFWXx7Z9QJi1IS1cCGD/TCxoZuPjzfmKXEWY5wFrd9X5f7flF7lw0Mk=
X-Received: by 2002:a05:651c:3c6:: with SMTP id
 f6mr13307474ljp.456.1623679166778; 
 Mon, 14 Jun 2021 06:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210614132536.1657-1-alex.bennee@linaro.org>
 <CAFEAcA8e0oVDdoAa_zpQQq++dujdWs9BkGTqEMd9Fgn0BjZecw@mail.gmail.com>
In-Reply-To: <CAFEAcA8e0oVDdoAa_zpQQq++dujdWs9BkGTqEMd9Fgn0BjZecw@mail.gmail.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Mon, 14 Jun 2021 14:59:12 +0100
Message-ID: <CAHDbmO2bHB7mCDSdKf97DSthbgj8Qc2LbCEeFRLRQ9mYxmA1RA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/trace-events: fix minor type in format string
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000f7225605c4ba4337"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 14 Jun 2021 13:59:30 -0000

--000000000000f7225605c4ba4337
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Haha, thanks!

On Mon, 14 Jun 2021, 14:30 Peter Maydell, <peter.maydell@linaro.org> wrote:

> On Mon, 14 Jun 2021 at 14:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Typo in subject line: should be "typo" :-)
>
> -- PMM
>

--000000000000f7225605c4ba4337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Haha, thanks!=C2=A0</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, 14 Jun 2021, 14:30 Peter Mayde=
ll, &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 14 Jun 202=
1 at 14:27, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" =
target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;=
<br>
<br>
Typo in subject line: should be &quot;typo&quot; :-)<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000f7225605c4ba4337--

