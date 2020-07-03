Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrM7h-0005Yy-0t
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM7f-0005Wv-Sw
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:52:59 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrM7e-0000wU-Bl
 for qemu-trivial@nongnu.org; Fri, 03 Jul 2020 09:52:59 -0400
Received: by mail-ot1-x341.google.com with SMTP id h1so4555907otq.12
 for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2020 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wpc26K4vIHW7s7G0jjwpwG5GXL2DZyAsm9Rh8wYBjkg=;
 b=OWuXsgZ6qUv8VQXPhEX+8AscWWs5PL3NntUQhLvZ4GuEpjGOlb63s6YYatjndc0M5N
 RK8Rgl7z2B3gzV3ukQIsrOUFGEgVepOfl2cGlWifOW1VoCBaCnDmQSRU50JZrHALoc25
 2LYg1kuvjKDYl/B2wqRLBLlrneLQCTrFcuHLpIEl7zpYJzeOP1d49F3yLu3kSWMRvZRm
 iBQ5LvK0iwgRj+iMGubkwDccQtuSL85idPCrN6sak8u7F0cQ/Y6V3m1c4B3W/z5qgUy9
 eD/Mnlun6Qa1EWxwAQC+y8h55BW8ge5ougjtX3qW3IOJtMtdLXL/0AozsKh7l6hXMZ0+
 M01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wpc26K4vIHW7s7G0jjwpwG5GXL2DZyAsm9Rh8wYBjkg=;
 b=l1I7qAjhISgzre7Gqxt7HMJ5hn1npDTA+C7RK9EPkXMw3i/TPbO28tduKPPHQtZaYG
 Zzr5MqVgE6tlGSokb3MmPOkZXegdb0gukuY5Wq7rn1tbGTplbuUs9SLrotdribCD8kIz
 Ltjc+L08uIkp0CwTncOqJX1KLhPrR+ATgLi6qSeS7tJ3ftWXecygA4u0Et+JNfr+4G8u
 VbSeaoVfK2w5A9QxLNUL6wU9S+6Tdmabqpu5ORlIJVnGC49wFhqTyzu3oQQYto9x9ntk
 0vt54bsqqkvgKDWpilfccSgeS8+qOrT3PrBk8x8xwmp/BXw4WOg7as85xcc/0wOj/zia
 EHag==
X-Gm-Message-State: AOAM530qmiZMKmXqd5zTiLUx+AnY9p4fBrdLBuJy9TlaslpZ2nnx+ght
 f4P9DLHLy8AtE6NuAfSl5Nf5UHTnSLX8rvrUFymKFQ==
X-Google-Smtp-Source: ABdhPJznsJBmGYE4zSd/XdE2aIPEEd/jodkGDBzTkq1kv3V+w+EKHhDpkc5o834osixtxkFltZcEcJepCtzAW9MYyc0=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr28478686ota.91.1593784377356; 
 Fri, 03 Jul 2020 06:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqzmb0K5HaOBNy31rNU0F0O4kq+B6eeYCUXiJJE6ENDsYw@mail.gmail.com>
In-Reply-To: <CA+XhMqzmb0K5HaOBNy31rNU0F0O4kq+B6eeYCUXiJJE6ENDsYw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:52:46 +0100
Message-ID: <CAFEAcA_O0NZgjz=q8cG-wL6ZNMS6rt2kO5VwTr_KLMsh1v6BJg@mail.gmail.com>
Subject: Re: [PATCH 9/9] Implementing qemu_init_exec_dir.
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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
X-List-Received-Date: Fri, 03 Jul 2020 13:53:00 -0000

On Tue, 30 Jun 2020 at 01:46, David CARLIER <devnexen@gmail.com> wrote:
>
> From fcdb25804af98329b52a04e7a4e5191135aac4f6 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 29 Jun 2020 22:36:03 +0000
> Subject: [PATCH 9/9] Implementing qemu_init_exec_dir.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  util/oslib-posix.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

