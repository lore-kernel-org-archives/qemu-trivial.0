Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5rXn-0005L8-Jg
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2020 10:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rXi-0005Ii-MJ
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:15:51 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rXg-0001rT-W8
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:15:50 -0400
Received: by mail-wm1-x344.google.com with SMTP id g8so1921776wmk.3
 for <qemu-trivial@nongnu.org>; Wed, 12 Aug 2020 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=icRLnGV3YL50+5AjSjMAxhtAvXTSbCOpbMHrDDg5Hlc=;
 b=Ykx7MKtzD2rnumU3qIbcpRARArQob0mnRLRK3lKZ7VsapDPOcGY88qqsSDvphnwUUG
 sFPFUiSJDv9kYDAlobEYH2RV3xemziamCRB49qVjulVWvo6kNVFKd5zyFu9i06mWvBoC
 IxmAreX2d1QmXayrvDL2wpTOZvaUfFL51hSoA8gs1Ngx/cxAEKg+Zx7EJouuTT41Ogs/
 EvukgBHFEaaMijveYiCoS7YLu7ke5XbZXvNOumrlfxTiI69WB+a6oNOPxiZZLoHRk2qx
 USre0DA+jbjrqL44G3+5dHz6wCQUJg5vhwbWyDw5URPdn7gBup0nh9DaNSgPcS6zJM8s
 dUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=icRLnGV3YL50+5AjSjMAxhtAvXTSbCOpbMHrDDg5Hlc=;
 b=hIQty1eov/4sHmJPZy/dbS+fnWx1lgpifAsRn/sccgjnvitOBtl6u20etrhHkAwvJu
 AdCsLOHL/SE/T/9PxvB2qOpmWTwhxxXMqTunNyqJL7TTlD/KAXTSJW/D6GqIfXXtbxxu
 1lFHDJhCHXw9Dr1C/CO7hqCZQDdQXtrgrKdpHS+xt+1mmpzWkKYqYyYfkmUKd3mmlntd
 aJBDayhiFSoKxYgKh6d8KE4BrrDD90jvSDfROk9GYMGZnkIrYIHbEbiiYy4folQEUG5J
 2n76w42NlhRiH5RnF7BtDdVLyuFYFZWed+n8RO8SkIZ+RzOKzxuhgHeKrFjNIv5oLJi3
 oEag==
X-Gm-Message-State: AOAM530IQfrF8EPkOWNSbo7jBWYvnQEE2XLtTbSH6KGAcvH7CpzrnO8M
 dCKTZOECSdzikHPJXEoFAHHplA==
X-Google-Smtp-Source: ABdhPJw0wIAZmyNr11sirpBgEH1L+D0rQv6a6bQ6Ivc9i8t03uL4tYjfd86TgXZTCFUpky00KIaHYA==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr9382wmk.108.1597241747359;
 Wed, 12 Aug 2020 07:15:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e4sm4505298wru.55.2020.08.12.07.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:15:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 749551FF7E;
 Wed, 12 Aug 2020 15:15:45 +0100 (BST)
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-7-zhaolichang@huawei.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhaolichang <zhaolichang@huawei.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 06/10] linux-user/: fix some comment spelling errors
In-reply-to: <20200812101500.2066-7-zhaolichang@huawei.com>
Date: Wed, 12 Aug 2020 15:15:45 +0100
Message-ID: <875z9o0x2m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Aug 2020 14:15:52 -0000


zhaolichang <zhaolichang@huawei.com> writes:

> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the linux-user folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

