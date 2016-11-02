Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1rKa-0000zd-R6
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 04:55:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1rKY-0000yD-UX
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1rKY-0002Pf-8K
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 04:55:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c1rKP-0002LZ-LS; Wed, 02 Nov 2016 04:55:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C56A072086;
	Wed,  2 Nov 2016 08:55:24 +0000 (UTC)
Received: from [10.36.116.29] (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA28tM9P018667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 2 Nov 2016 04:55:23 -0400
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <1478075872-11344-1-git-send-email-thuth@redhat.com>
	<be720fa3-ffa2-05a8-2c66-60edcf142a7a@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ce522f3f-4ee0-f1de-652c-114dcd9a3049@redhat.com>
Date: Wed, 2 Nov 2016 09:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <be720fa3-ffa2-05a8-2c66-60edcf142a7a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 02 Nov 2016 08:55:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] sparc: Add slavio_misc.c and eccmemctl.c
 to the MAINTAINERS file
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
X-List-Received-Date: Wed, 02 Nov 2016 08:55:35 -0000

On 02.11.2016 09:50, Paolo Bonzini wrote:
> 
> 
> On 02/11/2016 09:37, Thomas Huth wrote:
>> Both files seem to belong to the Sun4m machine.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b0712a8..79484ed 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -710,6 +710,8 @@ S: Maintained
>>  F: hw/sparc/sun4m.c
>>  F: hw/dma/sparc32_dma.c
>>  F: hw/dma/sun4m_iommu.c
>> +F: hw/misc/eccmemctl.c
>> +F: hw/misc/slavio_misc.c
>>  F: include/hw/sparc/sparc32_dma.h
>>  F: include/hw/sparc/sun4m.h
>>  F: pc-bios/openbios-sparc32
>>
> 
> Thomas,
> 
> I think you should send a pull request for your MAINTAINERS changes.

OK, I guess I could do that ... but since I sometimes also do mistakes
in classifying the files, I think I should at least wait a couple of
days to get an ACK from the corresponding subsystem maintainers...

 Thomas


