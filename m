Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZUMs-0000rT-KR
	for mharc-qemu-trivial@gnu.org; Tue, 07 Mar 2023 05:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUMn-0000qd-Ep
 for qemu-trivial@nongnu.org; Tue, 07 Mar 2023 05:16:21 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUMl-0002OF-RS
 for qemu-trivial@nongnu.org; Tue, 07 Mar 2023 05:16:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id k37so7433678wms.0
 for <qemu-trivial@nongnu.org>; Tue, 07 Mar 2023 02:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678184178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T5ZpNmkE1FFYNggiZcm9H8J5/bcUXG3yxX7TJU0EuN0=;
 b=RaeMcHQkWI6vRVqt8t/UeMYSA+07yLqaTBzSJ4qRK9wdsi/9f3K3rImZNgQG9Gdjyx
 gXhpqNpf5BtFc9OSQWQU2XUoNy26lkfifKbarXeyv8fB5ULBQ/6/tAtkVu0VI5K49ENK
 kjCNu8dwPbDtRc3VlZW8NbT0CtkMn/BYz2HwY168LWPSBY1CJoHOuID8kRB6/K16j2kv
 fGaVXELdO2HRys8RQ/bd2aTVFWaAJ/ug9wPx1TZwaynRkzdxKaCWWwWzJPGyaskG8yaQ
 SSTBjeOm+QPJgU+mHDvti4ABwu9B0urENuJ4GcEJ19tcWViN68do4KbhfR0jZmjUfhCh
 ePMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T5ZpNmkE1FFYNggiZcm9H8J5/bcUXG3yxX7TJU0EuN0=;
 b=ckqgPRMWDWNuhU5lGf1j4hlgZWTtTZvXJGlLlqFiQAS+HyodRSBLZwBmmqDcTJjzlD
 QYP7homnpTENsEl/PZn0U+yKmaBMa2p2LtuvRDRKoTud8MlW6ZjmhoL5qY38pbmiM4rS
 L9rAg/0/hgOscfbqg1z8LbkK2Fd83oGjSNDjg34DpB0bxUbUI38eocgzumsCrZhtr1JJ
 k0cGwKA9E0ASV9el9B3wpnG6wE6hV2FtNtKqDqPzlhkh4ebuKBc08q65w2iQlTAosdpZ
 QLEtKf+3A8H96Hc/jmuJ9lUtTnRwbxp9MZEiFj4gWJRpURztYu0D+NF/2dCyKbh7OZYI
 UTpA==
X-Gm-Message-State: AO0yUKX2ykplhXb1SGungaFeaOlkv40ihwQPa8qWu7tf6xM8oCV34Z7S
 JPvRJoz1KcolbdtjKUTQUi1dLw==
X-Google-Smtp-Source: AK7set+BGPIkJt7PI05EQWapwWgnl0fiKAieNzreYJ4qGCZa6Y5f+ss9WUh+g4SRavEHW97FAWxP/Q==
X-Received: by 2002:a05:600c:19d4:b0:3df:3bd6:63e5 with SMTP id
 u20-20020a05600c19d400b003df3bd663e5mr11940579wmq.12.1678184178112; 
 Tue, 07 Mar 2023 02:16:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x9-20020a5d60c9000000b002c70d97af78sm11956779wrt.85.2023.03.07.02.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:16:17 -0800 (PST)
Message-ID: <37edd5b4-5fee-59a2-5a71-b3f25f78f0c9@linaro.org>
Date: Tue, 7 Mar 2023 11:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] io/channel-tls: plug memory leakage on GSource
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, antoine.damhet@shadow.tech,
 charles.frey@shadow.tech, berrange@redhat.com
References: <98f750b6ded2dd2e8d0e4ffc9935d3d6e0cd59f4.1678144392.git.quic_mathbern@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <98f750b6ded2dd2e8d0e4ffc9935d3d6e0cd59f4.1678144392.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 07 Mar 2023 10:16:24 -0000

On 7/3/23 00:15, Matheus Tavares Bernardino wrote:
> This leakage can be seen through test-io-channel-tls:
> 
> $ ../configure --target-list=aarch64-softmmu --enable-sanitizers
> $ make ./tests/unit/test-io-channel-tls
> $ ./tests/unit/test-io-channel-tls
> 
> Indirect leak of 104 byte(s) in 1 object(s) allocated from:
>      #0 0x7f81d1725808 in __interceptor_malloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:144
>      #1 0x7f81d135ae98 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57e98)
>      #2 0x55616c5d4c1b in object_new_with_propv ../qom/object.c:795
>      #3 0x55616c5d4a83 in object_new_with_props ../qom/object.c:768
>      #4 0x55616c5c5415 in test_tls_creds_create ../tests/unit/test-io-channel-tls.c:70
>      #5 0x55616c5c5a6b in test_io_channel_tls ../tests/unit/test-io-channel-tls.c:158
>      #6 0x7f81d137d58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)
> 
> Indirect leak of 32 byte(s) in 1 object(s) allocated from:
>      #0 0x7f81d1725a06 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cc:153
>      #1 0x7f81d1472a20 in gnutls_dh_params_init (/lib/x86_64-linux-gnu/libgnutls.so.30+0x46a20)
>      #2 0x55616c6485ff in qcrypto_tls_creds_x509_load ../crypto/tlscredsx509.c:634
>      #3 0x55616c648ba2 in qcrypto_tls_creds_x509_complete ../crypto/tlscredsx509.c:694
>      #4 0x55616c5e1fea in user_creatable_complete ../qom/object_interfaces.c:28
>      #5 0x55616c5d4c8c in object_new_with_propv ../qom/object.c:807
>      #6 0x55616c5d4a83 in object_new_with_props ../qom/object.c:768
>      #7 0x55616c5c5415 in test_tls_creds_create ../tests/unit/test-io-channel-tls.c:70
>      #8 0x55616c5c5a6b in test_io_channel_tls ../tests/unit/test-io-channel-tls.c:158
>      #9 0x7f81d137d58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)
> 
> ...
> 
> SUMMARY: AddressSanitizer: 49143 byte(s) leaked in 184 allocation(s).
> 
> The docs for `g_source_add_child_source(source, child_source)` says
> "source will hold a reference on child_source while child_source is
> attached to it." Therefore, we should unreference the child source at
> `qio_channel_tls_read_watch()` after attaching it to `source`. With this
> change, ./tests/unit/test-io-channel-tls shows no leakages.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   io/channel-tls.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/io/channel-tls.c b/io/channel-tls.c
> index 8052945ba0..5a7a3d48d6 100644
> --- a/io/channel-tls.c
> +++ b/io/channel-tls.c
> @@ -446,6 +446,7 @@ qio_channel_tls_read_watch(QIOChannelTLS *tioc, GSource *source)
>       object_ref(OBJECT(tioc));
>   
>       g_source_add_child_source(source, child);
> +    g_source_unref(child);

Or declare child with 'g_autoptr(GSource)'. The difference is
only a matter of style, so I'll let Daniel to decide what is
preferred. Regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   }


