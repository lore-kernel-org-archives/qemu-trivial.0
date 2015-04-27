Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmjHr-0002FQ-3P
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 09:41:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YmjHo-0002Aj-BR
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 09:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YmjHn-0007bv-Cc
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 09:41:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YmjHe-0007Wk-MV; Mon, 27 Apr 2015 09:41:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 625C44275F;
	Mon, 27 Apr 2015 16:41:13 +0300 (MSK)
Message-ID: <553E3C79.6020702@msgid.tls.msk.ru>
Date: Mon, 27 Apr 2015 16:41:13 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>	<1430075424-25975-6-git-send-email-crosthwaite.peter@gmail.com>
	<20150427092838.GE17116@toto>
In-Reply-To: <20150427092838.GE17116@toto>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com, qemu-devel@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH microblaze v1 5/6] mb: cpu: Delete
	EXCP_NMI
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
X-List-Received-Date: Mon, 27 Apr 2015 13:41:25 -0000

27.04.2015 12:28, Edgar E. Iglesias wrote:
> On Sun, Apr 26, 2015 at 12:10:23PM -0700, Peter Crosthwaite wrote:
>> This define is unused. Remove.
>>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> 
> Hi,
> 
> Any reason not to shift down the numbering?
> 
> Otherwise the whole series looks good to me.

What does this mean, "looks good", is it your R-b? :)

>> @@ -36,7 +36,6 @@ typedef struct CPUMBState CPUMBState;
>>  
>>  #define ELF_MACHINE	EM_MICROBLAZE
>>  
>> -#define EXCP_NMI        1
>>  #define EXCP_MMU        2
>>  #define EXCP_IRQ        3
>>  #define EXCP_BREAK      4

I can renumber this on commit just fine, there's no need
to resend whole thing, is it okay with you Peter?

Thanks,

/mjt

