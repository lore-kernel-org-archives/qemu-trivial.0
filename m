Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckpJr-00030x-Ip
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 04:52:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ckpJo-0002yv-Uh
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 04:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ckpJo-0004sY-5b
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 04:52:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ckpJf-0004oJ-Sy; Mon, 06 Mar 2017 04:52:31 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A556B81226;
	Mon,  6 Mar 2017 09:52:31 +0000 (UTC)
Received: from [10.36.116.125] (ovpn-116-125.ams2.redhat.com [10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7B42D653;
	Mon,  6 Mar 2017 09:52:29 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<cc6a20fc4a2748f24920c03ce64ae34af0f61799.1488504063.git.balaton@eik.bme.hu>
	<d5475df8-290b-07d4-d177-979d78850615@redhat.com>
	<CAFEAcA90FRxghG0ZdH7H9y2bDk2U9XO1TUJgx0MN+N=7LzO5pQ@mail.gmail.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Magnus Damm <magnus.damm@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4a30ecb4-77d0-795f-bf61-378546a8b034@redhat.com>
Date: Mon, 6 Mar 2017 10:52:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90FRxghG0ZdH7H9y2bDk2U9XO1TUJgx0MN+N=7LzO5pQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 06 Mar 2017 09:52:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 13/13] ppc: Add SM501
 device in config for ppc and ppcemb targets
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
X-List-Received-Date: Mon, 06 Mar 2017 09:52:42 -0000

On 06.03.2017 10:47, Peter Maydell wrote:
> On 6 March 2017 at 07:00, Thomas Huth <thuth@redhat.com> wrote:
>> Note: In case you respin the series, you might want to add this
>> CONFIG_SM501 to ppc64-softmmu.mak, too, since it is a superset of the
>> 32-bit config (i.e. it can also emulate the 32-bit embedded chips).
> 
> Yes, definitely do this please.
> (Missed this because ARM's 64-bit default config includes the
> 32-bit one rather than duplicating its contents.)

I guess we could do something like that on ppc, too (and ppc-softmmu.mak
should likely include ppcemb-softmmu.mak), but
that's something for QEMU 2.10 / 3.0 / whichever version will be next.

 Thomas


