Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5vgu-0002sQ-EC
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jan 2022 15:18:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vgs-0002pr-Ol
 for qemu-trivial@nongnu.org; Fri, 07 Jan 2022 15:18:22 -0500
Received: from [2607:f8b0:4864:20::429] (port=34311
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vgr-0004pf-Bz
 for qemu-trivial@nongnu.org; Fri, 07 Jan 2022 15:18:22 -0500
Received: by mail-pf1-x429.google.com with SMTP id c2so6036835pfc.1
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 12:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H/I3ku4vsffsSeA5K0YyXrYX/tBYelSxhAOG8t1TM48=;
 b=sr2hB0CRGHwm6TnUlGSJL1Y8BxN/Vdu+rFUTTrUKOuuuY3oJYyTpcWrGpqIY+XFG6d
 BnRTUJ8Y8MS4U0fo53emVvL0txzYPPmxUWvucoX8EjzuqoxQtbv+4Qqv39buXEeF6WyA
 D3wTzjI47cedkFrurGaLmhldMXgod8c5VF246AzNdI7FolGkcD7CYP0K4rEB7RNlLTQb
 8luWid0Nm39yYZQiL2uQ4O5n6C7Xi+lpA0cjWBM+1+hWl9VxPims2EIfoYc+BnvvJx4+
 TtbrEekx7lXDfBz7DFqGLexZXS2nMhFipzZ8u9Gar2xP00OHmrKiYr08oYMaJvSWJjoU
 er3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H/I3ku4vsffsSeA5K0YyXrYX/tBYelSxhAOG8t1TM48=;
 b=LwtieWLnbXOqc6e7OEuk0QcOwBEFVMPvhMVlDiBdpwzzmVi+JHEbVhlQ6WUC5etvIv
 zKlvgcTiodBJE2iQ4NWC6Kwx1GgZPMBGGknX4douEXvkKrfHsjCIxgjF0g9tf7VNIwxU
 kQ8hmXGhHFyrNT5RqkmGxD7qlKoQnf39aMomB1dSef4m8Cyw9N68sgYA+kJ8ld0k+W0n
 G4KaBrwyGOrsZ8AxiDayX8S4kTFX6k2HrTE/Syw1hqeMmrlPJhcMUy3ODqmKL/0e6gKk
 5Xe8Z1pEt7MEpGR8ndsaJUesc3Vu/2R+hZfwMJuOtYRWF4XPzKobN7iKaaVdzgsuvIzx
 7EMQ==
X-Gm-Message-State: AOAM532kuvF2BtisM4/xMANXmoG9H1Ydc8yO3BSMMQ+Mq8rElHg+VdoK
 ejM656w3LMQw+i1Lm2jQ5vWnrA==
X-Google-Smtp-Source: ABdhPJxkATvUTuARJTbEuulCWoSCJJ55iHOBRNWIdbBf2Ni43JpvrFT4ToveYbSPAYVYWfV/eBkEtg==
X-Received: by 2002:a05:6a00:1254:b0:4bb:68cc:58b1 with SMTP id
 u20-20020a056a00125400b004bb68cc58b1mr66274933pfi.19.1641586699834; 
 Fri, 07 Jan 2022 12:18:19 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id o184sm6479783pfb.90.2022.01.07.12.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 12:18:19 -0800 (PST)
Subject: Re: [PATCH] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Yanan Wang <wangyanan55@huawei.com>, qemu-trivial@nongnu.org,
 Andrew Jones <drjones@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
References: <20220107133844.145039-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4aa47d06-ba24-fb92-c2e0-cd207f7d17b5@linaro.org>
Date: Fri, 7 Jan 2022 12:18:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107133844.145039-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 20:18:23 -0000

On 1/7/22 5:38 AM, Thomas Huth wrote:
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..9e96f5ecd5 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>           return -1;
>       }
>   
> -    while (p) {
> +    do {
>           name = p + 1;
>           p = strchr(name, '/');
>           namelen = p != NULL ? p - name : strlen(name);
> @@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>           }
>   
>           parent = retval;
> -    }
> +    } while (p);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

In addition, the copy between 'path' and 'p' is unnecessary -- one of the variables should 
be removed.  Either rename the parameter to 'p', or rename all uses to 'path'.


r~

