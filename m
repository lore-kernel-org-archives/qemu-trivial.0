Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAae0-0001hv-7L
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 06:23:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1bAadx-0001dv-NK
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 06:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1bAadv-0001Bo-Ir
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 06:23:24 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:13165 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1bAadp-00018Z-8J; Wed, 08 Jun 2016 06:23:18 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BQCwBn8VdX/5tjdVtdGgEBAQGDIFaOJ5kVAQQBgQ8BkSWCD4F5JIU1OgKBOjgUAQEBAQEBAWUnhEYBAQR5EAsOCgklDwEsGwYBiEUBCbx3AQEBAQEBAQMBAQEBAQEcBYVfhRWJfhwFmE+GA5dCj2EeNoNwOjeKCgEBAQ
X-IPAS-Result: A2BQCwBn8VdX/5tjdVtdGgEBAQGDIFaOJ5kVAQQBgQ8BkSWCD4F5JIU1OgKBOjgUAQEBAQEBAWUnhEYBAQR5EAsOCgklDwEsGwYBiEUBCbx3AQEBAQEBAQMBAQEBAQEcBYVfhRWJfhwFmE+GA5dCj2EeNoNwOjeKCgEBAQ
X-IronPort-AV: E=Sophos;i="5.26,438,1459807200"; d="scan'208";a="135188030"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 08 Jun 2016 12:23:07 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1bAadf-0000H3-M1; Wed, 08 Jun 2016 12:23:07 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1bAadf-0003FE-JP; Wed, 08 Jun 2016 12:23:07 +0200
From: Alberto Garcia <berto@igalia.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
In-Reply-To: <5757E903.7020308@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
	<ce94e108e049ac2b51ef197fa15b1dcf6600c9ca.1465112552.git.mjt@msgid.tls.msk.ru>
	<w51eg8812e1.fsf@maestria.local.igalia.com>
	<5757E903.7020308@msgid.tls.msk.ru>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Wed, 08 Jun 2016 12:23:07 +0200
Message-ID: <w51bn3c0yk4.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Subject: Re: [Qemu-trivial] [PULL 24/52] docs: Fix a couple of typos in
 throttle.txt
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
X-List-Received-Date: Wed, 08 Jun 2016 10:23:27 -0000

On Wed 08 Jun 2016 11:44:35 AM CEST, Michael Tokarev wrote:
> 08.06.2016 12:00, Alberto Garcia wrote:
>> On Sun 05 Jun 2016 09:43:01 AM CEST, Michael Tokarev wrote:
>> 
>>>    - Water leaks from the bucket at a rate of 100 IOPS.
>>>    - Water can be added to the bucket at a rate of 2000 IOPS.
>>>    - The size of the bucket is 2000 x 60 = 120000
>>> -  - If 'iops-total-max-length' is unset then the bucket size is 100.
>>> +  - If 'iops-total-max' is unset then the bucket size is 100 x 60.
>> 
>> Sorry, I should have noticed this here in the pull request, but this is
>> wrong.
>
> This has been discussed before, and it looks like the original version
> which I applied was actually right... :)
>
> I can just drop this patch from the pull request, since it hasn't
> been applied yet.  Esp. since the subject line is now wrong too :)

It's been applied already:

https://github.com/qemu/qemu/commit/0bab0ebb17759c926bd48fd396bd8cbb2c8e4a3e

I'll send a follow-up patch.

Berto

