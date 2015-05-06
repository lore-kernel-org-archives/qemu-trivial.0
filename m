Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YpwCx-0008Bf-3o
	for mharc-qemu-trivial@gnu.org; Wed, 06 May 2015 06:05:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YpwCu-0008At-Gp
	for qemu-trivial@nongnu.org; Wed, 06 May 2015 06:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YpwCq-0007UY-Rj
	for qemu-trivial@nongnu.org; Wed, 06 May 2015 06:05:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YpwCg-0007Aw-3y; Wed, 06 May 2015 06:05:22 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DCC7140561;
	Wed,  6 May 2015 13:05:20 +0300 (MSK)
Message-ID: <5549E760.6030208@msgid.tls.msk.ru>
Date: Wed, 06 May 2015 13:05:20 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <1430141220-20123-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CABoDooPkbFvVsC8i0XF9-9+dZQK16aJGDVoE7LAd_L9=COagqA@mail.gmail.com>
In-Reply-To: <CABoDooPkbFvVsC8i0XF9-9+dZQK16aJGDVoE7LAd_L9=COagqA@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] libcacard: stop
	including qemu-common.h
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
X-List-Received-Date: Wed, 06 May 2015 10:05:37 -0000

06.05.2015 12:23, Laurent Desnogues wrote:
> Hello,
> 
> On Mon, Apr 27, 2015 at 3:27 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> This is a small step towards making libcacard standalone.
> 
> on my system the removal of qemu-common.h inclusion broke compilation
> due to assert being used in glib-compat.h.

Interesting. What kind of build environment is that?  I compile-tested on
several platforms, all went fine.. ;)

>     A  fix might be to include
> assert.h in glib-compat.h.

I prefer s/assert/g_assert/ in glib-compat.h.

Thanks,

/mjt


