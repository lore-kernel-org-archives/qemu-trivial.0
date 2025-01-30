Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tdTY9-0000F8-7m
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2025 07:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tdTY7-0000ES-Ca
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 07:21:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tdTY5-00015A-EM
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 07:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738239691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=k7PADETBOPriYbe6v3UxyD97jr11fizzLXb3N77s4QI=;
 b=czeCZ+rzOR/qBMrovptYbhPCSGHp3VB4rWJ/3nl2ReDH3ceyKG2FQxcV8C8jdocqPcfDm8
 ur4wwO/FCi7+2mbQATcPoabSwmGBzC5fsXN9mCeedfcQpIjeIBiWH1AV/e6Zb02LKKcGY0
 qJpUCrRGl2WoBgjPFJpyPb3E4fJ2uts=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-rvCME9zZPFuC3eKJcr82oA-1; Thu, 30 Jan 2025 07:21:28 -0500
X-MC-Unique: rvCME9zZPFuC3eKJcr82oA-1
X-Mimecast-MFC-AGG-ID: rvCME9zZPFuC3eKJcr82oA
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b6f943f59dso126158385a.2
 for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2025 04:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738239688; x=1738844488;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k7PADETBOPriYbe6v3UxyD97jr11fizzLXb3N77s4QI=;
 b=NbZTCW3jEI2xoFVuKwfWgnAMFUExk2GcEPMLDKY8Txc82Ow8Mp2jJhm/7xNqdk48eT
 V59qLIv2uGqXJNVTWBssZLNwQpHkm8q9WXGZYSElKBfK53BBx5Uezjc+oSQXATp7L6t5
 1Txj32a2wUeKpcyrZ4e7w2/i3uxhEz7r6mGqq3IWadeyu06Vs0e35ny0CVR7IKuS7f+0
 A8hz2L4QjtT/g8TCDgtn9eaZJWqD0cw/TnwYHzEBpGcY6Hv0M4SmtrgSnR9jg0NrWe9l
 9z48P5wOW0hc4BywSk3l4PKZZ99tsZfSmqbue6lOqJbhylRYGdDay2nWn7xrNBXwwiXf
 45fw==
X-Gm-Message-State: AOJu0Yxf139gvmAVkW5rZJFGeAsFXZ7S9mqEBEFFRXYNGEPxa0fJsKqL
 ezrvxwjsWm+oUhUzsXD9AmVUUpMAZjmhnjns2xV00tk7wGfkXU1KUdTmeF55bpdovhHXOKfLCYt
 RTUedn+O56jRNaPyqvM8tcP936Xairn9qfnc++XoIInplPL9auU5C5os=
X-Gm-Gg: ASbGncu/U8kERfTI8uEzgmI1ddgUJ5TyWmMRWAikyxZjFg+4YterPpcXhRki3WLmccu
 u3xgfz8xsHl+J46+Eqh68xHtjs1DSSxv6rt7Kjb0X7bKJViB7j/rVj9O/o9maOXLqH5ER8sCcrr
 2MLgWmhSiTAR0rsSW0IPQHn4ByKWrFqXZiAeVy2LSFIfXSEYFOFNurCi3NzRjZPcb8mjC3ePEkK
 g3zO5KRV2mfru4K910ZUk89PF3eUWDlrBsEkaEUdOtHEtZ/Zdcy564RZc13xwAFk+j6ukezCuJt
 dAfGGnZtgEc1ebhGJZSjzcLIYxg2L0X2ETCp
X-Received: by 2002:a05:620a:2b8a:b0:7b8:6242:18b8 with SMTP id
 af79cd13be357-7bffcce2f2amr923877585a.16.1738239688214; 
 Thu, 30 Jan 2025 04:21:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMcJBzepdIB9C7tdkecJDGigBVBSEjkhMKH5yP9DnnCN0MnEjTPqLmSZXFGW0EVTbgYhXRbw==
X-Received: by 2002:a05:620a:2b8a:b0:7b8:6242:18b8 with SMTP id
 af79cd13be357-7bffcce2f2amr923874585a.16.1738239687852; 
 Thu, 30 Jan 2025 04:21:27 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c00a8d0203sm68173585a.47.2025.01.30.04.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 04:21:27 -0800 (PST)
Message-ID: <c445afee-582d-46f7-a3eb-6b04f3b6cdee@redhat.com>
Date: Thu, 30 Jan 2025 13:21:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] net/slirp: libslirp 4.8.0 compatibility
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@gnu.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250130114810.857224-1-mjt@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250130114810.857224-1-mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tFS5xaV_jVpzTFerFdytgxeLcp0PDsRb0DOMN6OMMqU_1738239688
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Thu, 30 Jan 2025 12:21:35 -0000

On 30/01/2025 12.48, Michael Tokarev wrote:
> Update the code in net/slirp.c to be compatible with
> libslirp 4.8.0, which deprecated slirp_pollfds_fill()
> and started using slirp_os_socket type for sockets
> (which is a 64-bit integer on win64) for all callbacks
> starting with version 6 of the interface.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v2: update other callbacks too, use version 6 of the interface
> v3: commit the changes before sending (*_sock => *_socket)
> 
>   net/slirp.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index eb9a456ed4..2d2a58a6ee 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -247,7 +247,14 @@ static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
>       timer_mod(&t->timer, expire_timer);
>   }
>   
> -static void net_slirp_register_poll_fd(int fd, void *opaque)
> +#if !SLIRP_CHECK_VERSION(4,8,0)
> +# define slirp_os_socket int
> +# define slirp_pollfds_fill_socket slirp_pollfds_fill
> +# define register_poll_socket register_poll_fd

If I get that right, register_poll_socket has just been added to libslirp 
4.9.0, but is not available with 4.8.0 yet? ... so you might need to split 
the #if into two parts, one for 4.8.0 and one for 4.9.0 ?

  Thomas


> +# define unregister_poll_socket unregister_poll_fd
> +#endif
> +
> +static void net_slirp_register_poll_sock(slirp_os_socket fd, void *opaque)
>   {
>   #ifdef WIN32
>       AioContext *ctxt = qemu_get_aio_context();
> @@ -260,7 +267,7 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
>   #endif
>   }
>   
> -static void net_slirp_unregister_poll_fd(int fd, void *opaque)
> +static void net_slirp_unregister_poll_sock(slirp_os_socket fd, void *opaque)
>   {
>   #ifdef WIN32
>       if (WSAEventSelect(fd, NULL, 0) != 0) {
> @@ -286,8 +293,8 @@ static const SlirpCb slirp_cb = {
>   #endif
>       .timer_free = net_slirp_timer_free,
>       .timer_mod = net_slirp_timer_mod,
> -    .register_poll_fd = net_slirp_register_poll_fd,
> -    .unregister_poll_fd = net_slirp_unregister_poll_fd,
> +    .register_poll_socket = net_slirp_register_poll_sock,
> +    .unregister_poll_socket = net_slirp_unregister_poll_sock,
>       .notify = net_slirp_notify,
>   };
>   
> @@ -314,7 +321,7 @@ static int slirp_poll_to_gio(int events)
>       return ret;
>   }
>   
> -static int net_slirp_add_poll(int fd, int events, void *opaque)
> +static int net_slirp_add_poll(slirp_os_socket fd, int events, void *opaque)
>   {
>       GArray *pollfds = opaque;
>       GPollFD pfd = {
> @@ -363,8 +370,8 @@ static void net_slirp_poll_notify(Notifier *notifier, void *data)
>   
>       switch (poll->state) {
>       case MAIN_LOOP_POLL_FILL:
> -        slirp_pollfds_fill(s->slirp, &poll->timeout,
> -                           net_slirp_add_poll, poll->pollfds);
> +        slirp_pollfds_fill_socket(s->slirp, &poll->timeout,
> +                                  net_slirp_add_poll, poll->pollfds);
>           break;
>       case MAIN_LOOP_POLL_OK:
>       case MAIN_LOOP_POLL_ERR:
> @@ -629,7 +636,9 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>   
>       s = DO_UPCAST(SlirpState, nc, nc);
>   
> -    cfg.version = SLIRP_CHECK_VERSION(4,7,0) ? 4 : 1;
> +    cfg.version =
> +         SLIRP_CHECK_VERSION(4,8,0) ? 6 :
> +         SLIRP_CHECK_VERSION(4,7,0) ? 4 : 1;
>       cfg.restricted = restricted;
>       cfg.in_enabled = ipv4;
>       cfg.vnetwork = net;


