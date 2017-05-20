Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBvFA-0004xn-N8
	for mharc-qemu-trivial@gnu.org; Fri, 19 May 2017 23:39:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dBvF7-0004xT-QD
	for qemu-trivial@nongnu.org; Fri, 19 May 2017 23:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dBvF3-00046I-Tw
	for qemu-trivial@nongnu.org; Fri, 19 May 2017 23:39:49 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:32812)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dBvF3-00046E-O7; Fri, 19 May 2017 23:39:45 -0400
Received: by mail-oi0-x244.google.com with SMTP id h4so15186756oib.0;
	Fri, 19 May 2017 20:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=+/Qmewod5hewm/3prf6POFaYGiXncq6NyuVovC8IeyU=;
	b=P3PQfZTBa0A34nOFKmO7k76FnABQLTjq1XGpvjQyEBhLmNMHpWHunHqg0tnWZLc1BJ
	tPyiwuUbjySRr/1N6P1wJnNCWva+RmXUSpdEuW5f51zKa8IsajDB9qFu6ZW/06bM4LAX
	h+Qy1wZbfHVpbELXV0VVO8v1BRYqevsyzpiP9PAn4EqOQiEsm0PkY320rWMRyh/6TANp
	+RBTX2IjprRkQPG2plFFupbJZJgxjlZFNpLu/FC/wLtbsXgZOUgi6gyw8+x28lrC7Zur
	vsm1kTzoSG+7NlVGdjW0U9bH/mjgijlLKXZCQ6l5+wSHaSOYZwYNCON4hV13iG8xCFJ5
	4cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=+/Qmewod5hewm/3prf6POFaYGiXncq6NyuVovC8IeyU=;
	b=IRt2ODnysgkIHSKkj+B++QLgmlYTi6tWFUhnyT/KjKLfVnf88t5ZrEZ34wn8xqTU+V
	FU066jQk+eRXHcK/Z/HZGiP28PVcLzLduOelxq5qooRVWW9nzgb3d8H9St/9tRYTiVsw
	6StZYkGN/iy32cGs5GAOOM4av/FDzvtv9+XMGpBmsjXinI02q7d9IuNajmeZ+Yr2i9Cv
	yIwL2G4G1Z0An/jWIyj1sa03UCYJd1zT+ij9OqFn5MTlQkwRY63OFzq2MDpe0HIadXSF
	Cvwvv6BRJCEpU0QEz0fGofXkNLZ+et7BOVVuwCN6FnPCrwTdEVB8eU/IrfM3o2/lBYUb
	wpWA==
X-Gm-Message-State: AODbwcB+moD2lA9iq6YDDQcSp549odr/pSh7v5sKQbHqIiKj6M4c7xhA
	TFhCC0emjLfk/g==
X-Received: by 10.202.78.200 with SMTP id c191mr6927237oib.203.1495251585045; 
	Fri, 19 May 2017 20:39:45 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id s1sm5248701otd.48.2017.05.19.20.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 20:39:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20170516001150.11508-1-f4bug@amsat.org>
	<20170517124822.GF8260@stefanha-x1.localdomain>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	Peter Lieven <pl@kamp.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1006af4d-3c51-4c8f-63df-f0e36e81d9bd@amsat.org>
Date: Sat, 20 May 2017 00:39:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170517124822.GF8260@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib: strip trailing '\n'
 from error_setg() string argument
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
X-List-Received-Date: Sat, 20 May 2017 03:39:51 -0000

On 05/17/2017 09:48 AM, Stefan Hajnoczi wrote:
> On Mon, May 15, 2017 at 09:11:49PM -0300, Philippe Mathieu-Daudé wrote:
>> spotted by Coccinelle script scripts/coccinelle/err-bad-newline.cocci
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  util/oslib-posix.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Please send multi-patch series with a cover letter and proper patch
> numbering ([PATCH 0/2], [PATCH 1/2], [PATCH 2/2]).  git-format-patch and
> git-send-email normally do this.  It's important so that patch
> management tools and continuous integration systems can track your
> patches.

Hi Stefan, I intended one command to generate unrelated patches from the 
same branch at once and send them individually without cover letter. I 
didn't noticed they'd go as a serie. I'll double-check next time!

> Thanks, applied to my block tree:
> https://github.com/stefanha/qemu/commits/block

Hmm I can't see it there maybe this part was not for this patch, I'll 
resend it soon with r-b tags.

>
> Stefan
>

Regards,

Phil.

