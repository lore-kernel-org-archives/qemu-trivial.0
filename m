Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk5Fy-0005FH-AT
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 03:04:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zj0at-0000Hc-HY
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 03:54:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zj0ap-0006RN-GL
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 03:53:59 -0400
Received: from mail-vk0-f48.google.com ([209.85.213.48]:35504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zj0ap-0006RE-CJ
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 03:53:55 -0400
Received: by vkao3 with SMTP id o3so91250413vka.2
	for <qemu-trivial@nongnu.org>; Mon, 05 Oct 2015 00:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0n79of1iu/yvBQPxuC87rtd461OzkKeCFGSboQqE3V0=;
	b=dZpSHz5TBgKTag9NVHxek1L+71IAn3BxkFKYYbBzXnD9VfOBpZPHW3ga9gyTjOUvN3
	V3yP4k9Ip/YwzwoiIUeAS8PVjQbW06EprojkDGCyXkKkxYq29N8KXAOap1KSZx5PW+FF
	swkrKPTUYW4ycm+/iAeagAeneCSPRiTL+JkqVyD9i0pffDR3teN9tglE1QUg8b8wAEyn
	aV8BLANd1A84+FIebfw6qEwXLSUbOMTUF8OQeIPrk1AeNVnLM6J6E5LRy9AjoNkTWl0/
	dWewY9z+YuZ5cCAAbcSgWwFMRdRRfk8qK5rgqGvpzP24vjrwvva7fzuJcUmo73KVmWrg
	qJsw==
X-Gm-Message-State: ALoCoQlEpcp3EUFYTodq7mwY/gTvMBwM4bpC1m7Gp1cl8qhhCn7UuEuwNi0FtM97LErKcZkeRVSS
X-Received: by 10.31.136.9 with SMTP id k9mr19004494vkd.92.1444031634835; Mon,
	05 Oct 2015 00:53:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 5 Oct 2015 00:53:35 -0700 (PDT)
In-Reply-To: <56122457.4060903@msgid.tls.msk.ru>
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
	<56100743.4010604@msgid.tls.msk.ru>
	<87d1wtao6l.fsf@blackfin.pond.sub.org>
	<56122457.4060903@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2015 08:53:35 +0100
Message-ID: <CAFEAcA_a9XPZ31jfKkuFvjEeBQ-5-dKqgne1NrOD292Xq161kg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.48
Cc: kvm-devel <kvm@vger.kernel.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Shraddha Barke <shraddha.6596@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] Target-microblaze:
	Remove unnecessary variable
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
X-List-Received-Date: Mon, 05 Oct 2015 07:54:00 -0000

On 5 October 2015 at 08:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 05.10.2015 08:18, Markus Armbruster wrote:
>> Why?  I like having the semantic patch in the commit message when
>> there's any chance we'll want do the same mechanical change again later.
>>
>> You could save space and include it by reference, though: "Same
>> Coccinelle semantic patch as is commit 74c373e".
>
> git commit messages aren't good documentation for various scripts
> like this, this info will be lost in the noize.  If it might be
> better to keep such scripts in a separate file where it is easier
> to find, or in a wiki page on the site. The key point is where to
> find the info, git log is difficult for that, especially when you
> don't know what to search for or that such a script exists in
> there in the first place.
>
> On the other hand, when git log is cluttered by such a long messages
> for such small changes, it becomes more difficult to find info which
> you really look in git log -- namely, which changes were made that
> might have introduced this regression, things like that.

I think it can be useful when you're looking at a commit
to know that it was automatically created, especially if
it's a big commit. It means that if you're looking for
a bug in it you can concentrate on the script that created
it rather than the possibly large set of changes it produced,
or if you're trying to cherry-pick it into another branch you
can just apply the script instead.

In a commit with a change this small it's not very significant
either way, though.

thanks
-- PMM

