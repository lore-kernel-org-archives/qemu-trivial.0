Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cv15k-0002i5-75
	for mharc-qemu-trivial@gnu.org; Mon, 03 Apr 2017 08:28:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cv15h-0002ga-EN
	for qemu-trivial@nongnu.org; Mon, 03 Apr 2017 08:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cv15g-0002GB-Hz
	for qemu-trivial@nongnu.org; Mon, 03 Apr 2017 08:28:13 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cv15c-0002FD-06; Mon, 03 Apr 2017 08:28:08 -0400
Received: by mail-qt0-x244.google.com with SMTP id r45so18591013qte.0;
	Mon, 03 Apr 2017 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=LoLl4sRNqz9wIZi5Oop/ZGX5pXOHPD3MergfM4xlitA=;
	b=rooLq/j3WR1RSQcel9+0FWUcoQ94/Dt8K1CaexIn6kL5vQab/i4RqsaQAHIA2In4UD
	tCdvCVdAAHIwXmslP2ibn6Y2tEaepRZt8TubkKWq/jf5a96t8lufvFDVmo731mp6oMyB
	4c0l9tmsjd7I0GkX6vbrgVstmZgJj5iKtMR9dPlY0CPJokonzE7XH28B4QJjrpDl9o10
	wfDF+k763kZo1xUdq2qMzMy0wpeVco+2OHTldEhcxJALMRcIuNIEVS7G824P/Mh55WPk
	iiKIM5O1+50IKJRFm79Lwa6YWAiC27CplPT79NBvgEkZs5s2n/+62Ci+Wcd+xIBYRdrS
	lXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=LoLl4sRNqz9wIZi5Oop/ZGX5pXOHPD3MergfM4xlitA=;
	b=n02j89CWAOr8k+wirQ5aTtHSWDBfcb7tOzxQbSI+MOtKXyXu+/i1T7qKXLwKWFPSuF
	+qsp6rPCpFLe6wv5YISkhP8+YlWRsSXR+95Ls2wBBPtsU64zHzDevIObj+EEskqbgKL9
	ZiZbZfCRFmsAEsURvjnRZbQcZnjS3pv+ac+P6ycXqP0PdwnCxpvcwQSX57ATLUeKZhRX
	45pNBoEPMIhvX1z6JhoGYw8PFO1NSCtBJ6OU4a7kE8AL5HI/UU1ytVTn3RhA4gLr+94l
	rKcoHOkWC0uxZjil9dA8b541RM0iP/NLKanlREDOu0+0/+Cgwg3BVibxbygY2GALqRwh
	+QXA==
X-Gm-Message-State: AFeK/H37QeUtP/fsx7Rxc4ZzalU4puvQCi4nV0WdxMRU234m4Xa0WNRnuW1rJBZSvzi8Qg==
X-Received: by 10.237.49.195 with SMTP id 61mr17556932qth.82.1491222486733;
	Mon, 03 Apr 2017 05:28:06 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	t47sm9451428qte.45.2017.04.03.05.28.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 05:28:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20170403114044.15762-1-lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ef70b4ab-f71a-8235-dc63-ae34097436af@amsat.org>
Date: Mon, 3 Apr 2017 09:28:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170403114044.15762-1-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-gpu: replace
 PIXMAN_* by PIXMAN_BE_*
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
X-List-Received-Date: Mon, 03 Apr 2017 12:28:14 -0000

On 04/03/2017 08:40 AM, Laurent Vivier wrote:
> This avoids a "#ifdef HOST_WORDS_BIGENDIAN" and this is the purpose
> of PIXMAN_BE_* macros.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/display/virtio-gpu.c | 35 ++++++++---------------------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
>
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 9b530ab..7befcef 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -258,41 +258,22 @@ void virtio_gpu_get_display_info(VirtIOGPU *g,
>  static pixman_format_code_t get_pixman_format(uint32_t virtio_gpu_format)
>  {
>      switch (virtio_gpu_format) {
> -#ifdef HOST_WORDS_BIGENDIAN
>      case VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM:
> -        return PIXMAN_b8g8r8x8;
> +        return PIXMAN_BE_b8g8r8x8;
>      case VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM:
> -        return PIXMAN_b8g8r8a8;
> +        return PIXMAN_BE_b8g8r8a8;
>      case VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM:
> -        return PIXMAN_x8r8g8b8;
> +        return PIXMAN_BE_x8r8g8b8;
>      case VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM:
> -        return PIXMAN_a8r8g8b8;
> +        return PIXMAN_BE_a8r8g8b8;
>      case VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM:
> -        return PIXMAN_r8g8b8x8;
> +        return PIXMAN_BE_r8g8b8x8;
>      case VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM:
> -        return PIXMAN_r8g8b8a8;
> +        return PIXMAN_BE_r8g8b8a8;
>      case VIRTIO_GPU_FORMAT_X8B8G8R8_UNORM:
> -        return PIXMAN_x8b8g8r8;
> +        return PIXMAN_BE_x8b8g8r8;
>      case VIRTIO_GPU_FORMAT_A8B8G8R8_UNORM:
> -        return PIXMAN_a8b8g8r8;
> -#else
> -    case VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM:
> -        return PIXMAN_x8r8g8b8;
> -    case VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM:
> -        return PIXMAN_a8r8g8b8;
> -    case VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM:
> -        return PIXMAN_b8g8r8x8;
> -    case VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM:
> -        return PIXMAN_b8g8r8a8;
> -    case VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM:
> -        return PIXMAN_x8b8g8r8;
> -    case VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM:
> -        return PIXMAN_a8b8g8r8;
> -    case VIRTIO_GPU_FORMAT_X8B8G8R8_UNORM:
> -        return PIXMAN_r8g8b8x8;
> -    case VIRTIO_GPU_FORMAT_A8B8G8R8_UNORM:
> -        return PIXMAN_r8g8b8a8;
> -#endif
> +        return PIXMAN_BE_a8b8g8r8;
>      default:
>          return 0;
>      }
>

