Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQcGi-0007AX-Qb
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:35:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcGf-00078m-VG
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcGe-0002jm-5Z
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:35:45 -0400
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:48252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UQcGa-0002ii-8T; Fri, 12 Apr 2013 07:35:40 -0400
Received: by mail-wi0-f175.google.com with SMTP id c10so1478769wiw.14
	for <multiple recipients>; Fri, 12 Apr 2013 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Gig9LbbAuw2jNj3eU67rI3NvzPF3I6J9DjcbSAYxR0g=;
	b=rwjYuXwcd/fw+CAd1ueVi9dxpu83WD4r53/NruocE0LHb32Lk5Y9tcdpatZZX7pIzx
	EnyPI4gBfhJH4QUn7YaUjd/Y4nxjUfZAw06TxVYxwA6RiYxQioGbd341M2+9AiclBk4K
	pdoeIDqSjx8Bpmc6aYOYQ19oRgGbHI9j7VlV5vbL4HpYwI4MX8XJcHtzcTAR820D1G5O
	d6BekqUbCkYggUegijHfnZjl60qjV0iaTBsIDOgE+grk9XyqorSwXBxQo0t28zmVSwFA
	pFiGkuJyPHkCvm6zYrbvILv3Ky8vlc9yq5P8QBaPgOiokm7GjT7MpD+i5OsQ5d5z8cB9
	qCaA==
X-Received: by 10.180.72.228 with SMTP id g4mr3419007wiv.22.1365766536954;
	Fri, 12 Apr 2013 04:35:36 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id ed6sm3072127wib.9.2013.04.12.04.35.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:35:36 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:35:34 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130412113534.GD9747@stefanha-thinkpad.redhat.com>
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
X-List-Received-Date: Fri, 12 Apr 2013 11:35:47 -0000

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

Looks fine but please resend with hw/ reorganization conflicts resolved.

Stefan

