Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7E2V-0001KG-8t
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 02:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7E2S-0001Jo-FK
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 02:56:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7E2R-0007l0-BX
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 02:56:56 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50348
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7E2R-0007jJ-6V
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 02:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582790214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4T4SEAtCV7t6TBZjUrYHbVftbeBLpSiOJmo/Sm4Y1U=;
 b=RgRKzdz4wi4ZnNd0yyxjr6QuG0ycqIJO0OUGHjjxw8LGBVp4kLv7CNH2XUKOPOkJzHhC+e
 ZD4sF+xHLytugHns/T9u0LjQ8UFts+V/ZJd/pxPXvfOf3Sp5CdpNy7+xtCmqd+3VXGbny+
 2UEfne6lQ/r/c6OTSW2r0UhHpoF8orI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-EaPvd8OgNc6mkVyXDvHgTw-1; Thu, 27 Feb 2020 02:56:47 -0500
X-MC-Unique: EaPvd8OgNc6mkVyXDvHgTw-1
Received: by mail-wr1-f72.google.com with SMTP id z15so963481wrw.0
 for <qemu-trivial@nongnu.org>; Wed, 26 Feb 2020 23:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H4T4SEAtCV7t6TBZjUrYHbVftbeBLpSiOJmo/Sm4Y1U=;
 b=gdcM4Sr82+K4Z5BKvs7brzUdfm2enhhyPMTf+cPo5ou57/dFZwWXdxytTXsKUciRBZ
 BOalMd8VjEao1aerAgKmoPNI7MI4tjWa1nilPDUVuHpacUiWiKDP4dQ6av+pBcqYimJm
 ZGwXpgpjsBxOajZpXnCOd4YkOapORLPg8DhgY+OybL167HYMLsadML9LKggSQ7SacuWd
 YZWCv0K0dh1pYILwZNW4SfGYR9Vrloko7xH8tQJibj3WfCmEDkZuPw/4+s6EcZhK5Mqw
 AiyX1dzgpOFWO0jM7KtpYUIPrSdyi8QfzZWDArSZMT1cODV+wuW+o7Qxsfcg9d/7iPpK
 m16A==
X-Gm-Message-State: APjAAAVPvlkRd+BM6+0Bu0/oJOA+F9LcAVPboFP2wRdFX0BEkH5SBZo+
 Tj/dXd2jtU3AfqPKqHQf4rf/k9+BISW4sTqALu6viGr7ObU7UGPrQzd8sKMACY+n+3IZe3fabP7
 qXos3zcu3GNyUdgHnuw==
X-Received: by 2002:a1c:984a:: with SMTP id a71mr3755794wme.185.1582790206154; 
 Wed, 26 Feb 2020 23:56:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7Qeec/88cYAQhSR1ghEGkLVjk2Y+LBRrBreTUBtUFojGUct0RpJnDoa+lu4R3UkoEwjPx9g==
X-Received: by 2002:a1c:984a:: with SMTP id a71mr3755753wme.185.1582790205781; 
 Wed, 26 Feb 2020 23:56:45 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id c9sm7019607wrq.44.2020.02.26.23.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 23:56:45 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Add entry for Guest X86 HAXM CPUs
To: Colin Xu <colin.xu@intel.com>, qemu-devel@nongnu.org, pbonzini@redhat.com
Cc: hang.yuan@intel.com, wenchao.wang@intel.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200226043204.67961-1-colin.xu@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <556a79eb-de83-0471-353f-b92423a77faa@redhat.com>
Date: Thu, 27 Feb 2020 08:56:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226043204.67961-1-colin.xu@intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 27 Feb 2020 07:56:57 -0000

Cc'ing qemu-trivial@

On 2/26/20 5:32 AM, Colin Xu wrote:
> HAXM covers below files:
> include/sysemu/hax.h
> target/i386/hax-*
> 
> Cc: Wenchao Wang <wenchao.wang@intel.com>
> Cc: Hang Yuan <hang.yuan@intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>

Please keep the Acked-by/Reviewed-by tags:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg623832.html

This patch already has:
Reviewed-by: Hang Yuan <hang.yuan@intel.com>

> ---
>   MAINTAINERS | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36d94c17a654..27727e2fac13 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -435,6 +435,16 @@ F: include/hw/block/dataplane/xen*
>   F: include/hw/xen/
>   F: include/sysemu/xen-mapcache.h
>   
> +Guest CPU Cores (HAXM)
> +---------------------
> +X86 HAXM CPUs
> +M: Wenchao Wang <wenchao.wang@intel.com>
> +M: Colin Xu <colin.xu@intel.com>
> +L: haxm-team@intel.com
> +S: Maintained
> +F: include/sysemu/hax.h
> +F: target/i386/hax-*
> +
>   Hosts
>   -----
>   LINUX
> 


