Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVGMK-0006nc-6L
	for mharc-qemu-trivial@gnu.org; Fri, 18 Mar 2022 13:25:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVGMH-0006nJ-Un
 for qemu-trivial@nongnu.org; Fri, 18 Mar 2022 13:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVGMF-000163-9J
 for qemu-trivial@nongnu.org; Fri, 18 Mar 2022 13:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647624345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asH6X9HWMOkBVqKKgg7llwQ5TC5dw9HIPQJ1qI0bvEI=;
 b=UGQz0wYmh2ulhMJ50K7XgdpHuMV85GPce3AB72Bo8I1GxFiCULdVr1OvRR0uFJqD6NE4Oe
 PQArb3FX6EpBbLc6WNJXarDwYdamqhps2/OE5ZdISFoFI/F0bp6X+Bd7fnpA/64eNj2Nrh
 Q72fqUAH7BURa8yKwI/KXAukcDppRu4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-Vf2AIDS6NbSKY7HU_BwvDw-1; Fri, 18 Mar 2022 13:25:44 -0400
X-MC-Unique: Vf2AIDS6NbSKY7HU_BwvDw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c126-20020a1c3584000000b00380dee8a62cso3294928wma.8
 for <qemu-trivial@nongnu.org>; Fri, 18 Mar 2022 10:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=asH6X9HWMOkBVqKKgg7llwQ5TC5dw9HIPQJ1qI0bvEI=;
 b=7YMwGvF5tmviU0/n3+wgXGGPIZP2x2iKbASsX7stqnL6WC16axyb8SHdGSK9mp5yGj
 3o2YwAhiLhDZFiNA9Hqj7kC0rHOs/hD6W7jNA4oNy5aauKamMd0yYEjkV4Ux39JSxFsP
 NhXtLNhKPXE6Ji85pkk3qyspjvjBVgzaT+0H+zpP+ENQLgkwb1kFD3lrUUczUcT2yTRd
 UvXqZis4NRmVPYkzP0AF36SVsRDswpy/JvG1PwKQUxAH1YdQ1p2pFrlZPByKL8foz1bx
 Z0Bw3kmI62QYy5vd7jml4CsspUIUcp+3yQOWhHZjXA943WYDy96T4HnvFTU9xOxZ5KVK
 frmw==
X-Gm-Message-State: AOAM533v1nNPl0OrkBOd7Z8jggc9LufRKZChP5aXSe0Sx+5SMX6ErhQl
 /OIgjrDWdwOBPbS5i8KtorjAsb7wRh87NuWwF8ED4dcR4aNPPYioLf1w6GVQVYSQDzkmnCxZ2Eo
 VLn7Yg5BcLwK+FRLHUA==
X-Received: by 2002:adf:f28c:0:b0:1f1:e5e5:28c0 with SMTP id
 k12-20020adff28c000000b001f1e5e528c0mr8882463wro.417.1647624343447; 
 Fri, 18 Mar 2022 10:25:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+qYQg6vjC9mhMlL2XBKxQZG/VxBIed3TGhHC+7CePQsP4WdMBOuJdWzPOt8QbZ9stuxKRmg==
X-Received: by 2002:adf:f28c:0:b0:1f1:e5e5:28c0 with SMTP id
 k12-20020adff28c000000b001f1e5e528c0mr8882449wro.417.1647624343115; 
 Fri, 18 Mar 2022 10:25:43 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 x6-20020adfdcc6000000b00203fc6ba079sm697814wrm.2.2022.03.18.10.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 10:25:42 -0700 (PDT)
Message-ID: <d9a8f15d-d582-5fc9-5ddd-206185f459c4@redhat.com>
Date: Fri, 18 Mar 2022 18:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] sh4: Replace TAB indentations with spaces
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210620175452.10076-1-email@aabouzied.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20210620175452.10076-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 18 Mar 2022 17:25:50 -0000

On 20/06/2021 19.54, Ahmed Abouzied wrote:
> Replaces TABs with spaces, making sure to have a consistent coding style
> of 4 space indentations in the SH4 subsystem.
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/376
> ---
...
> @@ -1705,101 +1705,101 @@ static void _decode_opc(DisasContext * ctx)
>           }
>           return;
>       case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
> -	CHECK_FPU_ENABLED
> +    CHECK_FPU_ENABLED
>           tcg_gen_mov_i32(FREG(B11_8), cpu_fpul);
> -	return;
> +    return;
>       case 0xf01d: /* flds FRm,FPUL - FPSCR: Nothing */
> -	CHECK_FPU_ENABLED
> +    CHECK_FPU_ENABLED
>           tcg_gen_mov_i32(cpu_fpul, FREG(B11_8));
> -	return;
> +    return;

Sorry, it's a very late reply ... but in case you're still interested in 
fixing this: It seems like at least some of these files used TABs as 8 
spaces, not as 4 spaces, so after applying your patch, the indentation seems 
to be wrong in all places. Please double-check the look of the files before 
sending! Thanks!

  Thomas


