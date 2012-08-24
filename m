Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4riP-0005ag-4H
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:06:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4riJ-0005Mt-Et
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4riG-00087n-T4
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:06:07 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:59501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4riG-00086I-PB
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:06:04 -0400
Received: by iakx26 with SMTP id x26so3022670iak.4
	for <qemu-trivial@nongnu.org>; Fri, 24 Aug 2012 04:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=N+YT+ZfcXVevBALZ4Xrw1pXrtUZiKDcTlZecCafAnyQ=;
	b=E7lUhfQ5v9WnUSeqxyBaeuiba03XT3e+ZA4e2N+0GoWMfkqj46x57xKOiVs5l5wqkC
	mjkBBGQi2Crj/hhefKiI83KWAdluyAyzouEXcR7MDupm4vrOQ2kt6hVyY92FDgZa4rR1
	JlF8vAzjiJsCSze/66FouKePmHYoezFUyxbijXPYM+uWq/OQ6vB1HCTuRDyhQnlxFl+P
	K+iCAYjZJlQ0q6HmvfXIMZSs6Aa9cI3rdxitiHTLzxsXIpmy9bqKaG64iG1aYPByQ+IW
	pnI2hzMQ1EPCTJVgV6Q28wfqMblrJSnRo5VeYYmj9jlcDyzQ4rhAnh1JzfWK+y1MSUSi
	afow==
MIME-Version: 1.0
Received: by 10.50.95.200 with SMTP id dm8mr1643480igb.60.1345806363780; Fri,
	24 Aug 2012 04:06:03 -0700 (PDT)
Received: by 10.50.160.161 with HTTP; Fri, 24 Aug 2012 04:06:03 -0700 (PDT)
In-Reply-To: <20120824105436.GC10867@stefanha-thinkpad.localdomain>
References: <1345437900-8001-1-git-send-email-sw@weilnetz.de>
	<20120824105436.GC10867@stefanha-thinkpad.localdomain>
Date: Fri, 24 Aug 2012 12:06:03 +0100
Message-ID: <CAFEAcA8K=DxK6PbX+LzqN5+2qSxxs=7N+=7JiwwGX11FD3H9JA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnNuJU3Ic+paH/uU5kON6Au6qZG/CnmSI6Y1/WmNn00kZeI1TQuogO/5wPg0sGHV5r+Fozk
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, imammedo@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-common: Declare
	qemu_irq earlier
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
X-List-Received-Date: Fri, 24 Aug 2012 11:06:12 -0000

On 24 August 2012 11:54, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Mon, Aug 20, 2012 at 06:45:00AM +0200, Stefan Weil wrote:
>> This allows using qemu_irq in the target specific cpu.h.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  qemu-common.h |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> I'm not sure if there's a reason why qemu_irq was previously hidden from
> cpu.h but the code change itself is fine and no one else has commented.
>
> Thanks, applied to the trivial patches tree:
> https://github.com/stefanha/qemu/commits/trivial-patches

Consensus seemed to be that it was better to move qemu_irq
into hw/irq.h, as discussed in this mail thread:
http://lists.gnu.org/archive/html/qemu-devel/2012-08/msg03463.html
rather than just doing a move of the typedef within this header.

-- PMM

