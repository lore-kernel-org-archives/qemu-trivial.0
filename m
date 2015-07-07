Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZCHlp-0002rR-SQ
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jul 2015 21:34:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1ZCHln-0002qY-AH
	for qemu-trivial@nongnu.org; Mon, 06 Jul 2015 21:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1ZCHlm-0007Gm-86
	for qemu-trivial@nongnu.org; Mon, 06 Jul 2015 21:33:59 -0400
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:36747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1ZCHlm-0007GP-16
	for qemu-trivial@nongnu.org; Mon, 06 Jul 2015 21:33:58 -0400
Received: by oiaf66 with SMTP id f66so99338840oia.3
	for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2015 18:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=G5kkaUF+lwXtYF+e+Z4f1l5KPqHSz8ns0CYD4gNpZlQ=;
	b=tSMFIajMEBXeA/goypvYHadlZIQ/+lscHKwvpt9fSshSFE7h4PbV3FtM7muAYP4SdJ
	PCT+MlwHvRc/pZnVDBdhPWajvxL5YT5qKdTVxXNgf1yFbaxS7rDGS8cKTW92pqT77SJt
	V6rgDdQerhbbDmIM3scGiAgPBtK293LXa5ED+I/t0XUt2ItrOG5RBdtqfjbWEiJ4aQBC
	bOE08sRgXxWA/xYlorVP9cnalg4JmYEHEEgFuzebAYwb6dhB+MM83wlO9Q/CjIGYYa0s
	JHXGMfQfLSxw6Kf1Zx+5KRa/mMuHMbUEnYnP3KaSF2c+MMNQ9DzXmEnM+DEq3AiEk0rj
	9U0g==
X-Received: by 10.202.85.200 with SMTP id j191mr1409063oib.101.1436232836783; 
	Mon, 06 Jul 2015 18:33:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.56.212 with HTTP; Mon, 6 Jul 2015 18:33:37 -0700 (PDT)
In-Reply-To: <559B296C.2080608@huawei.com>
References: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAE4R7bAXEXtHKsKHnFqbqXOf8sdHBSH_Mq4XyOXbZN4+G6aDpw@mail.gmail.com>
	<559B296C.2080608@huawei.com>
From: Scott Feldman <sfeldma@gmail.com>
Date: Mon, 6 Jul 2015 18:33:37 -0700
Message-ID: <CAE4R7bABiPUSj+XRNoz2mn_x2Yt-xy6+QhU06z3nsLRP3Ger4A@mail.gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::22b
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] rocker: Fix memory leak reported by
	coverity
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
X-List-Received-Date: Tue, 07 Jul 2015 01:34:00 -0000

On Mon, Jul 6, 2015 at 6:20 PM, zhanghailiang
<zhang.zhanghailiang@huawei.com> wrote:
> ping ?
>
> Will anyone pick this up ?

Hi zhanghailiang, Stefan picked up a similar version which uses g_new0:

http://lists.nongnu.org/archive/html/qemu-devel/2015-06/msg06584.html
http://lists.nongnu.org/archive/html/qemu-devel/2015-06/msg06686.html


>
> On 2015/6/23 14:06, Scott Feldman wrote:
>>
>> On Mon, Jun 22, 2015 at 6:31 PM, zhanghailiang
>> <zhang.zhanghailiang@huawei.com> wrote:
>>>
>>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>>
>>
>> Acked-by: Scott Feldman <sfeldma@gmail.com>
>>
>>
>
>

