Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vvkqe-0005Ua-LX
	for mharc-qemu-trivial@gnu.org; Wed, 25 Dec 2013 04:33:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VvkqZ-0005TR-AP
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 04:33:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VvkqS-0000T8-Q5
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 04:33:47 -0500
Received: from mail-pd0-f174.google.com ([209.85.192.174]:53506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VvkqS-0000St-KB
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 04:33:40 -0500
Received: by mail-pd0-f174.google.com with SMTP id x10so7020691pdj.19
	for <qemu-trivial@nongnu.org>; Wed, 25 Dec 2013 01:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sIdjcKm/e9xSsXNK4QZsonRzBhhdvHjuk/f3v6ZIACc=;
	b=eGHpGBkk1xJ1AriPY8HMzNMySJXp+6OR42dD282qytfSRvOBR+OFPvATIbgrJIL5sp
	4DOUw/glbjjH27P1M89NptSySnVk3OI0dBaOw711t9PX/hcksdLbYfc00f4OOcY8NjAL
	MHI52oQ0BBD6Yl7kAJH5N3ImeyDH52wz/nHK61yJh67ooMZ5jQ57KZus533Qjmp8DxyI
	CwM4U8yn5Dys1Y7mF+QCQ8MHaRbcNwx8CHrr2WdvHNAUla900UmLFk2l8e+YbqAzpXAT
	fSFSfXfPfFM6n1+WSOdNtsnkU9XLNvgKGpNr5zn6+ExL2XvY2ahpAIGiT1xuYdiVa3wJ
	pYLg==
X-Gm-Message-State: ALoCoQlQYDrfgx8KKxsBq4fk7YGJt3zQbdZRnUH9e8KO1y09Rz/FLUQDQAW1EeLk60JdZS6FoI2c
X-Received: by 10.68.179.35 with SMTP id dd3mr37869795pbc.138.1387964019912;
	Wed, 25 Dec 2013 01:33:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Wed, 25 Dec 2013 01:33:19 -0800 (PST)
In-Reply-To: <1387956078-10651-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1387956078-10651-1-git-send-email-lig.fnst@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Dec 2013 09:33:19 +0000
Message-ID: <CAFEAcA-a_0w=NNF+cD53Cf5DOQ0KeeE5GD+ug3qKMH=M99mBfg@mail.gmail.com>
To: liguang <lig.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.174
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] hw/sd: move sdhci.h to include/hw
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
X-List-Received-Date: Wed, 25 Dec 2013 09:33:52 -0000

On 25 December 2013 07:21, liguang <lig.fnst@cn.fujitsu.com> wrote:

This is where your patch should have had an explanation
for why you're making this change. What is the user outside
of hw/sd/ that needs this header that means we should
move it into include/ ?

> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>

thanks
-- PMM

