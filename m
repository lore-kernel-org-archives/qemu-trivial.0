Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zc9wi-0006Ti-8q
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2015 06:28:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zc9wg-0006Qn-Db
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:28:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zc9wf-000619-HP
	for qemu-trivial@nongnu.org; Wed, 16 Sep 2015 06:28:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zc9wb-00060d-6x; Wed, 16 Sep 2015 06:28:05 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A09B841B11;
	Wed, 16 Sep 2015 13:28:04 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 855DEA6E;
	Wed, 16 Sep 2015 13:28:04 +0300 (MSK)
Message-ID: <55F94434.10603@msgid.tls.msk.ru>
Date: Wed, 16 Sep 2015 13:28:04 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Jean-Christophe Dubois <jcd@tribudubois.net>
References: <1440085955-27951-1-git-send-email-linux@roeck-us.net>	<55F284A8.8060404@msgid.tls.msk.ru>
	<CAPokK=oHBqhrwXgx5VM3xHFqu2KTtBfOikhQbSUy5azRTO2LsA@mail.gmail.com>
In-Reply-To: <CAPokK=oHBqhrwXgx5VM3xHFqu2KTtBfOikhQbSUy5azRTO2LsA@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-trivial] [PATCH] imx_serial: Generate interrupt on tx
	empty if enabled
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
X-List-Received-Date: Wed, 16 Sep 2015 10:28:11 -0000

13.09.2015 23:17, Peter Crosthwaite wrote:
> On Fri, Sep 11, 2015 at 12:37 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>
>> Can we please have some r-b or ACK for this? :)
>>
>> 20.08.2015 18:52, Guenter Roeck wrote:
>>> Generate an interrupt if the tx buffer is empty and the tx empty interrupt
>>> is enabled. This fixes a problem seen when running a Linux image since
>>> Linux commit 55c3cb1358e ("serial: imx: remove unneeded imx_transmit_buffer()
>>> from imx_start_tx()"). Linux now waits for the tx empty interrupt before
>>> starting to send data, causing transmit stalls until there is an interrupt
>>> for another reason.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Looks right, Jean-Christophe may know more though.

Thanks, applied to the trivial-patches tree :)

/mjt

