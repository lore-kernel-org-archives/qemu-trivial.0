Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFGtF-0008Ih-T8
	for mharc-qemu-trivial@gnu.org; Tue, 01 Oct 2019 08:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38517)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iFGt8-0008Hr-Em
 for qemu-trivial@nongnu.org; Tue, 01 Oct 2019 08:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iFGt6-0002Nd-Al
 for qemu-trivial@nongnu.org; Tue, 01 Oct 2019 08:04:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50328)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iFGt6-0002Mb-21
 for qemu-trivial@nongnu.org; Tue, 01 Oct 2019 08:04:16 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 64C7346671
 for <qemu-trivial@nongnu.org>; Tue,  1 Oct 2019 12:04:14 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id o8so1325046wmc.2
 for <qemu-trivial@nongnu.org>; Tue, 01 Oct 2019 05:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4S9GSvtVGVTRXQRmHgyH0l0klwBA4ec1EdhxAPTUlBs=;
 b=kvt4duzGT+Cbo8QaJSXt/ubA9Cj0HGL7JPpicOIO25K2CAZeKs7Ym4N4j0NzyhjbBx
 wHRe8l5zpRkSagRBLEhoRnjdJggnh1qQBwiaQN2fvcYKNG6p+XQJAHdysAfQyHu0HipF
 Q7sEQu7+GbPF/2h9sHaU83gFTam/cSsUv1WJRbKPusPI/nTkmSnXGGtQvLlB4tfvmwZm
 mLzHG9kcBZOIoOxPfqFfTRsaxAkmcI4KI7vwdA2hfUhdxkEnyR2raMeY8Tzwy09vy3MK
 qel9K9663E5y4UsKErVdRfwt+ZD28JnvcQRbueDeBx76L7J392uTlI76tsGAj8zFkTFS
 eYuQ==
X-Gm-Message-State: APjAAAWkBElIejSR9U8zps7DOBztmv+m7Te9YePLnI1pBfqJyPjsCepR
 irb+8tiHyJHmhfJu/U/l3WNcfY8Hn6vQMAckKEYoqPqAWRG0m9YTHrgmC3sSI24o+LSEdWlpxJi
 juf2qJUL9O+VORTy82g==
X-Received: by 2002:a5d:430e:: with SMTP id h14mr17017572wrq.18.1569931453113; 
 Tue, 01 Oct 2019 05:04:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw22QpxGa9eME8dcs/1xT5CLiq4lo9gYEw1snK8wBcGR6XzU+vUI36fuW5MEeS/vXNxNnmE8w==
X-Received: by 2002:a5d:430e:: with SMTP id h14mr17017548wrq.18.1569931452886; 
 Tue, 01 Oct 2019 05:04:12 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
 [79.52.200.174])
 by smtp.gmail.com with ESMTPSA id q19sm38966503wra.89.2019.10.01.05.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 05:04:11 -0700 (PDT)
Date: Tue, 1 Oct 2019 14:04:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] qemu-doc: Remove paragraph about requiring a HD image
 with -kernel
Message-ID: <20191001120409.vgxd4tsmx4guhnxc@steredhat>
References: <20191001110111.4870-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001110111.4870-1-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 01 Oct 2019 12:04:20 -0000

On Tue, Oct 01, 2019 at 01:01:11PM +0200, Thomas Huth wrote:
> The need for specifying "-hda" together with "-kernel" has been removed in
> commit 57a46d057995 ("Convert linux bootrom to external rom and fw_cfg"),
> almost 10 years ago, so let's remove this description from our documentation
> now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-doc.texi | 4 ----
>  1 file changed, 4 deletions(-)


Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

> 
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 2ba6c90c08..3c5022050f 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -906,10 +906,6 @@ Use @option{-kernel} to provide the Linux kernel image and
>  @option{-append} to give the kernel command line arguments. The
>  @option{-initrd} option can be used to provide an INITRD image.
>  
> -When using the direct Linux boot, a disk image for the first hard disk
> -@file{hda} is required because its boot sector is used to launch the
> -Linux kernel.
> -
>  If you do not need graphical output, you can disable it and redirect
>  the virtual serial port and the QEMU monitor to the console with the
>  @option{-nographic} option. The typical command line is:
> -- 
> 2.18.1
> 
> 

-- 

