Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXrqL-0001lU-1q
	for mharc-qemu-trivial@gnu.org; Wed, 28 Oct 2020 16:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXrqJ-0001lG-Gz
 for qemu-trivial@nongnu.org; Wed, 28 Oct 2020 16:14:47 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXrqH-00075t-Gg
 for qemu-trivial@nongnu.org; Wed, 28 Oct 2020 16:14:47 -0400
Received: by mail-ed1-x542.google.com with SMTP id dg9so764894edb.12
 for <qemu-trivial@nongnu.org>; Wed, 28 Oct 2020 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EI+re5JhF2PN5CNGKWP0QgpLvNRbG0r2n5XJ/TemNC4=;
 b=lBjh27yDbKVGFCcQ2b6lR8BV1f9/7oytu2GhprK/Vo0SxfcL77uCVleZ27qZZXODe8
 9iFSro6zk4hafUqZQerQFfChhIfd/OICwadXK/tW2GAwHXsGfk0YYOl6a1MG9fPDqvY5
 HcK/+ylP/0Rl1KbxNBGJ3pJkj8veekErA1+mHDoEhAf/1ozR00ypWFe6JcccbuWjY34r
 I/5AoEV68C3bOzjmVpyXDfOd5IeqhWfx8DSfnUHw1ZidvkZHtnqh2JIgkanIV/yQwaTU
 9r5A4WgP1IDWZexKbg2gcbc+pGUf7op5MS8zAkREpyCrIeKFO8R9V7PGufGS/FFB8TsQ
 ktSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EI+re5JhF2PN5CNGKWP0QgpLvNRbG0r2n5XJ/TemNC4=;
 b=foioi7VDLrVLY+W2/gSFW9mazDRtJEr9NQHgI1eNPfq9wGOsJ/aHvUgdAMcj/cLj3u
 vBarzKAW8ZI5jCRbMiX3JTF7Z8KOTsGHcnE5Wwj/S/o17IgtVE4TlmdRJ1ew9qow9GzX
 dn7JHp+bCe7c00CaWMNNbwwPXu5HnvoV9eVZhnwtQkRgtKfB27jVoRwgKRIuXPk3D5rm
 bUEJbE1Z9Dt0mQdNARJL5ZhpuxEhgwJiUzxqQU30i91CFGgi8aKCWxQT73T+MISDVWMt
 /Gwqmbf/Z8pN5LSszr+etq8CVz3d2yh0QmgXQDeAnzxUq3g2gHKrtfXZaN0A1mXj3AeU
 WQeQ==
X-Gm-Message-State: AOAM532MU+vxzVvfx/T6vW2yvDlAyyUoZMvCfCVaK5nCcGNV4yvPFYXb
 HSwkE/8ySelmeCSuNsSPZLO0QUVQiSNKlYW/tkpXHg==
X-Google-Smtp-Source: ABdhPJzxJ58G8bO1cUsujEPiECPK/tTD85csERzqMUPTYqYtyQFcm3y7ppEtAx3TIsO2dESWQpWCbFWIudUef2CZkt0=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr711452edb.52.1603916083591; 
 Wed, 28 Oct 2020 13:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
 <20201028041819.2169003-10-kuhn.chenqun@huawei.com>
 <9992abee-6af6-5fae-15f6-3039fca84e80@amsat.org>
 <61ec3c46-f01e-c4ea-de28-a55507192ff3@redhat.com>
In-Reply-To: <61ec3c46-f01e-c4ea-de28-a55507192ff3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Oct 2020 20:14:32 +0000
Message-ID: <CAFEAcA-Pm2n19mVV0i4=551aVYW4wcOLE5BE14YmrpqowQr_nw@mail.gmail.com>
Subject: Re: [PATCH 9/9] hw/timer/renesas_tmr: silence the compiler warnings
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Chen Qun <kuhn.chenqun@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Magnus Damm <magnus.damm@gmail.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Gan Qixin <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
X-List-Received-Date: Wed, 28 Oct 2020 20:14:47 -0000

On Wed, 28 Oct 2020 at 15:07, Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/10/2020 10.59, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 10/28/20 5:18 AM, Chen Qun wrote:
> >> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed w=
arning:
> >> ../hw/timer/renesas_tmr.c: In function =E2=80=98tmr_read=E2=80=99:
> >> ../hw/timer/renesas_tmr.c:221:19: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
> >>   221 |         } else if (ch =3D=3D 0) {i
> >>       |                   ^
> >> ../hw/timer/renesas_tmr.c:224:5: note: here
> >>   224 |     case A_TCORB:
> >>       |     ^~~~
> >>
> >> Add the corresponding "fall through" comment to fix it.
> >>
> >> Reported-by: Euler Robot <euler.robot@huawei.com>
> >> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> >> ---
> >> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> >> Cc: Magnus Damm <magnus.damm@gmail.com>
> >> ---
> >>  hw/timer/renesas_tmr.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
> >> index 446f2eacdd..e03a8155b2 100644
> >> --- a/hw/timer/renesas_tmr.c
> >> +++ b/hw/timer/renesas_tmr.c
> >> @@ -221,6 +221,7 @@ static uint64_t tmr_read(void *opaque, hwaddr addr=
, unsigned size)
> >>          } else if (ch =3D=3D 0) {
> >>              return concat_reg(tmr->tcora);
> >>          }
> >> +        /* fall through */
> >>      case A_TCORB:
> >>          if (size =3D=3D 1) {
> >>              return tmr->tcorb[ch];
> >>
> >
> > You fixed A_TCORA but not A_TCORB...
>
> A_TCORB cannot fall through, since it always does a "return" in both
> branches of the if-statement.
>
> However, it also looks really odd that A_TCORA falls through to A_TCORB h=
ere
> and return that register value instead. Is this really intended? Yoshinor=
i,
> could you please double-check whether this is a bug here, or intended?

See the discussion in this thread:
https://lore.kernel.org/qemu-devel/CAFEAcA8c2dywr=3DZxz1ExAV-48JwFU5vbBDDfA=
=3D_KE98XamnXiA@mail.gmail.com/
from when Coverity spotting the fall-through.

I think this cleanup patch from Yoshinori deals with the fall-through
stuff by cleaning up that area of the timer device:
https://lore.kernel.org/qemu-devel/20200711154242.41222-1-ysato@users.sourc=
eforge.jp/
It just needs somebody to code-review it :-)

thanks
-- PMM

