Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QoHGm-0001ic-QX
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2011 11:52:36 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1QoHGj-0001Yy-RK
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2011 11:52:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1QoHGi-00049C-Jx
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2011 11:52:33 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:35451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1QoHGg-00048h-ID; Tue, 02 Aug 2011 11:52:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 4BC5CCB0202;
	Tue,  2 Aug 2011 17:52:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eu.adacore.com
Received: from mel.act-europe.fr ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGaOy8LGG6Mi; Tue,  2 Aug 2011 17:52:19 +0200 (CEST)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mel.act-europe.fr (Postfix) with ESMTP id 1B88BCB0035;
	Tue,  2 Aug 2011 17:52:19 +0200 (CEST)
Message-ID: <4E381D33.1040306@adacore.com>
Date: Tue, 02 Aug 2011 17:52:19 +0200
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Mnenhy/0.8.3
	Thunderbird/3.1.11
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1311582554-963-1-git-send-email-geleman@gmail.com>
	<4E32C560.2020001@redhat.com>
In-Reply-To: <4E32C560.2020001@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 194.98.77.210
Cc: qemu-trivial@nongnu.org, TeLeMan <geleman@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: fix build breakage
	with	--disable-vnc
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
X-List-Received-Date: Tue, 02 Aug 2011 15:52:34 -0000

On 29/07/2011 16:36, Anthony Liguori wrote:
> On 07/25/2011 03:29 AM, TeLeMan wrote:
>> The breakage was introduced by the commit 13661089810d3e59931f3e80d7cb541b99af7071
>>
>> Signed-off-by: TeLeMan<geleman@gmail.com>
> 
> Applied.  Thanks.
> 

I think this patch should be applied in stable-0.15.

Regards,

-- 
Fabien Chouteau

