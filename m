Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfRis-00020r-Dh
	for mharc-qemu-trivial@gnu.org; Wed, 09 Aug 2017 10:12:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfRiq-0001zM-Nw
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfRil-00020U-Ms
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 10:12:32 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfRil-0001zw-IX; Wed, 09 Aug 2017 10:12:27 -0400
Received: by mail-qk0-x241.google.com with SMTP id a77so5715463qkb.2;
	Wed, 09 Aug 2017 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zTvVkW3D+1kqM3IPllx6mCukl2qOXdbkv88Xk8uxpTQ=;
	b=lJxNiaqxAJHX5nieMKM0SDolT2D+hfWC+7E3xv28BBU56OZYhg6q1zjspRPv/eO4Nr
	4eBHK3S0n/KEKmjGsbvzz0kjzlcSTCxty+qzUZGEjL356Tiygx4QfB9NiiPKQN0+hNAQ
	8f6qoSNkfhWtSm1wzZ24cxq8QhpavhgNByuEYMTZBQG3KxYZ5MHhd5J/InL3BHwKnG/c
	WHQprGhdAQ9RJzsD3TS7mn4a439wvCrRJm6TaI2ha4EnWkiZYAjTcvnUSe1OmVNbFsIV
	LZNr4HRpqEmJ9HVbO6cgUfGSTNnvUuNWg+guIffeZSE7SPyI9kwLUdiZI7YX395gRMkL
	49Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zTvVkW3D+1kqM3IPllx6mCukl2qOXdbkv88Xk8uxpTQ=;
	b=tqNDWsyGy+zQPOSxw95MUpzymoWpLpU4ERHViHlaHP4PTAI7wNxP8GGMcca5DVgV26
	YTcmXVpJNxI/h5DgxNasqmnsVs3dr/GGhlbVpNJOPXDszAHW3X+CbLfHsvGzP6uwR9HP
	vC6UmEUAPPZiDbM6sre5o9N1V7FH02py1QNJordBy1n7a6SDWzAgdlpiJuhs3hF8930z
	puLQRafM+s8p6zWjiNGUSEOI/YTKzKNJbeXlcXLabV1C/ciEbbPHSN9fFVcaSB5Cy5BO
	NEuTYJr8Z8jVBGgY5X1JFMPuAw8mrwOhwRwODWpfaV+U2U/0j537S2H1icAbuVJ+mmkf
	izQQ==
X-Gm-Message-State: AHYfb5hHTooJCDo4P8Nn004CG7nsIyI6sZwzspMv3VxD+f3GzIG3+589
	Skc3MZGLsGUUWJMw/6I=
X-Received: by 10.55.76.193 with SMTP id z184mr10328559qka.146.1502287946804; 
	Wed, 09 Aug 2017 07:12:26 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id 4sm1924738qkl.56.2017.08.09.07.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:12:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Richard Henderson <rth@twiddle.net>, Chen Gang <gang.chen.5i5j@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-45-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff2ef34e-39d2-9048-2ef5-7073b3606271@amsat.org>
Date: Wed, 9 Aug 2017 11:12:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728053610.15770-45-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [RFC PATCH 44/47] MAINTAINERS: add missing entry
 for tilegx
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
X-List-Received-Date: Wed, 09 Aug 2017 14:12:33 -0000

ping?

I suppose no answer/ping timeout confirms there is no maintainer for 
"Odd Fixes" so the "Orphan" status is correct.

On 07/28/2017 02:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   MAINTAINERS | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 453f5fb3d7..dc1a69051c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -283,6 +283,10 @@ F: hw/tricore/
>   F: include/hw/tricore/
>   F: default-configs/tricore-softmmu.mak
>   
> +TILE-Gx
> +S: Orphan
> +F: target/tilegx/
> +
>   Guest CPU Cores (KVM):
>   ----------------------
>   
> 

