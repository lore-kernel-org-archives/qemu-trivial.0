Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WouCG-0007Kg-VO
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 08:40:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WouC6-00070c-7I
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 08:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WouBx-0002zM-77
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 08:39:58 -0400
Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230]:65386)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WouBc-0002ah-1X; Mon, 26 May 2014 08:39:28 -0400
Received: by mail-we0-f176.google.com with SMTP id q59so7802862wes.7
	for <multiple recipients>; Mon, 26 May 2014 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mVl2iRm1eUTCdHrsC+kqdYcDxo/ADLudvQ4eA37X2/c=;
	b=gLqeQmzMasffJVWrazKAIBslpE1y8D4Ja7EbVwttXbXZIcuDn5VbGoITVtBy+6Xi0s
	8UCLeU929E36FF4u/KGSXn/s6a60YowdCqODfHazU4ZnOOBB8pvxptMgktHGKZyaboOi
	DFAhRfuFV+1wuLsdGuBGPa2L+3kM8TywwTD6D/LJJ1TljO6y/U08msv9Xmfi7fgrfUs6
	SmHRuhXIven7heEYJ81eBi10fFxjksajt1d8wRkR4UnChp2BO3DCdp2FT2e3n8CNUOBB
	iPLw81mpxpUT1hvNTAClHeNGPGbHRgNWqWFDcmagtDa9DKv9EFE/ko0E6hAFzz7hHKMH
	JAmA==
X-Received: by 10.195.13.76 with SMTP id ew12mr27417587wjd.80.1401107966254;
	Mon, 26 May 2014 05:39:26 -0700 (PDT)
Received: from localhost (95-90-192-172-dynip.superkabel.de. [95.90.192.172])
	by mx.google.com with ESMTPSA id
	wl6sm26624135wjc.6.2014.05.26.05.39.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 May 2014 05:39:25 -0700 (PDT)
Date: Mon, 26 May 2014 14:39:22 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Le Tan <tamlokveer@gmail.com>
Message-ID: <20140526123922.GF10187@stefanha-thinkpad.redhat.com>
References: <1401068643-28655-1-git-send-email-tamlokveer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401068643-28655-1-git-send-email-tamlokveer@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::230
Cc: kwolf@redhat.com, peter.crosthwaite@xilinx.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, qemu-devel@nongnu.org, jan.kiszka@web.de,
	stefanha@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] block: replace
 fprintf(stderr, ...) with error_report()
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
X-List-Received-Date: Mon, 26 May 2014 12:40:07 -0000

On Mon, May 26, 2014 at 09:44:03AM +0800, Le Tan wrote:
> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
> have been removed because @fmt of error_report() should not contain newline.
> 
> Signed-off-by: Le Tan <tamlokveer@gmail.com>
> ---
>  block-migration.c      |    6 +--
>  block.c                |    4 +-
>  block/qcow2-refcount.c |  115 +++++++++++++++++++++---------------------
>  block/qcow2.c          |   16 +++---
>  block/raw-posix.c      |    8 ++-
>  block/raw-win32.c      |    6 +--
>  block/ssh.c            |    2 +-
>  block/vdi.c            |   14 +++---
>  block/vmdk.c           |   15 +++---
>  block/vpc.c            |    4 +-
>  block/vvfat.c          |  129 ++++++++++++++++++++++++------------------------
>  blockdev.c             |    6 +--
>  12 files changed, 159 insertions(+), 166 deletions(-)

There is one thing that worries me about this:

error_report() assumes that the QEMU global mutex is held in order to
access the "current monitor".

This is problematic for code in the read/write/flush path (like qcow2
refcount allocation) since it can be invoked from a virtio-blk
data-plane thread (where the QEMU global mutex is not held).

For the time being, I prefer keeping the fprintf().  In the long term we
need to decide:
1. Some functions should use Error * to report errors.
2. Some functions really produce their own output but it probably
shouldn't go to the monitor.
3. The remaining functions may really be error_report() candidates.

Stefan

