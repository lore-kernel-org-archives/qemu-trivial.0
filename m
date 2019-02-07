Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grrIu-0000ZP-S1
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 16:33:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1grrIr-0000Yv-Tn
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 16:33:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1grrIq-0006Bm-32
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 16:33:49 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:38336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1grrIo-00069P-FT
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 16:33:47 -0500
Received: by mail-wm1-f41.google.com with SMTP id v26so1414908wmh.3
	for <qemu-trivial@nongnu.org>; Thu, 07 Feb 2019 13:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oHppIWlJMyvi2++p5fgP16aW73l/ojeegXf2ntzmQ6U=;
	b=hHTzEI+tsB6Gb1jPUyL6FHBYo6qbHW7rJl6bNcGDVbTmQ3Az/XRwoIMjHJRNJFRu8L
	jIzg8ZMKzeR165kBgq+NAFowXTfIRQeYdMN5+AGaog8Ct3WJTPmphCnIU6R6cAZeNI2k
	K8lyTA0pqBuwLXHnvRj9tiNv8Ag1b933aCILlvm6hobgInapD69iqdXQXFijrFxFyt7+
	iGgK78qE3guR9rt1usaY9mRWtl/KDwXVJN/rjuX+Yy0n/52IQtl57cf0MJgw9DYnP8SS
	WeE7uBMroYlltv5zcc9uYp4+/u2ZhrMPE3uVraeF1d0wlF3d2MrHIc/iaQBdwjqfMGLo
	xUeA==
X-Gm-Message-State: AHQUAuZMQ3hYxWbVBJsrmfrY2SRViPyMTxSfpWvdJzpqAVAGmdR+puTj
	2Su6++kQ3uKbizsOGdwQmdNKjw==
X-Google-Smtp-Source: AHgI3IZJQe5NzDPpwY8VN1fyXDZiW1N1eq1qXkSY0dFnL8U/yeD01GrTrsceaSqQ+GQwhxKTTCMoww==
X-Received: by 2002:a1c:ac85:: with SMTP id v127mr8086486wme.62.1549575222067; 
	Thu, 07 Feb 2019 13:33:42 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id p5sm308613wmh.16.2019.02.07.13.33.41
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 13:33:41 -0800 (PST)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
	<20190207193605.25676-2-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <bfda8184-db4e-ac05-2054-cb33fc45f1bb@redhat.com>
Date: Thu, 7 Feb 2019 22:33:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190207193605.25676-2-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.41
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] configure: remove
 handling of "wav" audio driver
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2019 21:33:50 -0000

On 2/7/19 8:36 PM, Cleber Rosa wrote:
> This looks like a leftover that was never implemented.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  configure | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/configure b/configure
> index fbd0825488..ff55e2273e 100755
> --- a/configure
> +++ b/configure
> @@ -3350,10 +3350,6 @@ for drv in $audio_drv_list; do
>        oss_libs="$oss_lib"
>      ;;
>  
> -    wav)
> -    # XXX: Probes for CoreAudio, DirectSound
> -    ;;
> -
>      *)
>      echo "$audio_possible_drivers" | grep -q "\<$drv\>" || {
>          error_exit "Unknown driver '$drv' selected" \
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

