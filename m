Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eHAyk-0000En-TM
	for mharc-qemu-trivial@gnu.org; Tue, 21 Nov 2017 11:00:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eHAyi-0000DT-JS
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 11:00:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eHAyd-0003Dv-2K
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 11:00:52 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46178)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eHAyc-0003Dp-Th; Tue, 21 Nov 2017 11:00:46 -0500
Received: by mail-qt0-x241.google.com with SMTP id r39so19752904qtr.13;
	Tue, 21 Nov 2017 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Sk8Kf0nVt9F0goeafeBhxtXcpcA5UQmRvVS2RO9CD5g=;
	b=KwPZYi+9ixZv6XYLr0n5TPCtnwGF5ZFPdDVXPFmjBRO7iYgDuJyzr921EwOSSVYOK0
	Cjj9Dy7bJtxnIsokb0kPSazrMlymvE2EannlJ8Zc3jjdarF8yhCNHWtto4jRrtpXqOGD
	2rCjyrQ80UXVN870S+LH9O2TNMMsfUm7cFuFOlpaLwr5iS2boZFMevtl5vBVY9dv528P
	1mpuV7Eg+dA8lz7v5+TBuLd5y8IT2ktiRPYRmukcF2gqxs5eRf26gbm99dcB+cd93f8f
	cdPzMHE6fdbaUld2zOZqoGYDkuRa6AXo4onZFCaFUF4NOhSQk2OKX+3xZQh0tnnXBPEK
	ZSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Sk8Kf0nVt9F0goeafeBhxtXcpcA5UQmRvVS2RO9CD5g=;
	b=jkl6le/yFsX/AtpRBi+rxbhnv5DnFW+r6np5vhTtPiT7DIZVhhtss3aV6HBA/0LckU
	bplage81h7uhy6nZT4f0chSt9k+QzQz0KkoqG6f/XIKN+dATZ5GHlwIhIaF/4ZRI/Kgd
	zs2eD6ZfcnbEvu7F7BYO5VjB5f79FrLBLEshCosTkSO6sT9yXx6rU/lCM7TRoiVrZO5V
	PUgVOIbgotnqgJcd1Q7ZJWE7Gr767PXcOZpV+Wlew7MuF9QMawV7EgPOXtnXh27F/+HP
	5jOj23qA5BGVdKWVAHZk0VqW83MSi+ZgoNfZjagvxwWsbYchCzi636zzgXxlQWrr1YIE
	wUfQ==
X-Gm-Message-State: AJaThX70U3XeCQ6u5SfrbhaFhk3ul2AhMTVj/2WEFsPY/vyA4kESP8dy
	Ka8hTsVe/NDpz3lQT1jJPFY=
X-Google-Smtp-Source: AGs4zMZdKouFtKcBksF4G5Y1HnYtKQ7R5BrTTpqA+SiEacT8uKC4WYqcQOGWxYGexqb17An/jV/RjA==
X-Received: by 10.200.23.61 with SMTP id w58mr28265027qtj.341.1511280046197;
	Tue, 21 Nov 2017 08:00:46 -0800 (PST)
Received: from [192.168.1.240] (host99.190-139-18.telecom.net.ar.
	[190.139.18.99])
	by smtp.gmail.com with ESMTPSA id 13sm9159272qtv.67.2017.11.21.08.00.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 08:00:45 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
References: <1511276851-17680-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <67e3046b-a562-b1fd-d80d-ee31a1939517@amsat.org>
Date: Tue, 21 Nov 2017 13:00:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511276851-17680-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH]
 accel/tcg/cpu-exec-common.c: Remove unnecessary include of
 memory-internal.h
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
X-List-Received-Date: Tue, 21 Nov 2017 16:00:53 -0000

On 11/21/2017 12:07 PM, Peter Maydell wrote:
> The cpu-exec-common.c file includes memory-internal.h, but it doesn't
> actually use anything from that header. Remove the unnecessary include.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  accel/tcg/cpu-exec-common.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index 5b4ae54..dac5aac 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -21,7 +21,6 @@
>  #include "cpu.h"
>  #include "sysemu/cpus.h"
>  #include "exec/exec-all.h"
> -#include "exec/memory-internal.h"
>  
>  bool tcg_allowed;
>  
> 

