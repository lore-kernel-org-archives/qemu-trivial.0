Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1reWet-00046D-Nk
	for mharc-qemu-trivial@gnu.org; Mon, 26 Feb 2024 03:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reWen-00044B-Iz
 for qemu-trivial@nongnu.org; Mon, 26 Feb 2024 03:48:17 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reWel-0000gr-D2
 for qemu-trivial@nongnu.org; Mon, 26 Feb 2024 03:48:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso1856359f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 26 Feb 2024 00:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708937289; x=1709542089; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o4QuUVMa/8riGap4wQPSzLfqOnNru0vzY7BsLOLWHSE=;
 b=RIs65FJpUY7Q0acLr0xujBSY7T0Wtl2EYQzHSNLq/DY7JjrsHHv55flAPrT8nSntwa
 TwvldOpj3/7B91NDz80732jiqgkdZQTTZ/oUZocdgM+TtrykUjsx6l2/RlO/sIMVyd4m
 PqgOQy7w3xWLOZJY/+MfuFwH4Kxkj2Vvd9Zn2tTASbfp/OFkL+ePAyDPbMFqeXREzeZ5
 79Q2dFReeikbut64aOh2aubiX/v2U2ocVyef0ufsPLMjq0IvQjDOSspbJfAjmYB60Yu+
 fYccbA/qEZLA8Gu8g9usL8iSvVS/AfYHRkac+vVW9oRiwQcHdq8y11swBZW+wYsKVflk
 8ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708937289; x=1709542089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o4QuUVMa/8riGap4wQPSzLfqOnNru0vzY7BsLOLWHSE=;
 b=m+vitZt1Kmc8XkHP9bEjutxg/c6xeYuwRZ2+6m1uJXQ9DJBgMW6wVw2N0k3KA7azmQ
 Wm1Qb6Cdl/1217olvdY6JzzZSHnHk3qMiLofUbtvpcLO7kwH7Xde+plhu1GjNsWGJkIR
 9sG+9TpoSj/8aWnxY6kagEjTrI4TZytdg/yDHvB63l2zrEwD3RczXI2C+NaQ5FDlMtgz
 OsKUBsdKk9yUi3BimDV0RV40gdibF7if1ThOaUOwG0thFfmg9L34Qd1+3G8kE0AznoFU
 AJh39BYfD8zwZVKE+Q9GpgnvbavximTO2N2TZgegM5uSeYDri4OL4cUn1leDBcVZm4qu
 ALvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXngS1VAIP7rSphJfmvb1sPyG0Xz0CJOJ8YgJhypYMzEZTUU/tvIb2xajD8pCGDJFRAxa963lTJIuYfG/fWjx4wW/biEvSuJA==
X-Gm-Message-State: AOJu0YxpmQC10bRXajgMtBb4XlzeqRMX74/8HTx8k7xbKPxI/XrIRLjf
 2RPl5DiKv1I6xyWEMrkkMU+tMczXUUmfuiqj91eL/NsbUVfxxixaPP/MC7R/Vks=
X-Google-Smtp-Source: AGHT+IFVVBxgIny3rkSUlHtywxq7Pi75bQ+ik9Bkyyzzi+PoX3L9SACJ47r2B4OfyMG4JGXVHQG/ng==
X-Received: by 2002:a05:6000:1007:b0:33d:8ebf:4f6 with SMTP id
 a7-20020a056000100700b0033d8ebf04f6mr4797923wrx.20.1708937289450; 
 Mon, 26 Feb 2024 00:48:09 -0800 (PST)
Received: from [192.168.69.100] ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a5d4e83000000b0033d12895cfdsm7555529wru.61.2024.02.26.00.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:48:09 -0800 (PST)
Message-ID: <ec5f9189-9ec5-4b04-8da2-cfb9969970eb@linaro.org>
Date: Mon, 26 Feb 2024 09:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/unit/test-util-sockets: Remove temporary file after
 test
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-trivial@nongnu.org
References: <20240226082728.249753-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226082728.249753-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Mon, 26 Feb 2024 08:48:18 -0000

On 26/2/24 09:27, Thomas Huth wrote:
> test-util-sockets leaves the temporary socket files around in the
> temporary files folder. Let's better remove them at the end of the
> testing.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/unit/test-util-sockets.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
> index 63909ccb2b..4c9dd0b271 100644
> --- a/tests/unit/test-util-sockets.c
> +++ b/tests/unit/test-util-sockets.c
> @@ -326,6 +326,7 @@ static void test_socket_unix_abstract(void)
>           test_socket_unix_abstract_row(&matrix[i]);
>       }
>   
> +    unlink(addr.u.q_unix.path);
>       g_free(addr.u.q_unix.path);
>   }
>   

Maybe:
Fixes: 4d3a329af5 ("tests/util-sockets: add abstract unix socket cases")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


