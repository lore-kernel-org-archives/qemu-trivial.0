Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Umsah-00019B-2b
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 17:28:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1Umsae-00015C-6x
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 17:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1Umsad-0002vq-0C
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 17:28:24 -0400
Received: from mail-oa0-x22d.google.com ([2607:f8b0:4003:c02::22d]:43817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1Umsac-0002vc-SV; Wed, 12 Jun 2013 17:28:22 -0400
Received: by mail-oa0-f45.google.com with SMTP id j1so2919132oag.4
	for <multiple recipients>; Wed, 12 Jun 2013 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tUu1ybMY6q1TJmRbI1Ll1TdTDioOx4cwcFrSj0u8uHA=;
	b=IAJ+Z49Uwn/v3NT65iABhV1GYZ8a4LAWbQGSYTpCacvyOnv5IfmQMDoVI5JdxxvT8Q
	xUZo4X+fgbDvPAJVh4Q/JwlUmtKexyHKCM2DVwd1uUTM6kyss6cx8AZWP2WRUKMX33oC
	eaQYepCWUIXSWojSDE/X/TDKjWuo5OU4nn1JTUJ3BBqRbwAuuQkL3KitqCH2Y5oE4wl8
	p7EaoEFQaW/L+rYBTpaPEt5giABTtThCU6/QjoHMsjv5ZMrFzHDly8RWLB9x9bTs7rJs
	OaSc8NTaxzI6z+Jf6joqavIBv3U1B0acSHzixIJTo5zFmWH9E6NXhxW2EsTY07zOlFA5
	IRPw==
X-Received: by 10.182.215.133 with SMTP id oi5mr16707846obc.83.1371072502162; 
	Wed, 12 Jun 2013 14:28:22 -0700 (PDT)
Received: from localhost ([32.97.110.51])
	by mx.google.com with ESMTPSA id h4sm36025106oel.2.2013.06.12.14.28.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 14:28:21 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Date: Wed, 12 Jun 2013 16:27:49 -0500
From: mdroth <mdroth@linux.vnet.ibm.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Message-ID: <20130612212749.GA1875@vm>
References: <1369175577-18130-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<20130612201151.GF12585@vm> <87ppvrvxj2.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ppvrvxj2.fsf@codemonkey.ws>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::22d
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, nick@bytemark.co.uk,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] wdt_i6300esb: fix vmstate
	versioning
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
X-List-Received-Date: Wed, 12 Jun 2013 21:28:25 -0000

On Wed, Jun 12, 2013 at 04:17:53PM -0500, Anthony Liguori wrote:
> mdroth <mdroth@linux.vnet.ibm.com> writes:
> 
> > On Tue, May 21, 2013 at 05:32:57PM -0500, Michael Roth wrote:
> >> When this VMSD was introduced it's version fields were set to
> >> sizeof(I6300State), making them essentially random from build to build,
> >> version to version.
> >> 
> >> To fix this, we lock in a high version id and low minimum version id to
> >> support old->new migration from all prior versions of this device's
> >> state. This should work since the device state has not changed since
> >> its introduction.
> >> 
> >> The potentially breaks migration from 1.5+ to 1.5, but since the
> >> versioning was essentially random prior to this patch, new->old
> >> migration was not consistently functional to begin with.
> >> 
> >> Reported-by: Nicholas Thomas <nick@bytemark.co.uk>
> >> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >> Cc: qemu-stable@nongnu.org
> >> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> >
> > CC'ing qemu-trivial. Looking to get this in for 1.5.1
> 
> v2?  There were some review comments that haven't been addressed.

Sorry, pinged the wrong email. v2 is to the latest:

http://lists.nongnu.org/archive/html/qemu-devel/2013-05/msg02991.html

> 
> Regards,
> 
> Anthony Liguori
> 
> >
> >> ---
> >>  hw/watchdog/wdt_i6300esb.c |   19 ++++++++++++++++---
> >>  1 file changed, 16 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
> >> index 1407fba..851b664 100644
> >> --- a/hw/watchdog/wdt_i6300esb.c
> >> +++ b/hw/watchdog/wdt_i6300esb.c
> >> @@ -374,9 +374,22 @@ static const MemoryRegionOps i6300esb_ops = {
> >>  
> >>  static const VMStateDescription vmstate_i6300esb = {
> >>      .name = "i6300esb_wdt",
> >> -    .version_id = sizeof(I6300State),
> >> -    .minimum_version_id = sizeof(I6300State),
> >> -    .minimum_version_id_old = sizeof(I6300State),
> >> +    /* With this VMSD's introduction, version_id/minimum_version_id were
> >> +     * erroneously set to sizeof(I6300State), causing a somewhat random
> >> +     * version_id to be set for every build. This eventually broke
> >> +     * migration.
> >> +     *
> >> +     * To correct this without breaking old->new migration for older versions
> >> +     * of QEMU, we've set version_id to a value high enough to exceed all past
> >> +     * values of sizeof(I6300State) across various build environments, and have
> >> +     * reset minimum_version_id_old/minimum_version_id to 1, since this VMSD
> >> +     * has never changed and thus can except all past versions.
> >> +     *
> >> +     * For future changes we can treat these values as we normally would.
> >> +     */
> >> +    .version_id = 10000,
> >> +    .minimum_version_id = 1,
> >> +    .minimum_version_id_old = 1,
> >>      .fields      = (VMStateField []) {
> >>          VMSTATE_PCI_DEVICE(dev, I6300State),
> >>          VMSTATE_INT32(reboot_enabled, I6300State),
> >> -- 
> >> 1.7.9.5
> >> 
> 

