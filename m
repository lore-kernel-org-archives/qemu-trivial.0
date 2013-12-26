Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VvywC-0004Dd-RV
	for mharc-qemu-trivial@gnu.org; Wed, 25 Dec 2013 19:36:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vvyw7-0004DV-N5
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 19:36:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vvyw2-00078l-3K
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 19:36:27 -0500
Received: from mail-pa0-f54.google.com ([209.85.220.54]:56770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vvyw1-00078d-Td
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 19:36:22 -0500
Received: by mail-pa0-f54.google.com with SMTP id rd3so7798351pab.27
	for <qemu-trivial@nongnu.org>; Wed, 25 Dec 2013 16:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Kq8Kk+B1qyzKS+l5eyHbb4pkIotj+67RceJOnXhjM60=;
	b=Gyh7+kSpKqLTohQDJ6QuHqaN0i+DJr7Pmbch+gIYRT2gCZ+J3KObq3Fu/AQca65OBB
	kdEYbWaIB5/cs8eS7UVy0GWHsFMF9NXu/bMsZ9jAtERI4pK+THENzNjZ8j+shL207sBo
	Qi1PDKss/mz6LatEtYRMCMDB5iJ0klmKfjAJNo9AW5jzmhTgVj4NG8zDiVqLC6Dh2pjS
	PcCgEs4ILMZlETEUL5A8PKCkiXsDpEjCAMmnkET4K5rAZWlRmFa36PL1GpeoWfimAg/G
	MiyqsjddksXeEtxThCjr5C/hPDBS79SUT+VANGqp+3vH9jR/4WNLB3XAtvlrp9AUv9q7
	2Wnw==
X-Gm-Message-State: ALoCoQnx+Bl843eUSlfy92fkff7dh9DEaQvuzeRXUdc73QHsf3Llggt/QlBQtwU2jYw/s89ghTnK
X-Received: by 10.68.245.4 with SMTP id xk4mr302428pbc.153.1388018181056; Wed,
	25 Dec 2013 16:36:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Wed, 25 Dec 2013 16:36:00 -0800 (PST)
In-Reply-To: <52BB76AB.3060502@cn.fujitsu.com>
References: <1387956078-10651-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<CAFEAcA-a_0w=NNF+cD53Cf5DOQ0KeeE5GD+ug3qKMH=M99mBfg@mail.gmail.com>
	<52BB76AB.3060502@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Dec 2013 00:36:00 +0000
Message-ID: <CAFEAcA-fWhfh5JwkCyV5zgx0EmgYCpwFsh43wXVF5PnU1wQrJA@mail.gmail.com>
To: Li Guang <lig.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.54
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/sd: move sdhci.h to
	include/hw
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
X-List-Received-Date: Thu, 26 Dec 2013 00:36:32 -0000

On 26 December 2013 00:22, Li Guang <lig.fnst@cn.fujitsu.com> wrote:
> Peter Maydell wrote:
>> On 25 December 2013 07:21, liguang<lig.fnst@cn.fujitsu.com>  wrote:
>> This is where your patch should have had an explanation
>> for why you're making this change. What is the user outside
>> of hw/sd/ that needs this header that means we should
>> move it into include/ ?

> I don't mean someone will include it outside of hw/sd, just in the
> sense of "header files be better in a directory called include",

QEMU's policy is that header files used only by other C files within
that directory can live in that directory; include is for headers which
define functions to be used between modules.

> A10's SDHC(really an odd controller, without public datasheet) emulation
> will use some of definitions in this file, and I think many other standard
> SDHC will also be happy to include this file.

I think all of these will live inside hw/sd so there's no need to move
the header.

thanks
-- PMM

