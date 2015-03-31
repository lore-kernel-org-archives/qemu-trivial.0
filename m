Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcyCs-0001jo-2G
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 11:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YcyCn-0001cM-FK
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 11:35:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YcyCd-0002N2-Kh
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 11:35:53 -0400
Received: from e34.co.us.ibm.com ([32.97.110.152]:49002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YcyCc-0002Mi-RW
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 11:35:43 -0400
Received: from /spool/local
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 31 Mar 2015 09:35:42 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 Mar 2015 09:35:39 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com
	(b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 749263E40048;
	Tue, 31 Mar 2015 09:35:38 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2VFZbOp38928464; Tue, 31 Mar 2015 08:35:38 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
	by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id t2VFZb83028465; Tue, 31 Mar 2015 09:35:37 -0600
Received: from k-d941e-10.watson.ibm.com (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2VFZbel028375; Tue, 31 Mar 2015 09:35:37 -0600
Message-ID: <551ABEC8.6030300@linux.vnet.ibm.com>
Date: Tue, 31 Mar 2015 11:35:36 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org
References: <1427808437-535644-1-git-send-email-stefanb@linux.vnet.ibm.com>
	<551AAA82.9090608@redhat.com> <551AABE5.1020509@redhat.com>
In-Reply-To: <551AABE5.1020509@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15033115-0017-0000-0000-000009C0B307
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.152
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tpm_tis: fix format for
	64bit variable
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
X-List-Received-Date: Tue, 31 Mar 2015 15:35:55 -0000

On 03/31/2015 10:15 AM, Eric Blake wrote:
> On 03/31/2015 08:09 AM, Eric Blake wrote:
>> On 03/31/2015 07:27 AM, Stefan Berger wrote:
>>> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
>>> ---
>>>   hw/tpm/tpm_tis.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
>>> index 815c8ea..52e0148 100644
>>> --- a/hw/tpm/tpm_tis.c
>>> +++ b/hw/tpm/tpm_tis.c
>>> @@ -814,7 +814,7 @@ static void tpm_tis_mmio_write_intern(void *opaque, hwaddr addr,
>>>               tis->loc[locty].state == TPM_TIS_STATE_COMPLETION) {
>>>               /* drop the byte */
>>>           } else {
>>> -            DPRINTF("tpm_tis: Data to send to TPM: %08x (size=%d)\n",
>>> +            DPRINTF("tpm_tis: Data to send to TPM: %08lx (size=%d)\n",
>> NACK.  When printing uint64_t val, you HAVE to use PRIx64, not lx, for
>> the sake of 32-bit platforms.
> Furthermore, you could have caught this much sooner if you fix the
> definition of DPRINTF.  This file used:
>
> #ifdef DEBUG_TIS
> #define DPRINTF(fmt, ...) \
>      do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
> #else
> #define DPRINTF(fmt, ...) \
>      do { } while (0)
> #endif
>
> which is bad, because the compiler CAN'T see the type mismatch unless
> you turn debugging on (alas, we have a LOT of files in the code base
> with similar bad patterns).  A better example is hw/display/cg3.c:
>
> /* Change to 1 to enable debugging */
> #define DEBUG_CG3 0
> ...
> #define DPRINTF(fmt, ...) do { \
>      if (DEBUG_CG3) { \
>          printf("CG3: " fmt , ## __VA_ARGS__); \
>      } \
> } while (0);

I'll move it towards that after 2.3 is out.

      Stefan


