Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wa19i-0003RR-It
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 07:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa19a-0003PT-6N
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 07:03:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa19T-0004Uf-My
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 07:03:49 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:36643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wa19T-0004UU-Fs; Tue, 15 Apr 2014 07:03:43 -0400
Received: by mail-pa0-f45.google.com with SMTP id kl14so9486123pab.18
	for <multiple recipients>; Tue, 15 Apr 2014 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=kLaQoQ2+y34d9Hk3m+L2PUTDhppC18F8L5/xMX221v8=;
	b=NJ8JsaN/JbXz/47JBbx/e/6B/hXkh/LhRJzWyPkBb/2bUzRkovd1vL2qDCpuNP1fHN
	+/K3gbvTVgnAxOGOSYPAPEvslRa3L2/w7tPxedh/aF2hPjZ9/EEp1Ts6vZXSBjfhSSfQ
	ykspFflG2Lg8XE0aI2RxGUSZSRkxiaEv0nHYSZ4nCBARwStbv6kuKvbuT42HlW4CsZiZ
	WGvH8MKpcsdPFAwCo3EmvQ0/LOA3oVlrUjsoTqUT5NSvFX+AT9JrY35LdH61u8BWZ9bG
	yiiw1uBPyfc5y8wAjAeuV8hjcEATbd5XbiYhXivNkstohIr9SoFWtsY8aARYjXolcg34
	o1ZA==
X-Received: by 10.68.240.34 with SMTP id vx2mr1157994pbc.1.1397559822470;
	Tue, 15 Apr 2014 04:03:42 -0700 (PDT)
Received: from [192.168.1.104] ([219.143.91.142])
	by mx.google.com with ESMTPSA id
	su8sm19987307pbc.72.2014.04.15.04.03.37 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 04:03:41 -0700 (PDT)
Message-ID: <534D1206.1050805@gmail.com>
Date: Tue, 15 Apr 2014 19:03:34 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <53337BEB.90305@gmail.com>
	<87wqfgrp83.fsf@blackfin.pond.sub.org>	<5333F6E2.9080202@gmail.com>
	<53382DDD.8050001@gmail.com>	<87fvlylf02.fsf@blackfin.pond.sub.org>
	<53396545.805@gmail.com>	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>	<533969AB.4010505@gmail.com>	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>	<53396CE9.9090405@gmail.com>	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>	<533E7DD5.3090203@gmail.com>
	<5340F4FD.7040305@msgid.tls.msk.ru>	<53414941.5040908@gmail.com>
	<5343E4D4.6070305@gmail.com>	<5343E516.3020103@gmail.com>
	<5343E571.60407@gmail.com>	<CAEgOgz7gEi7s2paSDo+AnO67LT+T+K0_SZ_MnBEZCdpHZgaJrA@mail.gmail.com>
	<87tx9vgez0.fsf@blackfin.pond.sub.org>
In-Reply-To: <87tx9vgez0.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22d
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 2/3] vl: remove
 redundant local variable 'res'
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
X-List-Received-Date: Tue, 15 Apr 2014 11:03:56 -0000

On 04/15/2014 04:43 PM, Markus Armbruster wrote:
> Peter Crosthwaite <peter.crosthwaite@xilinx.com> writes:
> 
>> On Tue, Apr 8, 2014 at 10:02 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>>> In function, if no additional resources to free before quit, commonly,
>>> need not use additional local variable 'res' to notice about it. So
>>> remove it to simplify code.
>>>
>>
>> Styling wise, there is a school of thought that functions should only
>> have one return statement which is probably the original authors
>> intention.
> 
> Plausible.  But what matters here is whether we think the patch is
> worthwhile or not.
> 
> I find Chen's version a bit clearer, but I'm not sure it's worth the
> churn.
> 

Hmm... after think of, for me, it will be fine to still remain the
original state, it is not quit worth to churn.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

