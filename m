Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RT97L-0001b8-58
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 04:27:47 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT97I-0001aQ-Eg
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:27:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT97C-00052D-PD
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:27:44 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:55232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT97C-000524-JF
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:27:38 -0500
Received: by bkbzu5 with SMTP id zu5so1508265bkb.4
	for <qemu-trivial@nongnu.org>; Wed, 23 Nov 2011 01:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rBOI5ifSKYYCUOZQlpuH0zsSyHFh7X4tCDwLmBlOA3o=;
	b=H50Fm2Zpi8SpA97qUPSxeNjogvPc+C7aO4ikQONPm+6ggeeJkRy+oWwS5D6ledBtCt
	PWAvXRrJ8k+ucZL82rcW3vYNC2NOymgvR1F17ZBU4YkB4FiDHiJQysS85TjCpJyqm0X1
	CqKlWdWgYHtecQYYtItVbMRhr2X3lU7iN3UXs=
Received: by 10.204.156.219 with SMTP id y27mr23177890bkw.125.1322040457605;
	Wed, 23 Nov 2011 01:27:37 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id j9sm12333286bkd.2.2011.11.23.01.27.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 01:27:36 -0800 (PST)
Date: Wed, 23 Nov 2011 09:27:33 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Julian Pidancet <julian.pidancet@gmail.com>
Message-ID: <20111123092733.GA11867@stefanha-thinkpad.localdomain>
References: <77eaa9e77eb6236511d0fe4f209664c8855f8062.1321302712.git.julian.pidancet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77eaa9e77eb6236511d0fe4f209664c8855f8062.1321302712.git.julian.pidancet@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] rtl8139: Fix invalid IO access
	alignment
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
X-List-Received-Date: Wed, 23 Nov 2011 09:27:45 -0000

On Wed, Nov 23, 2011 at 01:03:15AM +0000, Julian Pidancet wrote:
> This patch makes iPXE work with the rtl8139 emulation. The rtl8139
> driver in iPXE issues a 16bit access on the ChipCmd register
> (offset 0x37) to check the status of the rx buffer. The offset of the
> ioport access was getting fixed up to 0x36 in qemu, causing the value
> read in iPXE to be invalid.
> 
> This fixes an issue with iPXE reporting timeouts during TFTP transfers.
> 
> Reposting this here because it is trivial enough and the original post
> on qemu-devel didn't attract much attention.
> 
> Also, the inw() which was causing the issue has been replaced with an
> inb() in upstream iPXE:
> https://git.ipxe.org/ipxe.git/commit/91dd64ad25baa27954a7518e73df4fca8a2d0c93
> 
> Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
> ---
>  hw/rtl8139.c |   14 +-------------
>  1 files changed, 1 insertions(+), 13 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

