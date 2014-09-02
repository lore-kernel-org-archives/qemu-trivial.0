Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XOsvY-00005j-Tr
	for mharc-qemu-trivial@gnu.org; Tue, 02 Sep 2014 14:35:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XOsvQ-0008RO-8k
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 14:35:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XOsvK-0003d5-K3
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 14:35:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XOsv8-0003Jq-Rf; Tue, 02 Sep 2014 14:35:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0722B405CF;
	Tue,  2 Sep 2014 22:35:01 +0400 (MSK)
Message-ID: <54060DD5.4020903@msgid.tls.msk.ru>
Date: Tue, 02 Sep 2014 22:35:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <1402933670-3324-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8q9MAGxD+RE_fC0z4s5Cy6n43ZHmP6Jmq3_Zih-nUecg@mail.gmail.com>
In-Reply-To: <CAFEAcA8q9MAGxD+RE_fC0z4s5Cy6n43ZHmP6Jmq3_Zih-nUecg@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Honour vlan/stack in
 hostfwd_remove commands
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
X-List-Received-Date: Tue, 02 Sep 2014 18:35:34 -0000

26.06.2014 16:35, Peter Maydell wrote:
> On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The hostfwd_add and hostfwd_remove monitor commands allow the user
>> to optionally specify a vlan/stack tuple. hostfwd_add honours this,
>> but hostfwd_remove does not (it looks up the tuple but then ignores
>> the SlirpState it has looked up and always uses the first stack
>> in the list anyway). Correct this to honour what the user requested.

I've applied this to -trivial.  Somehow this patch has been marked as
"handled" in my queue, but actually it weren't - that's why I haven't
really seen the pings.

Thanks,

/mjt

