Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5hl0-0005Q9-A3
	for mharc-qemu-trivial@gnu.org; Thu, 08 Mar 2012 13:08:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1S5hks-00051U-Df
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 13:08:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1S5hkY-0006Ob-CD
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 13:07:57 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:42183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1S5hkY-0006OJ-2Y; Thu, 08 Mar 2012 13:07:38 -0500
Received: by wibhi18 with SMTP id hi18so622759wib.4
	for <multiple recipients>; Thu, 08 Mar 2012 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=WxcmxE9i7DLdtDsvdavCVdtUR0rhjcd6QRpoPPIe2ls=;
	b=kb79X/RV2Tx7Xz8YqUqKPLLNH/ST6Qh5U/cEAz8taQp9bSoFCRpH4bhFrExzkKESub
	0kd5iej7rpeNWsCcMof8cYqAgxzE0EJOG4YbqgQJPTEyGgtoBB62lvqLWsMmqUEZlPBZ
	Um7qzGTQENtwfw6DqHITEd+OLOE3K1x2q5kwVkPtUWmY/fKca4kIs3btiTNrUlUnuO9L
	IRejo+I3CZ4l2ytA+8MoPvFfre1h1EPGmtW2Vh8VpFP2VfrHl24xJ2N02Rw74RD8SvLB
	+KOWvbhJvjX23GKD01TYjhFOXKNcp9i31Tyb04fbDpYCZ28pXQAzBFlfcEVfeDW4e1mE
	bEQA==
Received: by 10.216.133.39 with SMTP id p39mr3725197wei.40.1331230055132;
	Thu, 08 Mar 2012 10:07:35 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id fa9sm11927982wib.5.2012.03.08.10.07.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 10:07:34 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4F58F563.1020107@redhat.com>
Date: Thu, 08 Mar 2012 19:07:31 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1330176948-14379-1-git-send-email-sw@weilnetz.de>	<CAJSP0QXAc5S6dvh-6EJkL8RNfDCkD=7QcbT0DMZTiS5D+xTQsg@mail.gmail.com>
	<4F58D961.70706@redhat.com> <4F58DD6F.8080907@codemonkey.ws>
In-Reply-To: <4F58DD6F.8080907@codemonkey.ws>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Fix packed boolean
	struct members
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
X-List-Received-Date: Thu, 08 Mar 2012 18:08:04 -0000

Il 08/03/2012 17:25, Anthony Liguori ha scritto:
>>
>> Looks like a GCC bug where
>>
>>     x = y = 0;
>>
>> is converted to
>>
>>     x = (y = 0) != 0;
> 
> Curious, why convert like this?  What does this optimization do?

Nothing, it's just that if "y = 0" is an int (for some reason, I didn't
check if it's implicit promotion or just that y is already an int), then
it has to be converted back to a truth value before assigning to bool.
If you do

  bool x;
  int y;

  x = y = 2;

x is actually set to 1.

Paolo

