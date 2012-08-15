Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1eOO-0007PK-Uw
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 10:16:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1eOM-0007Oo-Pr
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1eOL-0006hX-CE
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:16:14 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:55996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1eOL-0006hT-4E; Wed, 15 Aug 2012 10:16:13 -0400
Received: by wgbfm10 with SMTP id fm10so1149181wgb.10
	for <multiple recipients>; Wed, 15 Aug 2012 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lWJ36ZUCugJD8sf58YV/VClRi+rNQLp/oC/G/KLlBco=;
	b=TM4xCie7DXsO0WA2FOe14wVMNI4CmnHC0gJB9Nxs8nMuDt+L168SfhVy/4I9eCwpjf
	lig6NmklXMXzVFClNDe7qmkPOZLQbrwbycBvP1UB2MttcipbQm44WlkrR6UAtWA3cy5P
	yk2Hb6YVJ7QPQC7kEJ2BHE8iUvYYX0MDBVphJktJ5hyTwuITy2lqGS9bLEaZVEXeZ9rc
	RgQ2dbJ0QgZYMCLpvRTKZ8ibVZdHIVadDuHTEmkstXVAveB9yDrC7G43Q6Iit/UFCSX8
	PWm3mFRhjStVnpLhlwLBAO9nDNIH/NF7u4yYorbu38L1/qvywix/alwHiy3Ks3N/s2hr
	qTNA==
Received: by 10.180.100.133 with SMTP id ey5mr37435040wib.4.1345040172111;
	Wed, 15 Aug 2012 07:16:12 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t8sm28869492wiy.3.2012.08.15.07.16.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 07:16:11 -0700 (PDT)
Date: Wed, 15 Aug 2012 15:16:08 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-ID: <20120815141608.GJ10742@stefanha-thinkpad.localdomain>
References: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
	<1344629007-23311-3-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344629007-23311-3-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Wed, 15 Aug 2012 14:16:16 -0000

On Fri, Aug 10, 2012 at 10:03:27PM +0200, Stefan Weil wrote:
> QEMU_PACKED results in a MinGW compiler warning when it is
> used for single structure elements:
> 
> warning: 'gcc_struct' attribute ignored
> 
> Using QEMU_PACKED for the whole structure avoids the compiler warning
> without changing the memory layout.

Quick link for other reviewers:
http://gcc.gnu.org/onlinedocs/gcc-4.7.1/gcc/Type-Attributes.html#Type-Attributes

> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/srp.h |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/srp.h b/hw/srp.h
> index 3009bd5..5e0cad5 100644
> --- a/hw/srp.h
> +++ b/hw/srp.h
> @@ -177,13 +177,13 @@ struct srp_tsk_mgmt {
>      uint8_t    reserved1[6];
>      uint64_t   tag;
>      uint8_t    reserved2[4];
> -    uint64_t   lun QEMU_PACKED;
> +    uint64_t   lun;
>      uint8_t    reserved3[2];
>      uint8_t    tsk_mgmt_func;
>      uint8_t    reserved4;
>      uint64_t   task_tag;
>      uint8_t    reserved5[8];
> -};
> +} QEMU_PACKED;

Here I actually see a difference for the uint64_t task_tag field.
Previously it was not packed, now it is packed and because it has 4 *
uint8_t before it there will be a difference in layout.

Looking at how QEMU accesses srp_tsk_mgmt, I think we're safe because we
never actually access task_tag?

Ben: Any thoughts on this patch?

Stefan

