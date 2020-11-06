Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb4Sq-0003jF-FP
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 11:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kb4So-0003it-NF
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 11:19:46 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kb4Sn-0002Xt-2p
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 11:19:46 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b9so1828854edu.10
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oN9OQFym7O5MXn5HwIx0K857oypcAsC25S2AkjjW1f0=;
 b=WWM4ZThvpDczlIjvihc+LG8gA8M0x/WTWRJ/poAea3s9odFvQRUJ/nZkiWeFcRiDmv
 XzJcgmaiB/W1E8KJTzkCVrKFOdJnHp6ju4kPJwDsTrKy2Ko57L8a6d4YtUPSCF7w33Xe
 QKbVNF0TlpwoLAaskouS5kJGJBuVPaf5ItRv/o2yxUnlF06833WOb5ZQSHtGUwxzrrXT
 9Eqm2klyyCA8pOX9OPMJ6PJp/mqNuTg//hGhVaRVJdNp08uKLZwmw7fPYG0c1CA9O0No
 A2Fl4GihWgkecnFZUoOuWj4DL39fA+g/UeclKJ2LhWxdeJqDJvzjVACx2IfT84S7S3Y4
 DTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oN9OQFym7O5MXn5HwIx0K857oypcAsC25S2AkjjW1f0=;
 b=oAF66TOyWomLmjRXtKazVJbuti9f9o4MWUSIpUKlBtN2F1uVE4ghW9U3V8naQ4tXrN
 3JbvuDiTNq2z2hpl3gjFFiaFSjxquQgsafGZXXOvfhqXhKKTdDvZM/j2inhqf+Rmfxo6
 TZGxv6z4xnZL4go8okJdeQHlPoxXyoW1D/wlMFPHzPPnYSYVNcgZOLboHlN9Q360z50V
 KMJdKxo5gEtt4eTC2TK4abZny8amr8q2NYHmMsuOArTcvUWx6TaSN0b1GbWJw6lLe5mt
 hokZ5+LrnUeNF9rtKEKIzPvq4aXqwRIe3KPbaAEGSA+dtdsumIajXovt3+zcIIsN7bUQ
 FsCQ==
X-Gm-Message-State: AOAM530ZPx1e5vjSUDoGuTrUVWjqdq/8TfiXmLX4LiWDOWd3hQXWi7QH
 PFUjiOrGvIYKvff+t2QqPplt6DXuymhYMEFXmY1m8A==
X-Google-Smtp-Source: ABdhPJy92la7BEygKjmWRuyPxBpGxD1RIARCa92qquxKSDcVOg6XhncCJ5khHPwL3sHC0jjtyagt9eNHC6qg5jdiwqU=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr1366070edt.204.1604679583194; 
 Fri, 06 Nov 2020 08:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20201105154208.12442-1-ganqixin@huawei.com>
 <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
 <87d00qk51l.fsf@dusky.pond.sub.org>
 <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
 <37c519e4-d72b-944c-ed70-038f9c606be9@redhat.com>
 <CAFEAcA_a=vBjLM8_-KDkYfFuTLDW6cMsQ48or70uwwVusW2q7w@mail.gmail.com>
 <87zh3ufoy4.fsf@dusky.pond.sub.org>
In-Reply-To: <87zh3ufoy4.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2020 16:19:31 +0000
Message-ID: <CAFEAcA-3a8gYRPzk4jzv3QfLAw3tL74LoFTMy+VhXZA3QdOfPg@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Fri, 06 Nov 2020 16:19:46 -0000

On Fri, 6 Nov 2020 at 16:08, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Personally I just don't think checkpatch should be nudging people
> > into folding 85-character lines, especially when there are
> > multiple very similar lines in a row and only one would get
> > folded, eg the prototypes in target/arm/helper.h -- some of
> > these just edge beyond 80 characters and I think wrapping them
> > is clearly worse for readability.
>
> The warning's intent is "are you sure this line is better not broken?"
> The problem is people treating it as an order that absolves them from
> using good judgement instead.
>
> I propose to fix it by phrasing the warning more clearly.  Instead of
>
>     WARNING: line over 80 characters
>
> we could say
>
>     WARNING: line over 80 characters
>     Please examine the line, and use your judgement to decide whether
>     it should be broken.

I would suggest that for a line over 80 characters and less than
85 characters, the answer is going to be "better not broken"
a pretty high percentage of the time; that is, the warning
has too many false positives, and we should tune it to have fewer.

And the lure of "produce no warnings" is a strong one, so
we should be at least cautious about what our tooling is
nudging us into doing.

thanks
-- PMM

