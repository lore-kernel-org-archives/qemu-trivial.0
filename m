Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKC6O-00069Z-4K
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:58:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKC6D-0005rn-Kl
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VKC66-0006yw-8i
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:58:41 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:52623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VKC5a-0006ms-R9; Thu, 12 Sep 2013 14:58:02 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	021E972819E8; Thu, 12 Sep 2013 20:58:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id C3W0LjII8siT; Thu, 12 Sep 2013 20:57:59 +0200 (CEST)
Received: from [192.168.178.35] (p54ADB00D.dip0.t-ipconnect.de [84.173.176.13])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	D242172819E4; Thu, 12 Sep 2013 20:57:58 +0200 (CEST)
Message-ID: <52320EB5.9030208@weilnetz.de>
Date: Thu, 12 Sep 2013 20:57:57 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>
References: <1379009870-18323-1-git-send-email-sw@weilnetz.de>
	<52320A4C.6020202@twiddle.net>
In-Reply-To: <52320A4C.6020202@twiddle.net>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Fix qemu-alpha on 32
 bit hosts (wrong assertions)
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
X-List-Received-Date: Thu, 12 Sep 2013 18:58:50 -0000

Am 12.09.2013 20:39, schrieb Richard Henderson:
> On 09/12/2013 11:17 AM, Stefan Weil wrote:
>> @@ -1093,7 +1093,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
>>              tmp8 = helper_ldb_mmu(env, taddr, tci_read_i(&tb_ptr));
>>  #else
>>              host_addr = (tcg_target_ulong)taddr;
>> -            assert(taddr == host_addr);
>>              tmp8 = *(uint8_t *)(host_addr + GUEST_BASE);
>>  #endif
> I noticed first that g2h would be better than fiddling GUEST_BASE
> by hand.  But then I noticed failure to handle endianness and
> failure to handle unaligned accesses too.
>
> You should be using
>
>   tmp8 = ldub(taddr);
>
> et al.  See include/exec/cpu-all.h, beginning line 253.
>
>
> r~

Thanks for your hint. Yes, as you can see from tcg/tci/README,the test
matrix of TCI
did not include big endian hosts up to now. Testing on an emulated big
endian Malta
system is terribly slow, and I have no access to real big endian
hardware fortests.

But I think that such changes are independent of this patchwhich can be
applied as it is.

Regards,
Stefan


