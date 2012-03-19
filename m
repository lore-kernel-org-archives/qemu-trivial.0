Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9ZSI-00078d-E9
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 06:04:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9ZSE-0006xK-Jd
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 06:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9ZS4-0000Jz-NX
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 06:04:42 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:64809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S9ZS4-0000IR-Eu; Mon, 19 Mar 2012 06:04:32 -0400
Received: by mail-wi0-f175.google.com with SMTP id hn6so3101860wib.10
	for <multiple recipients>; Mon, 19 Mar 2012 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=QvYKIyRydXbmxYHJFtkeXA8NO0LWFRyUWJQQrK1J42w=;
	b=SGOav+PmiuxgEa3gIqxPOM/SUphiZfzmu9pm9Uaj7ynCr8QCvRS2DM+/O6O2MBWaqB
	QcsbM/4DVyVOqBzURVqfaUogGWKjCVIv8TI0RA6pBJqgvtmFex7Ob2JE/wWn2uv3FWsI
	Tra8SWoyYfEY8VXQUXK3swXX3QIOdlhU1dSKGpNZOqZxEPBIg4qQQUIDDn5v2Y5zLAwb
	4MXLTRzoiGNmc+m04NkaBmlb4rvmMFvVBJRmzKfk0SGy3nJsCh9ZDIsuTbTymH5Nimk8
	rKUOc05uJ0QStD8H7gPKpCnwlBuy6EhtpLCi9Mp5wT82Up5J/9GwiiVy4MW5UkpNf28w
	vLFg==
Received: by 10.180.84.164 with SMTP id a4mr18523526wiz.2.1332151471006;
	Mon, 19 Mar 2012 03:04:31 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	fw5sm24439682wib.0.2012.03.19.03.04.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 03:04:30 -0700 (PDT)
Date: Mon, 19 Mar 2012 08:49:07 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Message-ID: <20120319084907.GA21464@stefanha-thinkpad.localdomain>
References: <20120319031957.17031.94258.stgit@amd-6168-8-1.englab.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120319031957.17031.94258.stgit@amd-6168-8-1.englab.nay.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, afaerber@suse.de,
	stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [REPOST PATCH] ioapic: fix build with
	DEBUG_IOAPIC
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
X-List-Received-Date: Mon, 19 Mar 2012 10:04:44 -0000

On Mon, Mar 19, 2012 at 11:19:57AM +0800, Jason Wang wrote:
> ioapic.c:198: error: format ‘%08x’ expects type ‘unsigned int’, but argument 3 has type ‘uint64_t’
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/ioapic.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

