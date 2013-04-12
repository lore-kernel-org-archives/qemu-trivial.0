Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQc7C-0001SE-52
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:25:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQc79-0001OQ-AI
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQc78-00072n-96
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:25:55 -0400
Received: from mail-wg0-f43.google.com ([74.125.82.43]:39140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UQc71-0006zX-93; Fri, 12 Apr 2013 07:25:47 -0400
Received: by mail-wg0-f43.google.com with SMTP id f12so2590293wgh.10
	for <multiple recipients>; Fri, 12 Apr 2013 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=fhSZwpzx1ONZmTjPTR94bqOqGizta6ms1v8tPk0A89c=;
	b=I5AW4M4LZzHMR6OurEipKIQS/ZN3wltoMLOU4IcfICXPjQht6+FLutHASLsICH2svu
	dJikP91fA89kO6DOlv23+w25BmYC4kFItWtZJIzgQ2l39vIe2T3phW+mYINc2LQEfPgg
	RmCxlFsBPj7CSOkp6mCkMfITNtDo9irb0Yk9NfCJWupS1fRYjd4NVZ2bqtcAFjFhqmKH
	vKFEgrDAH6m1G5Ni8zVc7iwlqbVtQBYscRaUNIZk/r5RAc/cvD+j4trz3NwRFcUXU7xh
	SwsGZ6Vqi9ox82mKwitPRJYh611G/zrLnAHWd4z4iG6+p/hUvajdVj7yNltDvADerVV9
	pA/w==
X-Received: by 10.180.37.101 with SMTP id x5mr3448431wij.0.1365765946372;
	Fri, 12 Apr 2013 04:25:46 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id bj9sm2732841wib.4.2013.04.12.04.25.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:25:45 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:25:43 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20130412112543.GB9747@stefanha-thinkpad.redhat.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.43
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 0/4]  m25p80: Fix debug printfery
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
X-List-Received-Date: Fri, 12 Apr 2013 11:25:56 -0000

On Sun, Apr 07, 2013 at 03:53:29PM +1000, Peter Crosthwaite wrote:
> Fix up the debug printfery m25p80 in various ways. 0 functional diff.
> 
> 
> Peter Crosthwaite (4):
>   m25p80: Fix debug messages.
>   m25p80: Convert guest errors to LOG_GUEST_ERROR
>   m25p80.c: Multiple debug verbosity levels
>   m25p80: Add debug message for no bdrv
> 
>  hw/m25p80.c |   52 +++++++++++++++++++++++++++++-----------------------
>  1 files changed, 29 insertions(+), 23 deletions(-)

No longer applies due to hw/ reorganization.  Please resend.

Stefan

