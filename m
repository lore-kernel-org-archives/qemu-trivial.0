Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUj3W-0003hl-Jc
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 16:11:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUj3R-0003hb-MP
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:11:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUj3N-0008F5-Mb
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:11:21 -0400
Received: from mail-lb0-f176.google.com ([209.85.217.176]:43242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUj3N-0008EV-Fx
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:11:17 -0400
Received: by mail-lb0-f176.google.com with SMTP id y6so3781587lbh.21
	for <qemu-trivial@nongnu.org>; Fri, 11 Oct 2013 13:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=chFpzCp/xzKJcsJw69IAKN2uZ62aDbal+MjnchTisI8=;
	b=akWcWafE9k58F9hldXlbgKij/4EF0hyzkwD50ld5/WVkxYerYaS5mIf5qAeUimrFsP
	WyvrrmjgpHMKy9bJ8OFgsCpBA0RyvJzj/bYpqqiK7S3+AYZKqe+YbX0OSYWY9W1JFOdf
	nsfu4bAS2So8C+TUFTg/MqM2RXbf0LZXjAPrWVy9VPqW4OYcqABWRZHDyAYAhm31Zv5S
	baaCPzTdSCo8ymlnesShUTG5zb7xEN8RpymidOTiwGn6MNTSVPY13BCpWp9ppwRzvfWS
	o5w00bSBN6YqzDbQI08CtJC7X3UVgDr8vgukdX4Uf1IVWrBfxx1Q8lDiSNMlQEKT/vmH
	8gjw==
X-Gm-Message-State: ALoCoQlvy1kqeQY0i9NkW67Sb92/WUvtSxeJiyzBhrQ9BCWdL6ddLo8n0MD9sg3gFIzkMw9xXILQ
X-Received: by 10.152.8.51 with SMTP id o19mr68888laa.42.1381522276603; Fri,
	11 Oct 2013 13:11:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Fri, 11 Oct 2013 13:10:56 -0700 (PDT)
In-Reply-To: <52585983.1000606@terremark.com>
References: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
	<52585983.1000606@terremark.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Oct 2013 05:10:56 +0900
Message-ID: <CAFEAcA8QMiNuBMN0=DmXA8RqV9iVdoD-weGF04njKCGw1nbbyg@mail.gmail.com>
To: Don Koch <dkoch@verizon.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.176
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] misc: Spelling and
	grammar fixes in comments
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
X-List-Received-Date: Fri, 11 Oct 2013 20:11:26 -0000

On 12 October 2013 05:03, Don Koch <dkoch@verizon.com> wrote:
> On 10/11/2013 03:34 PM, Stefan Weil wrote:
>> * it's -> its
>> * grammar fix in ui/vnc-enc-zywrle.h
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> This is v3 of http://patchwork.ozlabs.org/patch/257416/.
>>
>> v3:
>> Don't try to improve a strange sentence in the same context ("Of cause [...]").

>>   In this method, H/L and X0/X1 is always same position.
>> - This lead us to more speed and less memory.
>> + This leads us to more speed and less memory.
>>   Of cause, the result of both method is quite same
>>   because it's only difference that coefficient position.
>>  */
>>
>
> Since you're in the neighborhood, this paragraph needs more fixes:

No, see the note above and the previous discussion.

>  In this method, H/L and X0/X1 is always in the same position.
>  This leads us to more speed and less memory.
>  Of course, the result of both methods is the same
>  because the only difference is the coefficient position.

Unless you want to say you've reviewed the code and
are completely confident that the original author meant
"the same" or "exactly the same" and not "quite similar"
then we need to leave the original wording alone.

-- PMM

