Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPb21-0005yT-6c
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 13:08:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WPb1y-0005th-OO
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 13:08:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WPb1x-0006fz-Vf
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 13:08:54 -0400
Received: from mel.v6.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:47237
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1WPb1v-0006ez-LG; Mon, 17 Mar 2014 13:08:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 7B6F327016D6;
	Mon, 17 Mar 2014 18:08:50 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1QVYLooowch; Mon, 17 Mar 2014 18:08:50 +0100 (CET)
Received: from [10.10.1.115] (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 3C3F9270545C;
	Mon, 17 Mar 2014 18:08:50 +0100 (CET)
Message-ID: <53272C1B.2020402@adacore.com>
Date: Mon, 17 Mar 2014 18:08:43 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1394815901-7153-1-git-send-email-chouteau@adacore.com>
	<53233DCF.3010706@msgid.tls.msk.ru>
In-Reply-To: <53233DCF.3010706@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	qemu-devel@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH] FSL eTSEC: Fix typo in rx ring
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
X-List-Received-Date: Mon, 17 Mar 2014 17:08:55 -0000

On 03/14/2014 06:35 PM, Michael Tokarev wrote:
> 14.03.2014 20:51, Fabien Chouteau wrote:
> 
>>  hw/net/fsl_etsec/rings.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
>> index 7760272..31e6f58 100644
>> --- a/hw/net/fsl_etsec/rings.c
>> +++ b/hw/net/fsl_etsec/rings.c
>> @@ -592,7 +592,7 @@ void etsec_walk_rx_ring(eTSEC *etsec, int ring_nbr)
>>  
>>                  /* TODO: Broadcast and Multicast */
>>  
>> -                if (bd.flags | BD_INTERRUPT) {
>> +                if (bd.flags & BD_INTERRUPT) {
>>                      /* Set RXFx */
> [..etc..]
> 
> Hm.  Has this code _ever_ worked?? :(
> 

Yes because the kernel I'm using always set the BD_INTERRUPT flag.

