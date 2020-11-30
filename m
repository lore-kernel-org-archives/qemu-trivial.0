Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjjCG-0006kS-0a
	for mharc-qemu-trivial@gnu.org; Mon, 30 Nov 2020 08:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjCE-0006hd-8s
 for qemu-trivial@nongnu.org; Mon, 30 Nov 2020 08:26:26 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjCC-00045l-8d
 for qemu-trivial@nongnu.org; Mon, 30 Nov 2020 08:26:25 -0500
Received: by mail-ej1-x631.google.com with SMTP id f23so21829806ejk.2
 for <qemu-trivial@nongnu.org>; Mon, 30 Nov 2020 05:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+NKxKyeoqCIDEDdsuOFhamrjxI2SP9q59L9/qzoO/A=;
 b=X3XgvkxHaGnwY5wDFTuVjbBurC0VCE6pHKy0dKIQP1X+tdlMyoCe6uzv0ZbVH0p6yp
 SpUGPtEm7JDKnDVUE+YogBHFaCI5KUcyP2Fnj/VlB8mCncTjUpSePFOo7mlx4gQGIYe/
 eegdOKLBsoc9ABuN5TSJB/rlWJ8pCAoislZkr1SW61nQtJ7abkQaLcwQs6tkhcVdTCA0
 fUeYLQgzpVyt6HksE6DYu7XpkVEH37yD6XSM1TrKH75K0XT38xbEZPYqvPDOvoZdFpRF
 GzgDUikfqoTh5sboy+SelPQZ1mVgnH41/J3GjkFb5znktsvlA9haVP/I/KUhRYek8LvG
 1YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+NKxKyeoqCIDEDdsuOFhamrjxI2SP9q59L9/qzoO/A=;
 b=ZkRVkgheOkS1KoaKE5/7zfGzfBwckI4GzAsZrij5bC992X5us+bHQLCgzsnK9KqCQT
 HLdFR4Pn+k0bd6Wuf9RPZHBvJw0Zq12D3F1iFrlQZ7vq2AbqOTevwkRAZ919f4hwpHc5
 SrJ8rcr+yenJXrCp7C6wq/5VQC6lmM6vYILEMmngwGXGtCAb/6tJjUtBahvVJDzSzSz1
 nGfGzUt3SGLTIP8Lg90+uLTd0FNb1gez3HqPDie3/OZ0kgVrK49qfj/uwIlHgg6yxPZj
 sumiV1jyMYyUgsAhk2/qtTmxu6aRb7hrp0RY2rJt1CwN1UU3Pw/+kYtbKupoK+yP3/+1
 Eghw==
X-Gm-Message-State: AOAM532LpDP7+uF4S49mKqi0bYIOmiqJASQpqikSVk29ZbTHoojAPNaP
 ykbLZ0U0dMW2iwABkBX3zPkliWSCszb6/UQMHye5mw==
X-Google-Smtp-Source: ABdhPJysubEEd2miN6LQyJ8fw7dybpWKU6oBCCRbBln1S1qcUp5wxvH8ICq/Ws6i2Le9Fjm3Dr7qG891QhRJSmsL6TQ=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr3767664ejf.407.1606742782667; 
 Mon, 30 Nov 2020 05:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20201105154208.12442-1-ganqixin@huawei.com>
 <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
 <87d00qk51l.fsf@dusky.pond.sub.org>
 <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
 <37c519e4-d72b-944c-ed70-038f9c606be9@redhat.com>
 <CAFEAcA_a=vBjLM8_-KDkYfFuTLDW6cMsQ48or70uwwVusW2q7w@mail.gmail.com>
 <87zh3ufoy4.fsf@dusky.pond.sub.org>
 <CAFEAcA-3a8gYRPzk4jzv3QfLAw3tL74LoFTMy+VhXZA3QdOfPg@mail.gmail.com>
 <87mtzqsy2r.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtzqsy2r.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 13:26:11 +0000
Message-ID: <CAFEAcA-JCLUn5BxwH71CmFB3Q+KMSK0pid8nGH9hLUokNcoLSw@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
To: Markus Armbruster <armbru@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>, 
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Mon, 30 Nov 2020 13:26:26 -0000

On Mon, 9 Nov 2020 at 09:01, Markus Armbruster <armbru@redhat.com> wrote:
> CODING_STYLE.rst: "Lines should be 80 characters; try not to make them
> longer."  I'd like to keep the tooling we have to help us with trying
> not to make them longer.
>
> If we have lost the ability to differentiate between "warning" and
> "error", call it something else.

Personally I just want checkpatch with its default arguments not
to complain about code that we'd be happy to accept in the tree.
It's unnecessary noise when I write and check the code locally,
when patchew runs on the patch on the list and then when it goes
into a pullreq. Do we need a new "be really strict" option?

thanks
-- PMM

