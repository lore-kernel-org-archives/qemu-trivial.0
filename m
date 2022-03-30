Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZYub-0003Ul-A8
	for mharc-qemu-trivial@gnu.org; Wed, 30 Mar 2022 10:03:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYuU-0003S2-Vd
 for qemu-trivial@nongnu.org; Wed, 30 Mar 2022 10:02:55 -0400
Received: from [2607:f8b0:4864:20::22f] (port=44711
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYuT-0001K0-BW
 for qemu-trivial@nongnu.org; Wed, 30 Mar 2022 10:02:54 -0400
Received: by mail-oi1-x22f.google.com with SMTP id t21so17257881oie.11
 for <qemu-trivial@nongnu.org>; Wed, 30 Mar 2022 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tx1SwE4iNljeOcZpcrMgADhaavxCRvqXXqyh57t5650=;
 b=nQL2X8oq9dLlfvtRe1jwwgSEeQk2AHon6tdxLn7wRqW9GRT+e1HY169vsATBloEH+I
 UADr0E6x6FFBfyl5R02AxzTYPLemEaIgTjhwD/ISvzMhgSvYgVPhq7eefnBin6NKRzVj
 nkPYpQy2QEtKb/5P20DkMoFNhhDbV2h5LfYzXtfdjNWWW0815HHWmqqqAVbePrOslgd3
 zn2VAVnthx7MBX8pY05ZsJOih9nfw933N/jwQ/L0NxM3hacigH8WORvmX2hAYITop2DL
 hY1ZeM1ALdQ5P86qZ51YPjKIO2FavWcJrIYnB4mCw1LZ0WnbY/fDFHK7DgnZVbthS5WD
 1acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tx1SwE4iNljeOcZpcrMgADhaavxCRvqXXqyh57t5650=;
 b=Qhs9wVNPQThuivI8tVErDvdGPA4f3t3ytv27VrNBJG/fztlmslmGpVWEJgRDN4j4Fl
 tWDAP4gjzEWWvLmXIJyaf6lleAAgeTpWZEME05M1BasAhIk+H9AeqAToplOZd29CM+Cn
 Kk+hMu5eDC4fsCFqDWV9CdYqzm1/tWyYODh9SiU5ft/5+japKY/YhYjUTl3Lcoc5RbGo
 q5Chf2kb+p1q9DWjC9TroSmJuGRzxbGIEsBQWbwliZIx2qVgDaDrDl0L3SUmHa40I/QR
 iDoq4nvJwV7SCSiZ7J7ggySr8n4iKEdPgcTAnEtX8DshWif8NYLprkkBo/uKcoV6Y0U4
 KLmQ==
X-Gm-Message-State: AOAM533Ut2PWX1/YaNngBYJMq1z9YChWrVWb+xhr3INE4Y1xI4bEv2Ll
 ElNXo/G59BDiwQ/OU1lzM6Nk+wmo7Zl3as+F
X-Google-Smtp-Source: ABdhPJw6zH8VlfBreUxlqC12yemySZq9a/MlgGzWQVrXo011AVoNauBzktTdpa9eLsCPjJd8TRJqZg==
X-Received: by 2002:a05:6870:e253:b0:dd:a40e:ae92 with SMTP id
 d19-20020a056870e25300b000dda40eae92mr2206453oac.233.1648648480619; 
 Wed, 30 Mar 2022 06:54:40 -0700 (PDT)
Received: from [192.168.249.227] (172.189-204-159.bestelclientes.com.mx.
 [189.204.159.172]) by smtp.gmail.com with ESMTPSA id
 c3-20020a056808138300b002f76b9a9ef6sm2070342oiw.10.2022.03.30.06.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 06:54:40 -0700 (PDT)
Message-ID: <bab603b7-18d2-4a97-f426-6050211dbcc9@linaro.org>
Date: Wed, 30 Mar 2022 07:54:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] linux-user/sh4/termbits: Silence warning about
 TIOCSER_TEMT double definition
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20220330134302.979686-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330134302.979686-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 30 Mar 2022 14:02:55 -0000

On 3/30/22 07:43, Thomas Huth wrote:
> Seen while compiling on Alpine:
> 
>   In file included from ../linux-user/strace.c:17:
>   In file included from ../linux-user/qemu.h:11:
>   In file included from ../linux-user/syscall_defs.h:1247:
>   ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro redefined
>    [-Wmacro-redefined]
>   # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
>            ^
>   /usr/include/sys/ioctl.h:50:9: note: previous definition is here
>   #define TIOCSER_TEMT 1
>           ^
>   1 warning generated.
> 
> Add the TARGET_ prefix here, too, like we do it on the other architectures.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   linux-user/sh4/termbits.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

