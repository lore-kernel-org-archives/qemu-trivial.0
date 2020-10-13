Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSFmY-0000aM-Lr
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 04:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSFmT-0000Yx-LW
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 04:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSFmR-0004vC-G8
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 04:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602578134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGVk86dV2c40mJsaB0GuZyo4FuOI8eRya7E9IfirM9s=;
 b=LhfZsKZ5SW9/3wPsO4v5iFgjzkGzsx4xpd/w0yJCpUR54yWieyTQZ0SJYFWS5VP+z2Rbsr
 ndeF0laPCayKrQ763rEBSGZbMUHmasX1VXa+p0xrTD76txFUOjSQu95Pf3wCBLpmGu2bZy
 Nmqr/tagIWUxObOPaVUvxjSp4EwzkSY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-osaSAzx6MvuXO12Ki5u8IQ-1; Tue, 13 Oct 2020 04:35:31 -0400
X-MC-Unique: osaSAzx6MvuXO12Ki5u8IQ-1
Received: by mail-wr1-f70.google.com with SMTP id r8so3220884wrp.5
 for <qemu-trivial@nongnu.org>; Tue, 13 Oct 2020 01:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RGVk86dV2c40mJsaB0GuZyo4FuOI8eRya7E9IfirM9s=;
 b=NyfP6xrVXNjY2Xyw9vFH8ydAp93ZyMXEiaTD+CrmWV/faB3+1uWe2/oVjAIgHDYbkO
 YFWjumNSqPgw6SFI9rP54/2uc/PFoj3eycEIsHM01cdnzAL7hq0Tj/1E+t/wnkVjQ3f+
 ggQU1cgEq5Wyv+21N7y8MvFzxWB05nKJJZ+yeDpE8/3dJoUi7lb3zksPsoISh2TFvZXh
 RPmYnqHCqWRnTRza0Ghl5anJxTmTM62FojhE2OtW8hjp9QgffhIwJg9NPz9FBMCGfU5s
 Ng7pyKocFyOnQwewHI9FfZ832BdWJKDVyvTFFysb4cXlk1a/BwiMESCsm6RnxxRYiiUg
 wOCA==
X-Gm-Message-State: AOAM532itA/noXSEC0oBwPzLh7xiNRGZF9DE7kw+9drlIfDilXuxt5JH
 m/Mcx5LU7p28oYTx5f0vpDA4oF1ocDzk7QGoZKspJOjnRnPahpWxFaJiCbmD2j3rIWjqd0QvoOB
 tKTn2uFJyflo0AB2l7Q==
X-Received: by 2002:adf:ea0a:: with SMTP id q10mr22488353wrm.242.1602578129188; 
 Tue, 13 Oct 2020 01:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwopslEBIzPABteuTnu243j7fqDM/V1pNHDQZh1NqPTwUcVXCQPgM1renr8mNETXKJHzy5tew==
X-Received: by 2002:adf:ea0a:: with SMTP id q10mr22488326wrm.242.1602578128980; 
 Tue, 13 Oct 2020 01:35:28 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id a82sm27913568wmc.44.2020.10.13.01.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 01:35:28 -0700 (PDT)
Subject: Re: [PATCH v9 1/5] configure: fixes indent of $meson setup
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20201012234348.1427-1-luoyonggang@gmail.com>
 <20201012234348.1427-2-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9ced66f9-6641-ac41-15fa-975331c77eef@redhat.com>
Date: Tue, 13 Oct 2020 10:35:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012234348.1427-2-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 13 Oct 2020 08:35:39 -0000

On 10/13/20 1:43 AM, Yonggang Luo wrote:
> convert these line from tab to space
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   configure | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/configure b/configure
> index b553288c5e..1b63488521 100755
> --- a/configure
> +++ b/configure
> @@ -7211,13 +7211,13 @@ NINJA=${ninja:-$PWD/ninjatool} $meson setup \
>           -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
>           -Db_staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi) \
>           -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
> -	-Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
> -	-Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
> -	-Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
> -	-Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
> -	-Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
> -	-Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f \
> -	-Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
> +        -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
> +        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
> +        -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
> +        -Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
> +        -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
> +        -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f \
> +        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
>           $cross_arg \
>           "$PWD" "$source_path"
>   
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


