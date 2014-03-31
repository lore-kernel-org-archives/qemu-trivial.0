Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUfSB-0005TT-Be
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 12:52:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WUcEK-0004EF-Fo
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:26:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WUcEF-00018q-1E
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:26:24 -0400
Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f]:43828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WUcE3-00016z-PI; Mon, 31 Mar 2014 09:26:07 -0400
Received: by mail-pb0-f47.google.com with SMTP id up15so8104978pbc.6
	for <multiple recipients>; Mon, 31 Mar 2014 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ze/N+o3A1rIBTUQDmTHjYzumG9HLussXtmh0LQVZTHE=;
	b=TD4SHbKtK8u//WcCcRRw71GulDMAXfPlYNIuWLHwchdC4WrU/QLHP90vznr4YHO9tC
	NyxZz8jYTcbtenYDFy6lLlzeyefZj/6n22w3LHkLR03ODkskcL+9dd5+wi3VHzrZVttW
	QNykm7eAJ/wxW5Lv0+tt7D2mUECzI+RQRl9TPrJCACLqge/nXYJzPD01O97cS/tYJht5
	uM1zbJVheQlHpU1ISU3tnZKVmb821tsCUBN93YAZuz8vn1SGuf7RqV2n+bLLonl2eJ9W
	Uubx5T2rNboieD7rWtYnwup/IezW8VaaBA5IGLgATcvYLwvIrbpbMa9WCx9oRzczW4ag
	9bug==
X-Received: by 10.66.139.38 with SMTP id qv6mr6557554pab.123.1396272366868;
	Mon, 31 Mar 2014 06:26:06 -0700 (PDT)
Received: from [192.168.1.104] ([106.37.103.35])
	by mx.google.com with ESMTPSA id
	dk1sm43379780pbc.46.2014.03.31.06.26.03 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 06:26:06 -0700 (PDT)
Message-ID: <53396CE9.9090405@gmail.com>
Date: Mon, 31 Mar 2014 21:26:01 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
In-Reply-To: <CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22f
X-Mailman-Approved-At: Mon, 31 Mar 2014 12:52:53 -0400
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: use 'break' instead
 of 'continue' in configure_accelerator()
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
X-List-Received-Date: Mon, 31 Mar 2014 13:26:30 -0000



On 03/31/2014 09:16 PM, Peter Maydell wrote:
> On 31 March 2014 14:12, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> Next, when I send trivial patches, I will/should cc to qemu-trivial. I
>> guess, most of my future patches will be trivial patches (and for me,
>> trivial != minor).
> 
> We describe on the wiki what we mean by 'trivial':
> http://wiki.qemu.org/Contribute/TrivialPatches
> 

Thank you for your information.

Next, when I send trivial patches, I will only send to qemu-trivial (not
send/cc to qemu-devel again), that will be more efficient.  :-)


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

