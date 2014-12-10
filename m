Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XydMq-0006Bn-IC
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 04:15:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XydMf-0005zS-TX
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:15:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XydMW-0006O9-S3
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:15:21 -0500
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b]:37480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XydME-0005nx-Dr; Wed, 10 Dec 2014 04:14:54 -0500
Received: by mail-wg0-f43.google.com with SMTP id l18so2987857wgh.30
	for <multiple recipients>; Wed, 10 Dec 2014 01:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=MnxiTx1rwhHqAzVJ+z1GoWUourA7l/RkbArQrlgBFJg=;
	b=UAnFq+0Vx7XjiK9rSs8V/Z4Ryif0mZQ0NFr9YbpXTmZwBl2QT5dBCVhUcrFuH4CxQC
	RMFYOt7gZ8Cclrmdh/501tc/q7+0ogvwJQphIZoY9GtWU9x9PBTvgYDkQ9/ijo94KR5h
	VyURtYiMY37lh431PyZTCu5aOADZ2kxdHJOO3SZ56+wUDnGg0/Q9nf/YoAaKckZgeZTh
	jlP9rB9/7ASH3vm8dVItMWUokGItCJ9fxrHF14ckwwvNq3ikrVr/OayF/S/HMmAly8Hd
	sJHeVGJYMMy3kElfVWDASHpchisxOpQAwlbx6OhhXUzCqf5GWwMSQLC1VHTbQXg69X0R
	DdCg==
X-Received: by 10.194.62.19 with SMTP id u19mr5136647wjr.0.1418202893731;
	Wed, 10 Dec 2014 01:14:53 -0800 (PST)
Received: from [192.168.10.150] (net-2-35-193-40.cust.vodafonedsl.it.
	[2.35.193.40])
	by mx.google.com with ESMTPSA id gl5sm17089181wib.0.2014.12.10.01.14.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 01:14:52 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54880F06.40302@redhat.com>
Date: Wed, 10 Dec 2014 10:14:46 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Michael Tokarev <mjt@tls.msk.ru>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org
References: <1418109359-2364-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<54880B00.3030108@msgid.tls.msk.ru>
In-Reply-To: <54880B00.3030108@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22b
Cc: sw@weilnetz.de, peter.huangpeng@huawei.com, armbru@redhat.com,
	afaerber@suse.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] vt82c686: fix coverity warning about
 out-of-bounds write
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
X-List-Received-Date: Wed, 10 Dec 2014 09:15:31 -0000



On 10/12/2014 09:57, Michael Tokarev wrote:
> 09.12.2014 10:15, zhanghailiang wrote:
>> Refactor superio_ioport_writeb to fix the out of bounds write warning.
> 
> Is it just a warning, or real oob write?
> From the code it looks like it's just a warning...

It's a bug.

The simpler patch would have been just to remove the useless assignment

        superio_conf->config[superio_conf->index] = data & 0xff;

that is *outside* the switch and not protected by if (can_write).  Apart
from this, there is an off-by-one that I'll send a patch for right away.

Paolo

> 
> []
>> +
>> +        }
>> +        if (can_write == true) {
> 
> 09.12.2014 17:08, Paolo Bonzini wrote:
>> Michael, can you remove "== true" when applying this patch?
> 
> Sure, just did.  Does it mean I can add your R-b too? ;)

Sure.

Paolo

