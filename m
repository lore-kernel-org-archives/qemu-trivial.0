Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWmEN-0006DE-I7
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 08:31:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WWmED-0006D1-6L
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 08:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WWmE4-0004ue-4a
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 08:31:13 -0400
Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230]:49160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WWmE3-0004uU-Tc; Sun, 06 Apr 2014 08:31:04 -0400
Received: by mail-pd0-f176.google.com with SMTP id r10so5328373pdi.21
	for <multiple recipients>; Sun, 06 Apr 2014 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=jpd2PVrSgHrCrzdLZ/QypL/mQ4CUtoRG2CszGA07Pdo=;
	b=chXbhaBno9jTGtn7udG+g5BdMkDBUeiGoam3imriGMzYMXjEWa0GsHdUeR1dneMoMG
	QjADWutAuRJ9NgrrjGhh8NGlB1uu4CabKnUX4ResZPpdzFm6393gJX8owLYMVwEW2VeF
	Ahdr1zc4rqd4nIqYqOwwLhUSkLaEdnpcdSDN02ddu2tDdzYsuu2mzaDKUPCA9Hc3ekA1
	gbhjM/qTdpNWzY+j2Qd0bwPKNE8blfNAfr40X1ocWtfTA/0/Ce9j+LNlfglKhUpAZ9Sn
	FNkHYLzebKgT7wvLJ11qplKQSvbqulqyUdCcKgcAmBbzhCrt1ivLst3bCCoLp9QI7Kdb
	5oyA==
X-Received: by 10.68.163.197 with SMTP id yk5mr25414655pbb.57.1396787462558;
	Sun, 06 Apr 2014 05:31:02 -0700 (PDT)
Received: from [192.168.1.104] ([219.143.87.241])
	by mx.google.com with ESMTPSA id
	sm5sm70136866pab.19.2014.04.06.05.30.58 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 06 Apr 2014 05:31:02 -0700 (PDT)
Message-ID: <534148FE.3090007@gmail.com>
Date: Sun, 06 Apr 2014 20:30:54 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <53337BEB.90305@gmail.com>
	<87wqfgrp83.fsf@blackfin.pond.sub.org>	<5333F6E2.9080202@gmail.com>
	<53382DDD.8050001@gmail.com>	<87fvlylf02.fsf@blackfin.pond.sub.org>
	<53396545.805@gmail.com>	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>	<533969AB.4010505@gmail.com>	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>	<53396CE9.9090405@gmail.com>	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>	<533E7DD5.3090203@gmail.com>
	<87r45dweeo.fsf@blackfin.pond.sub.org>
In-Reply-To: <87r45dweeo.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::230
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial v2] vl: Report
 accelerator not supported for target more nicely
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
X-List-Received-Date: Sun, 06 Apr 2014 12:31:22 -0000



On 04/04/2014 06:57 PM, Markus Armbruster wrote:
> Chen Gang <gang.chen.5i5j@gmail.com> writes:
> 
>> When you ask for an accelerator not supported for your target, you get
>> a bogus "accelerator does not exist" message:
>>
>>   $ qemu-system-arm -machine none,accel=kvm
>>   KVM not supported for this target
>>   "kvm" accelerator does not exist.
>>   No accelerator found!
>>
>> Suppress it.
>>
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

Thanks.

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

