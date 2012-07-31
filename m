Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwFqs-000761-TV
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 13:03:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SwFql-0006mT-Rh
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 13:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SwFqj-00084M-TT
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 13:03:15 -0400
Received: from mail-qa0-f52.google.com ([209.85.216.52]:64183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1SwFqb-000814-3p; Tue, 31 Jul 2012 13:03:05 -0400
Received: by qabj34 with SMTP id j34so1679923qab.4
	for <multiple recipients>; Tue, 31 Jul 2012 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+fd9qPMx59lpugsi/rgPVeZpdfieRPqUrYqLOJQFjP0=;
	b=ikjRaP+XRh7wuOZYxZIyfAFd1k3yjq657ElwOTPMmoRFYqUiUTvqclvhQJhkYTyFgM
	o5EWge9KZNJRfXfJUROXOPL8Rt5m98LpfhoxcSwDfJqk3DOcHywbE1p3sbHr4nWbBzZw
	SWLE9H67hHGj99pi3McdH3AvESLUVE9Nq6wtKhWJyKasiQajqfa8FESgQqdk2K/kfIH1
	KBR/qX5Aog5gLHNYI/cqc/uAiwU/cipbpbXHornqtTvjXSJK/ciJ98LsqxapKt70/JfF
	uXW2mXcqvmRlY6SQTxNCyR2laIayMudwgi9MnVBY/EUAcSWVDaDOs/V13wxJSgM0UOIs
	JhZQ==
Received: by 10.50.196.232 with SMTP id ip8mr2629178igc.50.1343754181274; Tue,
	31 Jul 2012 10:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.10 with HTTP; Tue, 31 Jul 2012 10:02:41 -0700 (PDT)
In-Reply-To: <501805EB.9070606@weilnetz.de>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
	<CAFEAcA_M7RJdCjsxycJUJcOLGe+DdBPSKuagb_=Kspwp-29A2Q@mail.gmail.com>
	<87k3xk577l.fsf@blackfin.pond.sub.org>
	<20120731143834.GJ2475@redhat.com>
	<CAFEAcA9+32Y+q7p5H7JPvOucVU-3_s94wT7JtX0nz7e60tbTPA@mail.gmail.com>
	<5017FE6F.7090107@weilnetz.de>
	<CAFEAcA_iNL5YS4cH=NH=o_y3D9pmnE6j3U2qS6-xUw5CP_L4bA@mail.gmail.com>
	<501805EB.9070606@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Tue, 31 Jul 2012 17:02:41 +0000
Message-ID: <CAAu8pHurA8B-Gu1ipmX-owb5tcaQX5m58ZGFgGrcJgj+RVaJnw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.216.52
Cc: Peter Maydell <peter.maydell@linaro.org>, patches@linaro.org,
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
X-List-Received-Date: Tue, 31 Jul 2012 17:03:21 -0000

On Tue, Jul 31, 2012 at 4:20 PM, Stefan Weil <sw@weilnetz.de> wrote:
> Am 31.07.2012 17:51, schrieb Peter Maydell:
>>
>> On 31 July 2012 16:49, Stefan Weil <sw@weilnetz.de> wrote:
>>>
>>> Yes, QEMU creates files in 3 levels. We could use
>>>
>>>      rm -f *.[od] */*.[od] */*/*.[od]
>>>
>>> I suggest using the wrapper $(call quiet-command,...)
>>> to suppress printing of all removed file names.
>>
>>
>> My worry was not so much what we print as that we
>> might be exceeding the total command line length
>> limits on some systems (whether you did it this way
>> or via "rm -f $(find ...)").
>>
>> -- PMM
>
>
> That's quite possible:
>
> $ find -name "*.[od]"|wc
>    4862    4862  151329
> $ ls *.[od] */*.[od] */*/*.[od] */*/*/*.[od] */*/*/*/*.[od]|wc
>    4862    4862  141605
>
> (I was somewhat surprised to see that we use 5 levels of directories).
>
> The command line would be more than 140000 characters which is indeed very
> long.
>
> Separating .o and .d files and the levels reduces that number:
>
> $ ls *.o|wc
>      80      80     952
> $ ls */*.o|wc
>     819     819   20048
> $ ls */*/*.o|wc
>    1406    1406   45573
> $ ls */*/*/*.o|wc
>      87      87    2579
> $ ls */*/*/*/*.o|wc
>      16      16     796
>
> The 2nd and the 3rd level are potentially critical, but they could be
> split up further if needed.
>
> What about removing support for in-tree builds?
> For out-of-tree builds 'make distclean' is nearly trivial.

We could also recommend out of tree build for those hosts which have
command line restrictions (can they be detected?). Even better, always
warn if in tree build is detected.

>
> -- Stefan W.
>
>

