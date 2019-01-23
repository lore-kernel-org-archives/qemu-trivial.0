Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmJn7-0007lB-Cr
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2019 09:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmJn5-0007i9-Ll
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:46:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmJn3-0008Fn-OH
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:46:07 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:42554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gmJmx-00088c-6z; Wed, 23 Jan 2019 09:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jz83vnua6uf1RX06Tf5TU9tOpvaROtoXNQEgvPB0XF4=;
	b=ByLQVuMj8MLWoKRO+xecNUv+Ru
	d4XoM1mtvzyCAI3GfMi3nGajspLKYrh+OCxgeadxPie2ug4xs3VYQMkAc+jfXBU8pJ0660shS6Eeb
	4OjiAmE5P5saGhWbMw2B23B6SJ5fANBmxYn+czUKtJV5nsQzbGRy/9qQw7dVezxfGsXE=; 
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1548252536-6242-1-git-send-email-thuth@redhat.com>
	<1548252536-6242-4-git-send-email-thuth@redhat.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <038f7582-e5de-ab67-a2b3-0ff1e4d27c5b@mail.uni-paderborn.de>
Date: Wed, 23 Jan 2019 15:45:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548252536-6242-4-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.23.143316, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] target/tricore: Fix
 LGPL version number
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
X-List-Received-Date: Wed, 23 Jan 2019 14:46:08 -0000


On 1/23/19 3:08 PM, Thomas Huth wrote:
> It's either "GNU *Library* General Public version 2" or "GNU Lesser
> General Public version *2.1*", but there was no "version 2.0" of the
> "Lesser" library. So assume that version 2.1 is meant here.
>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/tricore/cpu-qom.h         | 2 +-
>   target/tricore/cpu.c             | 2 +-
>   target/tricore/cpu.h             | 2 +-
>   target/tricore/fpu_helper.c      | 2 +-
>   target/tricore/helper.c          | 2 +-
>   target/tricore/helper.h          | 2 +-
>   target/tricore/op_helper.c       | 2 +-
>   target/tricore/translate.c       | 2 +-
>   target/tricore/tricore-defs.h    | 2 +-
>   target/tricore/tricore-opcodes.h | 2 +-
>   10 files changed, 10 insertions(+), 10 deletions(-)


We can re-license it to GPL v2, but I'm also fine with this variant, so

Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>



