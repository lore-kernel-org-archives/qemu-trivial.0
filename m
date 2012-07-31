Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwEhE-0003bo-4A
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 11:49:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SwEh7-0003Hq-39
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:49:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SwEh5-00060o-Ri
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:49:12 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SwEh0-0005yx-Ov; Tue, 31 Jul 2012 11:49:06 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	3B3F87280021; Tue, 31 Jul 2012 17:49:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id B-FjkbUVsuB0; Tue, 31 Jul 2012 17:49:04 +0200 (CEST)
Received: from [192.168.178.20] (p54ADA0E1.dip.t-dialin.net [84.173.160.225])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	2A937728001F; Tue, 31 Jul 2012 17:49:04 +0200 (CEST)
Message-ID: <5017FE6F.7090107@weilnetz.de>
Date: Tue, 31 Jul 2012 17:49:03 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
	<CAFEAcA_M7RJdCjsxycJUJcOLGe+DdBPSKuagb_=Kspwp-29A2Q@mail.gmail.com>
	<87k3xk577l.fsf@blackfin.pond.sub.org>
	<20120731143834.GJ2475@redhat.com>
	<CAFEAcA9+32Y+q7p5H7JPvOucVU-3_s94wT7JtX0nz7e60tbTPA@mail.gmail.com>
In-Reply-To: <CAFEAcA9+32Y+q7p5H7JPvOucVU-3_s94wT7JtX0nz7e60tbTPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: "Daniel P. Berrange" <berrange@redhat.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Avoid explicit
 list of directories in clean target
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
X-List-Received-Date: Tue, 31 Jul 2012 15:49:19 -0000

Am 31.07.2012 17:00, schrieb Peter Maydell:
> On 31 July 2012 15:38, Daniel P. Berrange <berrange@redhat.com> wrote:
>> Isn't using 'find' somewhat overkill here really. QEMU only creates
>> .o and .d files in 2 levels of directory, so sure we can just avoid
>> find entirely
>>
>>    rm -f *.[od] */*.[od]
>
> That's exactly the bug this change is addressing (in a more
> general way than a couple of the proposed point fixes). There
> are subdirectories of hw/, so for instance we have a hw/usb/bus.o
> which your rm would not delete.
>
> -- PMM

Yes, QEMU creates files in 3 levels. We could use

     rm -f *.[od] */*.[od] */*/*.[od]

I suggest using the wrapper $(call quiet-command,...)
to suppress printing of all removed file names.

For me, your patch using find would also be sufficient.

Only developers use "make clean", and they should know
how to name files. Even if there are files with blanks
in their name, in most cases nothing bad will happen
(as long as they are not named "-rf .. .o" which would
be the worst scenario I can imagine).

Regards,
Stefan W.


