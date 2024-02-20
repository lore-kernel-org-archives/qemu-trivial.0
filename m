Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcP46-0007Bz-SI
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 07:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP45-0007BX-3G
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:17:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP43-0004GV-AS
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:17:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d568fbf62so964155f8f.3
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 04:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431453; x=1709036253; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U1sgjxdp+gqDly3StkHne6g68Czi1k258A8i6UHN3j4=;
 b=veJDFFvsjFVtS5YMFhPcbxG+WrmZdeXP1togJV8/wDCRrblx9ftZIzLAW63LGO0KWe
 dnKrNilXi5Cg0bj1v4/bmNTYLolxLicGr/5mdcOpQe4qAtuAKLUUsicRlSHuJxXmTcAa
 upTISz4GwtrtwVuHwYh9ETp50omIuMGFNTHy7me/G136sgjA7Ib6s5rmfS+FaS/YTGEC
 RPDzc/e0uMUZYIdhMdvBKvjrnsJsv5caIc3aK/Q9+5O7gUEEHu/9w39Zmk8iOuLU5ap5
 TrbV5e/hG4J5dQ+WJkz5sb7XodzPqedRk/LF14TMGa/6RULNSKDCh7sAT36a4KctSQRd
 QDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431453; x=1709036253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U1sgjxdp+gqDly3StkHne6g68Czi1k258A8i6UHN3j4=;
 b=TptxNwq8c2FuP+bqacIbNbMYDEk3CGv7wicjZaUCS4hwiQpXPl5195om30ZMMO4jK9
 SROP7os2qkakMsYTF6CE1G4vnPPNmhBvf7hZGyf0WHZEI0aL7ov1He01EfdKujsWE/8i
 bg4Ct+qb3s0Jh3D326pxfDDm4Nl41lC6zxg5tVt38i5SnUb8EbyUU9yfHtpmQk6sdMWP
 iVsJbYaMa5S9q2K++dwH134wIQ+3DjBiEE5WSnqG3DH6VJB6gUV2ulyVSZ3v5/t8wKJN
 J4rsvwn4GqZZMJ1QkJ0GYadaJk4SfUglqB9QhK0I9Co0ECvGCJkiGZen9usz0VlQZHkB
 im+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlc2IZnFq4k/DUuR+34KrN7RaCxJVhOpcfYd9HvaxnoXUAREbv5TgIKeGI5LJAg1rKZuFSvOD0ENfEng2xuUhUhwelFyPpjw==
X-Gm-Message-State: AOJu0YzFZGW40iKFLTcRlZSrNasTRh5zyh1aJO/l/3l+hrSiQB/RplBa
 exugwRFxKBuTRbyItagte8k7S7nHVB5hZts2BzdXtK2raqRVTgAS91k3/5yDZQ2/SKvb++6Y2PP
 a
X-Google-Smtp-Source: AGHT+IEHj6ucJ9seA0kkSsx7WH+3FZe11x5yevk+DmT5W0xpnsc6TjKevMbvPPpxKGMOSk5jx4vYgQ==
X-Received: by 2002:a5d:5645:0:b0:33d:3b82:ab2a with SMTP id
 j5-20020a5d5645000000b0033d3b82ab2amr5046236wrw.19.1708431453631; 
 Tue, 20 Feb 2024 04:17:33 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b0033b483d1abcsm13193952wrp.53.2024.02.20.04.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:17:33 -0800 (PST)
Message-ID: <f2caa5fb-5443-474a-b042-f467e737bbc0@linaro.org>
Date: Tue, 20 Feb 2024 13:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/21] include/exec/plugin-gen.h: correct typos
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <d3a488b11917054cf4f13010e0f56d7b619a1257.1708419115.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d3a488b11917054cf4f13010e0f56d7b619a1257.1708419115.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Tue, 20 Feb 2024 12:17:37 -0000

On 20/2/24 09:52, Manos Pitsidianakis wrote:
> Correct typos automatically found with the `typos` tool
> <https://crates.io/crates/typos>
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   include/exec/plugin-gen.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
> index c4552b5061..b18edd6ab4 100644
> --- a/include/exec/plugin-gen.h
> +++ b/include/exec/plugin-gen.h
> @@ -19,7 +19,7 @@ struct DisasContextBase;
>   #ifdef CONFIG_PLUGIN
>   
>   bool plugin_gen_tb_start(CPUState *cpu, const struct DisasContextBase *db,
> -                         bool supress);
> +                         bool suppress);

Could we keep the definition in sync?

accel/tcg/plugin-gen.c:794:bool plugin_gen_tb_start(CPUState *cpu, const 
DisasContextBase *db,
accel/tcg/plugin-gen.c-795-                         bool mem_only)


