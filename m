Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWK6I-00068S-00
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2011 22:47:50 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wudxw@linux.vnet.ibm.com>) id 1RWK6G-00068L-Jd
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wudxw@linux.vnet.ibm.com>) id 1RWK6F-0006zn-1C
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:47:48 -0500
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:50682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wudxw@linux.vnet.ibm.com>) id 1RWK6E-0006yv-EH
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 22:47:46 -0500
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wudxw@linux.vnet.ibm.com>;
	Fri, 2 Dec 2011 09:17:40 +0530
Received: from d28relay02.in.ibm.com (9.184.220.59)
	by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2011 09:17:36 +0530
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay02.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pB23lZ0x2400456; Fri, 2 Dec 2011 09:17:36 +0530
Received: from d28av01.in.ibm.com (loopback [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pB23lZAL005263; Fri, 2 Dec 2011 09:17:35 +0530
Received: from oc4654482034.ibm.com ([9.115.122.62])
	by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pB23lYx6005254; Fri, 2 Dec 2011 09:17:34 +0530
Message-ID: <4ED84A55.5060106@linux.vnet.ibm.com>
Date: Fri, 02 Dec 2011 11:47:33 +0800
From: Mark Wu <wudxw@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110927 Red Hat/3.1.15-1.el6_1
	Thunderbird/3.1.15
MIME-Version: 1.0
To: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
References: <1322796212-324-1-git-send-email-zhihuili@linux.vnet.ibm.com>
In-Reply-To: <1322796212-324-1-git-send-email-zhihuili@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
x-cbid: 11120203-3864-0000-0000-0000005840FB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.3
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/smbus_eeprom.c : fix
	memory leak
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
X-List-Received-Date: Fri, 02 Dec 2011 03:47:49 -0000

On 12/02/2011 11:23 AM, Li Zhi Hui wrote:
> Signed-off-by: Li Zhi Hui<zhihuili@linux.vnet.ibm.com>
> ---
>   hw/smbus_eeprom.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/hw/smbus_eeprom.c b/hw/smbus_eeprom.c
> index 5d080ab..d66fbbc 100644
> --- a/hw/smbus_eeprom.c
> +++ b/hw/smbus_eeprom.c
> @@ -142,4 +142,5 @@ void smbus_eeprom_init(i2c_bus *smbus, int nb_eeprom,
>           qdev_prop_set_ptr(eeprom, "data", eeprom_buf + (i * 256));
>           qdev_init_nofail(eeprom);
>       }
> +    g_free(eeprom_buf);
>   }
The memory pointed by eeprom_buf is used as 'data' buf of 8 
SMBusEEPROMDevice after initialization.  And it calls qdev_init_nofail, 
which will exit on failure. it should be ok to leave it there. Anyway, 
you shouldn't free it in the initialization.

Mark.


