Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1US1I6-0007L5-RK
	for mharc-qemu-trivial@gnu.org; Tue, 16 Apr 2013 04:31:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1US1I0-0007AF-6j
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2013 04:31:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1US1Hy-0006Wc-UE
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2013 04:30:56 -0400
Received: from mail-ea0-x22c.google.com ([2a00:1450:4013:c01::22c]:49910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1US1Hq-0006UJ-KG; Tue, 16 Apr 2013 04:30:46 -0400
Received: by mail-ea0-f172.google.com with SMTP id z7so103420eaf.17
	for <multiple recipients>; Tue, 16 Apr 2013 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=28rtZpO3f1as6ujXfy6clkmbAorxPWISv9t7i1mdjJE=;
	b=TkMSEYipS8cRRKWq07+QDuiVhjNqEOe21sDBhSJZ+6uiPOu9GPPJdDjmTJrZUAt/dy
	lHxg3O1thMx0WDZ+WHunz1FLfxEy92uYKneTKl65XZk/LDGtRxGw1CNkLPjo0DJEzG55
	w0aX9PNPH3mXTV3ZVpRGB0dbZhuwZnSo5IDRMkO/NNR/v2jZ66GYxjZvYd85I1zBlQeZ
	4vb+gUijNQALxzxGyL0WmNYYlFCg2jvXdvaI+sz8EsEEPlYrVuz0QAWpdbLEhDdFsr9P
	xamuzS6ZLS7CyEKwwEqmvM6BXmHJxOckl7oZ+22C0n0Ffu0dOLIzG+pOF0MRZ7ITMjzG
	/bzA==
X-Received: by 10.14.107.69 with SMTP id n45mr4031543eeg.23.1366101045621;
	Tue, 16 Apr 2013 01:30:45 -0700 (PDT)
Received: from localhost (h59ec325f.selukar.dyn.perspektivbredband.net.
	[89.236.50.95])
	by mx.google.com with ESMTPS id n48sm1385376eeg.12.2013.04.16.01.30.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 01:30:45 -0700 (PDT)
Date: Tue, 16 Apr 2013 10:30:40 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: peter.crosthwaite@xilinx.com
Message-ID: <20130416083040.GJ26210@smtp.vpn>
References: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22c
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3 0/4]  m25p80: Fix debug printfery
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
X-List-Received-Date: Tue, 16 Apr 2013 08:31:01 -0000

On Tue, Apr 16, 2013 at 10:32:14AM +1000, peter.crosthwaite@xilinx.com wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 
> Fix up the debug printfery m25p80 in various ways. 0 functional diff.
> 
> changed from v2:
> Rebased against hw reorg

Applied, thanks!

Cheers,
Edgar

> 
> 
> Peter Crosthwaite (4):
>   m25p80: Fix debug messages.
>   m25p80: Convert guest errors to LOG_GUEST_ERROR
>   m25p80.c: Multiple debug verbosity levels
>   m25p80: Add debug message for no bdrv
> 
>  hw/block/m25p80.c |   52 +++++++++++++++++++++++++++++-----------------------
>  1 files changed, 29 insertions(+), 23 deletions(-)
> 

