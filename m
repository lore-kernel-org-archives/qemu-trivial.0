Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UcG5x-0006G6-8i
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2013 10:20:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UcG5u-0006EY-Gx
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 10:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UcG5t-0005e4-2Y
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 10:20:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UcG5p-0005dH-EH; Tue, 14 May 2013 10:20:41 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9FB9D409CB;
	Tue, 14 May 2013 18:20:40 +0400 (MSK)
Message-ID: <51924838.9010304@msgid.tls.msk.ru>
Date: Tue, 14 May 2013 18:20:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1368530312-16080-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA_P78TYqZGr0reev4Oa=4j1qoKaGbC6rEnBDeMtUo-TTg@mail.gmail.com>
	<519246F4.4040803@msgid.tls.msk.ru>
	<CAFEAcA-_eyVSdD+L_ejNYQjaiKndgPU4RJOVQFJULBvGZV9qTg@mail.gmail.com>
In-Reply-To: <CAFEAcA-_eyVSdD+L_ejNYQjaiKndgPU4RJOVQFJULBvGZV9qTg@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH (trivial)] remove some
	double-includes
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
X-List-Received-Date: Tue, 14 May 2013 14:20:48 -0000

14.05.2013 18:16, Peter Maydell wrote:
> On 14 May 2013 15:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 14.05.2013 15:30, Peter Maydell wrote:
>>>
>>> There's already been a patch on the list for this one:
>>> http://patchwork.ozlabs.org/patch/240540/
>>>
>> Yes I know Peter, and actually this is the patch which prompte
>> me to look for other places.  The person in question does not
>> reply (so far)
> 
> Is there anything they need to reply to? The patch is good,
> it has a signed-off-by and a review, you can just put it in
> the trivial queue to be applied next time you do a pull
> request for it.

OH. That's my dirty script.  I didn't notice S-o-b in text
without patch description ;)

Sure that's enough now when I see it :)

Thank you!

/mjt

