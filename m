Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qPlvu-0003Jx-La
	for mharc-qemu-trivial@gnu.org; Sat, 29 Jul 2023 11:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qPlvt-0003JX-1a
 for qemu-trivial@nongnu.org; Sat, 29 Jul 2023 11:32:41 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qPlvr-000858-JR
 for qemu-trivial@nongnu.org; Sat, 29 Jul 2023 11:32:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31763b2c5a4so3229132f8f.3
 for <qemu-trivial@nongnu.org>; Sat, 29 Jul 2023 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690644758; x=1691249558;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zFSEOV+/KCHbaF2/scRJkd3cPshqRAc2e7Z/Z+qxErM=;
 b=CpsJqyWGVqnC9Trucnn1BfQlbKPTY47CpaMPxOy8ea8Sg8IUMvfEVB/8KwvFEPoU7j
 XcPhGxKe7zVEehqdCEyWRE3B5OklymmLFIIoqkhobryMDx21goT1GvvyIvQITu2S9K6i
 Y/uH1hJHUJqRcTmDY7EN3ZJkdat2zQcz6TDZMf+U1H8ysQZJxeGz6GWKTRSHhEg7G2iu
 /VIaQOP9j5XXLYRBTCTTpRjyiuZN7emwoEnIDZTungtwGdFlsKk6tDyXDmpWL2SDWan4
 WhUoavLia0xg3A9j1jYT6e96X3XyDmJYvibMjYr/v8/2zbyJmSs9NZdsl5+do/yA0J0R
 sHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690644758; x=1691249558;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFSEOV+/KCHbaF2/scRJkd3cPshqRAc2e7Z/Z+qxErM=;
 b=d7lEoaeNpwiQTEHRboXr4i552Y7rVTcnYTGHBFlc6JXyJOrdzFFUd2DCJhMxBHXq4s
 sWOkfpNTVg8K+HcNf8YHzYeGwow2PXbPFe80PKUX6ptQbbTF1lKmWuxPRvpeAwoT9D7H
 U1/D7xoycfQFApLZ8BvzRrgv7o+CRbOproTzOtjJFKMAc65ep9hjE2gdr5xf9Z8NiPTC
 iUbx/6sfSYh8b41C3n4MpqLw4wpTr6JJklw/PF8itsvtEIIZ7Qg5XPIPMKSlYAuSUP28
 IlPMF3Gbfw4gA6Cp1Tvre6T3Q3rOs0VysSvFeWCNRwhqcVp3iRrpPZTTTfr0WP0Pl1a/
 n+iQ==
X-Gm-Message-State: ABy/qLYh6biHvMnhngqZJ9/wkaFTX3TZ+3gDhvQYfG+6Cigf3Nhy45ts
 LXvHrQG1pIxC1wHqpe1yhFbU+yKa1xSpVErIq2HcoA==
X-Google-Smtp-Source: APBJJlFSFS6fgkDPSs6V2VQIjDu1/itJ7No0ThVx4F6Zvby34TXMlErAPZgl8GyBiRBbxbOyvdJG0DYomQ+Rxc3buos=
X-Received: by 2002:a5d:458a:0:b0:313:e520:936f with SMTP id
 p10-20020a5d458a000000b00313e520936fmr4847388wrq.17.1690644757984; Sat, 29
 Jul 2023 08:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230728195646.168997-1-danielhb413@gmail.com>
 <20230728195646.168997-3-danielhb413@gmail.com>
In-Reply-To: <20230728195646.168997-3-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Jul 2023 16:32:27 +0100
Message-ID: <CAFEAcA9vsv4BpSfFb6=W=MFjGdR283KEGFN13Sfy=TxtcjT4hA@mail.gmail.com>
Subject: Re: [PATCH for-8.2 2/2] target/ppc: use g_free() in
 test_opcode_table()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 29 Jul 2023 15:32:41 -0000

On Fri, 28 Jul 2023 at 21:47, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> Use g_free(table[i]) instead of free(table[i]) to comply with QEMU low
> level memory management guidelines.
>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e6a0709066..d90535266e 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7129,7 +7129,7 @@ static int test_opcode_table(opc_handler_t **table, int len)
>                  tmp = test_opcode_table(ind_table(table[i]),
>                      PPC_CPU_INDIRECT_OPCODES_LEN);
>                  if (tmp == 0) {
> -                    free(table[i]);
> +                    g_free(table[i]);
>                      table[i] = &invalid_handler;
>                  } else {
>                      count++;

Where is the allocation that this memory is free()ing? I
think it is the g_new() in create_new_table(), but the code
is a little complicated for me to understand...

thanks
-- PMM

