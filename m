Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t7rf1-0008KW-SQ
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2024 02:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t7rex-0008Ft-0N
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2024 02:37:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t7res-0007Aa-9m
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2024 02:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730705872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vgtKFrdrpE1ik1eXaxHir3LJP/uIW+qaH4lnmz9x/W4=;
 b=aQO7w1TrgFbTLhNHAP4pAEi3t9cBTEK2xskaJSw5bWi4fZRKu0/d+dSS+y1ExnKq39gEiO
 TcRuUSIybvL59LOrNKVx7NIRskVV7jTmFxcBgBZb+k5DmED5M7WiykiSlJzvIkRQnIHLzW
 g6YQDHftXNjm/C+GBKgs1wyl39wBf+o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-Lv0jtk2hOxSJNoKTabAbRg-1; Mon, 04 Nov 2024 02:37:49 -0500
X-MC-Unique: Lv0jtk2hOxSJNoKTabAbRg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4317391101aso25418215e9.2
 for <qemu-trivial@nongnu.org>; Sun, 03 Nov 2024 23:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730705868; x=1731310668;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgtKFrdrpE1ik1eXaxHir3LJP/uIW+qaH4lnmz9x/W4=;
 b=J/RF+mr+xzL7kt+c2NxJ0kHYnFG1uMD1Z+QWhA9VW+VOuboJQFNudp3rkwxBbTfWPr
 VuMY3w0yY7oXmdbONLi9LhGLMwK0HAC2mwe66vgT9CWHvU4yATE7SdnvhHKWqLOKETC6
 fd3ChXCFrlfTwnaqQHffU88BAdak7goLcxAkUakyr4t9YMVDfKf+SU9m2KYocAjY4ce5
 Mzd3tJbYZ7aiJYLbMwMcoprP9UvDoTLFDqnPsvXq5PVKp+f6XDrX/nxM6u6Ws7pgJ8aa
 0rhb9MBnsrPRtjCMnmL3IezJAjFgaF146xdaboBXJlnCdYmr4wz6SMACFwarKU5O8loq
 8cCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAmVA6v0eUqhPYLNQKhueC87xhSi3vnv8ohZs5LHt/2uFqGtttHSL9APWtB7rWIgk1nCAhHbA6Gix1vBs=@nongnu.org
X-Gm-Message-State: AOJu0YzWHOvbxy+0/GA0ASVJUhomAfOcSyfDP7M2F+xz3RNFkwr3V6LB
 toKay2fuLcW1nU5hTLubR1SQFVGZ06+r9aKPWJs4OdzC8w+Khp6XD4aYvFIvrs3qiUsgemrlU1T
 5iW1cN5ZLtuz1hjME9bqSnL8UNsdyDlP+f1zyZuA/2IChDDlCrtnLfiw=
X-Received: by 2002:a05:600c:1f81:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-4328324da11mr87825905e9.16.1730705868269; 
 Sun, 03 Nov 2024 23:37:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHt6YKZ2oRJWBQu0e8RJrOKMLMdqImkaB1oiplN3BlgKP3Hvpbk8e3C6IqI4rDOP5GS+zwyg==
X-Received: by 2002:a05:600c:1f81:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-4328324da11mr87825795e9.16.1730705867915; 
 Sun, 03 Nov 2024 23:37:47 -0800 (PST)
Received: from [10.33.192.239] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e51csm12460886f8f.79.2024.11.03.23.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Nov 2024 23:37:47 -0800 (PST)
Message-ID: <6f67908f-7ca7-4aa2-86e2-99b79aa6b4e7@redhat.com>
Date: Mon, 4 Nov 2024 08:37:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/usb: Use __attribute__((packed)) vs __packed
To: Roque Arcudia Hernandez <roqueh@google.com>,
 richard.henderson@linaro.org, jansene@google.com, mjt@tls.msk.ru
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20241101211720.3354111-1-roqueh@google.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241101211720.3354111-1-roqueh@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 04 Nov 2024 07:37:59 -0000

On 01/11/2024 22.17, Roque Arcudia Hernandez wrote:
> __packed is non standard and is not present in clang-cl.
> __attribute__((packed)) has the same semantics.
> 
> Signed-off-by: Erwin Jansen <jansene@google.com>
> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> ---
>   include/hw/usb/dwc2-regs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/usb/dwc2-regs.h b/include/hw/usb/dwc2-regs.h
> index 523b112c5e..b8b4266543 100644
> --- a/include/hw/usb/dwc2-regs.h
> +++ b/include/hw/usb/dwc2-regs.h
> @@ -838,7 +838,7 @@
>   struct dwc2_dma_desc {
>           uint32_t status;
>           uint32_t buf;
> -} __packed;
> +} QEMU_PACKED;

Reviewed-by: Thomas Huth <thuth@redhat.com>

Actually, the struct only consists of two 32-bit values, so I doubt that the 
"packed" is needed here at all. Maybe we could even simply remove it?

  Thomas


