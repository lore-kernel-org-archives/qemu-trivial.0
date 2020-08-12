Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5rUw-0000il-Bn
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2020 10:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rUu-0000f7-LH
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:12:56 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rUs-0001G3-Tx
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 10:12:56 -0400
Received: by mail-wr1-x441.google.com with SMTP id a15so2168049wrh.10
 for <qemu-trivial@nongnu.org>; Wed, 12 Aug 2020 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=je6VphbiDfG1JG0+cuv27iYamG6VH0o4d0cYjOIwIU4=;
 b=Gyrz6DPoeJr/WN/VCp9M4bBZFUbkGzl7ofF7jzPYD+bKZYaltRQWYfeCGB+RiZXo1g
 MkVLe8Fx2DGElsB8TnScS6rtsuN8OIFABSFVgEz/QR3YMRfGFrj2+rRNZnuNBhiE1omn
 mnmWsJiU25fw07opHDvhXpybhAw+bztBKojp45YOL6TEDC16vbYnJJZw8y38XcdCpiVF
 Qm0FEMpWG+fdhKWqcuEfCyVDPJ/plcA95LZTvlLzt0TgOGwc8yoyS+PU4qz0HbLo80dg
 4ji71EwZ0smFwzBkJ1UU4sU6s1d9VUxpz1MqwUb5sTbkG+AZEk8XfY8xisUP4ozKxQnY
 g4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=je6VphbiDfG1JG0+cuv27iYamG6VH0o4d0cYjOIwIU4=;
 b=Dn98LZMrtT8aTO02E0JUXuYUYzb8OPxj1i4SeK+wIOH9qnM0SzwOTrK2lP0MpjRc9/
 L/2reSN8lhfEB4/vQrjgKLpsZq5jcVkvE1yICxl1VyVsJAUJNLut6qk0WFPWxRj5CLy+
 XVWCPGAD2Ob6LRh+gfs9O9pv76tD5rus2KkVTApszNRQw4xAzNlKbsIg/iq/XGG7qqEh
 A8V+qpEG4+hSnbhJlz0X2MvIQY84JmvMAW43ANm9jtnFghtPDAG51fieS/ZyaHbSa6M0
 TPSyUG5z0EEZz36mRg4SKeAqEINSx2WoRm8fpF93ssrcjrc7tn/0XoYALAbpqdDfLr5b
 Q1LA==
X-Gm-Message-State: AOAM5317NIYhxC69RyTNujs/SjuY3PkSCq3HzemZtWtpJwgHiB2qUjIh
 dEQzJQbO1vDAGLvZx5LdqGrrhw==
X-Google-Smtp-Source: ABdhPJxa77GpuoT+D5YGADRK9bSJpYg58KCZ/FxDY4JcYJQMROGch6+b7JheU3bNTMk+ih3bXUDNSA==
X-Received: by 2002:a5d:644b:: with SMTP id d11mr32901022wrw.373.1597241572848; 
 Wed, 12 Aug 2020 07:12:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g14sm4010686wme.16.2020.08.12.07.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:12:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 780F21FF7E;
 Wed, 12 Aug 2020 15:12:49 +0100 (BST)
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-2-zhaolichang@huawei.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhaolichang <zhaolichang@huawei.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 01/10] qemu/: fix some comment spelling errors
In-reply-to: <20200812101500.2066-2-zhaolichang@huawei.com>
Date: Wed, 12 Aug 2020 15:12:49 +0100
Message-ID: <87eeoc0x7i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
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
X-List-Received-Date: Wed, 12 Aug 2020 14:12:56 -0000


zhaolichang <zhaolichang@huawei.com> writes:

> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> ---
<snip>

> diff --git a/gdbstub.c b/gdbstub.c
> index f3a318c..bbe66b5 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -698,7 +698,7 @@ static uint32_t gdb_get_cpu_pid(CPUState *cpu)
>  {
>      /* TODO: In user mode, we should use the task state PID */
>      if (cpu->cluster_index =3D=3D UNASSIGNED_CLUSTER_INDEX) {
> -        /* Return the default process' PID */
> +        /* Return the default process's PID */

Hmm I thought this was correct usage as s's -> s' but apparently that is
only a given rule for possessive plural nouns (processes' PIDs) -
although apparently it is possible to have singular nouns in plural
forms so what do I know :-/

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

