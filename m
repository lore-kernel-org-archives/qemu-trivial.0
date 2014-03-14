Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOVF9-0002G4-4M
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 12:45:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOVF2-0001pH-Nt
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:45:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOVEx-00020M-Ut
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:45:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOVEe-0001tp-8w; Fri, 14 Mar 2014 12:45:28 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E788341CB5;
	Fri, 14 Mar 2014 20:45:26 +0400 (MSK)
Message-ID: <53233226.3090908@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 20:45:26 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-13-git-send-email-peter.maydell@linaro.org>
	<20140310215910.GE7104@redhat.com>
In-Reply-To: <20140310215910.GE7104@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 12/12] hw/pci-host/apb.c: Avoid shifting
 left into sign bit
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
X-List-Received-Date: Fri, 14 Mar 2014 16:45:57 -0000

11.03.2014 01:59, Michael S. Tsirkin wrote:
> On Mon, Mar 10, 2014 at 07:10:48PM +0000, Peter Maydell wrote:
>> Add U suffix to avoid undefined behaviour.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> While not required for correctness, it would be cleaner
> to change all constants around this line to 1U <<, for consistency.

I agree, this is what I thought as well when looking at the result.
I can fix when applying if you like.

Thanks,

/mjt


>> ---
>>  hw/pci-host/apb.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/pci-host/apb.c b/hw/pci-host/apb.c
>> index 1b399dd..a6869b8 100644
>> --- a/hw/pci-host/apb.c
>> +++ b/hw/pci-host/apb.c
>> @@ -58,7 +58,7 @@ do { printf("APB: " fmt , ## __VA_ARGS__); } while (0)
>>  #define PBM_PCI_IMR_MASK    0x7fffffff
>>  #define PBM_PCI_IMR_ENABLED 0x80000000
>>  
>> -#define POR          (1 << 31)
>> +#define POR          (1U << 31)
>>  #define SOFT_POR     (1 << 30)
>>  #define SOFT_XIR     (1 << 29)
>>  #define BTN_POR      (1 << 28)


>> 1.9.0
>>
> 


