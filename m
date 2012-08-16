Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1ux4-0001A7-Lq
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2012 03:57:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1ux3-00019z-7v
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 03:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1ux2-0000IY-3p
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 03:57:09 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:53975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1ux1-0000IT-T9; Thu, 16 Aug 2012 03:57:08 -0400
Received: by wibhm2 with SMTP id hm2so301699wib.10
	for <multiple recipients>; Thu, 16 Aug 2012 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2x2F2yhvwvbHxtWg4DQZBo1lUUpqwtQYCZzWUD04Q/I=;
	b=yFGtTQOVxhOC6T10NRtrlyKb6NgCLdHpHgwWpUw751o5OxWyo+8DpS0EQZ8aGqDZuq
	fErs2+oIDlhlq0Q0yv4qPDilHHm9ICmtEOpEdO/W3Kwwvmu/OOB7W1+br+yyuX8rJtiz
	z5oIW9u8u7Wt9uLqTVOTVfkLKRM49GiSa55TAlglgvavN+DyY80wjddmuFnW6E8h6MYd
	jEzxIneblc0Q5FTP2wL0JVh0tAoMEweWFnacMFR6XyRBsI54+W/2moFZa7rYV1At34Ft
	ajBvulvjOotsG+krBDwzkqGkhK41WZldujhVrDNytVR4n8l1IIfPRfdFfvfLsDD3tFpo
	HGSw==
Received: by 10.216.138.220 with SMTP id a70mr149170wej.170.1345103826729;
	Thu, 16 Aug 2012 00:57:06 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id l5sm3881971wix.5.2012.08.16.00.57.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 00:57:06 -0700 (PDT)
Date: Thu, 16 Aug 2012 07:53:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120816065352.GA17802@stefanha-thinkpad.localdomain>
References: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
	<1344629007-23311-3-git-send-email-sw@weilnetz.de>
	<20120815141608.GJ10742@stefanha-thinkpad.localdomain>
	<502BC75E.8060404@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <502BC75E.8060404@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] srp: Don't use QEMU_PACKED for single
 elements of a structured type
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
X-List-Received-Date: Thu, 16 Aug 2012 07:57:10 -0000

On Wed, Aug 15, 2012 at 05:59:26PM +0200, Stefan Weil wrote:
> Am 15.08.2012 16:16, schrieb Stefan Hajnoczi:
> >On Fri, Aug 10, 2012 at 10:03:27PM +0200, Stefan Weil wrote:
> >>QEMU_PACKED results in a MinGW compiler warning when it is
> >>used for single structure elements:
> >>
> >>warning: 'gcc_struct' attribute ignored
> >>
> >>Using QEMU_PACKED for the whole structure avoids the compiler warning
> >>without changing the memory layout.
> >Quick link for other reviewers:
> >http://gcc.gnu.org/onlinedocs/gcc-4.7.1/gcc/Type-Attributes.html#Type-Attributes
> >
> >>Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >>---
> >>  hw/srp.h |    8 ++++----
> >>  1 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/hw/srp.h b/hw/srp.h
> >>index 3009bd5..5e0cad5 100644
> >>--- a/hw/srp.h
> >>+++ b/hw/srp.h
> >>@@ -177,13 +177,13 @@ struct srp_tsk_mgmt {
> >>      uint8_t    reserved1[6];
> >>      uint64_t   tag;
> >>      uint8_t    reserved2[4];
> >>-    uint64_t   lun QEMU_PACKED;
> >>+    uint64_t   lun;
> >>      uint8_t    reserved3[2];
> >>      uint8_t    tsk_mgmt_func;
> >>      uint8_t    reserved4;
> >>      uint64_t   task_tag;
> >>      uint8_t    reserved5[8];
> >>-};
> >>+} QEMU_PACKED;
> >Here I actually see a difference for the uint64_t task_tag field.
> >Previously it was not packed, now it is packed and because it has 4 *
> >uint8_t before it there will be a difference in layout.
> >
> >Looking at how QEMU accesses srp_tsk_mgmt, I think we're safe because we
> >never actually access task_tag?
> >
> >Ben: Any thoughts on this patch?
> >
> >Stefan
> 
> 4 * uint8_t + 4 bytes from the packed lun, so there is no change
> for task_tag, it's always on a 8 byte boundary!

Ah, yes, I see it now!  Glad we're switching to struct-level packing :).

Stefan

