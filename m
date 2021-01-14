Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzw60-0001Ka-Jz
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jan 2021 01:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzw5v-0001K6-Pi
 for qemu-trivial@nongnu.org; Thu, 14 Jan 2021 01:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzw5s-0001da-3l
 for qemu-trivial@nongnu.org; Thu, 14 Jan 2021 01:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610605611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psmIzOD9lzkpnYIQW4/BOG8l/eg6MD3R/B2vPGlNUx0=;
 b=fgQplO/yxxL5flImjfw3ilnmqa4b9tMxZ1n1D99uI8aLL1M3yOOMhTvVVovNU4j16ImciG
 iquuuhDzq5XLyZ5lq/Ka0qmjk0p8WPpiwJLuEhW8nDR1zX/9CvnVFIiQiunV5fwUbs54K9
 m0pEQS232i9MxNFF5hiEo8MfRp+COK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-IZy6Z5g1Np6-SkSgo9QUJg-1; Thu, 14 Jan 2021 01:26:46 -0500
X-MC-Unique: IZy6Z5g1Np6-SkSgo9QUJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C97468066E1;
 Thu, 14 Jan 2021 06:26:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-108.ams2.redhat.com [10.36.112.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E13A10016FB;
 Thu, 14 Jan 2021 06:26:44 +0000 (UTC)
Subject: Re: [PATCH v2] osdep.h: Remove <sys/signal.h> include
To: Michael Forney <mforney@mforney.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20201027003848.10920-1-mforney@mforney.org>
 <20210113215600.16100-1-mforney@mforney.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <08a896b4-8a5b-bf91-7c7c-7d5232e8fcd9@redhat.com>
Date: Thu, 14 Jan 2021 07:26:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210113215600.16100-1-mforney@mforney.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 14 Jan 2021 06:26:58 -0000

On 13/01/2021 22.56, Michael Forney wrote:
> Prior to 2a4b472c3c, sys/signal.h was only included on OpenBSD
> (apart from two .c files). The POSIX standard location for this
> header is just <signal.h> and in fact, OpenBSD's signal.h includes
> sys/signal.h itself.
> 
> Unconditionally including <sys/signal.h> on musl causes warnings
> for just about every source file:
> 
>    /usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
>        1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
>          |  ^~~~~~~
> 
> Since there don't seem to be any platforms which require including
> <sys/signal.h> in addition to <signal.h>, and some platforms like
> Haiku lack it completely, just remove it.
> 
> Tested building on OpenBSD after removing this include.
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
> Changes since v1: rebase on latest master
> 
>   include/qemu/osdep.h | 4 ----
>   meson.build          | 1 -
>   2 files changed, 5 deletions(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f9ec8c84e9..a434382c58 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -104,10 +104,6 @@ extern int daemon(int, int);
>   #include <setjmp.h>
>   #include <signal.h>
>   
> -#ifdef HAVE_SYS_SIGNAL_H
> -#include <sys/signal.h>
> -#endif
> -
>   #ifndef _WIN32
>   #include <sys/wait.h>
>   #else
> diff --git a/meson.build b/meson.build
> index 3d889857a0..af2bc89741 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1113,7 +1113,6 @@ config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>   config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>   config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>   config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
> -config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
>   
>   ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>   arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


