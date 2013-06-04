Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjsIy-0006nM-11
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 10:33:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UjsIo-0006aM-Lu
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 10:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UjsIg-0005as-KK
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 10:33:33 -0400
Received: from mail-qc0-x22a.google.com ([2607:f8b0:400d:c01::22a]:53833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1UjsID-0005QD-LI; Tue, 04 Jun 2013 10:32:57 -0400
Received: by mail-qc0-f170.google.com with SMTP id s11so176464qcw.29
	for <multiple recipients>; Tue, 04 Jun 2013 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=60ACxz7HTcwoFrcXkP8U1ZtsTMbYbxzxfvpnVPYahFU=;
	b=XbZzHURvh0mOuu0v0LP+T6DwLo6IRVQAqy9T80h1ejrYa33sb04BTMWNw9gxOtuwUq
	ah/4Xf99bsGfD39Rc+1H1AjUGQR9sp8P4dqPHGAPmeRnn7zrHLgymi4kerwHy8WDg3uo
	NnNjdza0B2QJmGYxKPYUKybcBUY2yJrnUBzMuREqTwIr3f2stquqbUutepNYeXcL/BsH
	R/rYZvUNykCuLKFWyPaPAiFfGMu2/JEotVJjZHYwQkGxtyq/nQVHTcqFxHkHd0yDDgNr
	hvSYyQ/J3smamhS2/BKTxGgT727vXmzVaUsjxJGuGaloIFeI8LIrSKdeToUycA7x4SiD
	RAkA==
MIME-Version: 1.0
X-Received: by 10.229.134.134 with SMTP id j6mr9285043qct.117.1370356376959;
	Tue, 04 Jun 2013 07:32:56 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.12.17 with HTTP; Tue, 4 Jun 2013 07:32:56 -0700 (PDT)
In-Reply-To: <CAEgOgz6KQkHtLiw9p3qreYP980L+UedhXZ5vx3sJP1-k-DfF3g@mail.gmail.com>
References: <1369835909-35664-1-git-send-email-emaste@freebsd.org>
	<CAEgOgz6KQkHtLiw9p3qreYP980L+UedhXZ5vx3sJP1-k-DfF3g@mail.gmail.com>
Date: Tue, 4 Jun 2013 10:32:56 -0400
X-Google-Sender-Auth: VYZP_M4jPSZhvTwZBjqcXll8JUw
Message-ID: <CAPyFy2BJ_JGG=xjLBaQpEbz6CqJQGF9yOsAZ3q2qJEyjugVDTw@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::22a
Cc: qemu-trivial@nongnu.org, suneelg@xilinx.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] m25p80: Add Micron n25q032a
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
X-List-Received-Date: Tue, 04 Jun 2013 14:33:42 -0000

On 4 June 2013 07:31, Peter Crosthwaite <peter.crosthwaite@xilinx.com> wrote:
>>      /* Micron */
>> +    { INFO("n25q032a",    0x20bb16,      0,  64 << 10,  64, ER_4K) },
>
> Does this have a11 and a13 variants as well?
>
>>      { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, 0) },
>>      { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, 0) },
>
> And this looks odd, these parts don't support 4K erase as well?

You're correct on both counts - I originally added the n25q032a based
on the n25q256a entry, then sync'd the list with the one from the
Linux kernel, and it's missing the 4K sector erase flag.  I'll send a
followup patch to update all of the Micron entries.

