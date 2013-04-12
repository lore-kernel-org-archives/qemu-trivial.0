Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQcM2-0003ph-UH
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:41:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcLz-0003jB-IP
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcLy-0005K9-A6
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:41:15 -0400
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e]:50527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UQcLv-0005IX-JG; Fri, 12 Apr 2013 07:41:11 -0400
Received: by mail-wi0-f174.google.com with SMTP id hj8so1483480wib.7
	for <multiple recipients>; Fri, 12 Apr 2013 04:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=z6qh8vJsD/Rq2fPMefrFbRdt59/gT+7gAjSmSiZ/21U=;
	b=MYBkZdg20SNqbjmzPd/IwZ8zwyBuoM72ToWrx4Fur8UL/UJtHzIQM2Tts8jBhSiFuH
	I6GDl4MKSjywRBueM0VH0GhtOAbV8qo9VBmMVwxQQg4wtWSx7qntugq0OUZLtx2lVWW2
	f+glH/EBVZuhHvngRpo2X2b5gt5y6UgCJH7Kmiq3Ggep028nNu7RHrKWvVrkHfURyC+U
	fdeGpxmOa0I2fDNGLkMo6GY5XoIIobS+zRVPe5/BR072zm8UKUmRuHUNqzDNaRktprq9
	gjU75nk4PmieZ4X3b31IgKUb9bv3M0MChg93bASa5ycmV3aLJQzZwFUKUFwrULC/kn9H
	AsuA==
X-Received: by 10.194.3.4 with SMTP id 4mr14185161wjy.53.1365766870760;
	Fri, 12 Apr 2013 04:41:10 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id bq19sm3117510wib.7.2013.04.12.04.41.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:41:10 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:41:08 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130412114108.GH9747@stefanha-thinkpad.redhat.com>
References: <1365508099-21453-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365508099-21453-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22e
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] Typo, spelling and grammatical fixes
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
X-List-Received-Date: Fri, 12 Apr 2013 11:41:17 -0000

On Tue, Apr 09, 2013 at 12:48:19PM +0100, Peter Maydell wrote:
> Minor fixes to documentation and code comments.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> No actual changes, just rebased and resent following Paolo
> moving everything around.
> 
>  docs/bootindex.txt         |   10 +++++-----
>  docs/ccid.txt              |    2 +-
>  hw/block/virtio-blk.c      |    4 ++--
>  hw/intc/armv7m_nvic.c      |    2 +-
>  hw/s390x/s390-virtio-ccw.c |    2 +-
>  hw/s390x/s390-virtio.c     |    2 +-
>  hw/sd/sd.c                 |    4 ++--
>  target-microblaze/mmu.c    |    2 +-
>  target-s390x/mem_helper.c  |    8 ++++----
>  9 files changed, 18 insertions(+), 18 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

