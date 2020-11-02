Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZX3G-00006K-Mi
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 05:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZX3F-00004z-FI
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 05:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZX3A-0003bo-Fd
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 05:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604312815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6s7sZKwjrVBjlusaRmPZYQ0r2G5ERLZAPT8kPT4iE+4=;
 b=KGRTDMk2kCaFPWA39W3RXQ7IKpAGwKO6O0F4nG438ohz7mRnkWr/XsnMsCSDo7Yr6OvOT+
 UKLpfh3zJ8ER2Xd7gV3NkKgozlxLe3Gnj8DUirLAPL8kt2H601iqsPdbi5yaZnNDnXlVQv
 ZGDkxllv45J3lBpV+U3uDZixgLGrmhY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-32Kp_fxEO7K1awZhcp2kIw-1; Mon, 02 Nov 2020 05:26:53 -0500
X-MC-Unique: 32Kp_fxEO7K1awZhcp2kIw-1
Received: by mail-wm1-f72.google.com with SMTP id a130so149215wmf.0
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 02:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6s7sZKwjrVBjlusaRmPZYQ0r2G5ERLZAPT8kPT4iE+4=;
 b=S4F+eLJXhqNrAn/EkGKo+LY7YU9UPU9AQHx6MsxKdJ3Tw4229EP2w5HCdf3aiT248y
 NI72G/bX7sT8zgDHkAOnFcgW9qglHWi3pgZOYmF1MDY4NyT5NYVmEibKqw7RbxIATdOm
 b5Q/k3eqaMvg+2Ao5YMyRUs4CBr+jzcGlrWUtLejW4eEpNhX3fW6kcTnbRYNQ0tB5EEb
 E9UfrF6wVGr7aZf19Fqvtqj/Ylk8TU1PVo6IM+ijGKf0hyGWPOTVnVNVIhHlpHpVy+/K
 l+wyPU6lkUoxX+ppTpfNlIpJ39zBqDNoJ9n5pjGse8RP/OoUJkfmPDgx/vw7ZxElhmoN
 ypxA==
X-Gm-Message-State: AOAM532Wnt6CYt8JBHyoX7KibzrxzZG9o4UsuURcRaVys+KnCndKNaqp
 3fPST0TdUZirxL+oRhJoA5I1AXy+8MPvqhsk/8ZtpNY51zMiqZ0YZGUjqpGQAmNEq3WBSG6o8q3
 XNilauRLUBr++CdptRw==
X-Received: by 2002:a1c:2087:: with SMTP id
 g129mr10698283wmg.158.1604312812563; 
 Mon, 02 Nov 2020 02:26:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXAaIvdk/Krsl3IMvJMKG6G+51aLeIu51dR+yaAiQSX/O+yGAKLsZIBywD69g9b5eNiH96EQ==
X-Received: by 2002:a1c:2087:: with SMTP id
 g129mr10698270wmg.158.1604312812394; 
 Mon, 02 Nov 2020 02:26:52 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id j127sm15136012wma.31.2020.11.02.02.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 02:26:51 -0800 (PST)
Subject: Re: [PATCH] vhost: fix up trailing whitespace
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20201102101301.1101378-1-mst@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd6d907b-fe97-8c67-8676-928c0e5ef258@redhat.com>
Date: Mon, 2 Nov 2020 11:26:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102101301.1101378-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Nov 2020 10:27:01 -0000

On 11/2/20 11:13 AM, Michael S. Tsirkin wrote:
> Drop trailing whitespace in vhost.c
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/virtio/vhost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


