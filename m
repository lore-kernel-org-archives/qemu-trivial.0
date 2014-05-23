Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnyYA-00047K-Ep
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 19:06:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WnyY3-00046y-Js
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 19:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WnyXy-0005Gb-HR
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 19:06:47 -0400
Received: from mail-ve0-f180.google.com ([209.85.128.180]:43782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WnyXy-0005GV-Dd
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 19:06:42 -0400
Received: by mail-ve0-f180.google.com with SMTP id db12so7086216veb.11
	for <qemu-trivial@nongnu.org>; Fri, 23 May 2014 16:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=D2Tv3N/Ty0huWYA+5BY0Z0OrLFRuD9CGg17CkX2RAXg=;
	b=PPtZbdSJZnifaC3D6CeNah6C1UIPvn5vATrRIxHFa773pSI1IX+tMFwDM0x8Hl5TDp
	Gxr7MQoMCqmtKkEnTDlphgTtofCxSvdcG6nYz68+tdjaqjWb9/fRu/g3Jbi0hbKYYKvw
	SKzI5oWcYcB61rd0puz+57XT/do90obRXpnJKIYIwp+SqwAGLHIFtuFcJwUTlr9lIsy1
	dSuY89IHCr6LBjJnO75XnXwaE9eBx357HFlmAaaF0VazW5b9hK21o4t+RtUPTkBcHxhG
	BuWjW20rTZxtJLDe58jF3Ra+4rXbXbYifnmeyU3YVVg9Y27Qs4Yym5A+V7s9vKg0d3lF
	wGwg==
X-Gm-Message-State: ALoCoQmUQtaBtsYxGZROXScKdbTdqH7to3U+/Gdy5wZlhH/1HKJmnXAfSZpCP9LeLngwO407jIaT
MIME-Version: 1.0
X-Received: by 10.58.219.166 with SMTP id pp6mr6766768vec.1.1400886401459;
	Fri, 23 May 2014 16:06:41 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Fri, 23 May 2014 16:06:41 -0700 (PDT)
In-Reply-To: <CAEgOgz4GgkEWpLpa8SKPsZGZnRcqE5CifqJ+UiiA4Lm8dOnLMA@mail.gmail.com>
References: <cover.1399449874.git.peter.crosthwaite@xilinx.com>
	<CAEgOgz4GgkEWpLpa8SKPsZGZnRcqE5CifqJ+UiiA4Lm8dOnLMA@mail.gmail.com>
Date: Sat, 24 May 2014 09:06:41 +1000
X-Google-Sender-Auth: GCExVrneN1PnnViSo0CF5a9tFGg
Message-ID: <CAEgOgz46UcJiGC6H==O1XZFkvZh4Wa+2kBy8DDwAfKG6SUmp+g@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.180
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH net v1 0/4] Cadence GEM patches
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
X-List-Received-Date: Fri, 23 May 2014 23:06:52 -0000

Ping^2!

I'll try trivial queue too :)

Regards,
Peter

On Wed, May 14, 2014 at 11:17 PM, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> Ping!
>
> On Wed, May 7, 2014 at 9:15 AM, Peter Crosthwaite
> <peter.crosthwaite@xilinx.com> wrote:
>>
>> Hi Stefan, Peter,
>>
>> Found a bug in the Cadence GEM. Fixed in P1. Have some follow us trivials
>> as well (P2-4).
>>
>> Regards,
>> Peter
>>
>>
>> Peter Crosthwaite (4):
>>   net: cadence_gem: Fix Tx descriptor update
>>   net: cadence_gem: Add Tx descriptor fetch printf
>>   net: cadence_gem: Fix top comment
>>   net: cadence_gem: Comment spelling sweep
>>
>>  hw/net/cadence_gem.c | 25 +++++++++++++++----------
>>  1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> --
>> 1.9.2.1.g06c4abd
>>

