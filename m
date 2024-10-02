Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1svwnH-0002aR-JD
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2024 06:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwnF-0002a5-QK
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwnE-0002Yg-0V
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727865671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6lvvepeCr/w31iiapTDJFAzQrCKLFbSQiEUqxFrebgw=;
 b=Gn/ex2SZoVCulmrevY6JOyRESszFqEmvlV8UtCvXswxhjVtZ+rohyh12tgYOQVmlYhjsgY
 k7hwKakhrcK+BBQrYKNiNYDRLTAyOPn2lcHpFufh784EKLhTLTgAoE/yvjXBLbFPk/Un9D
 2hY3LInEaOJpqbOakdLV3+cvxmGVOHw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-IoVAJPnYMdeQag3vg-J9PA-1; Wed, 02 Oct 2024 06:41:10 -0400
X-MC-Unique: IoVAJPnYMdeQag3vg-J9PA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb89fbb8cso37404715e9.0
 for <qemu-trivial@nongnu.org>; Wed, 02 Oct 2024 03:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727865670; x=1728470470;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6lvvepeCr/w31iiapTDJFAzQrCKLFbSQiEUqxFrebgw=;
 b=twLxX/8FMaErKAyA2xcHuJXgRyiqvH8KeefUSEJrNT1CzNJxjo9IJIQmf14y5J7wEA
 RvNQL+D6Y1v77f9LNKhb8MsnvREZJ1b5tYG8jY9JIZf1dq6n+LN3LaN60Te6WRPetCvb
 uSPVL99xSl38W5snu67lvt8XEhtfk+i8gSeZMt7465BGtPXmzgT6LOqC6jTQ5bzzudaR
 fjhwpiyIRc8NJDX8Lo9fl49SEGkvcEMDuipzu6ZCGP850987Gb5YEW3duC8vd7tagKkd
 tJMpWJgm2MU1WufdY9wU5lf//LCo5/li1/JUarfQ7CqGvrMfFAb4xHj85HhYNWSNaKJU
 F+0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5TFI6HS6/H4FTsN9Px9VT15XmwGwSngZhTGausanAM8wXemyhYxnKP4WrXeEx/OchraMbXNV7D8Yh8PI=@nongnu.org
X-Gm-Message-State: AOJu0YyU5ylmeXvvg2X1qmqu6M4vJUJjTTN25hBTzA1mL0k29ogb2rwk
 ojuAt0E6rH1bHE2Oy9H+yuIRaeO53xidnoyAQMNodPO8eGJ7mYlByyc6hsRtCRgszM7VhvVFv5R
 X5rNzt+Ba8kloRppSjMR/03vst+yrnKHnzI3Hst3aZJbQa9/jX8n8G+8=
X-Received: by 2002:a05:600c:4705:b0:42e:93f4:5383 with SMTP id
 5b1f17b1804b1-42f777ecf6dmr16705535e9.23.1727865669626; 
 Wed, 02 Oct 2024 03:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjrRCfjE5CyiCwnTqrjl0B3KeyzxI0sIDQFmmrnoK3wgcS4mE6nqKbQ1GsnTssSkyG5bCs/A==
X-Received: by 2002:a05:600c:4705:b0:42e:93f4:5383 with SMTP id
 5b1f17b1804b1-42f777ecf6dmr16705365e9.23.1727865669199; 
 Wed, 02 Oct 2024 03:41:09 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-143.web.vodafone.de.
 [109.42.49.143]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f7a00bc5csm15175585e9.45.2024.10.02.03.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 03:41:08 -0700 (PDT)
Message-ID: <2149788c-ea6a-4e6c-be95-b4daa5c5aefe@redhat.com>
Date: Wed, 2 Oct 2024 12:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remote: Remove unused remote_iohub_finalize
To: dave@treblig.org, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20240919165852.322707-1-dave@treblig.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240919165852.322707-1-dave@treblig.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
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
X-List-Received-Date: Wed, 02 Oct 2024 10:41:18 -0000

On 19/09/2024 18.58, dave@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <dave@treblig.org>
> 
> remote_iohub_finalize has never been used.
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   hw/remote/iohub.c         | 13 -------------
>   include/hw/remote/iohub.h |  1 -
>   2 files changed, 14 deletions(-)
> 
> diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
> index 40dfee4bad..988d3285cc 100644
> --- a/hw/remote/iohub.c
> +++ b/hw/remote/iohub.c
> @@ -33,19 +33,6 @@ void remote_iohub_init(RemoteIOHubState *iohub)
>       }
>   }
>   
> -void remote_iohub_finalize(RemoteIOHubState *iohub)
> -{
> -    int pirq;
> -
> -    for (pirq = 0; pirq < REMOTE_IOHUB_NB_PIRQS; pirq++) {
> -        qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
> -                            NULL, NULL, NULL);
> -        event_notifier_cleanup(&iohub->irqfds[pirq]);
> -        event_notifier_cleanup(&iohub->resamplefds[pirq]);
> -        qemu_mutex_destroy(&iohub->irq_level_lock[pirq]);
> -    }
> -}
> -
>   int remote_iohub_map_irq(PCIDevice *pci_dev, int intx)
>   {
>       return pci_dev->devfn;
> diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
> index 6a8444f9a9..09ee6c77b6 100644
> --- a/include/hw/remote/iohub.h
> +++ b/include/hw/remote/iohub.h
> @@ -37,6 +37,5 @@ void remote_iohub_set_irq(void *opaque, int pirq, int level);
>   void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg);
>   
>   void remote_iohub_init(RemoteIOHubState *iohub);
> -void remote_iohub_finalize(RemoteIOHubState *iohub);
>   
>   #endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


