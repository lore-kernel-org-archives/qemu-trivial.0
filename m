Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFloq-0004fv-LG
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 07:57:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RFloo-0004ZX-TO
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:57:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RFloj-0001EA-6v
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:57:22 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:47892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RFloc-0001DO-PD; Mon, 17 Oct 2011 07:57:10 -0400
Received: by qadb10 with SMTP id b10so2567433qad.4
	for <multiple recipients>; Mon, 17 Oct 2011 04:57:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.72.84 with SMTP id l20mr4050855qcj.60.1318852630013; Mon,
	17 Oct 2011 04:57:10 -0700 (PDT)
Received: by 10.229.92.10 with HTTP; Mon, 17 Oct 2011 04:57:09 -0700 (PDT)
In-Reply-To: <m3sjmrltw3.fsf@trasno.mitica>
References: <CAKUHwZpm+WW2vdM1WjHV+rmYe8mbsP8Ydtnub7UxxxzfMD9m8A@mail.gmail.com>
	<m3sjmrltw3.fsf@trasno.mitica>
Date: Mon, 17 Oct 2011 12:57:09 +0100
Message-ID: <CAFEAcA_cDYx-JNOHrMg2yxb++AEozGAZPig7xE85bCw7ko7Mzw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: quintela@redhat.com
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Dmitry Koshelev <karaghiozis@gmail.com>,
	qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm cpu state loading fix
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
X-List-Received-Date: Mon, 17 Oct 2011 11:57:23 -0000

On 17 October 2011 12:50, Juan Quintela <quintela@redhat.com> wrote:
> Dmitry Koshelev <karaghiozis@gmail.com> wrote:
>> Floating registers loading fix.
>>
>> Signed-off-by: Dmitry Koshelev <karaghiozis@gmail.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> /me really wonders if arm migration has ever worked :-(

I've used save/restore successfully on versatilepb models
before, but only for debug, not for serious work (which
would be why I didn't hit this bug -- the test case I was
working on was probably integer only code); and in order
to get that to work I had to fix a lot of devices. There
are still some ARM devboard device models which are missing
save/restore support.

-- PMM

