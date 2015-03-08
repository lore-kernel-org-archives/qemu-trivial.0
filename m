Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUaYZ-0003um-2C
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 08:43:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YUaYW-0003uJ-Hc
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 08:43:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YUaYT-0001S6-6y
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 08:43:40 -0400
Received: from mail-lb0-f178.google.com ([209.85.217.178]:39083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YUaYT-0001Rm-04
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 08:43:37 -0400
Received: by lbiw7 with SMTP id w7so19129483lbi.6
	for <qemu-trivial@nongnu.org>; Sun, 08 Mar 2015 05:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SLfek9Pi7nqHCQ9wNvuAdzko447IxJl+TKuXOvGfjl4=;
	b=Kfy962iJ15y1DBqo+Lv3+k9lXlin2/rl2ZodEYcy8KDY6lBYdYvHBJDmpR5dqkYB1W
	tpNVL7x4OlkA8kq7Cn7WbObiANCPm9ICE82tVznD9McAWIkjQoMquGmIntspli9v6/6e
	ZURZkq5reqYcBLnfjRWMd6bCqiGtHJz+sBoLtKDxuidtiH2oZpTgPULZK6wxF8t+LjlN
	MUtQt7qdReF1BSLor6RFi4RVi0N6rrgenV2XoWQtyR4SHEvbD1EZ3bnOG8jdCOlkNG3W
	4N6RVXBwkO2ShFCOfU/1bWACYm3FlK8NTRFIshaEO3yLNhKTLeEH80rooRzdHhWzibCj
	ZtPQ==
X-Gm-Message-State: ALoCoQlsj7tLQYa47MAoWJxMhTdO32f9ngu61pg7gIw/FRtvDV1oZ5MrfDt6CqFOM+OqUTApMrX3
X-Received: by 10.152.225.167 with SMTP id rl7mr21576382lac.54.1425818615521; 
	Sun, 08 Mar 2015 05:43:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.145.193 with HTTP; Sun, 8 Mar 2015 05:43:15 -0700 (PDT)
In-Reply-To: <cover.1425489273.git.mjt@msgid.tls.msk.ru>
References: <cover.1425489273.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 8 Mar 2015 21:43:15 +0900
Message-ID: <CAFEAcA9xPOrFfpx7-_P9xPe-065itFxap5ZKa1w6G4Y-fG3_-A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v2 00/46] Trivial patches for
	2015-03-04
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
X-List-Received-Date: Sun, 08 Mar 2015 12:43:41 -0000

On 5 March 2015 at 02:16, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a resend of my previous pull request, but without
> patch 6 "migration/rdma: clean up qemu_rdma_dest_init a bit".
> I won't include all the other patches since they're the same,
> there's no need to bomb people again.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 576a94d8bcaa1bb07a81d9ffd2cf76095a66ad9a:
>
>   vl: take iothread lock very early (2015-03-03 13:21:53 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-03-04
>
> for you to fetch changes up to a49f076ea6b016ee14766db2b247b48f187794b1:
>
>   9pfs: remove useless return (2015-03-04 20:14:22 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-03-04
>
> ----------------------------------------------------------------

Fails to build on clang, I'm afraid:

/home/petmay01/linaro/qemu-for-merges/disas/cris.c:1218:33: error:
unused variable 'cris_cond15s' [-Werror,-Wunused-const-variable]
static const struct cris_cond15 cris_cond15s[] =
                                ^
1 error generated.

-- PMM

