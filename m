Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaMaJ-0004oP-6g
	for mharc-qemu-trivial@gnu.org; Fri, 21 Dec 2018 10:19:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gaMaH-0004n1-6Z
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 10:19:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gaMa9-00071c-Oc
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 10:19:29 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:45989)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gaMa9-0006xe-3o
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 10:19:21 -0500
Received: by mail-wr1-f41.google.com with SMTP id t6so5628541wrr.12
	for <qemu-trivial@nongnu.org>; Fri, 21 Dec 2018 07:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7mF0QdavoQKLyFpkaXfUT9HwDDzySDX4qwqiqBmWvW0=;
	b=fyYQx2bROY8EZjILUopHxEhg5QirE/rxN6zpyf+GKJkwjLn+YxgUc4QVPXXxo5ryey
	ZzOp2kRj+Ue1hnJgdPuis0SJkdh7cFxujr+SahggoVBJNX+3YPwmzHKVGTQPIanIU3iq
	rTTVNzRdrYa8KnNC1FhKaQq5ogjaAB1rQaB/zGSgkkTPdQ0d/lymMxDTPFp6+37BN9cm
	8a1SRGNYwE7iDyUUnkGCK6L1p+h/GLITD5b2HEx6T6GedDnnuR94qMs8KklgmEW1qFg1
	Q0ST4vm+OT42vRPJtjV2dyYP27p3Jf5qHyfPuMudPq9xOeisNRX7E1YR4QNp0KVGbVrt
	plwg==
X-Gm-Message-State: AJcUukcLK8b9OLQ7Tr8kl9Z0DevMT8YnhMG8Dn7uHPfF93tj2h3iRrLF
	PlBGmCPT7svoL9S4G9+s86GkeQ==
X-Google-Smtp-Source: ALg8bN5Oes3tKnqlkc3pf7sWuWdsmgmJB4dXxNk7dEGNI5/nnA4jk4Ylua3uxIcdiHGW1q3X+RL4nA==
X-Received: by 2002:adf:8b83:: with SMTP id o3mr3148557wra.81.1545405557676;
	Fri, 21 Dec 2018 07:19:17 -0800 (PST)
Received: from [192.168.1.15] (abayonne-654-1-110-220.w86-222.abo.wanadoo.fr.
	[86.222.61.220]) by smtp.gmail.com with ESMTPSA id
	o17sm19796658wmg.35.2018.12.21.07.19.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 07:19:16 -0800 (PST)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-stable@nongnu.org
References: <20181221134115.27973-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <009f5d95-c968-6f3f-93c2-32300ee7e5e1@redhat.com>
Date: Fri, 21 Dec 2018 16:19:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181221134115.27973-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.41
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/usb: fix mistaken
 de-initialization of CCID state
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
X-List-Received-Date: Fri, 21 Dec 2018 15:19:30 -0000

On 12/21/18 2:41 PM, Daniel P. Berrangé wrote:
> In previous commit:
> 
>   commit 7dea29e4af17fc1d27478de9f8ea38144deac54a
>   Author: Li Qiang <liq3ea@gmail.com>
>   Date:   Fri Oct 19 03:50:36 2018 -0700
> 
>     hw: ccid-card-emulated: cleanup resource when realize in error path
> 
> The emulated_realize method was changed so that it jumps to a cleanup
> label to de-initialize state upon error. This change failed to ensure
> the success path exited the method before this point though. So the
> mutexes are always destroyed even in normal operation. The result is
> as crashtastic as expected:
> 
> $ qemu-system-x86_64 -usb -device usb-ccid,id=ccid0 -device ccid-card-emulated,backend=nss-emulated,id=smartcard0,bus=ccid0.0
> qemu-system-x86_64: util/qemu-thread-posix.c:64: qemu_mutex_lock_impl: Assertion `mutex->initialized' failed.
> Aborted (core dumped)
> 
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>

Fixes: 7dea29e4af1

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/usb/ccid-card-emulated.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
> index 25976ed84f..e0457d305b 100644
> --- a/hw/usb/ccid-card-emulated.c
> +++ b/hw/usb/ccid-card-emulated.c
> @@ -549,6 +549,8 @@ static void emulated_realize(CCIDCardState *base, Error **errp)
>      qemu_thread_create(&card->apdu_thread_id, "ccid/apdu", handle_apdu_thread,
>                         card, QEMU_THREAD_JOINABLE);
>  
> +    return;
> +
>  out2:
>      clean_event_notifier(card);
>  out1:
> 

