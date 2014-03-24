Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS5E0-0007EP-Jo
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 09:47:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WS5Dt-0002AY-5m
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 09:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WS5By-0000MH-GS
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 09:45:38 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:40359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WS4qT-0001nx-NF
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 09:23:17 -0400
Received: by mail-lb0-f172.google.com with SMTP id c11so3634741lbj.17
	for <qemu-trivial@nongnu.org>; Mon, 24 Mar 2014 06:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XKi4M8G2JxKpWjdeVkC3C+/VdpQP9KkXaD5kjkyIxCY=;
	b=k19KE9WokSdAlexm6r3XBFTTJ2NOV/lP1pCdXgdSdfvDR9HlV8h8E40ngQZTtWx2W8
	qMMlqTZcWLW1MtJdWoQy+DySEK+OvnjBnfD35S6cn0T+hMIVcStUcjEVCcYfWxqsqZv3
	EoCX5eDiWYlFOovXq2xuac6Z+K6N+MOM6jd3jlAZ7HbvDz5cw/LkWetDLbQE9Vb1D8wK
	uOTfHguZCX0IMWkeUf+gB1ZXrtCzMdXflceN1epNaYZAULNKqQ2zA3OpahS2PmOWkmsr
	6fIHzvsvR3bLeEG/M9deYh2ercEVm67ibE033AL8q/boacNhm8x4fM0aheMLi1VjyIPV
	Vs/g==
X-Gm-Message-State: ALoCoQl320/NhFU0h+nDgq2/mwQhW14kVqUZkfpe+iP9Ghhv1js2TEwkVwnjhWDIlXRiT3OHekro
X-Received: by 10.152.239.137 with SMTP id vs9mr49621lac.59.1395667396707;
	Mon, 24 Mar 2014 06:23:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Mon, 24 Mar 2014 06:22:56 -0700 (PDT)
In-Reply-To: <20140324131959.GF4384@stefanha-thinkpad.redhat.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<20140324131959.GF4384@stefanha-thinkpad.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Mar 2014 13:22:56 +0000
Message-ID: <CAFEAcA-D+6uHgaChtvmmZ6gXoPsAxY=0L9ho6a2xoryYHC6xsA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: Alex Bligh <alex@alex.org.uk>, v.maffione@gmail.com,
	Alexey Kardashevskiy <aik@ozlabs.ru>, "J. Kiszka" <jan.kiszka@siemens.com>,
	Prasad Joshi <prasadjoshi.linux@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Vassili Karpov <av1474@comtv.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, Anthony Liguori <aliguori@amazon.com>,
	Paolo Bonzini <pbonzini@redhat.com>, g.lettieri@iet.unipi.it,
	rizzo@iet.unipi.it, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 1/6] audio: set top level latch for each
	slot
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
X-List-Received-Date: Mon, 24 Mar 2014 13:47:35 -0000

On 24 March 2014 13:19, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> On Sun, Mar 23, 2014 at 02:58:38PM +0530, Prasad Joshi wrote:
>> CSMKeyControll function is supposed to set the top level latch for each
>> slot. However, at the moment, it incorrectly updates only the first
>> slot. Patch fixes the problem.
>>
>> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
>> ---
>>  hw/audio/fmopl.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Peter: This series has some fixes for QEMU 2.0 since they are bug fixes.

I'm currently assuming that bugfixes for 2.0 will appear in
the form of pullrequests marked 'for-2.0' from the appropriate
submaintainers...

thanks
-- PMM

