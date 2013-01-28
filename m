Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzpTT-00014s-BV
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2013 09:14:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TzpTQ-00012Z-8E
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 09:14:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TzpTH-0004vA-J6
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 09:14:12 -0500
Received: from mail-lb0-f170.google.com ([209.85.217.170]:46369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TzpTH-0004um-Br
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 09:14:03 -0500
Received: by mail-lb0-f170.google.com with SMTP id ge1so3976402lbb.1
	for <qemu-trivial@nongnu.org>; Mon, 28 Jan 2013 06:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=8sJQeYuyCCo6zYclA28WteY1ZJK10sWA43FFSFRvWAI=;
	b=UMC8Vtc34WR6ujeDsxfGB602erCOSdvP+R8odo+88zyBDpWKFTUwhjj1h+uejprI/H
	KPIGMEWl1GqHjQLJ/DafWTGED/5DJopTbmDCF6ho3excDZyuMa3vW/WYUypYkecK24L7
	pN5KwY4/egVxqE3e+VEoOp/+5yYwDGPCClJ2a43+zl1hnoTzfEOGCaG+erDstzn1RFJM
	sj8ZTA5wVwJYoAxS6ze9EmKtj+pE0cejgQub7yXcltLHxF0PAvulsvMyzeD7vIPi2Spw
	NV7LhTB54tPwK4NEcbvrISdVDD/wROWsWstq5KtQUuInpbyXw5l2OBN35H3USdhpx4UM
	InDA==
X-Received: by 10.152.111.72 with SMTP id ig8mr13179030lab.1.1359380870269;
	Mon, 28 Jan 2013 05:47:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.107.42 with HTTP; Mon, 28 Jan 2013 05:47:29 -0800 (PST)
In-Reply-To: <50FD7775.6030307@redhat.com>
References: <1358769827-7317-1-git-send-email-peter.maydell@linaro.org>
	<50FD4E55.1080709@redhat.com> <50FD7775.6030307@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jan 2013 13:47:29 +0000
Message-ID: <CAFEAcA_roL5tEdnirqmMeDqS+yWmSg=QhcF-ML15-F0zKp0JWg@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlSTftehqGTGIZFmfZ15BMnj1WZHr8jDc0BBlk+GCxA/VxPzFXXdWHnT/2HvxHZz6iu+pBs
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.170
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu-pixman.h: Avoid
 mutual inclusion loop with console.h
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
X-List-Received-Date: Mon, 28 Jan 2013 14:14:13 -0000

Ping: Stefan, are you going to take this via -trivial
as Gerd suggests?

[patchwork url: http://patchwork.ozlabs.org/patch/214114/ ]

thanks
-- PMM

On 21 January 2013 17:14, Gerd Hoffmann <kraxel@redhat.com> wrote:
> On 01/21/13 15:19, Gerd Hoffmann wrote:
>>> Stefan: I've made the obvious change to fix the spice compile issue,
>>> but none of my systems have a new enough spice-protocol/spice-server
>>> to allow me to configure with spice enabled. I'd appreciate it if
>>> you could check it does indeed compile OK now...
>>
>> I'll run this through the buildbot ...
>
> All green.
>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>
> Taking through trivial would be a nice service as I don't have any
> 1.4-ish pixman stuff pending arm.
>
> thanks,
>   Gerd

