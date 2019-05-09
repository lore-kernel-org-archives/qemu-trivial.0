Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOfzc-0002Dn-0j
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 06:09:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hOfzZ-0002CF-A0
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 06:09:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hOfzY-0001lb-FR
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 06:09:33 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:52171)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hOfzY-0001lH-AM
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 06:09:32 -0400
Received: by mail-wm1-f41.google.com with SMTP id o189so2524028wmb.1
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2019 03:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3BicAukpMKaKuEWZ1ijQDw/rRr87otZDmaqoSFNoo/g=;
	b=CEQsGbFLhndb0hSjsku5uxeD03uXUeW6tEqkWNYSEAhoQ92cGRdmrJ3/rdvZdUgJcq
	5koNuUGu9oPt758gLZ0YCAl1NcOo5+jpjKOG7+DyykFgrws6ylvl2J4Pvae/+OpHu1eY
	vrWxja7qaQMJeV9enEIyfVzPlmiGvEUBTLgxdpqzJ7/RoVK1zg6d6g0rA7l1rjGqhdqq
	pAc6zzt2Vw68tdynG8cSNh0EnxCgG7dD9ZWXDuvj7s9GcSrO4dCjHll/oY7xqPtfsUB7
	/RsnsAzdBYLfCPrW9KnVgxtzgDPdyC5DeYOTkI422WogpePjmxBU1u45l56QSrh3joJv
	Axcw==
X-Gm-Message-State: APjAAAXrZiNaup2DpVf5lOB4ogvOc0xl60Q8roQDsqEmRCPqmmqm4pK2
	SP8zMQC4q/88a4lbu6zd/2Mwb5yY0IY=
X-Google-Smtp-Source: APXvYqzA+NvhSavVykjoxpahuiAtzHmZLHsSVOJv763cam9Nv6v4/P9WYg0vBc2h2TkpB+EB1zb4pg==
X-Received: by 2002:a1c:24c2:: with SMTP id k185mr2247244wmk.115.1557396570075;
	Thu, 09 May 2019 03:09:30 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	c11sm1144234wrs.86.2019.05.09.03.09.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 03:09:29 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20190508150608.3311-1-thuth@redhat.com>
	<6cb2ea74-b3f8-09f3-90cb-e3b8344e67bd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7e7f01a6-f5a6-52bf-d4ce-c183257b0c72@redhat.com>
Date: Thu, 9 May 2019 12:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6cb2ea74-b3f8-09f3-90cb-e3b8344e67bd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.41
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] include/exec/poison: Mark
 TARGET_FMT_lu as poisoned, too
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2019 10:09:34 -0000

On 5/9/19 11:10 AM, Paolo Bonzini wrote:
> On 08/05/19 10:06, Thomas Huth wrote:
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  include/exec/poison.h | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Queued, thanks.

Thomas already included it in his "qtests, copyright statement
clarifications and misc patches" pull request.

