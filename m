Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5rVt-0002Hn-S9
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2020 10:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rVs-0002Dh-6z
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:13:56 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rVq-0001OD-RQ
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:13:55 -0400
Received: by mail-wm1-x341.google.com with SMTP id x5so1922076wmi.2
 for <qemu-trivial@nongnu.org>; Wed, 12 Aug 2020 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=HFZ1MRgWEraNBLOBjnMvz0Kyv2paNJq3sQZJkOlGE04=;
 b=totxb3Z7b/eZnT8B5cFib0vemR2QQqEqi2O5Cihef1HGvlNtXXZS56BYSigZqYMnyd
 Rrs36YWmGANpFXA7oXmOdIRu93nQTP68Y85AJg5wDLUXxcZ51Df/Mb4xWj0EDjtf6VQt
 HVstiao38iM64mglJBuybU2GaZ8VX9ty4SUtsHxAaYMmUuP7HMN8qU0SGOGjpfdHBymY
 3+inVWd7qiUGZuppDZpgVxaoyEw1q3GK+98TUmzRD49vYj4//jbEerKl7hxsEhLGP5W3
 qjEPSNV5TvPCuua58t+uR817oE5zXdIdjLAm1gjMEz2Li9QdM7Ew3lSH0SqxmNIOyW1f
 Y3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=HFZ1MRgWEraNBLOBjnMvz0Kyv2paNJq3sQZJkOlGE04=;
 b=eypJxeElOjMrNxuyrB8OEIdLp6mnu9PiAU1N11ucwOy51G3wkoi4237LkrmX/C8pl2
 0o7uZKIBYQKVoGJ0GIO4XAH0gJ+wYBcIdJLo4UJD9V0pO25AmXA//sNwN/Br2bE+Q81G
 ZVOSmAWy5QBbAf9odSbzjYDW21a9fjMux65BUxzQeLXzJjDZ22euu3Ye8/G3jhBq7Qn2
 GIOkWO3M9VY90GuYCMxSLmw2BFDNjvvyi9icxpQZB/Wz55QAI9CTQ0QA8djy/9ByhYMR
 pcoG5lXmY86Sn3GE+X8K2s1w02YcomF4bnh+qUMxU8hNWoXu30rA6GS2M788OEvIsdo1
 Hwog==
X-Gm-Message-State: AOAM532tKx+tdMKyBxzGNPclWs6kzbCKTy9I14GJJGR4/1vD4SSaIEnF
 JGs8BaOMyS8apckrcp3jcnADwQ==
X-Google-Smtp-Source: ABdhPJwGAW2WNFYMKeNZoC/KnguotxO0K9lesn+TMHx4U7f7QTDowVGhxg15FqJduB4GInvrxs6W5Q==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr13638wmc.40.1597241633423;
 Wed, 12 Aug 2020 07:13:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i66sm4290566wma.35.2020.08.12.07.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:13:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4FDFC1FF7E;
 Wed, 12 Aug 2020 15:13:51 +0100 (BST)
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-4-zhaolichang@huawei.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhaolichang <zhaolichang@huawei.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 03/10] docs/: fix some comment spelling errors
In-reply-to: <20200812101500.2066-4-zhaolichang@huawei.com>
Date: Wed, 12 Aug 2020 15:13:51 +0100
Message-ID: <87bljg0x5s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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
X-List-Received-Date: Wed, 12 Aug 2020 14:13:56 -0000


zhaolichang <zhaolichang@huawei.com> writes:

> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the docs folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

