Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlfVr-0007jg-K7
	for mharc-qemu-trivial@gnu.org; Fri, 12 Nov 2021 17:59:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mldKW-0008OD-9e
 for qemu-trivial@nongnu.org; Fri, 12 Nov 2021 15:39:24 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:43198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mldKT-0007j3-7f
 for qemu-trivial@nongnu.org; Fri, 12 Nov 2021 15:39:22 -0500
Received: from vla1-a78d115f8d22.qloud-c.yandex.net
 (vla1-a78d115f8d22.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:2906:0:640:a78d:115f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id AFC602E1272;
 Fri, 12 Nov 2021 23:39:09 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-a78d115f8d22.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 uPXVCxPvCp-d9suoWJ7; Fri, 12 Nov 2021 23:39:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636749549; bh=+YPp49mlvnOWmu13OU3H2BKA73rQ0rKBTzdu3YPETF0=;
 h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
 b=u3kN1EGcB8t/jBDNe4+9CVH8w73CV0yAqxCJSkrOGFnsH/BDhG9NXr5Pwq+/03j9j
 JZfz6RJpe0wHEDl7/OZdan/cFJs00hbgr8oBdmTI9yGcsIdwbuVG1A3OkOuXGNzie1
 i1HQlsEQg3OGg8Icup+2w65mzYJPC6JLuxQVTT8A=
Authentication-Results: vla1-a78d115f8d22.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1206::1:19])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 kBSkBxChz7-d9xmoDod; Fri, 12 Nov 2021 23:39:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Fri, 12 Nov 2021 23:39:07 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Jon Doron <arilou@gmail.com>,
 qemu-trivial@nongnu.org, Roman Kagan <rkagan@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
Message-ID: <YY7Q62ltAyfAUYJp@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Jon Doron <arilou@gmail.com>,
 qemu-trivial@nongnu.org, Roman Kagan <rkagan@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 "Denis V. Lunev" <den@openvz.org>
References: <20211106134155.582312-1-philmd@redhat.com>
 <54b75db4-8867-d1ee-e32c-bc3e4c23ec28@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54b75db4-8867-d1ee-e32c-bc3e4c23ec28@virtuozzo.com>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Nov 2021 17:59:11 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Nov 2021 20:39:24 -0000

On Fri, Nov 12, 2021 at 09:32:31PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Add Den and Roman (his new address)

Thanks, I missed it on the list indeed.

> 06.11.2021 16:41, Philippe Mathieu-Daudé wrote:
> > This is the 4th time I send this patch. Is the VMBus infrastructure
> > used / maintained? Should we deprecate & remove?

I think it's fair to say it's not maintained.  The whole
hw/hyperv/vmbus.c was submitted as a part of the work by Jon to enable
some obscure windows debugging feature which only worked in presence of
VMBus.  It was mostly taken from the respective branch of the (now
effectively abandoned) downstream tree with an implementation of the
core VMBus infrastructure and the devices using it; however, none of the
actual VMBus devices ever made it into the mainline tree.

> > 
> >    $ ./scripts/get_maintainer.pl -f hw/hyperv/vmbus.c -f include/hw/hyperv/vmbus.h
> >    get_maintainer.pl: No maintainers found
> > 
> > Philippe Mathieu-Daudé (1):
> >    hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
> > 
> >   include/hw/hyperv/vmbus.h |  3 --
> >   hw/hyperv/vmbus.c         | 59 ---------------------------------------
> >   2 files changed, 62 deletions(-)

This seems to basically be the revert of 4dd8a7064b "vmbus: add
infrastructure to save/load vmbus requests"; it was originally meant to
be submitted with the code that would use it, vmbus scsi controller, but
that never happened.  It believe it's safe to remove without affecting
Jon's work, but I'd rather check with him.

Thanks,
Roman.

