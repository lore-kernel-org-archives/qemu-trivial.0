Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5dfl-00008c-Jd
	for mharc-qemu-trivial@gnu.org; Thu, 08 Mar 2012 08:46:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1S5dfe-00007U-Ax
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 08:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1S5dfH-0002ME-2q
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 08:46:17 -0500
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:58523)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1S5dfG-0002L7-Hp
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 08:45:55 -0500
Received: from /spool/local
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <dwg@au1.ibm.com>;
	Thu, 8 Mar 2012 13:40:03 +1000
Received: from d23relay05.au.ibm.com (202.81.31.247)
	by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 8 Mar 2012 13:40:01 +1000
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q28Ddjs32945038; Fri, 9 Mar 2012 00:39:47 +1100
Received: from d23av02.au.ibm.com (loopback [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q28DjP65010147; Fri, 9 Mar 2012 00:45:26 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.190.163.12])
	by d23av02.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q28DjPUA010144; Fri, 9 Mar 2012 00:45:25 +1100
Received: by ozlabs.au.ibm.com (Postfix, from userid 1010)
	id B385C73A0A; Fri,  9 Mar 2012 00:45:25 +1100 (EST)
Date: Thu, 8 Mar 2012 21:25:47 +1100
From: David Gibson <dwg@au1.ibm.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120308102547.GF10735@truffala.fritz.box>
Mail-Followup-To: Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Blue Swirl <blauwirbel@gmail.com>
References: <1331168981-13139-1-git-send-email-david@gibson.dropbear.id.au>
	<1331168981-13139-2-git-send-email-david@gibson.dropbear.id.au>
	<4F584D5E.304@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F584D5E.304@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
x-cbid: 12030803-0260-0000-0000-000000AA77E4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.81.31.140
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] cache-utils.h needs
 stdint.h for uintptr_t
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
X-List-Received-Date: Thu, 08 Mar 2012 13:46:24 -0000

On Thu, Mar 08, 2012 at 07:10:38AM +0100, Stefan Weil wrote:
> Am 08.03.2012 02:09, schrieb David Gibson:
> >cache-utils.h uses the C99 standard uintptr_t type.  However, that type
> >comes from stdint.h which is not #included before cache-utils.h in all
> >configurations.  This patch adds the necessary include to fix this.
> >
> >Signed-off-by: David Gibson<david@gibson.dropbear.id.au>
> >---
> >  cache-utils.h |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >
> >diff --git a/cache-utils.h b/cache-utils.h
> >index 04a6e2e..b0f1786 100644
> >--- a/cache-utils.h
> >+++ b/cache-utils.h
> >@@ -1,6 +1,8 @@
> >  #ifndef QEMU_CACHE_UTILS_H
> >  #define QEMU_CACHE_UTILS_H
> >
> >+#include<stdint.h>
> >+
> >  #if defined(_ARCH_PPC)
> >  struct qemu_cache_conf {
> >      unsigned long dcache_bsize;
> 
> The include statement is only needed for _ARCH_PPC.
> 
> See http://patchwork.ozlabs.org/patch/144763/ which
> fixes the same issue.

Ok, cool, didn't spot that one.

> Anthony, Blue, could someone please commit my patch?
> 
> Regards,
> 
> Stefan W.
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson


