Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grJR8-0002CI-Lg
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 04:24:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1grJR6-00029y-OY
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 04:24:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1grJR5-0006RF-HX
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 04:24:04 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1grJR5-0006Q0-BK
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 04:24:03 -0500
Received: by mail-wr1-f65.google.com with SMTP id x10so6660178wrs.8
	for <qemu-trivial@nongnu.org>; Wed, 06 Feb 2019 01:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=YdkFrxEpxvp7ecup+57z7c6DVWm7mJPWTpHHSLuhFPA=;
	b=dWb5Dm8xnTHBeyUHl5PLCmcUpIYj1ZNzPeLb5XnLhE8utQRNVClr6rmkkt7T7bFual
	VsTb4TQEVHItZKNmRNhPWIOpt4ohwJ9jFV9QgD4/iWbeQXzhJJX901O9RIluADG0yeX5
	Ybcj/zGASLIyM5UPnVStOOjvldZpcrXxDP3dOMMI9K/4+7ULYVsmxoA5LsCfjPL8Cj9m
	2UwYqSyOlrHIPtWUR9sU42+qW5RgQa6cpdUDlj1Ml+og3F6euCqAVLNBr9+Dyr5UegCH
	9WqVdw+hhSThUx2kE6dmBrmuwW9yKOC0TtktVVnytnlLIbqIkr6rkXwzntg7kBiQtDfK
	gRdQ==
X-Gm-Message-State: AHQUAubXqc0S4JmCsueOTlETO3MR8KBcKd0aRyHMyP5KlhlX0ZbbNNvN
	rs+6Nu270Txx172Djg7sXO4T+Q==
X-Google-Smtp-Source: AHgI3IYNC36sPPijk2yvxsbOToau69qVa8prudGKgXQ7w7YizdeYCgWCnuuXKb8GcfqSY/eirZT+8g==
X-Received: by 2002:a5d:6b8b:: with SMTP id n11mr6894919wrx.216.1549445037380; 
	Wed, 06 Feb 2019 01:23:57 -0800 (PST)
Received: from steredhat (host68-1-static.63-82-b.business.telecomitalia.it.
	[82.63.1.68]) by smtp.gmail.com with ESMTPSA id
	q15sm6745973wmj.46.2019.02.06.01.23.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Feb 2019 01:23:56 -0800 (PST)
Date: Wed, 6 Feb 2019 10:23:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Message-ID: <20190206092353.7tfo56bqasgg6vvo@steredhat>
References: <20190204204517.23698-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190204204517.23698-1-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/input/tsc210x: Fix
 building with no verbosity
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
X-List-Received-Date: Wed, 06 Feb 2019 09:24:05 -0000

On Mon, Feb 04, 2019 at 09:45:17PM +0100, Philippe Mathieu-Daudé wrote:
> When building with TSC_VERBOSE not defined, we get:
>       CC      arm-softmmu/hw/input/tsc210x.o
>     hw/input/tsc210x.c: In function ‘tsc2102_data_register_write’:
>     hw/input/tsc210x.c:554:5: error: label at end of compound statement
>          default:
>          ^~~~~~~
>     hw/input/tsc210x.c: In function ‘tsc2102_control_register_write’:
>     hw/input/tsc210x.c:638:5: error: label at end of compound statement
>          bad_reg:
>          ^~~~~~~
>     hw/input/tsc210x.c: In function ‘tsc2102_audio_register_write’:
>     hw/input/tsc210x.c:766:5: error: label at end of compound statement
>          default:
>          ^~~~~~~
>     make[1]: *** [rules.mak:69: hw/input/tsc210x.o] Error 1
> 
> Fix this by replacing the culprit fprintf(stderr) calls by a more
> recent API: qemu_log_mask(LOG_GUEST_ERROR). Other fprintf() calls
> are left untouched.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/input/tsc210x.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

