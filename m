Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WAykl-0006eH-PW
	for mharc-qemu-trivial@gnu.org; Wed, 05 Feb 2014 04:26:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WAyke-0006V9-Hw
	for qemu-trivial@nongnu.org; Wed, 05 Feb 2014 04:26:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WAykZ-0002vZ-IY
	for qemu-trivial@nongnu.org; Wed, 05 Feb 2014 04:26:36 -0500
Received: from mel.v6.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:47826
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1WAykP-0002ss-Jc; Wed, 05 Feb 2014 04:26:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 094D026E067C;
	Wed,  5 Feb 2014 10:26:21 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0XhrNBAMRIc; Wed,  5 Feb 2014 10:26:20 +0100 (CET)
Received: from [192.168.0.17] (mon75-15-88-166-12-160.fbx.proxad.net
	[88.166.12.160])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id C663D26E065C;
	Wed,  5 Feb 2014 10:26:20 +0100 (CET)
Message-ID: <52F203BC.5070701@adacore.com>
Date: Wed, 05 Feb 2014 10:26:20 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Sebastian Huber <sebastian.huber@embedded-brains.de>, 
	qemu-devel@nongnu.org, Blue Swirl <blauwirbel@gmail.com>
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
	<52F1FE42.3000000@adacore.com>
In-Reply-To: <52F1FE42.3000000@adacore.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc/leon3: Initialize
 stack pointer
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
X-List-Received-Date: Wed, 05 Feb 2014 09:26:42 -0000

On 02/05/2014 10:02 AM, Fabien Chouteau wrote:
> On 02/03/2014 10:18 AM, Sebastian Huber wrote:
>> A lot of real world LEON3 systems are shipped with the GRMON boot
>> loader.  This boot loader initializes the stack pointer with the end of
>> RAM address.  The application can use this to detect the RAM size of a
>> particular board variant.
>>
> 
> Looks good, thank you Sebastian.
> 
> Reviewed-by: Fabien Chouteau <chouteau@adacore.com>
> 

Sorry Blue you should be in copy. Can you apply this patch please?

Thanks,


