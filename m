Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tdUFV-0004cq-3Z
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2025 08:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tdUFJ-0004am-50
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 08:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tdUFF-0007Bu-3X
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 08:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738242367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jZgeqZY7UahEfyyNmhjGq70TYulL62YUYWSLDJkmUEw=;
 b=Kn0MOocHShHQbQqqZz81i/B+YV3ygEonbMfObTOtfyT6In1eYBzOlBaBhEzq4tjOfrzbEO
 ql1NXqoXMx+mgbQKRszVsFjabodng1FQhw1gdFsQUmu1ClFVS40OTq0U6iYlIVCfGSuvcf
 eFFYPS7CiCb3N+DycTdM5e8S3oPbP1w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-c4h9aoSYP1-MTm8MFPn3Qw-1; Thu, 30 Jan 2025 08:06:04 -0500
X-MC-Unique: c4h9aoSYP1-MTm8MFPn3Qw-1
X-Mimecast-MFC-AGG-ID: c4h9aoSYP1-MTm8MFPn3Qw
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38c24ac3415so626694f8f.2
 for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2025 05:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738242363; x=1738847163;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jZgeqZY7UahEfyyNmhjGq70TYulL62YUYWSLDJkmUEw=;
 b=Xz/3+w7ROxab8a/mbGmFD3zEOGtJKm0CEivCcVdtIYFghvcCU4ripb6orZWuNxkAhH
 Fn88djMzz3pAwuzMnDzpxA0KGcCOKi/CavxkbTAbf0SUqdKuKMGpb3UN1CbNjuhq8MnW
 LvTTxXU3wpOzdoomrVmFIjmB6q2g3MEcWZWKadTmHPvAFqWgP69iKYyTaDm5AVErFM/5
 wyH2GPmndUZk5rXfLEtY8ltb3fT0uNmv7wcSuE6bnbKiSAAgtqgN+lcR2HUemp4dvro3
 JZhlI/CY21EuuvyWGbkzgtodOWugLSlsFtpwPp/y+n9YHaHYOXydo8GJNHqKyJ437hGi
 3VoA==
X-Gm-Message-State: AOJu0YyGRDD+axxc4kINRmsMODgpEdbapMNICwC1+TQM1vA7FlpXvy3L
 W6mESbR6CCWzYN5U21/YH7V6iHO/uFkscSvc/KqZb0vT50sqIByzjnT1zlbR7zCF+akkj5w9Bwh
 afmcm3BVkkG16zmHCl/cHo5J0TY6PlXUvcedXTht7yj1tbDtJPt+wKEg=
X-Gm-Gg: ASbGncvETubUYY+TTP97oTSoL1xzgES24juVNb9V6BeR3k0N83IKuxJE7ysBfGIT3Ih
 1OQ8EPcpEy3JmUmAO/UgJDegWVY353hZzKdkCWYbP5nX6C+yON8igYE2CRfsbqMnlOUD8CzWVc4
 6BgGRL6W3yFSSncfri7fIbV48EdBCx+pdxAjO9l3QiaAbIHgUVjXqEe7InN/mDEM7bRQ6N5h8wX
 Wps+jbRyzQ5qUQjSpzQPcAehSmcGHW/0dx0bIqtPL7isHgimYcHxsCq+Xsy5XpFPCoZQVv1fBHk
 YElbOLZ2vAVLS/IQP4Uov8ZW0f/EJC5NSh9Z
X-Received: by 2002:a5d:5f56:0:b0:385:d7f9:f157 with SMTP id
 ffacd0b85a97d-38c51e957b9mr6303840f8f.36.1738242362865; 
 Thu, 30 Jan 2025 05:06:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmeC53Kp7PfA20Vl9Cko8cX7jhe9WujQhdr1x9D0Twd2bspbJ+n2aKEob5xgjg7dgzhvClsA==
X-Received: by 2002:a5d:5f56:0:b0:385:d7f9:f157 with SMTP id
 ffacd0b85a97d-38c51e957b9mr6303786f8f.36.1738242362479; 
 Thu, 30 Jan 2025 05:06:02 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec89csm1910063f8f.6.2025.01.30.05.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:06:02 -0800 (PST)
Message-ID: <c0735951-7734-404e-abc3-1921312f0093@redhat.com>
Date: Thu, 30 Jan 2025 14:06:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] net/slirp: libslirp 4.9.0 compatibility
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@gnu.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250130123253.864681-1-mjt@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250130123253.864681-1-mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VVUfj3NnTDV14je-uPbOhg_D_IZ5XnF-OIGJbee9djE_1738242363
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
X-List-Received-Date: Thu, 30 Jan 2025 13:06:16 -0000

On 30/01/2025 13.32, Michael Tokarev wrote:
> Update the code in net/slirp.c to be compatible with
> libslirp 4.9.0, which deprecated slirp_pollfds_fill()
> and started using slirp_os_socket type for sockets
> (which is a 64-bit integer on win64) for all callbacks
> starting with version 6 of the interface.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v2: update other callbacks too, use version 6 of the interface
> v3: commit the changes before sending (*_sock => *_socket)
> v4: version is 4.9.0, not 4.8.0
> 
>   net/slirp.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index eb9a456ed4..c61a93f3fa 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -247,7 +247,14 @@ static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
>       timer_mod(&t->timer, expire_timer);
>   }
>   
> -static void net_slirp_register_poll_fd(int fd, void *opaque)
> +#if !SLIRP_CHECK_VERSION(4,9,0)
> +# define slirp_os_socket int
> +# define slirp_pollfds_fill_socket slirp_pollfds_fill
> +# define register_poll_socket register_poll_fd
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
> +         SLIRP_CHECK_VERSION(4,9,0) ? 6 :
> +         SLIRP_CHECK_VERSION(4,7,0) ? 4 : 1;

Thanks, this fixes the problem with the macOS CI job, indeed:

  https://gitlab.com/thuth/qemu/-/jobs/8996370468

Tested-by: Thomas Huth <thuth@redhat.com>

I can pick this up for my upcoming pull request to fix the CI (unless Samuel 
plans to do a pull request, too)

I'll just add some spaces after the comma in SLIRP_CHECK_VERSION() to 
silence errors from the checkpatch.pl script.

  Thomas


