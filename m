Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ktvYM-00063y-32
	for mharc-qemu-trivial@gnu.org; Mon, 28 Dec 2020 11:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1ktvYJ-00062j-8K; Mon, 28 Dec 2020 11:39:24 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1ktvYD-0000vy-Te; Mon, 28 Dec 2020 11:39:21 -0500
Received: by mail-ej1-x631.google.com with SMTP id w1so14835019ejf.11;
 Mon, 28 Dec 2020 08:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YNpJPtBT6Oihbn07w9iHm5NjbLipfilKsvPAfcM/vSI=;
 b=p7N/PoQzTddc+1u2Q9/q9cjnDedVsfue8/LXmOw6VsOTDwYO5NKk4hVvQ7UTcWti6C
 A9HriDQAPdznNvOXpvZlLqur9an69udYPOMcycl2dOZ3mHAB1DxXtyUHrExOdZW6qFjk
 xZKxNdROBqTxjK6faQ8tPOXBoTO3bRcxD0RyAwD9/bddxl61Lte0NxozRvyCU1hu5pBW
 LusG+/vba0Ikbls5JBFdhtoJNv3XWPePbgiXhr69Wken8awBAXziQ6hVQ+SBYIgrSWsA
 HsHGMAf89l/t5bayZO/bzBdxN89OhHBw0dzEdLmIN3eLuB9uyOZtLl3Mh439f1/esMw9
 5UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YNpJPtBT6Oihbn07w9iHm5NjbLipfilKsvPAfcM/vSI=;
 b=o9mtg9KJmcniQFYN3pI4qiwohkYOn/oMg4zMN9dlgiN8v2kmtEY9/VpQXvLjM1WWBF
 tetsR4F/RFkZWWpXBeTqHR1e3+LRwwPRiiSi08JDsHrSX1NJ57xmuRolG1Z8QvD9Hu0J
 zaYYMMh+8LDWzdeQBRf8JEwP8F4Iw7AouwQ/DbQKsHKepDmjiGKDHnRGg+2NwBqDsyEb
 3WcUiA/iFiAYECVBAM7eOZ3vKjIiS+hyYfzANPAkIhUY0l8mOim1aJoLMh58tRwTMu4l
 +pLCVJ3E3GUpWUYqccjLFPAboVW0wgbx/z9KI9F/eQWrwYeRkeSJJWPdTa+TYhOziAdg
 NihA==
X-Gm-Message-State: AOAM531/SVJkZiYquWWglJoFORRWGMwEjtusjC/bfxPP7AcV8JIZZkYG
 iqGqFx/rF0lC6nKcaIgQSMeeRVteknTkOnm5XDs=
X-Google-Smtp-Source: ABdhPJxlUenRrCMMBmc+q5jkdLTU//+n1A0Aap8mdkqyqCXudlH3x0cJfuV+K+ZCYlZsBAgtuWeox1Ge3DINpiR9ibY=
X-Received: by 2002:a17:906:6c8b:: with SMTP id
 s11mr41917070ejr.187.1609173556052; 
 Mon, 28 Dec 2020 08:39:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+XhMqwjq99QdTKntxbQ_rZ-L3bQX7D3WHLkwMdK6zmiP=_56w@mail.gmail.com>
 <CANCZdfpt0vEvJR7BYpPSxKdHs6r0BoUtXsHL1gi+x6ZopzZ1OA@mail.gmail.com>
In-Reply-To: <CANCZdfpt0vEvJR7BYpPSxKdHs6r0BoUtXsHL1gi+x6ZopzZ1OA@mail.gmail.com>
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 28 Dec 2020 16:39:05 +0000
Message-ID: <CA+XhMqwVS7nOCdf0Ji_=ZpWQYp03z4dcTwkHqBwOCCkEQv8_sQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] bsd-user, FreeBSD update
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=devnexen@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 28 Dec 2020 16:39:25 -0000

Oh good to know I understand better why syscalls not updated for so long.

To upstream I would suggest not to push straight all these changes in
one shot and focus on FreeBSD at first, much less to review and so on.

Regards.

On Mon, 28 Dec 2020 at 16:21, Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Mon, Dec 28, 2020 at 1:15 AM David CARLIER <devnexen@gmail.com> wrote:
>>
>> From 10b13162949debdbbd8394bc1047511d1a900176 Mon Sep 17 00:00:00 2001
>> From: David Carlier <devnexen@gmail.com>
>> Date: Mon, 28 Dec 2020 08:10:43 +0000
>> Subject: [PATCH 0/2] *** SUBJECT HERE ***
>>
>> bsd-user, FreeBSD update.
>>
>> David Carlier (2):
>>   bsd-user, updating the FreeBSD's syscall list, based on the 11.x
>>   bsd-user, Adding more strace support for a handful of syscalls.
>>
>>  bsd-user/freebsd/strace.list  | 12 ++++++++++++
>>  bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---
>>  2 files changed, 34 insertions(+), 3 deletions(-)
>
>
> Have you seen my patches in this area? Are you familiar with the bsd-user=
 efforts we've been doing at https://github.com/qemu-bsd-user/qemu-bsd-user=
 We have about 300 patches in the queue and the more that others change thi=
ngs, the harder it is to get them in. They are a twisty maze of conflicts e=
arly in the series and some not-updated API calls dealing with the evolutio=
n of the qemu cpu model as well.
>
> I posted this series two weeks ago: https://lists.gnu.org/archive/html/qe=
mu-devel/2020-12/msg05528.html
>
> This part https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05530.=
html updates the system call numbers to the latest FreeBSD 13 numbers.
>
> Perhaps you could help in these efforts? They have been going on since ar=
ound Qemu 1.0 and we were bad about getting them upstreamed early, and so a=
re paying the price now. We use the code in the above repo to build about 4=
0k packages for a couple of different architectures.
>
> Warner
>
>>
>> --
>> 2.30.0.rc2
>>

