Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmsQi-0000Us-0m
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 17:18:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UmsQd-0000Qy-Qi
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 17:18:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UmsQa-0007km-1u
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 17:18:03 -0400
Received: from mail-oa0-x229.google.com ([2607:f8b0:4003:c02::229]:33264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1UmsQZ-0007kJ-Ta
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 17:17:59 -0400
Received: by mail-oa0-f41.google.com with SMTP id n10so3310375oag.28
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 14:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:in-reply-to:references:user-agent:date
	:message-id:mime-version:content-type:x-gm-message-state;
	bh=RGCm2x0beHGbl36YhUR47s938XJcxOB25tMqoEHpPmg=;
	b=U7zSKutO19NmZUGCByNKrpe2BDtMpNSQIJnbMkR4sEGQLhUXl9XFQ7lwjFCZ24GL6Y
	CtCnoMud8OI2AVlGWNo3XiqJa+sbpyQB9WFxp0IC8YIqB18hRmvKiEDbcqUleAxtyECt
	L+KRESm/FA1M643syEwIv3l0VN87Q1/CD4Tx2fLXSh9lGvZGO0ATVyOTXkJfomEaPVt8
	JnVu2o4+268edODELSHwzGp9X6lqcq/xlhOVhQDTiFV6ek7GXGNY6xqYI3UpcyKLcN+2
	sDH9sZ6wCA+QURvp6Dt/rj6tu7GSAAIxRh0DpJx5eyHHcD7i0RC0pxSHo6qNdctvzG9D
	Lxqw==
X-Received: by 10.60.93.196 with SMTP id cw4mr2710070oeb.135.1371071878924;
	Wed, 12 Jun 2013 14:17:58 -0700 (PDT)
Received: from titi.smtp.gmail.com (cpe-70-112-157-87.austin.res.rr.com.
	[70.112.157.87])
	by mx.google.com with ESMTPSA id h4sm35974293oel.2.2013.06.12.14.17.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 14:17:58 -0700 (PDT)
From: Anthony Liguori <anthony@codemonkey.ws>
To: mdroth <mdroth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
In-Reply-To: <20130612201151.GF12585@vm>
References: <1369175577-18130-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<20130612201151.GF12585@vm>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Wed, 12 Jun 2013 16:17:53 -0500
Message-ID: <87ppvrvxj2.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Gm-Message-State: ALoCoQkWrOdWEMwmdjdCEK3KAd/p7YHnCXbhK25/jXQsQGMvWIdIbrztGjVk+3qwMT/320+nybuO
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::229
Cc: peter.maydell@linaro.org, nick@bytemark.co.uk, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
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
X-List-Received-Date: Wed, 12 Jun 2013 21:18:05 -0000

mdroth <mdroth@linux.vnet.ibm.com> writes:

> On Tue, May 21, 2013 at 05:32:57PM -0500, Michael Roth wrote:
>> When this VMSD was introduced it's version fields were set to
>> sizeof(I6300State), making them essentially random from build to build,
>> version to version.
>> 
>> To fix this, we lock in a high version id and low minimum version id to
>> support old->new migration from all prior versions of this device's
>> state. This should work since the device state has not changed since
>> its introduction.
>> 
>> The potentially breaks migration from 1.5+ to 1.5, but since the
>> versioning was essentially random prior to this patch, new->old
>> migration was not consistently functional to begin with.
>> 
>> Reported-by: Nicholas Thomas <nick@bytemark.co.uk>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
>
> CC'ing qemu-trivial. Looking to get this in for 1.5.1

v2?  There were some review comments that haven't been addressed.

Regards,

Anthony Liguori

>
>> ---
>>  hw/watchdog/wdt_i6300esb.c |   19 ++++++++++++++++---
>>  1 file changed, 16 insertions(+), 3 deletions(-)
>> 
>> diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
>> index 1407fba..851b664 100644
>> --- a/hw/watchdog/wdt_i6300esb.c
>> +++ b/hw/watchdog/wdt_i6300esb.c
>> @@ -374,9 +374,22 @@ static const MemoryRegionOps i6300esb_ops = {
>>  
>>  static const VMStateDescription vmstate_i6300esb = {
>>      .name = "i6300esb_wdt",
>> -    .version_id = sizeof(I6300State),
>> -    .minimum_version_id = sizeof(I6300State),
>> -    .minimum_version_id_old = sizeof(I6300State),
>> +    /* With this VMSD's introduction, version_id/minimum_version_id were
>> +     * erroneously set to sizeof(I6300State), causing a somewhat random
>> +     * version_id to be set for every build. This eventually broke
>> +     * migration.
>> +     *
>> +     * To correct this without breaking old->new migration for older versions
>> +     * of QEMU, we've set version_id to a value high enough to exceed all past
>> +     * values of sizeof(I6300State) across various build environments, and have
>> +     * reset minimum_version_id_old/minimum_version_id to 1, since this VMSD
>> +     * has never changed and thus can except all past versions.
>> +     *
>> +     * For future changes we can treat these values as we normally would.
>> +     */
>> +    .version_id = 10000,
>> +    .minimum_version_id = 1,
>> +    .minimum_version_id_old = 1,
>>      .fields      = (VMStateField []) {
>>          VMSTATE_PCI_DEVICE(dev, I6300State),
>>          VMSTATE_INT32(reboot_enabled, I6300State),
>> -- 
>> 1.7.9.5
>> 

