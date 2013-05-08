Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ua4NT-0007g5-IS
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2013 09:25:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ua4NM-0007bb-Jj
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 09:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ua4NF-0006R5-OT
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 09:25:43 -0400
Received: from mail-yh0-x22a.google.com ([2607:f8b0:4002:c01::22a]:62433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1Ua4NF-0006Qp-KW
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 09:25:37 -0400
Received: by mail-yh0-f42.google.com with SMTP id t59so435590yho.29
	for <qemu-trivial@nongnu.org>; Wed, 08 May 2013 06:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:in-reply-to:references:user-agent
	:date:message-id:mime-version:content-type:x-gm-message-state;
	bh=Hq7up1sP0XoMSl8yAQRz49fEbHuiq+e1F4E309tstOA=;
	b=QQtcKdPQtEniwxIz1Az04RI1NFaKsz2L0yXp0KpHlS7NNXGU4Z6XsGLN7W6zWewcSX
	g6KiR4aNarSY7sQAF6pfY5UYf+QvV7kpM0Tc9uLgJDRikt+wlnRnCRzTPYn2/MxL7ARh
	1Jn7rccnRKnL8RKBUPcL9Ou9lKzXZKJO6pcaD4U6deRa+aPArjopqGpw05WBYhhyEq66
	Bk33b18k0e8tu8zGWzWAxfWLvpmu9kTQx17egjohorlAfapC6vDV/0YaPqINglDODs/w
	p0uXRo+zrtVZrR+usDnCzwa/5cRpsM+owe19MWFQZr6ltMXUpMKxlmV1PclvzDWN8SvL
	+q+Q==
X-Received: by 10.236.145.6 with SMTP id o6mr5384675yhj.18.1368019536601;
	Wed, 08 May 2013 06:25:36 -0700 (PDT)
Received: from titi.smtp.gmail.com ([66.187.233.207])
	by mx.google.com with ESMTPSA id i75sm63800687yhi.9.2013.05.08.06.25.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 08 May 2013 06:25:36 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: Michael Tokarev <mjt@tls.msk.ru>, Trival <wdongxu@linux.vnet.ibm.com>
In-Reply-To: <518A4A2E.200@msgid.tls.msk.ru>
References: <1368006380-3125-1-git-send-email-trivial@linux.vnet.ibm.com>
	<1368006380-3125-2-git-send-email-trivial@linux.vnet.ibm.com>
	<518A4A2E.200@msgid.tls.msk.ru>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Wed, 08 May 2013 08:25:33 -0500
Message-ID: <87vc6t61te.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQlrwNubokNIcSecRb8x3ZfAe2wfCtMoiO66XgFnWwfJRg9iW00VbcTHiJqU4UeQ5ATv73Sq
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c01::22a
Cc: qemu-trivial@nongnu.org, Trival <trivial@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] remove needless
	semicolon
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
X-List-Received-Date: Wed, 08 May 2013 13:25:49 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 08.05.2013 13:46, Trival wrote:
>> Signed-off-by: Trival <trivial@linux.vnet.ibm.com>

Something went wrong in sending this.  This is not a valid SoB.

Regards,

Anthony Liguori

>> ---
>>  block/nbd.c                 | 2 +-
>>  fsdev/virtfs-proxy-helper.c | 4 ++--
>>  hw/9pfs/virtio-9p-local.c   | 2 +-
>>  hw/i386/pc_q35.c            | 2 +-
>>  hw/intc/imx_avic.c          | 2 +-
>>  hw/usb/host-linux.c         | 4 ++--
>>  qga/channel-win32.c         | 2 +-
>>  7 files changed, 9 insertions(+), 9 deletions(-)
>
> Applied to the trivial queue.  I renamed the patch to be
> "remove double semicolons", to better describe what it does.
>
> Thank you!
>
> /mjt

