Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nnzu6-0007Wu-7D
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2022 05:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnzu4-0007TO-UU
 for qemu-trivial@nongnu.org; Mon, 09 May 2022 05:42:08 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:43075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnztw-0003NM-0a
 for qemu-trivial@nongnu.org; Mon, 09 May 2022 05:42:08 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ec42eae76bso137476547b3.10
 for <qemu-trivial@nongnu.org>; Mon, 09 May 2022 02:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+28j831FHP+Qy7Zljtzt43jqwBPafUfzH6D+d1VuvqM=;
 b=avfEwdnrvuiDZ2nJXFzN4t9omjsLvyGO87TfchIOYpJaaEDOgHVwDDlh+Yyg5xcQ/D
 SQWwsaSd3x9NzxYmb1jzWceDWqpLkH7EU+5X/eaMBazaukQrEw7P0k8pEyz9Yjl9XIgd
 +BsZ2qePPa/d+oSOt6mhRfHioHA5PGq/Zcamk047Xz/DdgwMyzXT7Jb5TfgSuni5ynzm
 ZgN8gfYFdW7sDevSJNRTCro5Nb+btGnvkaSyNyoYA9F/+uVDjjS1uNUJe+KTZlh8LlkP
 75UBEWzC5gjNUFX1BWG+nJFOT/YFA9/DlBT0WBarKBqbaHXYkhHmNNFI/IcrjBKz8G77
 WvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+28j831FHP+Qy7Zljtzt43jqwBPafUfzH6D+d1VuvqM=;
 b=zi/uPImksiXAUJ/wvOB2sEK8GzTmR2CmrkbQIdR9W8Ax4ItpKJk3cYLSC7WmRQvDmd
 +S7Qm8YkCgzBqqW2J8XuwiYYBKnMA1rTW2D1S/hdh7H3iI2W/zn6MyapZOKSwkd8O8Sh
 /e5Mt0TVUlLtxstZg530oAsc2Gb3YyeRui1YQYC6wyM9KDwjTWLQFnD/Mx4BfkCZkTUE
 hP4LthBm/t6xs0l7befskQrzNKjKL8wtEEt/dvHUt/QP7wPHSMsL4HLrTRqwsamGWX5c
 I3xXgWJ2AN2I0dmAUPvKkKOA1jBKz0gP0/cD5o/qxQGClInukUiAZHZ/EqrwxikfCY6a
 RrIA==
X-Gm-Message-State: AOAM531+KjVy7MAQe7dYZe4Dg2QZ2YLTptqiOiyUFjSqwnCc6wN6Xigp
 VfuHLLi6zihB3+XdLGihYyWKo7QTgxQbRMQf3v8c8Q==
X-Google-Smtp-Source: ABdhPJzuMUpj/xeZSCHnFt+vzxOnMxE1AdINNGJW/KzuJInqUPSj2RGRNKkAH63nJBsgGcX50q0VHeMEu+W2qCQOwvQ=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr13228246ywd.10.1652089318662; Mon, 09
 May 2022 02:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2022 10:41:47 +0100
Message-ID: <CAFEAcA-tC5hUcYa7Q_GOe=7_k=De_yw0mm2F21ALh6-2D5ChzA@mail.gmail.com>
Subject: Re: [PATCH] qom/object: Remove circular include dependency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2022 09:42:09 -0000

On Mon, 9 May 2022 at 09:53, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> "qom/object.h" doesn't need to include itself.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/qom/object.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 5f3d5b5bf5..ef7258a5e1 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -16,7 +16,6 @@
>
>  #include "qapi/qapi-builtin-types.h"
>  #include "qemu/module.h"
> -#include "qom/object.h"
>
>  struct TypeImpl;
>  typedef struct TypeImpl *Type;

Accidentally (but harmlessly) added in commit db1015e92e0483 by a
change generated by a script.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Eduardo: is it worth making ./scripts/codeconverter/converter.py
handle this as a special case, so it doesn't add the include line
to qom/object.h itself ? Or do we not really expect that script
to be run on the codebase again in future ?

thanks
-- PMM

