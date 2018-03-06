Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etDMw-0007gA-B9
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 09:15:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1etDMp-0007cK-Kr
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 09:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1etDMj-0002dj-5K
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 09:14:59 -0500
Received: from chuckie.co.uk ([82.165.15.123]:42355
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1etDMi-0002cq-UR; Tue, 06 Mar 2018 09:14:53 -0500
Received: from [86.188.254.49] (helo=[172.30.1.185])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1etDMt-0005l7-LV; Tue, 06 Mar 2018 14:15:04 +0000
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <20180306132430.32110-1-berrange@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8df5a25c-3e3b-c85e-223a-f5a57a06438d@ilande.co.uk>
Date: Tue, 6 Mar 2018 14:14:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180306132430.32110-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.188.254.49
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 82.165.15.123
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: don't use hwaddr as a
 type in trace events
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
X-List-Received-Date: Tue, 06 Mar 2018 14:15:04 -0000

On 06/03/18 13:24, Daniel P. Berrangé wrote:

> Use types that are defined by QEMU in trace events caused build failures
> for the UST trace backend:
> 
>    In file included from trace-ust-all.c:13:0:
>    trace-ust-all.h:11844:206: error: unknown type name ‘hwaddr’
> 
> It only knows about C built-in types, and any types that are pulled in
> from includs of qemu-common.h and lttng/tracepoint.h. This does not
> include the 'hwaddr' type, so replace it with a uint64_t which is what
> exec/hwaddr.h defines 'hwaddr' as. This fixes the build failure
> introduced by
> 
>    commit 9eb8040c2d2b38e1a40bb6129b1b668fa178fcab
>    Author: Peter Maydell <peter.maydell@linaro.org>
>    Date:   Fri Mar 2 10:45:39 2018 +0000
> 
>      hw/misc/tz-ppc: Model TrustZone peripheral protection controller
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
> 
> For future work it might be good to have tracetool whitelist the
> permitted data types that can be safely used in trace events...
> 
>   hw/misc/trace-events | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index eb5ffcc0a8..b0cc047289 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -92,8 +92,8 @@ tz_ppc_cfg_sec_resp(int level) "TZ PPC: cfg_sec_resp = %d"
>   tz_ppc_irq_enable(int level) "TZ PPC: int_enable = %d"
>   tz_ppc_irq_clear(int level) "TZ PPC: int_clear = %d"
>   tz_ppc_update_irq(int level) "TZ PPC: setting irq line to %d"
> -tz_ppc_read_blocked(int n, hwaddr offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" HWADDR_PRIx " read (secure %d user %d) blocked"
> -tz_ppc_write_blocked(int n, hwaddr offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" HWADDR_PRIx " write (secure %d user %d) blocked"
> +tz_ppc_read_blocked(int n, uint64_t offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" HWADDR_PRIx " read (secure %d user %d) blocked"
> +tz_ppc_write_blocked(int n, uint64_t offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" HWADDR_PRIx " write (secure %d user %d) blocked"
>   
>   # hw/misc/iotkit-secctl.c
>   iotkit_secctl_s_read(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl S regs read: offset 0x%x data 0x%" PRIx64 " size %u"
> 

Hi Daniel,

IIRC last time I made this mistake I also had to change HWADDR_PRIx to 
PRIx64 in the format strings because one of my pull requests failed when 
trying to use HWADDR_PRIx in one of the non-QEMU tracing tools.


ATB,

Mark.

