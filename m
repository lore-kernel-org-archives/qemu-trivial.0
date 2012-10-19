Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TP80M-0002Dg-Dv
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 04:32:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP80J-00024H-1L
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP80F-0001eZ-0G
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:32:26 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:40672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TP807-0001dK-QE; Fri, 19 Oct 2012 04:32:15 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so66202bkc.4
	for <multiple recipients>; Fri, 19 Oct 2012 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bl1C33B2e6pcyvZzu5HlPCbv1uH9zjL4kGfSelkflcg=;
	b=URkJSGaAEO8JPI6yOck0Z3ikfp8ssatsjaURcS47SENKZ+36aWGijTERa5JKI93i84
	r3GxeLh3AHJ3Mr1n8GqDN2olqwwpsm09d9O8+JN91G5Nx4T23SIbEp+9TFgv9wXUvvju
	a4x2UuYLV7eMdFF0xSLarp851Rb0XMaXbCddXc3FchQ7BqIs75DNC8LvS8ce0jNP6pRH
	kl6wCBjBXZ+6ssJrQKpvxFLcWs/LiE93pAdPDBgRdWMrauLSIi4i1M4Ha+0UOvq31xEE
	1DiwLu0lwbK1Ym18ibHcaDpp5UK3P9CdkfUOT4fHDujTjWweXMvogEBKzz8j4scNmfQe
	6M7w==
Received: by 10.204.150.213 with SMTP id z21mr150333bkv.45.1350635534756;
	Fri, 19 Oct 2012 01:32:14 -0700 (PDT)
Received: from localhost (188-194-252-80-dynip.superkabel.de. [188.194.252.80])
	by mx.google.com with ESMTPS id ht18sm296238bkc.14.2012.10.19.01.32.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 01:32:14 -0700 (PDT)
Date: Fri, 19 Oct 2012 10:32:12 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121019083212.GA4656@stefanha-thinkpad.redhat.com>
References: <1350064784-13058-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350064784-13058-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, patches@linaro.org, Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] targphys.h: Don't define
 target_phys_addr_t for user-mode emulators
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
X-List-Received-Date: Fri, 19 Oct 2012 08:32:28 -0000

On Fri, Oct 12, 2012 at 06:59:44PM +0100, Peter Maydell wrote:
> Commit 4be403c accidentally defined the target_phys_addr_t type when
> building user-mode emulators. Since the type doesn't really make
> any sense except for system emulators, avoid defining it when building
> in user mode.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> cf brief discussion earlier:
> http://lists.gnu.org/archive/html/qemu-devel/2012-10/msg01138.html
> 
>  targphys.h |    4 ++++
>  1 file changed, 4 insertions(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

