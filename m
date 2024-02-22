Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rd0If-0003Iq-Nv
	for mharc-qemu-trivial@gnu.org; Wed, 21 Feb 2024 23:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rd0Ib-0003AP-Sq
 for qemu-trivial@nongnu.org; Wed, 21 Feb 2024 23:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rd0Ia-0007PO-Bs
 for qemu-trivial@nongnu.org; Wed, 21 Feb 2024 23:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708574583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IJ9d5/KH8exfeUgSs1FxBgwqHlkbBlgAKWiKe8KTwb4=;
 b=AxXhwvRGxonLWFyccFd0a/7kxweQSpWI0Tj8hOJQWbjdJTP4r2GrBlTXPKv+fsD/f1IsZW
 nNJx7C806tz19cn7iFA7M0VAXfdTPq6SLHnthcJrIFrfVUfXxeCqvCIXiQG3LGYDAgIMKA
 a4JnijrvoHePqA4dv+/4Wmh0vXl94hY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-dpYkFTwLNK6mezyadyLZAA-1; Wed, 21 Feb 2024 23:03:02 -0500
X-MC-Unique: dpYkFTwLNK6mezyadyLZAA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-411ac839dc5so39605295e9.2
 for <qemu-trivial@nongnu.org>; Wed, 21 Feb 2024 20:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708574581; x=1709179381;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IJ9d5/KH8exfeUgSs1FxBgwqHlkbBlgAKWiKe8KTwb4=;
 b=Dsc22UdvtNcqzroSSCGmu220cTgJq5P65wxBgOaznd1t1qarIIENuroBqmtKnXJdaX
 G8BDQy02+Mp1o50nACdCi3sycnN6QT1Yg3i5BOqkG/AmhFe8LFQ/gcjLzzQsCaQv2dvu
 IJre5ZkJsEtiPHFeSt5iILJmxI/TjfEcQ4dz5IDsDtRZzXWRLodq3mNQyQZtAmp/w3H/
 sIpbqaChdw8O7yH90JdrhEskZwlG3KVG3pEKncNFKMOCKY2vjvyzFGIhMds+sbV1B9vW
 ILN/DIMpVTANS7+kTh9yVkoHBYwBJHEP2YdlVuZZLqTb0Ix2s7A0ib6UVC4l0w6dfisL
 7WQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZJmbhZNqVS3z9pcWSloP2ii4O26jwlqlxachAqq3CY8vGcEdY6sSIbZfckfg/dzKc5TpY77UzB3bs0mxfgYAxLgH6jTw88A==
X-Gm-Message-State: AOJu0YzKRfGkyN9ZY/n9Zqya5fm0ba9LYIEquwMF5kExdVcLB1wmLNAF
 f+/V93A1HOqRQ4JP+NNc6rnTudHsgu9N6fgtnc87vEt21aLd51vjiyOWrwX3G5I1t1zZdc/P20n
 HHi/cOV2RgqXBMw+4FCsYf0AoUukJfzUZVVH2CU8eTsttVm2pZad4oCY=
X-Received: by 2002:a05:600c:4fc9:b0:412:5652:2875 with SMTP id
 o9-20020a05600c4fc900b0041256522875mr13357203wmq.17.1708574581347; 
 Wed, 21 Feb 2024 20:03:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfs5wiJFOwQ2tZR/lLXg9Gxga/sObz6uIOb+hsZJ7JNTFfz9CKUVKgtyf2S3BTiNbrsB9NJA==
X-Received: by 2002:a05:600c:4fc9:b0:412:5652:2875 with SMTP id
 o9-20020a05600c4fc900b0041256522875mr13357194wmq.17.1708574581132; 
 Wed, 21 Feb 2024 20:03:01 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-100.web.vodafone.de.
 [109.43.178.100]) by smtp.gmail.com with ESMTPSA id
 j11-20020adff54b000000b0033b43a5f53csm18834788wrp.103.2024.02.21.20.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 20:03:00 -0800 (PST)
Message-ID: <d8299843-b4c3-464c-a137-2af26ad88020@redhat.com>
Date: Thu, 22 Feb 2024 05:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs/system: Update description for input grab key
To: Tianlan Zhou <bobby825@126.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240221195208.462-1-bobby825@126.com>
 <20240221195208.462-2-bobby825@126.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240221195208.462-2-bobby825@126.com>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Feb 2024 04:03:06 -0000

On 21/02/2024 20.52, Tianlan Zhou wrote:
> Input grab key should be Ctrl-Alt-g, not just Ctrl-Alt.
> 
> Signed-off-by: Tianlan Zhou <bobby825@126.com>
> ---
>   docs/system/keys.rst.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/keys.rst.inc b/docs/system/keys.rst.inc
> index 2e2c97aa23..59966a3fe7 100644
> --- a/docs/system/keys.rst.inc
> +++ b/docs/system/keys.rst.inc
> @@ -29,7 +29,7 @@ Ctrl-Alt-n
>      *3*
>         Serial port
>   
> -Ctrl-Alt
> +Ctrl-Alt-g
>      Toggle mouse and keyboard grab.
>   
>   In the virtual consoles, you can use Ctrl-Up, Ctrl-Down, Ctrl-PageUp and

Fixes: f8d2c9369b ("sdl: use ctrl-alt-g as grab hotkey")

Reviewed-by: Thomas Huth <thuth@redhat.com>


