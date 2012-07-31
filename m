Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDKt-0004K8-Se
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 10:22:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwDKj-0004Af-OO
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwDKi-0007FR-L0
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:22:01 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:48586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwDKi-0007Ed-G7
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:22:00 -0400
Received: by yenl1 with SMTP id l1so5932820yen.4
	for <qemu-trivial@nongnu.org>; Tue, 31 Jul 2012 07:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=utUaXx1kH7Jy/C0FithSXw4oiV2+YisaZMm5PEpy/io=;
	b=Ge8Dh2IBtWCyENedd3oPyM5n0jYgWiRZMmZivw2w58E5DMEAwHT/82WTxd1ZWTxZSw
	ciF8agNkxBndAqDV0bCRjEyxap0LIOej4jXDJSkDXg3xyxYZQPepILPJHybyNchBXUVz
	wprqNVUDIdxg2E7appuaeuOaOMeBR7uTj0ajIDU0bUAyx01jUMc7/LL60RlPl8cHM9Kt
	AJe8+GGmpvm98ol+ljnCH8FX4rPejAhEUy88X7uB4OHBrj3WQKNl8gRT3kmWTE+hjgMS
	W0g7IGICs0pvc6KnB8HRC17VJzOPfORyzSiuMnU8tovssfPNOd6QO5uBFoSzbmyMFw49
	5TRg==
MIME-Version: 1.0
Received: by 10.50.10.164 with SMTP id j4mr860671igb.13.1343744519047; Tue, 31
	Jul 2012 07:21:59 -0700 (PDT)
Received: by 10.50.94.202 with HTTP; Tue, 31 Jul 2012 07:21:59 -0700 (PDT)
In-Reply-To: <87pq7c9fng.fsf@blackfin.pond.sub.org>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
Date: Tue, 31 Jul 2012 15:21:59 +0100
Message-ID: <CAFEAcA_M7RJdCjsxycJUJcOLGe+DdBPSKuagb_=Kspwp-29A2Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQl5HQkuwqOaQB2AespZTUwGlVmCmeXPaN+RZ22NsVF+F/MuU+kpbHGE2RnEcGbMHXzkgjs/
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: patches@linaro.org, qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
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
X-List-Received-Date: Tue, 31 Jul 2012 14:22:10 -0000

On 31 July 2012 15:19, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> +     find . -name '*.[od]' | xargs rm -f
>> +     rm -f *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
>
> Shit happens if you somehow manage to create a "mean" file name in the
> build tree.  Sure you don't want to -print0 | xargs -0?

-print0 isn't POSIX, so I wasn't sure it would be present on all
our platforms. (It's probably fairly safe, though...)

-- PMM

