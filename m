Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEfwd-0007Cz-AL
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 09:37:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <James.Hogan@imgtec.com>) id 1VEb70-0000X0-2D
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 04:28:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <James.Hogan@imgtec.com>) id 1VEb6u-0000Vf-3f
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 04:28:22 -0400
Received: from multi.imgtec.com ([194.200.65.239]:1191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <James.Hogan@imgtec.com>)
	id 1VEb6t-0000VW-T1; Wed, 28 Aug 2013 04:28:16 -0400
Message-ID: <521DB49B.5060708@imgtec.com>
Date: Wed, 28 Aug 2013 09:28:11 +0100
From: James Hogan <james.hogan@imgtec.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>
References: <1377622116-37650-1-git-send-email-yongbok.kim@imgtec.com>
	<521D028F.1070505@twiddle.net>
In-Reply-To: <521D028F.1070505@twiddle.net>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.154.65]
X-SEF-Processed: 7_3_0_01192__2013_08_28_09_28_15
X-detected-operating-system: by eggs.gnu.org: Windows XP
X-Received-From: 194.200.65.239
X-Mailman-Approved-At: Wed, 28 Aug 2013 09:37:58 -0400
Cc: Yongbok Kim <yongbok.kim@imgtec.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: fix
 get_physical_address() #if 0 build error
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
X-List-Received-Date: Wed, 28 Aug 2013 08:28:28 -0000

On 27/08/13 20:48, Richard Henderson wrote:
> On 08/27/2013 09:48 AM, Yongbok Kim wrote:
>>  #if 0
>> -    qemu_log(TARGET_FMT_lx " %d %d => " TARGET_FMT_lx " %d (%d)\n",
>> +    qemu_log(TARGET_FMT_lx " %d %d => %" HWADDR_PRIx " %d (%d)\n",
>>              address, rw, access_type, *physical, *prot, ret);
>>  #endif
> 
> While by itself correct, consider converting this to the trace infrastructure
> (with uint64_t instead of hwaddr).
> 
> If it's not worth a trace, it's probably not worth keeping at all.

True. I suspect it isn't worth a trace (I just happened to be modifying
that function so tried it out to test my changes - and anybody doing
that can easily add a temporary qemu_log/fprintf message themselves).

Cheers
James


