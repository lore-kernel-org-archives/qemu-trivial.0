Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R1wun-0002cp-0J
	for mharc-qemu-trivial@gnu.org; Fri, 09 Sep 2011 04:58:25 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R1wuk-0002cR-5B
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2011 04:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R1wui-0001L6-Gf
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2011 04:58:22 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:43049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R1wui-0001Kz-BK; Fri, 09 Sep 2011 04:58:20 -0400
Received: by fxbb27 with SMTP id b27so2595723fxb.4
	for <multiple recipients>; Fri, 09 Sep 2011 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZtLBO6YcobtzqBrxySSiaho3IuQK7cc1TMmJ9o06dVU=;
	b=QSg0DDE1dTVSUTy37dEPFxHBIhK1IM1TWmvdcfBFued7IIYNks9imzwn/gtpF6pUOL
	CuS6FUhmT7W0snKi2SRLKHjZ0Nc5IajiHi1/KrG2YzlBFuDzKeSHgCvWgiWo+ff4S7i0
	JwCxfnQ73mvPv6h2XOT7nSVDGzrLP4vyQHxDs=
Received: by 10.223.41.149 with SMTP id o21mr61886fae.19.1315558699322;
	Fri, 09 Sep 2011 01:58:19 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id o16sm772058fag.21.2011.09.09.01.58.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 01:58:17 -0700 (PDT)
Date: Fri, 9 Sep 2011 09:58:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110909085814.GA7699@stefanha-thinkpad.localdomain>
References: <1311143248-29509-1-git-send-email-weil@mail.berlios.de>
	<87aac9wakl.fsf@linux.vnet.ibm.com>
	<4E68EA84.3020204@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E68EA84.3020204@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] virtio-9p: Fix syntax error in debug code
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
X-List-Received-Date: Fri, 09 Sep 2011 08:58:23 -0000

On Thu, Sep 08, 2011 at 06:17:08PM +0200, Stefan Weil wrote:
> Am 20.07.2011 11:44, schrieb Aneesh Kumar K.V:
> >On Wed, 20 Jul 2011 08:27:28 +0200, Stefan Weil
> ><weil@mail.berlios.de> wrote:
> >>This error was reported by cppcheck:
> >>
> >>qemu/hw/9pfs/virtio-9p-debug.c:342:
> >>error: Invalid number of character ({) when these macros are defined:
> >>'DEBUG_DATA'.
> >>
> >>Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> >>Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> >>---
> >>hw/9pfs/virtio-9p-debug.c | 2 +-
> >>1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >>diff --git a/hw/9pfs/virtio-9p-debug.c b/hw/9pfs/virtio-9p-debug.c
> >>index 4636ad5..96925f0 100644
> >>--- a/hw/9pfs/virtio-9p-debug.c
> >>+++ b/hw/9pfs/virtio-9p-debug.c
> >>@@ -295,7 +295,7 @@ static void pprint_data(V9fsPDU *pdu, int
> >>rx, size_t *offsetp, const char *name)
> >>
> >>if (rx) {
> >>count = pdu->elem.in_num;
> >>- } else
> >>+ } else {
> >>count = pdu->elem.out_num;
> >>}
> >>
> >
> >Applied.
> >
> >We also need to update virtio-9p-debug w.r.t the new co-routine
> >series. With co-routine we can have multiple 9p handler started
> >simultaneously.
> >
> >-aneesh
> 
> Maybe this patch can be applied via qemu-trivial.
> I simply would like to get it out of my list of open patches.

I checked with Aneesh who agreed to move this patch through the
trivial-patches tree.  This patch has been applied to the trivial
patches -next tree:

http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

