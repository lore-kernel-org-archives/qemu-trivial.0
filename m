Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jkuI0-0002jP-Ug
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2020 14:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkuI0-0002jH-4C
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 14:57:00 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkuHy-000827-Hh
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 14:56:59 -0400
Received: by mail-oi1-x243.google.com with SMTP id x202so16856211oix.11
 for <qemu-trivial@nongnu.org>; Mon, 15 Jun 2020 11:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YmH3hG6EhBsqqMd07CDLXlRsVvhPUNVt2A0ZzdgHAJc=;
 b=xP/q58UYbKL4/L+gCAQeH92j7Fjd2Z8c+sVT1Bmd5w9uMlaxC8CNsbqgrkLIIF2DA4
 fyPvKccena1j4PHpkTld9ELWWHaWvOuX8s3wYAGe9OfTo9QU9J4MMWkuOq4KsiAd461X
 VzcNcnLkns+5cmeGnLf3wwHJPS7DmT70PfLzGtFEGjwfx4C3bHPbVfipFLIHU2uI9xwE
 vEEb13R8Acv9mhW+ehC39DeJffjI2TGrXCWhIsfDbmLEaxdXJnltph+SCFjAkVEk4XQr
 XYWXMyyJ9FpdEzr4SPTum/MA6Jk9uZyBSJJqCWSnsLI5yBQ6g7LrQK4RsPogu7z/GplQ
 f4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YmH3hG6EhBsqqMd07CDLXlRsVvhPUNVt2A0ZzdgHAJc=;
 b=NRD5zN1/qOjIehWCIvk/7PHVJxgGgMTTqZuSUYgl7hmEd8I9O5NSZrHroAv2tY7C0r
 y/MfLUt84Ta+sREt3i3Cz2XPpDET9gID2qvdK8WGe6zu5CLM+i1chzupFMpAcYTCc282
 U22YwDjaRvqnwg/EC0d1OGKXijCTtuNovrQfFjyqkyi/hEzB0rqDVNQN5ji3bsjsJ495
 NCqfBabAHwYOh7aKc4aDPWzk4f+RSetUJyS9pBx2dn1crmoryb0eiU1yIOKjl3EvFp3D
 DLNlpBU1th0lmti1QIgttLWla+zE4eQbJ7Y8W0ftJlPTCgBIlcc2n5xjBvx9MiUtT0yZ
 Guew==
X-Gm-Message-State: AOAM530Im2rBwJjk3VjGH5hvNLcTOJVAkjcyiT8v1kTmFHVxOckQOHhE
 JwMd7KOZ+SkbYZNQzYMyWKD83dnpTXq0BsjSbFVynQ==
X-Google-Smtp-Source: ABdhPJxDgpB7+j8lGobSHHjCxnLlnPu80vI3Q4VugAVJDY9ap06eXyTvSwMVd1NAeUjsKxsBNcgkWJqu7cXvFuxNzRw=
X-Received: by 2002:aca:568c:: with SMTP id k134mr619824oib.48.1592247417050; 
 Mon, 15 Jun 2020 11:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <1591663670-47712-1-git-send-email-wang.yi59@zte.com.cn>
 <94e456a8-0b4f-e1fd-7baa-8f81f36c6872@redhat.com>
 <31290c21-01bb-e191-a166-1595f4fc8549@redhat.com>
 <CAFEAcA-D440Z4-cPdmpMXJcfkxjrHTOvwO2PG5BhyXMzRCQN+w@mail.gmail.com>
 <eb11ce18-f1db-1d60-6b8e-3b0ba6ce6993@redhat.com>
In-Reply-To: <eb11ce18-f1db-1d60-6b8e-3b0ba6ce6993@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 19:56:45 +0100
Message-ID: <CAFEAcA_kfs-Par3fA0x3=m+X5ZXNCfj6TrLZFPWUxgrcTODS3g@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Install qemu-[qmp/ga]-ref.* into the directory
 "interop"
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Yi Wang <wang.yi59@zte.com.cn>, QEMU Developers <qemu-devel@nongnu.org>,
 xue.zhihong@zte.com.cn, 
 QEMU Trivial <qemu-trivial@nongnu.org>, wang.liang82@zte.com.cn, 
 Liao Pingfang <liao.pingfang@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 15 Jun 2020 18:57:00 -0000

On Mon, 15 Jun 2020 at 18:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 15/06/20 18:32, Peter Maydell wrote:
> >> Queued, thanks.
> > I guess this works, but it's kind of odd because it's installing
> > a non-Sphinx document into the Sphinx manual directory.
> >
> > I'm hoping we'll be able to land the conversion of the qapigen
> > stuff to rst this cycle, which will make this change moot;
> > so I suppose it's the most expedient fix for the moment.
>
> I can keep the patch in the queue and not submit it unless really necessary.

Probably better to apply it; the conversion patchset is pretty
big and is going to need at least one more round of review.
And this fix won't be a big deal to fix up the conflict for.

thanks
-- PMM

