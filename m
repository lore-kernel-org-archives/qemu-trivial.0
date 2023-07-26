Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qOgFm-0005BU-Vj
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2023 11:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qOgEh-00041p-Rs
 for qemu-trivial@nongnu.org; Wed, 26 Jul 2023 11:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qOgEg-0002Ij-At
 for qemu-trivial@nongnu.org; Wed, 26 Jul 2023 11:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690384533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/E+tJdnvHN0tMMFcvwe1cwsrYFR3of+Y/bdj6wZa9Gs=;
 b=JqrPIFglp2BgUEh2b6YdD0fCinrtod0Hk7cgC42Vk6J5qRT6hH9HE5kgp/SSn4+dMa+Bt/
 +i8zgutzXPcRRgnAjEBWssPhz/YFMXVZeNKNGsCDut7BytYs3XYUU9NPdl+zxSJsg+aMWs
 ly1o6QmlkQVq+icN3KGp8nsQCTmFCMo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-NA9j237LPD2xkyaRyfLpfA-1; Wed, 26 Jul 2023 11:15:30 -0400
X-MC-Unique: NA9j237LPD2xkyaRyfLpfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fd2e286689so21354835e9.3
 for <qemu-trivial@nongnu.org>; Wed, 26 Jul 2023 08:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690384529; x=1690989329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/E+tJdnvHN0tMMFcvwe1cwsrYFR3of+Y/bdj6wZa9Gs=;
 b=bUchEp/3fRNcG2MPNUJplHE7HcgrU/cMtWsEfR19wnRgC2WjgE+CI8G0hqZRIrUxJP
 M1CvDCU9hSX/tUIZgW2o2f9uq7Ds7Ew0jmFMYLF0RbjD2XVtWFiJzyPziJRRx7NqYIe8
 aPgz1EcSvOWKJx6M/POwxIRSH7OjrXvTHc6PZtewr3ZLhJAOQUyw4RXfCARnJx59ZzAM
 HXtWa6GpP78OTCbrKuOHAaHjROyZ1D6q7u1aEq6TNaD0h+RTuYK/HnDDo6qftSXuc/On
 TVH0aYYm/9mrfaIierLsjZPmewS1du6VrQB5s1+StNMASB892ZBTPnYQQNYcAdZahLfl
 dmlQ==
X-Gm-Message-State: ABy/qLYrE+7c3bDBEqigUOTRlmZgrWXXQfjcHGy8zK6Em7rgvOPzpZI9
 1+QqRSzLSLVnVg2T2uMseIOO48xA8OZGNHqUU84xLyPZPqwjw3SVJEn5g8veiSYZxXRKzqgD6cu
 0gGm4w47bwcZ2p3AG5g==
X-Received: by 2002:a05:600c:255:b0:3fc:55c:440a with SMTP id
 21-20020a05600c025500b003fc055c440amr1587554wmj.7.1690384528906; 
 Wed, 26 Jul 2023 08:15:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEM3NP2+4j+zESlqFLfGzOeBrVDncZLhOaduSjEG6+u6gvHmY8p2myiyT+pvvJqudefHp2EJw==
X-Received: by 2002:a05:600c:255:b0:3fc:55c:440a with SMTP id
 21-20020a05600c025500b003fc055c440amr1587537wmj.7.1690384528549; 
 Wed, 26 Jul 2023 08:15:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-0.web.vodafone.de. [109.43.176.0])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f91e32b1ebsm2317413wmi.17.2023.07.26.08.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 08:15:28 -0700 (PDT)
Message-ID: <8242fc5c-4c73-a3e1-8f80-3e24ab341e14@redhat.com>
Date: Wed, 26 Jul 2023 17:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ui/dbus: fix clang compilation issue
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: philmd@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230726151221.515761-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230726151221.515761-1-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 26 Jul 2023 15:15:36 -0000

On 26/07/2023 17.12, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../ui/dbus-listener.c:236:9: error: expected expression
>          Error *err = NULL;
> 
> See:
> https://gitlab.com/qemu-project/qemu/-/issues/1782#note_1488517427
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/dbus-listener.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> index 02fc6ae239..30917271ab 100644
> --- a/ui/dbus-listener.c
> +++ b/ui/dbus-listener.c
> @@ -232,7 +232,7 @@ static void dbus_call_update_gl(DisplayChangeListener *dcl,
>           egl_fb_read_rect(ddl->ds, &ddl->fb, x, y, w, h);
>           dbus_gfx_update(dcl, x, y, w, h);
>           break;
> -    case SHARE_KIND_D3DTEX:
> +    case SHARE_KIND_D3DTEX: {
>           Error *err = NULL;
>           assert(ddl->d3d_texture);
>   
> @@ -249,6 +249,7 @@ static void dbus_call_update_gl(DisplayChangeListener *dcl,
>               dbus_update_gl_cb,
>               g_object_ref(ddl));
>           break;
> +    }
>       default:
>           g_warn_if_reached();
>       }

Reviewed-by: Thomas Huth <thuth@redhat.com>


