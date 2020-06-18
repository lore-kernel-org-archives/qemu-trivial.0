Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlrZX-0001Px-U4
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2020 06:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlrZW-0001Pj-UF
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 06:15:02 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlrZU-00034b-TT
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 06:15:02 -0400
Received: by mail-oi1-x242.google.com with SMTP id k4so4595492oik.2
 for <qemu-trivial@nongnu.org>; Thu, 18 Jun 2020 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOgCWDaVqeVjNhGXS/D2YamsCh0AISfE46WA7zq9rFY=;
 b=E+qd+c9CuRmwf9YrCglD4MqWPWNCqMi5Fh+NF/y1/ceW6zDu+qOquD371uRdMEi2GR
 4sH+MMYtRIey1bfr0wRpnHL7VcWsR7iq3v9OKIklnog52FpI1I78NBaqY4xIWIifH8bV
 WgCKzvIJH1oVaE9oJLsrmEEoibcAwbgPz0AvSESHiQQmlqLAZLZOV2e1kkk1F3UqFZAr
 wpxXtTCgpaSFzwss5/264+0PXfJJpXBariX7mTbjQ8KFG+jQMsLbq1bfmvbLY0MGZfxz
 kUGGSPKbxQ1qliX8YK4ScCyAuWMPvuUrcPQLYbq+PUgFVYCYhFy+0lbsnQPREzw8BdzE
 qSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOgCWDaVqeVjNhGXS/D2YamsCh0AISfE46WA7zq9rFY=;
 b=N/8zPMBPMjALE8iL91gF9qqFFADMHudosflviQNrUDZlVYDqapldC8pRqPhSJGa2vt
 fYoHkk5v310lGNlmdlrygS8V1wQarP4QfmZOL8GbRCsOD/z6Uy+17fHkonF0CyUhxpsm
 ljQxkI0kFrNRc8TRBP/SGisY1RcSdAxdbf2lNoHwps2BfR0d8ZluhzW2o5MdoqF0ZofA
 /ZaXoobjHBRrOe5ZFGv8SksWG4v8NYkpAs8rvV1US2bMb7lKUMPFO4a9QqHBZH3Jb+V7
 b91iev88lGbJG76EpmNvD4jNYk4OhMrQWUuQZXfsw4HGtxWkzSFs61vFDnuX2PumLeir
 Qiaw==
X-Gm-Message-State: AOAM5333blQAG6Z870DN/we0cLJNDCxPlLL55sb5wSuwCsG+MvZsvNa5
 p6xODmT+pPR9y04REEbaNTlqmgUiE7DQ+OLjY+iRKA==
X-Google-Smtp-Source: ABdhPJxq0CN9euPc5XzcZnA4xsAI06ZCYJYuJlYW9PMiKmXGuq3nIr/ggugEJlXCJlNaRw7X5qKOXagCJpmyixCJu7Y=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2219930oia.163.1592475299610; 
 Thu, 18 Jun 2020 03:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqxwC10XHVs4Z-JfE0-WLAU3ztDuU9QKVi31mjr59HWCxg@mail.gmail.com>
In-Reply-To: <CA+XhMqxwC10XHVs4Z-JfE0-WLAU3ztDuU9QKVi31mjr59HWCxg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 11:14:48 +0100
Message-ID: <CAFEAcA--iXsUZcKKriV7=1w5f3vC68PL8_GPG9ygLEfj6RWjjQ@mail.gmail.com>
Subject: Re: [PATCH V5] util/oslib-posix : qemu_init_exec_dir implementation
 for Mac
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 18 Jun 2020 10:15:03 -0000

On Tue, 16 Jun 2020 at 19:40, David CARLIER <devnexen@gmail.com> wrote:
>
> From 3025a0ce3fdf7d3559fc35a52c659f635f5c750c Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Tue, 26 May 2020 21:35:27 +0100
> Subject: [PATCH] util/oslib-posix : qemu_init_exec_dir implementation for Mac
>
> Using dyld API to get the full path of the current process.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks for working through the code review process with us.
Since we don't have anything else OSX relevant at the moment
I'll put this into the tree via my target-arm branch just
for convenience's sake (should make it in within a week or so).

thanks
-- PMM

