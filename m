Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQcLu-0003a9-BM
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:41:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcLo-0003R0-3S
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:41:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcLl-00055x-Ni
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:41:03 -0400
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:38374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UQcLf-00051a-HA; Fri, 12 Apr 2013 07:40:55 -0400
Received: by mail-wi0-f175.google.com with SMTP id c10so1484039wiw.8
	for <multiple recipients>; Fri, 12 Apr 2013 04:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=y72PFZuKZwJC5p1xFitquBQccjK2Dl4SbvyCaUoHX8M=;
	b=EmEzAK2LskqM6DJEpi773uZNcvJUKo5zpemI42fOYhetT93AyLdwjWSKRosOmtleME
	TwSNsebw6fuQuRDYUP/yWv9tOyEbg3jO5C1cf35GfuVYAJcFZR4mFW+fF6ICQtNhgKtk
	fVy4SHTv2QowbuiNdo0q547v0jvn6ONRqVIVsB5zRDINysY5Mn7lonaSCBz8m2SPmSKE
	wHY4eDebZaZsSZNrIW0d1OXKnkaLmachL8SiwyT+ViypbkHlUXg4BPqd2vRxhVff9dkT
	JKAUniP6tolI3EVABL1H04ViGN/MTpj7m89vE9hCTt+SjzBexgrb3E3KMVZZTaBRa1TA
	p7+A==
X-Received: by 10.180.208.47 with SMTP id mb15mr3468575wic.16.1365766854669;
	Fri, 12 Apr 2013 04:40:54 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id dm9sm2814872wib.3.2013.04.12.04.40.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:40:53 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:40:51 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130412114051.GG9747@stefanha-thinkpad.redhat.com>
References: <1365438972-20259-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365438972-20259-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22f
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] Typo, spelling and grammatical fixes
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
X-List-Received-Date: Fri, 12 Apr 2013 11:41:09 -0000

On Mon, Apr 08, 2013 at 05:36:12PM +0100, Peter Maydell wrote:
> Minor fixes to documentation and code comments, including
> a set of lets-vs-let's corrections.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/bootindex.txt         |   10 +++++-----
>  docs/ccid.txt              |    2 +-
>  hw/armv7m_nvic.c           |    2 +-
>  hw/s390x/s390-virtio-ccw.c |    2 +-
>  hw/s390x/s390-virtio.c     |    2 +-
>  hw/sd.c                    |    4 ++--
>  hw/virtio-blk.c            |    4 ++--
>  target-microblaze/mmu.c    |    2 +-
>  target-s390x/mem_helper.c  |    8 ++++----
>  9 files changed, 18 insertions(+), 18 deletions(-)

Great, I just noticed you already sent a v2!

Thank you,
Stefan

