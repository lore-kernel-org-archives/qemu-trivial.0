Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r6T5f-0007EA-F4
	for mharc-qemu-trivial@gnu.org; Fri, 24 Nov 2023 05:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6T5d-0007Db-GF
 for qemu-trivial@nongnu.org; Fri, 24 Nov 2023 05:07:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6T5b-0002Qw-RR
 for qemu-trivial@nongnu.org; Fri, 24 Nov 2023 05:07:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso3604515e9.0
 for <qemu-trivial@nongnu.org>; Fri, 24 Nov 2023 02:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700820430; x=1701425230; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YC2tLNreGHK49JPhlPQlJlVbNqZ3GVCIkMwFfzLCrvg=;
 b=X9ll3cF9U+Mh/wD7zxJXNdaFbPU9aQml5qkdx82Ot9jn+rJ33w+Qh3j+KfwmXfm8VW
 7lOMNXT1I8H7L4HrEAAB7rg4ZY6cN137ruDq+S4im4QxWTlmzLboBpO7sabO16VJ/A3T
 qWO8T62i//a5O57hJDxwRIl7u62es6KcfdPqOXBlq0u+2HB1TLZecHIYh9s2vzDu6Z4+
 uk9rCRq8w5xV9b9rYZKZuho9vixmoOVvofHfIlVFc18lYWCaR/j/MrwwIaoP4k1GLijo
 Af/J5Uvzc4B77LngDpBtqIbOzpWSsJ3XbHDNZYwdm3boZv/2qFLq3ep30HhcMOE75ZDM
 q2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700820430; x=1701425230;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YC2tLNreGHK49JPhlPQlJlVbNqZ3GVCIkMwFfzLCrvg=;
 b=mOdF8aNe7X88M7S5Xp68PNOzZhNLZTIWeyETpeUhgP2xsCucYL+zmplxSVXAjsBDZb
 sUnYbjYqg2I0yTghergf+QTGpXNfNPuwRno1sg4C0aDZR9ykn1OWPq3j+VeBuUB0QLsq
 V1DLNh+YMR6B5YgfaR/8jZHs/q8iglXo3tEbctwj4Drj4Oi4zH+znxII8CqDY8wO2F88
 fpZmim87HQ8KFKJWalAcxgPLNE2DOsf9ZbOEdsIiOH/wPOSgGX6fdzZjNotYsrMKGbDO
 eANADRLxo9EmZ/BUYVA7RHiA2RWHD5ZprXpR3D3lEOjSMzFK8Feyzmq1Gu99tddt+0LB
 QP9Q==
X-Gm-Message-State: AOJu0Yxp6s8+7IYWKug78pOTf6P3MGMQ3hgD8cG9UXEmITmmAUw25s+W
 TtkFkq3NPeiOxRTfWkOVgKk9cw==
X-Google-Smtp-Source: AGHT+IGb/DWEHigLo46ovG0tO9bdT+TByU9UZWgxsepy5J0BoGAMKzGx8BlO/o+rQOfZmdiv8nzzfA==
X-Received: by 2002:a05:600c:4fc6:b0:408:411c:4f6d with SMTP id
 o6-20020a05600c4fc600b00408411c4f6dmr1897526wmq.14.1700820428784; 
 Fri, 24 Nov 2023 02:07:08 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a05600c348f00b0040b33222a39sm5361270wmq.45.2023.11.24.02.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 02:07:08 -0800 (PST)
Message-ID: <93f7ee3e-a92f-4b18-bf16-2169c8b2791d@linaro.org>
Date: Fri, 24 Nov 2023 11:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/core: define stack variable to NULL to fix qtest with
 sanitizers
Content-Language: en-US
To: Daniel Hoffman <dhoff749@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20231124015312.544422-1-dhoff749@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231124015312.544422-1-dhoff749@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Fri, 24 Nov 2023 10:07:13 -0000

(Cc'ing QAPI maintainer)

On 24/11/23 02:53, Daniel Hoffman wrote:
> This was the only failure preventing `make check` from passing with sanitizers
> enabled on my configuration.

IIUC this is due to visit_start_list() which expects a NULL list,
see qapi/qapi-visit-core.c:

bool visit_start_list(Visitor *v, const char *name, GenericList **list,
                       size_t size, Error **errp)
{
     bool ok;

     assert(!list || size >= sizeof(GenericList));

which is well defined in its declaration:

/*
  * Start visiting a list.
  *
  * @name expresses the relationship of this list to its parent
  * container; see the general description of @name above.
  *
  * @list must be non-NULL for a real walk, in which case @size
  * determines how much memory an input or clone visitor will allocate
  * into *@list (at least sizeof(GenericList)).  Some visitors also
  * allow @list to be NULL for a virtual walk, in which case @size is
  * ignored.
  ...

With the patch description improved:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
> ---
>   hw/core/qdev-properties.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 91632f7be9f..4caa78b7bc5 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -690,7 +690,7 @@ static void get_prop_array(Object *obj, Visitor *v, const char *name,
>       uint32_t *alenptr = object_field_prop_ptr(obj, prop);
>       void **arrayptr = (void *)obj + prop->arrayoffset;
>       char *elem = *arrayptr;
> -    GenericList *list;
> +    GenericList *list = NULL;
>       const size_t list_elem_size = sizeof(*list) + prop->arrayfieldsize;
>       int i;
>       bool ok;


