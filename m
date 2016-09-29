Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpdtD-0005bD-8g
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 12:08:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpdt9-0005Wn-QN
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpdt7-0008O0-HH
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:08:46 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:32923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpdt6-0008Mv-Nb
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:08:45 -0400
Received: by mail-vk0-x232.google.com with SMTP id z126so79308639vkd.0
	for <qemu-trivial@nongnu.org>; Thu, 29 Sep 2016 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wveneCdCraUAo3ArWczAvLHqsa8ufpYXQcj92/Qda+E=;
	b=GsD+c1lv1RJplbmMkwpwNSK4uJ1efkVt0fAgiRtrSPUZR8rccibkq1Xw9ptNVoDYWI
	LCYS5az8RGC7wnIuewN22lUNVX+Q3KrHWvKxaMHM8iF93mbRM3soKH41CH8lVayJwfsK
	YwpGAupxHl4Hvqw8RZyHW+GWwHzG42U55WgAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wveneCdCraUAo3ArWczAvLHqsa8ufpYXQcj92/Qda+E=;
	b=fXWN9VBBZcYCMV9dNya2BUIOVCGONu020+ipds3ki9BnGBOrTLUTLvgtAJflj6TLjy
	rd008t0uDVfWaNQ/giwbZqZCRftUfTEchGwiK6GtXFfgfCE7sYUyRHDyuftLStjDsPtr
	kKYqOC8ommI0MbAWiYdD7YR3Z0YiAOUYEM8Id5YTwDTaaB2VNFHY1NHmu3rE8Fx3cz++
	1GMtyLI6RAuF1khcMpN0bgwYmd3GLKtBBIdM5FDbx2GgoVznKi7SaXouEliCvA6GNCti
	s3VpZZr4C1e4Rk0xNTIIn2jQBAlg4jhr6WKZdGQfuUSHYEmlo5TbZXa2iaZ5OgsLeDKb
	UZ9w==
X-Gm-Message-State: AA6/9RmygYe0xMCze8T2m8JT2vJklLlYI52WemMwa4V1DZm2bROZj6vD9CaBRCPxrbJ4QAQ2k7h/fHwM8mIJI6D2
X-Received: by 10.31.92.21 with SMTP id q21mr1453519vkb.170.1475165324308;
	Thu, 29 Sep 2016 09:08:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 09:08:23 -0700 (PDT)
In-Reply-To: <1474633117-5227-1-git-send-email-thuth@redhat.com>
References: <1474633117-5227-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 09:08:23 -0700
Message-ID: <CAFEAcA9Ng0dikY=bwebUVz0AJTtm7GCYkcigXRhD9rMhXzZabw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add some ARM related files
 to the corresponding sections
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
X-List-Received-Date: Thu, 29 Sep 2016 16:08:49 -0000

On 23 September 2016 at 05:18, Thomas Huth <thuth@redhat.com> wrote:
> The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
> CP, and hw/cpu/realview_mpcore.c and hw/misc/arm_sysctl.c seem to
> belong to Real View.

arm_sysctl is also used in the Versatile PB and Vexpress boards;
it's not specific to realview.

thanks
-- PMM

