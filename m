Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwEjw-0004W0-V1
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 11:52:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwEju-0004PX-JJ
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:52:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwEjq-0007Bg-6P
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:52:05 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:58081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwEjp-0007B1-WB
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:52:02 -0400
Received: by wgbfm10 with SMTP id fm10so4808234wgb.10
	for <qemu-trivial@nongnu.org>; Tue, 31 Jul 2012 08:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=sRCFy11Ysj1XOQxs3NGwWjRWP8sgUbn+qXwewjxSJ54=;
	b=hRlK/GTmYBNAwOWgEX0fruhbkh0JSkMnyVsfHf5MJVqAa0+nCHY4x/2LKeaJBnP0r4
	c3QPjedCglVUZIax1EaTkSQ/gs1MEWj5Ltn1tiQLUWd3rIj3YJoimXLlIYnIFKPrWxNF
	8TDZBhxG+ruUK4if1hivpIStJQ/puLh4sSdQ9wzvGhOwt7mxW3oOiz7So1ZgmNDEyPUb
	iUi2/mXJCPTeRgLhbSUe9K9ai/TITB2BmZaVojo6QHT53t7zC4esLWcQ4UMDLwtrxKKT
	I3Cs39UblETWgCc4eNEyCtlKvKmZuJv16uIwf9d0kgjAeAkv4b9AanOYRJVeNIlu/2ih
	w3oA==
MIME-Version: 1.0
Received: by 10.50.220.195 with SMTP id py3mr2318936igc.70.1343749919679; Tue,
	31 Jul 2012 08:51:59 -0700 (PDT)
Received: by 10.50.94.202 with HTTP; Tue, 31 Jul 2012 08:51:59 -0700 (PDT)
In-Reply-To: <5017FE6F.7090107@weilnetz.de>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
	<CAFEAcA_M7RJdCjsxycJUJcOLGe+DdBPSKuagb_=Kspwp-29A2Q@mail.gmail.com>
	<87k3xk577l.fsf@blackfin.pond.sub.org>
	<20120731143834.GJ2475@redhat.com>
	<CAFEAcA9+32Y+q7p5H7JPvOucVU-3_s94wT7JtX0nz7e60tbTPA@mail.gmail.com>
	<5017FE6F.7090107@weilnetz.de>
Date: Tue, 31 Jul 2012 16:51:59 +0100
Message-ID: <CAFEAcA_iNL5YS4cH=NH=o_y3D9pmnE6j3U2qS6-xUw5CP_L4bA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQl6M3+09Cwx983mURVMZS6OXOJOrdEo5S9CmqQnGm3TzSgfU0W6RMTiPhkxkK250lRGQGn+
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
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
X-List-Received-Date: Tue, 31 Jul 2012 15:52:07 -0000

On 31 July 2012 16:49, Stefan Weil <sw@weilnetz.de> wrote:
> Yes, QEMU creates files in 3 levels. We could use
>
>     rm -f *.[od] */*.[od] */*/*.[od]
>
> I suggest using the wrapper $(call quiet-command,...)
> to suppress printing of all removed file names.

My worry was not so much what we print as that we
might be exceeding the total command line length
limits on some systems (whether you did it this way
or via "rm -f $(find ...)").

-- PMM

