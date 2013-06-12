Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmrOy-0003a8-C8
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 16:12:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1UmrOs-0003TY-6X
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 16:12:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1UmrOp-0000a7-QW
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 16:12:10 -0400
Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d]:57812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1UmrOp-0000Zq-Ky; Wed, 12 Jun 2013 16:12:07 -0400
Received: by mail-ob0-f173.google.com with SMTP id wc20so14018656obb.32
	for <multiple recipients>; Wed, 12 Jun 2013 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N3oBg2ol2gwz+vVJP/yK2jv7CCBMyHGkWCjyJH6eybs=;
	b=a8vQ6NxogMnDiUsj807btvFbWjXdUlUpBSqJMGegAwO/FIwvU5aH/0V1nhp73rTkGD
	GWO9UJJbQLiSXGrjjU3f71OkVviBmNe/zlDUeuislOhImbH+FgL8p7iEDsqYSMnfMsMl
	gkqeygOE+UrV2f6QDwmWpibrjKGhiwm3Xkn48y6mvmPYA+RFVV+boskdJywCUqFbSFQx
	6Ur9Xb9i4ymuM//3Srvljgic/cSxA20OF6swgj0LeOZjYtuuHMqDC/9BPhR2FYpQZWBO
	PwXZeYNKKc9Vm2TydkBpv8U4ZvOIOm6pvyS0w/aMI4eFmUf3ntQ8vJbrOXI6+y8Fu6Yo
	Z0wg==
X-Received: by 10.60.133.202 with SMTP id pe10mr16970123oeb.56.1371067926934; 
	Wed, 12 Jun 2013 13:12:06 -0700 (PDT)
Received: from localhost ([32.97.110.51]) by mx.google.com with ESMTPSA id
	nt17sm34930390obb.13.2013.06.12.13.12.04 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 13:12:06 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Date: Wed, 12 Jun 2013 15:11:51 -0500
From: mdroth <mdroth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Message-ID: <20130612201151.GF12585@vm>
References: <1369175577-18130-1-git-send-email-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1369175577-18130-1-git-send-email-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22d
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-stable@nongnu.org,
	nick@bytemark.co.uk
Subject: Re: [Qemu-trivial] [PATCH] wdt_i6300esb: fix vmstate versioning
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
X-List-Received-Date: Wed, 12 Jun 2013 20:12:15 -0000

On Tue, May 21, 2013 at 05:32:57PM -0500, Michael Roth wrote:
> When this VMSD was introduced it's version fields were set to
> sizeof(I6300State), making them essentially random from build to build,
> version to version.
> 
> To fix this, we lock in a high version id and low minimum version id to
> support old->new migration from all prior versions of this device's
> state. This should work since the device state has not changed since
> its introduction.
> 
> The potentially breaks migration from 1.5+ to 1.5, but since the
> versioning was essentially random prior to this patch, new->old
> migration was not consistently functional to begin with.
> 
> Reported-by: Nicholas Thomas <nick@bytemark.co.uk>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>

CC'ing qemu-trivial. Looking to get this in for 1.5.1

> ---
>  hw/watchdog/wdt_i6300esb.c |   19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
> index 1407fba..851b664 100644
> --- a/hw/watchdog/wdt_i6300esb.c
> +++ b/hw/watchdog/wdt_i6300esb.c
> @@ -374,9 +374,22 @@ static const MemoryRegionOps i6300esb_ops = {
>  
>  static const VMStateDescription vmstate_i6300esb = {
>      .name = "i6300esb_wdt",
> -    .version_id = sizeof(I6300State),
> -    .minimum_version_id = sizeof(I6300State),
> -    .minimum_version_id_old = sizeof(I6300State),
> +    /* With this VMSD's introduction, version_id/minimum_version_id were
> +     * erroneously set to sizeof(I6300State), causing a somewhat random
> +     * version_id to be set for every build. This eventually broke
> +     * migration.
> +     *
> +     * To correct this without breaking old->new migration for older versions
> +     * of QEMU, we've set version_id to a value high enough to exceed all past
> +     * values of sizeof(I6300State) across various build environments, and have
> +     * reset minimum_version_id_old/minimum_version_id to 1, since this VMSD
> +     * has never changed and thus can except all past versions.
> +     *
> +     * For future changes we can treat these values as we normally would.
> +     */
> +    .version_id = 10000,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,
>      .fields      = (VMStateField []) {
>          VMSTATE_PCI_DEVICE(dev, I6300State),
>          VMSTATE_INT32(reboot_enabled, I6300State),
> -- 
> 1.7.9.5
> 

