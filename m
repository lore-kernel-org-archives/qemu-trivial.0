Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfhkK-0004rV-D4
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 06:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jfhkG-0004qd-SE
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 06:32:41 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jfhkF-0002BB-DS
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 06:32:40 -0400
Received: by mail-wm1-x342.google.com with SMTP id f5so10826530wmh.2
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 03:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=XsL6FKxWCCAoiMn+xELJ5UvMBzEdFAXZf/Y+QJf8cv8=;
 b=uXHnbtqCKuLE8LpmRriBscnkCeAPuwXrPPktxx6IS0DU8KaDimLuc1YXJqMleeFq/t
 TS0/s+mLF7vBXgQE9oU7vDnDjBbRC0i07laNI3uQuDcHoc5IBP2dJTV/cHy2USEe4IsA
 D48BVVmZg6U2DjhUBNAarn5Yy74WjgkLAJd9FS11mU1qJIpAvFodMNbUic/uTR0janGQ
 O2mPNRSqs8Drcurc8vMjhV611YeHX/qfEkakX3sa/VD1fjFTeAKrWg489dGcBKVWUUAY
 DTNLTwvRFiIbXotuUsY4w/tLE6Tme8M5fu70Ba7LuEGIHcwtQg/ZLsdHbsQ6JrPjDSqG
 HxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=XsL6FKxWCCAoiMn+xELJ5UvMBzEdFAXZf/Y+QJf8cv8=;
 b=gXJGCZ85L42dvs5pCim2gkpWfF6ck2yB1pfjaJ3nEkZjjCgEFXTGYn8ueWrFbXSAJs
 735yMeDGcK+OOGHUtb1JBRkgfIhbUhz7wFELOy4bibC8Gux0l1grdDQ8R6NR6t0duhCb
 BBKLqU8DRnYsqoNb7pWnWdtl1pULyEgmL5ciuNsCqwP+dQMSOs7b3legJ5q+Aj5lvsN1
 ueeBBCriiBpwSLn0z226vWqxiBUKbtkr+JhuB7X9vjyizB5oR1kZANPEx46BAGY+kr7C
 nfJu1YX/iroRU3SVAdE3CILFswo+kpW2q8rEHKS0t2PbSmbpP2OUQVJ/U2SPxG3xRHjB
 lZmw==
X-Gm-Message-State: AOAM533Whraqyjqw9AV4hBcYor9pzLHXOJXL7Mp9+TSFby2GTsuCaUn5
 Fo7wnqPki0cUurUpcoFdNSuA8w==
X-Google-Smtp-Source: ABdhPJx2cGIjytgTbyr5Z34t1M/pVVz61y9xEK5m7hUOJXPCY56VuOd6azbZWYuSH+tCaXb47Mf3Ow==
X-Received: by 2002:a05:600c:1084:: with SMTP id
 e4mr21842151wmd.144.1591007557848; 
 Mon, 01 Jun 2020 03:32:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k21sm16122360wrd.24.2020.06.01.03.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 03:32:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7BC91FF7E;
 Mon,  1 Jun 2020 11:32:35 +0100 (BST)
References: <20200530092306.26628-1-f4bug@amsat.org>
 <87eer0v25c.fsf@linaro.org>
 <8279188f-f6a7-4d0e-50d9-de1c66619e50@amsat.org>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Fam Zheng
 <fam@euphon.net>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>
Subject: Re: [PATCH 0/5] hw/sh4: current patch queue
In-reply-to: <8279188f-f6a7-4d0e-50d9-de1c66619e50@amsat.org>
Date: Mon, 01 Jun 2020 11:32:35 +0100
Message-ID: <87tuzv6pq4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 01 Jun 2020 10:32:43 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 5/31/20 12:18 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> Hi,
>>>
>>> As there is no SH4 active maintainer, I gathered various
>>> patches in a single series, in case someone is willing to
>>> apply them.
>>=20
>> I'm sure you you could put yourself down as an "Odd Fixes" maintainer
>> and put together a PR if you want?
>
>   Odd Fixes: It has a maintainer but they don't have time to do
>              much other than throw the odd patch in.
>
> OK 'Odd Fixes' matches what I can offer as a hobbyist.
> I'm happy to help avoiding this code to bitrot, as long as I don't get
> the same pressure imposed on other targets.

Yeah Odd Fixes doesn't imply anything other than at least some might
look at it. It's easier that convincing someone else who cares even less
to put it in a PR for you ;-)

> After all this Renesas hardware has a lot in common with the RX I've
> been looking at recently.
>
>>=20
>>>
>>> CI report:
>>> https://travis-ci.org/github/philmd/qemu/builds/692828388
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>> Philippe Mathieu-Daud=C3=A9 (3):
>>>   hw/sh4: Use MemoryRegion typedef
>>>   hw/sh4: Extract timer definitions to 'hw/timer/tmu012.h'
>>>   hw/timer/sh_timer: Remove unused 'qemu/timer.h' include
>>>
>>> Thomas Huth (2):
>>>   tests/acceptance: Add boot tests for sh4 QEMU advent calendar image
>>>   .travis.yml: Test SH4 QEMU advent calendar image
>>>
>>>  include/hw/sh4/sh.h                    | 12 +-----------
>>>  include/hw/timer/tmu012.h              | 23 +++++++++++++++++++++++
>>>  hw/sh4/sh7750.c                        |  1 +
>>>  hw/timer/sh_timer.c                    |  3 ++-
>>>  .travis.yml                            |  2 +-
>>>  tests/acceptance/boot_linux_console.py | 13 +++++++++++--
>>>  6 files changed, 39 insertions(+), 15 deletions(-)
>>>  create mode 100644 include/hw/timer/tmu012.h
>>=20
>>=20


--=20
Alex Benn=C3=A9e

