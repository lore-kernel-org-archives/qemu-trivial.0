Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb1yH-0005Wd-D9
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 08:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kb1yG-0005WP-CR
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 08:40:04 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kb1yC-0004Ke-Vf
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 08:40:03 -0500
Received: by mail-ed1-x532.google.com with SMTP id cq7so1088371edb.4
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKnReEf/p/xSBuslk1N1S2RpHTmhnhh7XzQnHsR2Bmg=;
 b=daUn94oyFO4dqdSyWVN0KxTXWNHyPguuirT0xAGFfr8hdcolJNAl6JRJEjTfCwlyYA
 F3/j0ZABOUrwDzw9UjIPJC/3RKoOCEXgEX2XYvIt5djrw3JdT6h3S/YA4IemHiQjqTTC
 XVtYvBrl5yE7riAvYYbplZo13KJzTqUJeryW3mdV62J/iprOFZQpSL+9G6GIqnBTUp+k
 5tKivf6kspHbqu2R3Kqhhg6BOkbzqVfU9KBA9ov7vKmO5FdXfmBm+2cw3n0k1jFE5W1u
 7Fz+hf9Ps6WTsDia3G+auSYSNJ5dGcHh2tGR+LnAfEd3MeDtdgfAz6kc9wWOAECzo1kC
 xesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKnReEf/p/xSBuslk1N1S2RpHTmhnhh7XzQnHsR2Bmg=;
 b=gIlWo04L+b1NJ4tBhmwCuE7pXhIPnDZP4w7RqfxTntGaJKUGJ4ffVgEZZcS/Re7mgo
 BT1u4xk/gYQjoQoPxpB0LXAd2c93VzNEFx5V6f+YPZb5OIK/WSuj0sgEy6tUdG/NrZTo
 6ruaS7oEg/Vceyshrr2C5g0dvchIhiqqdsE9maVihExGY/nveCE7slwu/oYuOH+ai+9d
 Dx9zAZ7irg7XXUxFDjPuJwvWQ6PMluhtBXAAfKUoerTx28Ea4+y5h2qQMsj1nHlqB8jl
 Wzq0yBQ6evTIGXzKcRVhAqhWL5YWvBZ3FucwmZ6FdwDTSceJebNAYgCUDhbFjnyCzRC0
 b4/g==
X-Gm-Message-State: AOAM530V6uixd5fqDuuDid84m1zj1T8Aq3iqf7HgCPrK19UqU081hz35
 BimkTzeNq8mzuQ+BUwRk4NflirSjDuPc/EaOcrW+nQ==
X-Google-Smtp-Source: ABdhPJwRtfrfzOma3hWqvGkBY3KGtVOhqP+LLmw+So5ynmjLjPEQwQxSFJTBorzAjEl9c55x2EMRSRz9rBZ026fhCIY=
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr2009335edb.146.1604669998555; 
 Fri, 06 Nov 2020 05:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20201105154208.12442-1-ganqixin@huawei.com>
 <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
 <87d00qk51l.fsf@dusky.pond.sub.org>
In-Reply-To: <87d00qk51l.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2020 13:39:45 +0000
Message-ID: <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
To: Markus Armbruster <armbru@redhat.com>
Cc: Gan Qixin <ganqixin@huawei.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 06 Nov 2020 13:40:04 -0000

On Fri, 6 Nov 2020 at 13:07, Markus Armbruster <armbru@redhat.com> wrote:
> The current "warn at 80, error at 90" is a compromise.  It's the result
> of a lengthy argument.  Why reopen it?

There was some previous discussion under this thread:
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05653.html

which I think is what prompted this patch.

thanks
-- PMM

