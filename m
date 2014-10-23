Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhC1k-0004Ql-FV
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:37:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC1e-0004JF-8i
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XhC1Z-0001C3-FR
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:37:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XhC1P-0000rw-Iz; Thu, 23 Oct 2014 02:37:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D4DC345ABE;
	Thu, 23 Oct 2014 10:37:18 +0400 (MSK)
Message-ID: <5448A21D.2080108@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 10:37:17 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Max Filippov <jcmvbkbc@gmail.com>
References: <1410723393-17812-1-git-send-email-peter.maydell@linaro.org>	<CAMo8Bf+80_-=GVZbhy4URKLYThmc+h_ooVbTfvSjTL+dGwDvgg@mail.gmail.com>
	<CAFEAcA8=Ku5NwK8jqeHpB1ygHEh4JW_RgVpBnLUBSe30KFFRRA@mail.gmail.com>
In-Reply-To: <CAFEAcA8=Ku5NwK8jqeHpB1ygHEh4JW_RgVpBnLUBSe30KFFRRA@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] target-xtensa: mark XtensaConfig structs
 as unused
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
X-List-Received-Date: Thu, 23 Oct 2014 06:37:39 -0000

On 10/10/2014 08:24 PM, Peter Maydell wrote:
> On 14 September 2014 21:29, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Sun, Sep 14, 2014 at 12:36 PM, Peter Maydell
>> <peter.maydell@linaro.org> wrote:
>>> The XtensaConfig structs will be defined but not used if they are
>>> for the opposite endianness from that of the binary being built;
>>> keep the compiler from complaining about this by marking them
>>> with the 'unused' attribute.

Applied to -trivial, thanks!

/mjt

