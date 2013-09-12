Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKBnw-0007QM-IS
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:39:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VKBnm-0007Eg-Sr
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VKBne-0001Li-Fd
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:39:38 -0400
Received: from mail-oa0-x234.google.com ([2607:f8b0:4003:c02::234]:41117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1VKBnN-0001Ju-D7; Thu, 12 Sep 2013 14:39:13 -0400
Received: by mail-oa0-f52.google.com with SMTP id f4so210345oah.11
	for <multiple recipients>; Thu, 12 Sep 2013 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=fr4cnL7UyroyMuzAZvBvNVNDKBiTxkEwSDLYGuRFGE0=;
	b=whCzxyAfZryDiW3tsKIOX4fn600qr5Jb3i+Vs6EDnDUdOv7fDSmEBmVwk3DVl9REPT
	quE1sQkNTvlkHRy/zPgs2aQZQit5YGZrB6kyQIeA+XgMO3KqekMFYy8BHv7FaOFQNBb0
	N70vdMQ9eHdjLwa7m0vSPpgt9lhKkoNdFUNLnM3i5wQlrY+oc0v3RED4pMD1dL8O3OuJ
	eonHCBio4slqsAAQQBy+8rg4onPHpUEO9v0MD3qYAdfjdGNwp8Y6huEf4UiwNcKY6SBw
	+IeP4Ygg3xAI/hmiIdlSgQEhX4RetE+gjqdMWRcSUwtSn3TXxK8Ge8bMDCB12bnVgiwy
	CtOA==
X-Received: by 10.60.145.241 with SMTP id sx17mr3501069oeb.57.1379011152573;
	Thu, 12 Sep 2013 11:39:12 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id d8sm7720016oeu.6.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 11:39:11 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <52320A4C.6020202@twiddle.net>
Date: Thu, 12 Sep 2013 11:39:08 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1379009870-18323-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1379009870-18323-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::234
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
X-List-Received-Date: Thu, 12 Sep 2013 18:39:47 -0000

On 09/12/2013 11:17 AM, Stefan Weil wrote:
> @@ -1093,7 +1093,6 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
>              tmp8 = helper_ldb_mmu(env, taddr, tci_read_i(&tb_ptr));
>  #else
>              host_addr = (tcg_target_ulong)taddr;
> -            assert(taddr == host_addr);
>              tmp8 = *(uint8_t *)(host_addr + GUEST_BASE);
>  #endif

I noticed first that g2h would be better than fiddling GUEST_BASE
by hand.  But then I noticed failure to handle endianness and
failure to handle unaligned accesses too.

You should be using

  tmp8 = ldub(taddr);

et al.  See include/exec/cpu-all.h, beginning line 253.


r~

