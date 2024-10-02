Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1svwo4-00039i-4N
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2024 06:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwo1-00039K-Sa
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwnm-0002a2-5J
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727865709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Jk+6uwbU3+q/YGIC1U4HcCbOtPCb9GLeymuWSf5rIMg=;
 b=Aa0aHV9yR08KuxXZUDOC7PAj8yE7URqXX7l//wYAUvz0Gh9IHbRJUCS06egBn5i2L7ATdk
 7NZk03DeFsyu868rShtesQy6bxKAv3A0jHzsn6RmjaDx8eDeldbULua7co2q7lG/xpJz9n
 HEx+CnTNlFgEuEYVnakCCxDut9So64Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-2g4vfCzgMJOAyh4m-payKw-1; Wed, 02 Oct 2024 06:41:47 -0400
X-MC-Unique: 2g4vfCzgMJOAyh4m-payKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42cb940cd67so65296855e9.0
 for <qemu-trivial@nongnu.org>; Wed, 02 Oct 2024 03:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727865706; x=1728470506;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jk+6uwbU3+q/YGIC1U4HcCbOtPCb9GLeymuWSf5rIMg=;
 b=gqCutgCJSvmuLezfATcpU+dRjFjGv7r90X8ctgXtgtflgkKVH+z3Rtagr/rv3fr0fY
 tNUVdwwlTZWkI3stiR9ohu2Ga4K4KLNTFb5kjOrQ6mlKYbJsoYT9IXbsID2stOVbAVZf
 1PoTNa+gsqvbCjL0633u4QcfpjjzmmpOni/uyVXMrC3QUP8jryvUz1VC2UiT/z94jpzK
 vzRwntBgVWkn4wIzkTjoXQ4jXBqlQIk9tyBnTqrJ7wXf+SNSU+v80ugU9HQ+JJSIafnS
 gmcg4jcWAjBAtH6C0CLxr5WZ9B3/jrRc/ZqXesgP3H/ckM6xbh6Zz7MvKl1pm/QLLFpB
 W1Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+hIRgkdsWV5uR9vxX/Dtx9cD8BrrFvHnjtHnSkYhpJTKU8cWQDLM5Rb7Q/Qd0FpT2Fex2+vL56lX+uWw=@nongnu.org
X-Gm-Message-State: AOJu0YwGAJRvlvxN94eCMIZtlwDOAUaYI7GGvu/Xr8CbMZeyyXG1BFwF
 SKyDHFTEWOdTkbnUjvDnwm8KogLvAQgQX7rQO4XUeNb0qnUdR7OgvVWpNCXqudmkfsL6L3oi2Co
 83GgE/wb2cm7xugDxG/wO3yBfS3MIdhueAnrPVgtHMY10bqphsKuCiHU=
X-Received: by 2002:a05:6000:c9:b0:37c:d2e3:1298 with SMTP id
 ffacd0b85a97d-37cfba19c9amr2397620f8f.55.1727865706496; 
 Wed, 02 Oct 2024 03:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsT/UcOOX1wF4XzUTMJamNALfDPq/+4M53dYqDtYVw6vCmJjwxLUBmA8EGusw1CZLiIXHbhg==
X-Received: by 2002:a05:6000:c9:b0:37c:d2e3:1298 with SMTP id
 ffacd0b85a97d-37cfba19c9amr2397587f8f.55.1727865706004; 
 Wed, 02 Oct 2024 03:41:46 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-143.web.vodafone.de.
 [109.42.49.143]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd564d27csm13629502f8f.23.2024.10.02.03.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 03:41:45 -0700 (PDT)
Message-ID: <31578ca3-4819-463a-85ba-d12aa784e377@redhat.com>
Date: Wed, 2 Oct 2024 12:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] replay: Remove unused replay_disable_events
To: dave@treblig.org, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20240918234005.466999-1-dave@treblig.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240918234005.466999-1-dave@treblig.org>
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
X-List-Received-Date: Wed, 02 Oct 2024 10:42:06 -0000

On 19/09/2024 01.40, dave@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <dave@treblig.org>
> 
> replay_disable_events has been unused since 2019's
>    c8aa7895eb ("replay: don't drain/flush bdrv queue while RR is working")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   include/sysemu/replay.h | 2 --
>   replay/replay-events.c  | 9 ---------
>   2 files changed, 11 deletions(-)
> 
> diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
> index 8102fa54f0..cba74fa9bc 100644
> --- a/include/sysemu/replay.h
> +++ b/include/sysemu/replay.h
> @@ -117,8 +117,6 @@ void replay_async_events(void);
>   
>   /* Asynchronous events queue */
>   
> -/*! Disables storing events in the queue */
> -void replay_disable_events(void);
>   /*! Enables storing events in the queue */
>   void replay_enable_events(void);
>   /*! Returns true when saving events is enabled */
> diff --git a/replay/replay-events.c b/replay/replay-events.c
> index af0721cc1a..2e46eda6bf 100644
> --- a/replay/replay-events.c
> +++ b/replay/replay-events.c
> @@ -92,15 +92,6 @@ void replay_flush_events(void)
>       }
>   }
>   
> -void replay_disable_events(void)
> -{
> -    if (replay_mode != REPLAY_MODE_NONE) {
> -        events_enabled = false;
> -        /* Flush events queue before waiting of completion */
> -        replay_flush_events();
> -    }
> -}
> -
>   /*! Adds specified async event to the queue */
>   void replay_add_event(ReplayAsyncEventKind event_kind,
>                         void *opaque,

Reviewed-by: Thomas Huth <thuth@redhat.com>


