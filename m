Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmCez-0004ij-RA
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 20:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmCeu-0004hg-5H
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 20:42:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmCep-0002Q0-GL
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 20:42:00 -0400
Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a]:52905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmCep-0002Pq-A2
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 20:41:55 -0400
Received: by mail-bk0-f42.google.com with SMTP id jk13so3661410bkc.1
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 17:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=SSTscuu+zOkwV6lctqmX1mqNHVH5UTgHwL1lzss/DNE=;
	b=NaK4Dd9BU9JWhXEr/7uVgxZHedJZlRFrVl906hLdfLCQaSod7Yyk4QhHbfdef+1GyK
	6KXIIgJI2mq8pnSweY/TGAlQ5P10dbFQClTbnF4iuhPCtLmMAesKM1XuQED6mTqIzUhW
	SJkJ/sLUx3+W9phkJymjTLhF+5MqAacXLnKMdCO3x0me7csoPvQLhSEaKPNP6HrKklxg
	JZZUbE/ASWOhIVoJSr+fa9NvPgiKH3hB39WVG7gZRf5BC7JZvHkOwcI4JN8o5wbVynJZ
	wbCbAM7uSfLNSgARJ7REbCs/5L/ASSK76WMCyoJToC4VQKfOZKDjeZIEcuKFAfH5/oUE
	bPmA==
MIME-Version: 1.0
X-Received: by 10.205.34.132 with SMTP id ss4mr1880590bkb.125.1370911314051;
	Mon, 10 Jun 2013 17:41:54 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Mon, 10 Jun 2013 17:41:53 -0700 (PDT)
In-Reply-To: <51B26065.3000705@msgid.tls.msk.ru>
References: <cover.1370572420.git.peter.crosthwaite@xilinx.com>
	<1ec46fbd250efe78699a1e4cf6838c0c88f4acc7.1370572420.git.peter.crosthwaite@xilinx.com>
	<CAEgOgz7vk_8z+KzFMfj0iWjLPeykkLUP4ePu8AECLSHn1t3KcQ@mail.gmail.com>
	<51B26065.3000705@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 10:41:53 +1000
X-Google-Sender-Auth: Kyhf7L-rfGvZIj9S6vc3wzCMa6E
Message-ID: <CAEgOgz7RRbcT_0Vyga=NQv-8cAjthm4Gn8RzZrTvfGdu3KRpAA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQkn89ELn1frRG3xwEGKYzGGBMR9C8A3iD3rzyTExbTrYTtrDh7Z4eAVHarsSGWfxwXUtozu
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22a
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/5] intc/xilinx_intc:
	Use qemu_set_irq
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
X-List-Received-Date: Tue, 11 Jun 2013 00:42:04 -0000

On Sat, Jun 8, 2013 at 8:36 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 07.06.2013 06:39, Peter Crosthwaite wrote:
>>> Use qemu_set_irq rather than if-elsing qemu_irq_(lower|raise). No
>>> functional change, just reduces verbosity.
>
> Thanks, applied to the trivial patches queue.
>

Thanks,

I need to respin the later patches in this series but as you have
taken this ill drop it from the respin. No conflict issues.

Regards,
Peter

> /mjt
>

