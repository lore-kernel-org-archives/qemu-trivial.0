Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1da1uS-0003T0-1s
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 11:38:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1da1uP-0003QK-Jd
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:38:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1da1uK-0001aT-KK
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:38:05 -0400
Received: from mail-wm0-f42.google.com ([74.125.82.42]:34674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1da1uK-0001Zo-Do
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:38:00 -0400
Received: by mail-wm0-f42.google.com with SMTP id l81so27808005wmg.1
	for <qemu-trivial@nongnu.org>; Tue, 25 Jul 2017 08:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sKL3QkZjznQvzauvPzI1/9HkFClqiJj4J9wq7hdUeTY=;
	b=lS5xi70lyqMYtLvJhrC+Ha6M0temJDbYeG9Q81A0B2+swsqGzH25tR3DGjGfo6Yoww
	kZVKKM15yQEJLWiiN7V40bT1v46P9vwCzQy7I53EEIsZ4ACzC4/W1rfVJaNZo6GHusMp
	apzUquSU6RtuOaDzIhEEyu93Q6uyeGsgYV3hd8KR00ubj3gP1M4ibKRUCnb5XTxYW8hA
	bAMxFlaVQGERvA5gqm05NE3R44gDxba7LPNCgYPNYoDLjQwZFTkmWBBcs87VYYbSlTYd
	QDCn3ipYqot3G4R+CAMvcwAbvr0bG1MgeHU7aUHYrpeIrdxDu/pgOdLrLM6CnQU52KAE
	O9Ww==
X-Gm-Message-State: AIVw113B3N/TzdW2ywIHRcnNmMbaxbtI+x3D1lwKtVYHANKqKAgd5v3c
	uo1CXHB2/xkZt3zp
X-Received: by 10.28.48.136 with SMTP id w130mr8637148wmw.54.1500997079241;
	Tue, 25 Jul 2017 08:37:59 -0700 (PDT)
Received: from [192.168.10.165] (94-39-195-172.adsl-ull.clienti.tiscali.it.
	[94.39.195.172]) by smtp.gmail.com with ESMTPSA id
	39sm21182705wrc.84.2017.07.25.08.37.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 08:37:58 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-13-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e12418c8-3619-7377-1f92-02f143da5367@redhat.com>
Date: Tue, 25 Jul 2017 17:37:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.42
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 12/35]
 vfio/platform: fix use of freed memory
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
X-List-Received-Date: Tue, 25 Jul 2017 15:38:06 -0000

On 24/07/2017 20:27, Philippe Mathieu-Daudé wrote:
> free the data _after_ using it.
> 
> hw/vfio/platform.c:126:29: warning: Use of memory after it is freed
>         qemu_set_fd_handler(*pfd, NULL, NULL, NULL);
>                             ^~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/vfio/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index 7c09deda61..da84abf4fc 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -120,11 +120,11 @@ static int vfio_set_trigger_eventfd(VFIOINTp *intp,
>      *pfd = event_notifier_get_fd(intp->interrupt);
>      qemu_set_fd_handler(*pfd, (IOHandler *)handler, NULL, intp);
>      ret = ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set);
> -    g_free(irq_set);
>      if (ret < 0) {
>          error_report("vfio: Failed to set trigger eventfd: %m");
>          qemu_set_fd_handler(*pfd, NULL, NULL, NULL);
>      }
> +    g_free(irq_set);
>      return ret;
>  }
>  
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

