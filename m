Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WVMbA-00030q-5l
	for mharc-qemu-trivial@gnu.org; Wed, 02 Apr 2014 10:57:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WVMb4-0002v7-Pn
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 10:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WVMb0-0000Tp-8M
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 10:56:58 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:37750
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1WVMaq-0000RX-VS; Wed, 02 Apr 2014 10:56:45 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 0601F272007C;
	Wed,  2 Apr 2014 16:56:44 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emiAogHcCoaJ; Wed,  2 Apr 2014 16:56:43 +0200 (CEST)
Received: from [10.10.1.115] (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id DC2C42720016;
	Wed,  2 Apr 2014 16:56:43 +0200 (CEST)
Message-ID: <533C252F.6040601@adacore.com>
Date: Wed, 02 Apr 2014 16:56:47 +0200
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1396450172-31322-1-git-send-email-chouteau@adacore.com>
	<2B9CCD53-1C5A-48B7-90A0-C8C5D347E563@suse.de>
In-Reply-To: <2B9CCD53-1C5A-48B7-90A0-C8C5D347E563@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Fix typo in eTSEC Ethernet controller
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
X-List-Received-Date: Wed, 02 Apr 2014 14:57:03 -0000

On 04/02/2014 04:52 PM, Alexander Graf wrote:
> 
> On 02.04.2014, at 16:49, Fabien Chouteau <chouteau@adacore.com> wrote:
> 
>> IRQ are lowered when ievent bit is cleared, so irq_pulse makes no sense
>> here...
>>
>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> 
> Thanks, applied to ppc-next.

Thanks Alex,

> Given that the wiring with boards is still missing I don't think this is a critical 2.0 fix.
> 

That's right.

Regards,


