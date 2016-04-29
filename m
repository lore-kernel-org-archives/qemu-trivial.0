Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw8yn-0006rO-IN
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 10:01:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw8yf-0006ZM-Ad
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 10:01:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw8yT-0003Vl-8v
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 10:00:59 -0400
Received: from mail-yw0-x236.google.com ([2607:f8b0:4002:c05::236]:36115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw8yR-0003Qz-Rb
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 10:00:52 -0400
Received: by mail-yw0-x236.google.com with SMTP id o66so189610326ywc.3
	for <qemu-trivial@nongnu.org>; Fri, 29 Apr 2016 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P1tiLmw2d0MMhMOZGvewgN7mzilOU1ygo6gUqPmyrDE=;
	b=IgDfFKIrC1ctMDr0I1BZnUlLnaTWMhrKaDUcZ6Ef3ZUlvZU7rZrNE94zQ2SGy5N6lT
	LDj35P8iEyv3Pejwf2BPGEMP4ImgAjmPQE3kjDlpIls4qEzg8Q+ZRq+EJW+sVh9LroON
	EZHpG6KVF+yF46Amh5G8XPdMqdcP77j/sJdf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P1tiLmw2d0MMhMOZGvewgN7mzilOU1ygo6gUqPmyrDE=;
	b=lRW/zqVaWa9L8eAUxAFwf/HhZk8yyKHHT49EOedYcAmLcREs26MHeO07YGI+6bZlgM
	MqSK/ehnIsr2s7YDd2vFauRLHmvI9iIQgpRsV7NHS2xQsDW9HhPrCNxL1yfHR6UC3GQr
	RzX0gqJQMiEiwYHt6LKutLrHSSMJ3MZOi4ieo1vHGY3jas2tY7/Q5RLYbkQUB0zS+oi+
	uCNLcKdJcU1K/EsPpf/Bchc/3b9/nwrM1xqOtunZfK1YXUoPvGtpxvVdlbA9BkXbELhm
	tlFsy4oU54JxdNeUpkJRQ1CVSTMRqjEFsPXx4s5iJZaflV8f4Q5cByPE6R1xEJBpb4p+
	Yukg==
X-Gm-Message-State: AOPr4FXV51yXAwKx/cBwL1UUnprbQqz3N5UMNEhvivBADvxqvySPTrz8d3vpOgE/ZIK09Yg5TiLPEB8qBzheNEQo
X-Received: by 10.159.54.232 with SMTP id p95mr2975801uap.107.1461938429794;
	Fri, 29 Apr 2016 07:00:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 29 Apr 2016 07:00:10 -0700 (PDT)
In-Reply-To: <5723680D.2050601@weilnetz.de>
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
	<CAFEAcA-yNp8wGnyzMrTu=28g4vYPv-5F-PJ4aeHq8xSnxRZLkA@mail.gmail.com>
	<5723680D.2050601@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Apr 2016 15:00:10 +0100
Message-ID: <CAFEAcA9dHj60vTBm5TG0Ob072U64Vy8A0cGocPg7LNdO=aNqow@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Jan Vesely <jano.vesely@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::236
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Apr 2016 14:01:12 -0000

On 29 April 2016 at 14:56, Stefan Weil <sw@weilnetz.de> wrote:
> Am 29.04.2016 um 15:54 schrieb Peter Maydell:
>
>> This means we'll build with a HAVE_FSXATTR define set, but
>> nothing in the tree tries to use that as far as I can tell:
>> "git grep HAVE_FSXATTR" returns no matches. What am I missing?

> It's used by the system headers:
>
> /usr/include/xfs/xfs_fs.h:#ifndef HAVE_FSXATTR

...so this is a bug in the system headers that we're working
around? It would probably be useful to say so in a comment
in configure, otherwise it's liable to get ripped out in
future when somebody notices it's not used any more.
(For instance HAVE_IFADDRS_H isn't used and looks like dead
code in configure.)

thanks
-- PMM

