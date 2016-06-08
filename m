Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAZMZ-0000Cr-Fb
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 05:01:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1bAZMT-00007K-CI
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 05:01:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1bAZMR-00057c-Hf
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 05:01:16 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:13525 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1bAZMH-00051b-71; Wed, 08 Jun 2016 05:01:05 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DYCAAT3ldX/5tjdVtdGgEBAQGDII59mQ8BAQEBAQEBBAGBDwGRJYIPgXmGEwKBNzgUAQEBAQEBAWUnhEYBAQR5EAsOEyUPASwbBgGIRQG9HQEBAQEBAQQBAQEBASKFX4UViX4cAQSYT51Fj2EeNoNwOopBAQEB
X-IPAS-Result: A2DYCAAT3ldX/5tjdVtdGgEBAQGDII59mQ8BAQEBAQEBBAGBDwGRJYIPgXmGEwKBNzgUAQEBAQEBAWUnhEYBAQR5EAsOEyUPASwbBgGIRQG9HQEBAQEBAQQBAQEBASKFX4UViX4cAQSYT51Fj2EeNoNwOopBAQEB
X-IronPort-AV: E=Sophos;i="5.26,438,1459807200"; d="scan'208";a="18642955"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 08 Jun 2016 11:00:23 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1bAZLa-00071G-5o; Wed, 08 Jun 2016 11:00:22 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1bAZLa-0000Zr-3A; Wed, 08 Jun 2016 11:00:22 +0200
From: Alberto Garcia <berto@igalia.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <ce94e108e049ac2b51ef197fa15b1dcf6600c9ca.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
	<ce94e108e049ac2b51ef197fa15b1dcf6600c9ca.1465112552.git.mjt@msgid.tls.msk.ru>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Wed, 08 Jun 2016 11:00:22 +0200
Message-ID: <w51eg8812e1.fsf@maestria.local.igalia.com>
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
X-List-Received-Date: Wed, 08 Jun 2016 09:01:22 -0000

On Sun 05 Jun 2016 09:43:01 AM CEST, Michael Tokarev wrote:

>    - Water leaks from the bucket at a rate of 100 IOPS.
>    - Water can be added to the bucket at a rate of 2000 IOPS.
>    - The size of the bucket is 2000 x 60 = 120000
> -  - If 'iops-total-max-length' is unset then the bucket size is 100.
> +  - If 'iops-total-max' is unset then the bucket size is 100 x 60.

Sorry, I should have noticed this here in the pull request, but this is
wrong.

If 'iops-total-max' is unset the bucket size is 100. It's not 100 x 60
because you can only set 'iops-total-max-length = 60' when
'iops-total-max' is set as well.

I'll send a new patch fixing this.

Berto

