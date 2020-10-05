Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPNDb-0005b7-K6
	for mharc-qemu-trivial@gnu.org; Mon, 05 Oct 2020 05:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPNDa-0005ap-6I
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 05:55:42 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:35078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPNDY-00033w-HO
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 05:55:41 -0400
Received: by mail-ed1-x543.google.com with SMTP id cq12so4849316edb.2
 for <qemu-trivial@nongnu.org>; Mon, 05 Oct 2020 02:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LlbqEHXOsa04D97hGS77EQwYH+JTb8cxRTKR/RTuVbk=;
 b=sVhyc3gRtBSzIcdmCejubMfWtQZ7UNp8T6RrMAn8DPw0fi4lBfITNhaOBlVRGK6Jif
 SN95QPzikQ64F5P4Uq+fjELkYWGBpLsiVVb/DUHT8sXHx9PewU14LneZPXgsfzUE/93j
 Lu/y+pvJaE2LUP5jP2XNhTV0w2mfoV8Bip1rJ/QQWdMj6Qnbp4uZehIl1wfG1+sx4buy
 tucWvePJlY6mPeBeY92ihfkmHJnCVAOf3SjjBFgQ2EUwxEcYv4j1eKOGLqB0xGaJmEHC
 Xsx+jWGU/xrmOtgTJuQqiRigUv0U5zgPQB5jRqm9/pNOHocEOHdcDvOJOxodbTAisLqm
 DRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LlbqEHXOsa04D97hGS77EQwYH+JTb8cxRTKR/RTuVbk=;
 b=or34kgvg9/F9j65U/8s+R9i1AOiBgnQMlXZebm4oMh9vIuT9SW3Okxd+G03r6A/u8D
 IeJmN8nrbTyezOanAAvDbZwJLvnZ83OtZUwYVAZr7npCQTvwyUByObsGszYiMvH57zX9
 L0/zZ9vIn8Y8tCIExjQgKACK8VpMGv74WMuZ955p6f/XGzEib+VVkqhay+hqGVrzyDXB
 OELk3cBKcoDcW/qdnadMZ/UBwTzXIYTDGbfs3EaBFYojE6L82RE3Tjc87MLEE5sDhgix
 brcfqyaLrdWubmo4aAdAQsNgSLax47lhY37MVLIOkVKXzpLDcZPlYrKGdpKp7kDUdIVC
 OF5w==
X-Gm-Message-State: AOAM532RDBZ+dIyonXpONkvR03s2QVclFLM/u01eyO4yHWLJUXKlMkSB
 4L/kfWocWzIOSZ305C5yQ8zdUnYeqtWf2yPMTgKrWw==
X-Google-Smtp-Source: ABdhPJwdZqgSTcyB3y5KS8k5GBdZjitFdYkVYeSSdVcVBDIH/hjgVmeiPOLwUKmTws79GZPX+n0EOU0c2Mc0F+/qkxs=
X-Received: by 2002:aa7:c683:: with SMTP id n3mr15822822edq.146.1601891738764; 
 Mon, 05 Oct 2020 02:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201001123807.42978-1-eafanasova@gmail.com>
 <87r1qhtdxt.fsf@dusky.pond.sub.org>
 <b4ab229a-0e84-9d0b-1287-846c52a667bb@redhat.com>
 <87eemhm2b9.fsf@dusky.pond.sub.org>
 <17636b91-e111-1b60-4eb2-d526df4a6bb6@redhat.com>
 <d52b5d3655fba86d1b3816115b24997b36952e3b.camel@gmail.com>
In-Reply-To: <d52b5d3655fba86d1b3816115b24997b36952e3b.camel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2020 10:55:27 +0100
Message-ID: <CAFEAcA-5FFqr1oUgjeym=NjaSfnZCgHz9UrsnwF6GjMmb+w+wg@mail.gmail.com>
Subject: Re: [PATCH v2] elfload: use g_new/g_malloc and g_autofree
To: Elena Afanasova <eafanasova@gmail.com>
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Kamil Rytarowski <kamil@netbsd.org>, Brad <brad@comstyle.com>,
 Ed Maste <emaste@freebsd.org>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
X-List-Received-Date: Mon, 05 Oct 2020 09:55:42 -0000

On Sun, 4 Oct 2020 at 13:22, Elena Afanasova <eafanasova@gmail.com> wrote:
>
> Subject: [PATCH v2] elfload: use g_new/g_malloc and g_autofree
>
> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
> ---
>  bsd-user/elfload.c | 79 ++++++++--------------------------------------
>  1 file changed, 14 insertions(+), 65 deletions(-)

Random question -- how are you testing this change? (bsd-user
isn't covered by 'make check' I think).

thanks
-- PMM

