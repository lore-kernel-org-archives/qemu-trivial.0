Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwFC5-0006SU-EE
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 12:21:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SwFBz-0006Bx-SA
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 12:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SwFBv-0001Qv-RE
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 12:21:07 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SwFBt-0001QF-AQ; Tue, 31 Jul 2012 12:21:01 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	09E567280021; Tue, 31 Jul 2012 18:21:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id x8e6+MF9TgTA; Tue, 31 Jul 2012 18:20:59 +0200 (CEST)
Received: from [192.168.178.20] (p54ADA0E1.dip.t-dialin.net [84.173.160.225])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	46A30728001F; Tue, 31 Jul 2012 18:20:59 +0200 (CEST)
Message-ID: <501805EB.9070606@weilnetz.de>
Date: Tue, 31 Jul 2012 18:20:59 +0200
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
	<5017FE6F.7090107@weilnetz.de>
	<CAFEAcA_iNL5YS4cH=NH=o_y3D9pmnE6j3U2qS6-xUw5CP_L4bA@mail.gmail.com>
In-Reply-To: <CAFEAcA_iNL5YS4cH=NH=o_y3D9pmnE6j3U2qS6-xUw5CP_L4bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: "Daniel P. Berrange" <berrange@redhat.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>
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
X-List-Received-Date: Tue, 31 Jul 2012 16:21:12 -0000

Am 31.07.2012 17:51, schrieb Peter Maydell:
> On 31 July 2012 16:49, Stefan Weil <sw@weilnetz.de> wrote:
>> Yes, QEMU creates files in 3 levels. We could use
>>
>>      rm -f *.[od] */*.[od] */*/*.[od]
>>
>> I suggest using the wrapper $(call quiet-command,...)
>> to suppress printing of all removed file names.
>
> My worry was not so much what we print as that we
> might be exceeding the total command line length
> limits on some systems (whether you did it this way
> or via "rm -f $(find ...)").
>
> -- PMM

That's quite possible:

$ find -name "*.[od]"|wc
    4862    4862  151329
$ ls *.[od] */*.[od] */*/*.[od] */*/*/*.[od] */*/*/*/*.[od]|wc
    4862    4862  141605

(I was somewhat surprised to see that we use 5 levels of directories).

The command line would be more than 140000 characters which is indeed 
very long.

Separating .o and .d files and the levels reduces that number:

$ ls *.o|wc
      80      80     952
$ ls */*.o|wc
     819     819   20048
$ ls */*/*.o|wc
    1406    1406   45573
$ ls */*/*/*.o|wc
      87      87    2579
$ ls */*/*/*/*.o|wc
      16      16     796

The 2nd and the 3rd level are potentially critical, but they could be
split up further if needed.

What about removing support for in-tree builds?
For out-of-tree builds 'make distclean' is nearly trivial.

-- Stefan W.


