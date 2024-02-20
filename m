Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcNC7-0003Sd-5V
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 05:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rcNC4-0003SA-IA
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 05:17:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rcNC3-0006LU-0L
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 05:17:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d6f26ff33so150066f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 02:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708424261; x=1709029061; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dD47USlRE9SCSskFlIhsE3baFMZgQDtxOJr+pWEYaM=;
 b=pOZRhomjgyeMTMl5fn3pariaOUbYqzGPcujZlpwsVariHmT4TkJ9KaFJt4RZ2gmSA0
 pi7Go92mkkb40B6erJV0vUZxpp1wfc42kW4uMw5qCyqhFY2qmbQfYp8Aly2Pm9sh7y9d
 WHS7GgV4zOsd9Da9YxdZtU4nCCDYR8zEz9YswqCSX5pz0nYFIeQtRForJJIMwKz93of4
 UaT5bwE6ow0XDyugdzUf5OBP5gnrd+mPbRigXQVxseCALiTHfufidj389OU5kPmwfewy
 /Wt8IurvvvP3sqAccuj6Z3Ej9BoFUI7h673W2KRlJQeJfCjgzhFykvS8z0lkaPnyxnZf
 YHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708424261; x=1709029061;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4dD47USlRE9SCSskFlIhsE3baFMZgQDtxOJr+pWEYaM=;
 b=TYinBZvAlIKuHSsXcucZm03EgLdRxUWR4LTjjKPWAKXRSZTz5GnOuFhSK70091Mlhv
 fn+iwv8vP4yRPc0wNkzOCwBhHfxkaLeeluBWDF9ZYQIHwydOj8xkWReGx9Xehv8zgmbB
 8fn7jEkktqkMz6Gg8a51FYKN2NzVnAZAohepO2C3bhDsM5nkdAHW8Qlz6xrizQVNciWZ
 +m5h10fj3Bwnb40BkbvwgekMDRR1iigPB+J9EigKdyAbQjdiXH+Q33Yl3Etq/jxO/wB2
 gsHy90ijW2TVZTZ2y2ABcp0ECzku6TE3aD4j1IxzPhdYOwscdwDro8+5uwiccCj481ba
 xAoQ==
X-Gm-Message-State: AOJu0YxbrUTp7nsWhYrj3zh+A1RbKoVYtXE6YfX0pbS6nufIA/92tUWC
 Bg7Sv08P0+fe1oAZ4tcCA0l/dH1c8RmqL49BT1SqBnvZTQ8sKyLUW4XfHkxaXt8=
X-Google-Smtp-Source: AGHT+IFW++kiOUvk74B0B07+ddkJbc7OoxxdYHRh4VfQoly76cMUOlLdSYAgMKksV6/gd9vVDV/tEg==
X-Received: by 2002:adf:cd0d:0:b0:33d:13bc:4fc2 with SMTP id
 w13-20020adfcd0d000000b0033d13bc4fc2mr7906608wrm.27.1708424260797; 
 Tue, 20 Feb 2024 02:17:40 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bk30-20020a0560001d9e00b0033cddadde6esm13324007wrb.80.2024.02.20.02.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 02:17:40 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0E5475F8B9;
 Tue, 20 Feb 2024 10:17:40 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-trivial@nongnu.org,  qemu-devel@nongnu.org,  Michael Tokarev
 <mjt@tls.msk.ru>,  Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v1 04/21] accel/tcg: correct typos
In-Reply-To: <a7bdde5bf92b22255cb6d280330bab94bdb59a79.1708419115.git.manos.pitsidianakis@linaro.org>
 (Manos Pitsidianakis's message of "Tue, 20 Feb 2024 10:52:11 +0200")
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <a7bdde5bf92b22255cb6d280330bab94bdb59a79.1708419115.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.28; emacs 29.1
Date: Tue, 20 Feb 2024 10:17:40 +0000
Message-ID: <87bk8be8xn.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 10:17:44 -0000

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Correct typos automatically found with the `typos` tool
> <https://crates.io/crates/typos>
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

