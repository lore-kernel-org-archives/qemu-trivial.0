Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKDBX-0006ET-9D
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 16:08:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VKDBP-0005yJ-GW
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 16:08:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VKDBJ-0001IX-N7
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 16:08:07 -0400
Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232]:33062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1VKDB6-0001CH-Vh; Thu, 12 Sep 2013 16:07:49 -0400
Received: by mail-ob0-f178.google.com with SMTP id uy5so294587obc.37
	for <multiple recipients>; Thu, 12 Sep 2013 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=lLVw+xZj8a58iqhbuYuh0DDn+kWIsVLh9CZjBcPyQe0=;
	b=GID2Vm/xny8RtNhbuLZVZIcjoVRiWP9NhKjkJ25cjx6ulIvqU0xG860ZWalWG57HJB
	VhE4KX26IAjBooILGnT1Ogs2xWHKZJn3BwGUtMQpwr18zB6OpKXKnIWfvpJtuPJ/3W2/
	cYeDc0TVD/YP3Rw0z9y1eAqSqoIF7QhEJPnQDWD8szJzqFCWx8RSkBPaGSHCg1oaZtRk
	0KWRwThPCG9TEQcn+A01bnF87rB5PKT/Y73ADhVZtwAhXiL8UJ/m2wh7/Y+ZNNLePPio
	ssmkFcZqSkX3vArg42bxcNeOuaMKb0c7xC2Wv/qzKP4UglDeRVnMX/F3jUC3p83KXRfE
	h26Q==
X-Received: by 10.60.116.230 with SMTP id jz6mr8651286oeb.21.1379016468146;
	Thu, 12 Sep 2013 13:07:48 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id hs4sm7872247obb.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 13:07:47 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <52321F0F.4080903@twiddle.net>
Date: Thu, 12 Sep 2013 13:07:43 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1379009870-18323-1-git-send-email-sw@weilnetz.de>
	<52320A4C.6020202@twiddle.net> <52320EB5.9030208@weilnetz.de>
In-Reply-To: <52320EB5.9030208@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::232
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Fix qemu-alpha on 32
 bit hosts (wrong assertions)
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
X-List-Received-Date: Thu, 12 Sep 2013 20:08:13 -0000

On 09/12/2013 11:57 AM, Stefan Weil wrote:
> Thanks for your hint. Yes, as you can see from tcg/tci/README,the test
> matrix of TCI
> did not include big endian hosts up to now. Testing on an emulated big
> endian Malta
> system is terribly slow, and I have no access to real big endian
> hardware fortests.

Recall that we're not necessarily talking about big-endian host,
but big-endian target on little-endian host.  I don't see any
byte swapping going on here at all.

FYI, the smoke-test I use for big-endian is

$ qemu-system-sparc -nographic
Configuration device id QEMU version 1 machine id 32
CPUs: 1 x FMI,MB86904
UUID: 00000000-0000-0000-0000-000000000000
Welcome to OpenBIOS v1.1 built on Jul 30 2013 21:43
  Type 'help' for detailed information
Trying disk...
No valid state has been set by load or init-program

0 >

At which point you can signal the monitor to exit with ctrl-a x.

> But I think that such changes are independent of this patchwhich can be
> applied as it is.

Fair enough.  In which case

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


