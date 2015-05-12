Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys4zK-00071D-Hd
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2015 03:52:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ys4zI-0006zk-FL
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:52:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ys4zF-0005se-2F
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:52:24 -0400
Received: from mail-ie0-f181.google.com ([209.85.223.181]:34099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ys4zE-0005sG-VL
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 03:52:21 -0400
Received: by iedfl3 with SMTP id fl3so1944326ied.1
	for <qemu-trivial@nongnu.org>; Tue, 12 May 2015 00:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+RaOxf8TlkQ3BWkUnAEjHMDyWDPfbS280Ygkj+L1sMU=;
	b=YIORx+YwhJKeVqSSKNmEs9zv58ewWtc9WlZUHIVLRX0LGClFd3rfXi0EDLmQ7y16VT
	U7IWrahhKy3GGnsbaW7E9Kcv21kQnN110oTIYi1SLq/nhVBOO5VljhyTz3uLqIxJURgp
	Rd/kjYFkdoeuAz8pkVPLT9enDZGWEvJAzXgxR6hlTKC7B061rjroNJvvR16yI3V62SFm
	pg4o/L3UnbeQtmo53cyd7XsyQ0lLx8lNv5dNYuel8R3iGfUClHOssxnZ8duCUbVixbRY
	9AJCMnZTLYacGC+QJUe3VDjEioBSvvfFCmBxcBiPsX6tnadU6A3N7LL2SIChf6FkQISg
	SOCw==
X-Gm-Message-State: ALoCoQkQ6CJeRv74kiTxNTlxHGiT2qk3NUHHpjPR62WYxVepANzh8HZGrLqSpM9QfMB0z2zeBDWG
X-Received: by 10.50.30.202 with SMTP id u10mr2032118igh.28.1431417140536;
	Tue, 12 May 2015 00:52:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Tue, 12 May 2015 00:52:00 -0700 (PDT)
In-Reply-To: <1431397521-2316-2-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
	<1431397521-2316-2-git-send-email-shannon.zhao@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 May 2015 08:52:00 +0100
Message-ID: <CAFEAcA99yzgDZHCcZyODHmn_q=Yo3PxsBMdiiSfMKS1WW5cRdg@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.181
Cc: hangaohuai@huawei.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 1/6] hw/s390x/s390-virtio-bus: Remove
	meaningless blank Property
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 07:52:25 -0000

On 12 May 2015 at 03:25,  <shannon.zhao@linaro.org> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/s390x/s390-virtio-bus.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/hw/s390x/s390-virtio-bus.c b/hw/s390x/s390-virtio-bus.c
> index 1a72b56..273bd9c 100644
> --- a/hw/s390x/s390-virtio-bus.c
> +++ b/hw/s390x/s390-virtio-bus.c
> @@ -536,17 +536,12 @@ static unsigned virtio_s390_get_features(DeviceState *d)
>

Net and scsi are already fixed in master (I had to do that
as part of the conflict resolution between your virtio
patches and Cornelia's).

-- PMM

