Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l96gP-0002Yh-DU
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2021 08:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l96gB-0002W0-RB
 for qemu-trivial@nongnu.org; Mon, 08 Feb 2021 08:34:18 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l96fz-0004Cq-5H
 for qemu-trivial@nongnu.org; Mon, 08 Feb 2021 08:34:15 -0500
Received: by mail-wr1-x429.google.com with SMTP id u14so17175931wri.3
 for <qemu-trivial@nongnu.org>; Mon, 08 Feb 2021 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8xQ8NTAa1qNwkvm959+RaRdezYg5tTtejQG8BM6rY8c=;
 b=qADVBe6r0nuTF785wOt/B+tX/y3cwHXBk8BMELxcxh2dD9lurIAvHvlHf2zetOWkpS
 aVocqOelZJw05G6mT3mHm5Tyqk483jFsLIFQOXjt+bG7ZW891omqzA/R2/cnDsfei4vS
 bHxJHuPx3aWCz2hcWwn9c3yYs8ZbB+KqJ+bWHe0NYYDBWWtetP3f5RpB1zBz0W9DVZtq
 RNlmnu7G2rX74N8BS4h8b/OrNjEOiRKpG68qFco666A+REOnvVaLUgqs9j0ArgS0kd9U
 jhyHf0wjAzpr423NTpITRM/bk9h+R6UqfpJ+NE2+yMV42gPGNkecw9/ydgjnHP9/M+/1
 HMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8xQ8NTAa1qNwkvm959+RaRdezYg5tTtejQG8BM6rY8c=;
 b=BAaRJT1Y0H4mvVkjgevYAxzzQFKvJmhU8Hi5nyA9I5L2ldNKRllcuvbx2xerELZiRz
 ng2/r4elelsamNTmq4JE8/Ae11PHZZTXvxF/nIClmhXNQtUe4KbXqLMue4BGKW6/hMzX
 Fau26FyRfOt+iE7vKZI460aDfQ0JtvJfqskyTh5kU5T35k768Na3pqtG7a1r8+70spoL
 BovIZkoel50VzYuXhhuP0nHoDxB52zwK2l1maWQTcZ2tuyWQaX0nrjXgen3FOqeLMy7g
 Rjkk1aZo4LovEm6qLX+mBoAkyHZvX0iajOM3jq7NCKaRv6v2WxMdGLtJXzpjRus1wc/f
 fK3Q==
X-Gm-Message-State: AOAM531LXcTa+83SFVqy9MSKB+aRVeYub2CDPWxiUf40Lv2k1nfB0EPi
 vGOnvG7/iTduqpjBZCS0jcGeUw==
X-Google-Smtp-Source: ABdhPJxA5S0OgfcYpCV9jiJ15s6rQrDkxTbVOZkrB615sjvp5rZTJFbuUIMxhWh/1GN3Fni8jcXsiA==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr11108644wrt.238.1612791241249; 
 Mon, 08 Feb 2021 05:34:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm28562911wrl.95.2021.02.08.05.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:34:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 851C81FF7E;
 Mon,  8 Feb 2021 13:33:59 +0000 (GMT)
References: <20210208113729.25170-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
Date: Mon, 08 Feb 2021 13:33:38 +0000
In-reply-to: <20210208113729.25170-1-peter.maydell@linaro.org>
Message-ID: <87czxabs54.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Mon, 08 Feb 2021 13:34:22 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Noticed this because my recent patchset which touched gdbstub.h
> didn't cause check-maintainers to add the gdb stub maintainers
> automatically.

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Do you want me to pull these into my tree (with your other set)?

--=20
Alex Benn=C3=A9e

