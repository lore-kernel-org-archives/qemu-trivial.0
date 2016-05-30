Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7K0G-0003g5-De
	for mharc-qemu-trivial@gnu.org; Mon, 30 May 2016 06:00:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1b7K0D-0003eK-Oh
	for qemu-trivial@nongnu.org; Mon, 30 May 2016 06:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1b7K0B-0007fc-Tk
	for qemu-trivial@nongnu.org; Mon, 30 May 2016 06:00:52 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:16054 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1b7K06-0007WH-Hc; Mon, 30 May 2016 06:00:46 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AdAgA+DkxX/5tjdVtdGQEBAQEBgx6OeJgnAQUBBAGBD5EOgg8BDYF5hhECgSs4FAEBAQEBAQFlJ4RGAQEEeRALGAklDwEsGwYBiEUBux4BAQEBAQEEAQEBAQEihV+FFYoGHAEEmDedPI9MHgEBQoNvOolvAQEB
X-IPAS-Result: A2AdAgA+DkxX/5tjdVtdGQEBAQEBgx6OeJgnAQUBBAGBD5EOgg8BDYF5hhECgSs4FAEBAQEBAQFlJ4RGAQEEeRALGAklDwEsGwYBiEUBux4BAQEBAQEEAQEBAQEihV+FFYoGHAEEmDedPI9MHgEBQoNvOolvAQEB
X-IronPort-AV: E=Sophos;i="5.26,389,1459807200"; d="scan'208";a="131469745"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 30 May 2016 12:00:06 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1b7JzS-00019C-LK; Mon, 30 May 2016 12:00:06 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1b7JzS-0007iX-IY; Mon, 30 May 2016 12:00:06 +0200
From: Alberto Garcia <berto@igalia.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <574BE26E.9020106@cn.fujitsu.com>
References: <1464091153-11057-1-git-send-email-berto@igalia.com>
	<5744DFA3.1070806@redhat.com> <574BE26E.9020106@cn.fujitsu.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Mon, 30 May 2016 12:00:06 +0200
Message-ID: <w51k2ib50ih.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix a couple of typos
 in throttle.txt
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
X-List-Received-Date: Mon, 30 May 2016 10:00:54 -0000

On Mon 30 May 2016 08:49:18 AM CEST, Changlong Xie wrote:
>>>     - Water leaks from the bucket at a rate of 100 IOPS.
>>>     - Water can be added to the bucket at a rate of 2000 IOPS.
>>>     - The size of the bucket is 2000 x 60 = 120000
>>> -  - If 'iops-total-max-length' is unset then the bucket size is 100.
>>> +  - If 'iops-total-max' is unset then the bucket size is 100.
>
> Sorry to brother, why the bucket size is 100 rather than 100 x 60?

Oh, that's because 'iops-total-max-length' can only be set if
'iops-total-max' is set as well. It's explained earlier in the document,
maybe I should make it clear there as well.

Michael, shall I send a new patch on top of my previous one or can the
previous one be replaced?

Berto

