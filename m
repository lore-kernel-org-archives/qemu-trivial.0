Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBski-0005It-5k
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2025 06:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uBskg-0005IG-U0
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 06:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uBske-0007AC-CW
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 06:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746439723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AupjWrkNHOXQRIrz6ddkeins7N8TbrYzaAfnH+BMypE=;
 b=isYo+8DEAOVmRxF17aZcHEG9lXb/xCSmbWWWkCh5Q3b1wld3T9NaZSTOzDZhOENgIeorJA
 0W+WwgW26otZSjTPf7SAw1xIluZf8/sYzAVqYLfXu5UaDrZ0u6gAls8x0+ZjW3/C2mfaKL
 oXregzdsvHh3Y8FbG/YsI3PvlLIIkbs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-1lEw3wqfMUC4o757ScfLHg-1; Mon, 05 May 2025 06:08:41 -0400
X-MC-Unique: 1lEw3wqfMUC4o757ScfLHg-1
X-Mimecast-MFC-AGG-ID: 1lEw3wqfMUC4o757ScfLHg_1746439721
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d0830c3f7so30569295e9.2
 for <qemu-trivial@nongnu.org>; Mon, 05 May 2025 03:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746439720; x=1747044520;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AupjWrkNHOXQRIrz6ddkeins7N8TbrYzaAfnH+BMypE=;
 b=Kuwhu+ywDQJz259IX8q8DBZEbYqGUTe2Q65Qg1BaNVGc1Xk1DuaWB/3tSVe3Q7P1op
 ZGL6DNdaYkGjmcaSJK+dNCyRkS9jlPzW4zrBgSdbItGo1oGEXTIBqb870mEdPzJ+Nfdc
 EexOYEH/wnvHEu/PA/Hs9QqLvhH8R9P0zu2HkwuMb0X9GA0AI/OPcg26XqiTXZ12UNcA
 g9jwFYN1AR8lNlKr4hzDTG68py5sgnvhecX8WU0ty000+f83JJRkq8MpTyuzUYsHlCPb
 Uj+W6txN+EKW/IEtalMand2I6gOcyuWwJhwwlggvKo8VR8n5i07frMVHHNFOqfwheBaq
 4mSA==
X-Gm-Message-State: AOJu0Ywy5oerYLeN+//d66Xo4FCD72412Yux+reE0Kl1FsHQaEV8UuKV
 K1dbi7B2U9UYwEqb9qHXpGzE7E7qhbfRkwpEmha3doeJfoZDP126N80dulj+ExXD/JBT4DbXJvB
 fRqnBOYxjwFod7ruac05vBj+D/DQrXRi1huwgoYpmfM6VsZWeLPUwSP4=
X-Gm-Gg: ASbGncvKZTJ0vMMC3A9RdYGg6sXpIQn+yu5EBTdtxUhRZusgSvAoRCJ9W8PrGx5srad
 v/8lCm2qyxK+jYbJGPS+TGJOmry6N+z+v8qg6RCjJkdAl7igJTiohDf6H13t5zr8RqcUZ2rj9or
 EtJnmJpLT00/aJlFXRp8otIGEsIZBD/dfENK854ju4Wexd2T4WfhYfOgL9lr/jL6t4dL4vbC/US
 OonIVXoQwyDuXuYqCzEj6XMCFtOKfpfMFr5h2s5tA2KCRTgwmAnZ8pBNbS/9Pcwz7GKZzFBEOOq
 RaofHTMt9z9hjFHiDIBXcF7mooL+Ss52DCmjjIJg
X-Received: by 2002:a05:600c:45d1:b0:43a:b0ac:b10c with SMTP id
 5b1f17b1804b1-441c49236b0mr54692185e9.26.1746439720592; 
 Mon, 05 May 2025 03:08:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj07jF8yg+Fkh7/2IdJ8Imqwfz9d1CXaZjjIlY6wnqQQkQR4ZvAh+NQ09ijzVqr9kPwJjM/g==
X-Received: by 2002:a05:600c:45d1:b0:43a:b0ac:b10c with SMTP id
 5b1f17b1804b1-441c49236b0mr54691965e9.26.1746439720223; 
 Mon, 05 May 2025 03:08:40 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-87.web.vodafone.de. [109.42.49.87])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441bc83d471sm104976375e9.26.2025.05.05.03.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 03:08:39 -0700 (PDT)
Message-ID: <a4749d61-727f-4ec7-b494-33ebaa2956ed@redhat.com>
Date: Mon, 5 May 2025 12:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qom/object: Fix typo in comment
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org
References: <20250504215639.54860-5-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250504215639.54860-5-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uJ_crCAz_apOus6pwTDMHiBoHd8zdM7aSkIS399Uszo_1746439721
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 May 2025 10:08:47 -0000

On 04/05/2025 23.56, Gustavo Romero wrote:
> Fix duplicate preposition in comment.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   qom/object.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index 664f0f24ae..7b013f40a0 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -485,7 +485,7 @@ bool object_apply_global_props(Object *obj, const GPtrArray *props,
>    * Slot 0: accelerator's global property defaults
>    * Slot 1: machine's global property defaults
>    * Slot 2: global properties from legacy command line option
> - * Each is a GPtrArray of of GlobalProperty.
> + * Each is a GPtrArray of GlobalProperty.
>    * Applied in order, later entries override earlier ones.
>    */
>   static GPtrArray *object_compat_props[3];

Reviewed-by: Thomas Huth <thuth@redhat.com>

There seems to be another "of of" in linux-user/mmap.c in case you want to 
extend your patch.

Also:

$ grep -r " the the " *
block.c:     * will not run most of the the code in .drained_begin() again 
(which is not
hw/xen/xen-hvm-common.c:     * to provide the the addresses to map the 
shared page and/or to get the
include/exec/cpu-common.h: * Attempt to load the the unwind state for a host 
pc occurring in
include/hw/xen/interface/io/blkif.h: *      since the the backend driver 
will still try to map those grants
qapi/qom.json:#     HMAT indexed via the the node ID in this SRAT structure) to

$ grep -r " in in " *
hw/display/apple-gfx.m:     * All unique MemoryRegions for which a mapping 
has been created in in this
qapi/machine-target.json:#     removed in in some future version of QEMU 
according to the QEMU

  Thomas


