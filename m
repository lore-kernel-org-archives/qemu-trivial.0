Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYvVu-00035c-4b
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 07:59:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvVo-00030Q-V2
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 07:59:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvVo-00087I-6R
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 07:59:20 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvVo-000870-2B
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 07:59:20 -0500
Received: by mail-vk0-x22a.google.com with SMTP id e185so46350671vkb.1
	for <qemu-trivial@nongnu.org>; Thu, 25 Feb 2016 04:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZecNscYYqrfXsY8d3MCVKzq2qyi3uk+r/YwwpmST2bM=;
	b=FRphLEOij00VYZnCb8DA4rQCqzzrjDmPzZyF1fsVEtoB3S+5zX2sj96B0wWw0OnTUp
	p8bPOWw+ywKOH6V3i2LQguSPiSbkwbSL5s+L5af3OHCDMp69UTwXntwVTGD571BZjSD4
	NTxlBSm17+s5dtCKgWnaMCgtksEKjmJ0CBPVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZecNscYYqrfXsY8d3MCVKzq2qyi3uk+r/YwwpmST2bM=;
	b=HPD8FHjdZCnPpO2G1sBnIPXBxw/Zt7BhfKISXdR57VGtE1fLg9kwXdgjvm7kY5J/H1
	BDuZNDaRN3N2NGRY+zT2AS6+m9S0JgWOp/B9UPMnBiVKpYyQBn7WrYdgKiB5Hv2nBsxB
	oKBa/ORLBvo1DcOjko2t8zToa4fvZZl67Jfi79RHgh/SUPjU9eJmm/3BMiBSX+C5Ulz3
	metwjiQfwELpWAOKM3KyntejGPDdQc4MtrksWYQ9Qnye2+U85ouF5gsCMteYHbNSyd7Y
	UdZkseOO0EkQbK/FbDYuq6iu3iU8my/ZexnrhPT17IR4xxgrbAL0CPTergsuc8qrwtEp
	jU7w==
X-Gm-Message-State: AG10YOSaJZFJYh6lcs1gDsqg4tRer6I5WUd3QvVUNti29HxhQfcuyO0ngTAuQXq6i8GMtjZMZ89NjjvdZEvMUaZt
X-Received: by 10.31.107.194 with SMTP id k63mr32794541vki.27.1456405159613;
	Thu, 25 Feb 2016 04:59:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 04:59:00 -0800 (PST)
In-Reply-To: <1455814580-17699-1-git-send-email-wei@redhat.com>
References: <1455814580-17699-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 12:59:00 +0000
Message-ID: <CAFEAcA__Y0mxn8BBSrw4zhvRbQjoeSpicOxUiKOGXYrmvbtobQ@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/1] ARM: PL061: Checking register r/w
 accesses to reserved area
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
X-List-Received-Date: Thu, 25 Feb 2016 12:59:24 -0000

On 18 February 2016 at 16:56, Wei Huang <wei@redhat.com> wrote:
> pl061.c emulates two GPIO devices, ARM PL061 and TI Stellaris, which
> share the same read/write functions (pl061_read and pl061_write).
> However PL061 and Stellaris have different GPIO register definitions
> and pl061_read()/pl061_write() doesn't check it. This patch enforces
> checking on offset, preventing R/W into the reserved memory area.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/gpio/pl061.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)

Applied to target-arm.next, thanks.

-- PMM

