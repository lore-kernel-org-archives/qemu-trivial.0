Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVKfr-0000Rs-PV
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 09:58:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YVKfp-0000Oh-FN
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 09:58:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1YVKfo-0005B1-Fg
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 09:58:17 -0400
Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d]:35697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1YVKfh-00059v-OQ; Tue, 10 Mar 2015 09:58:09 -0400
Received: by obcwo20 with SMTP id wo20so1694015obc.2;
	Tue, 10 Mar 2015 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=n4RxFPsyrKcGM9RgYg7UHD5jmTvcrhTULmnATk4xJWk=;
	b=qeM/hTpDermosKdhZf4hzCNsr8aHnX8Rn/zrVTItmRh+EPrztmeWLlvanhK17r6a5r
	q9XFK+Ir59WxvYFoLBuDw0wHh/eA38xZCfQApmDZZjJKP0U3hg5mfEuoo8ZDucHFWw8C
	fMiBPm0oT733/KXVnkviyYhdhyBnhuldBOUWrAUxH/VgkQOWiAhAbsPkPbDPeQ75tnTw
	233NZQcn0cYjpuPZ83L8EG5p7834zuQeBf4DBCbl9P4C4TxCDwP/sLfeCZ9vPYBHYG54
	OKTNQ4OkPT/uBU34XLJkpec/pVRUo3w0+yb1KuFwHOjwAle5ddG12mD5mH3q/4M0wn/m
	PHRg==
MIME-Version: 1.0
X-Received: by 10.182.68.12 with SMTP id r12mr26056285obt.84.1425995889045;
	Tue, 10 Mar 2015 06:58:09 -0700 (PDT)
Received: by 10.76.98.163 with HTTP; Tue, 10 Mar 2015 06:58:08 -0700 (PDT)
In-Reply-To: <20150310100936.GD3770@noname.str.redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150310085016.GC3770@noname.str.redhat.com>
	<20150310091759.GC14320@ad.nay.redhat.com>
	<20150310100936.GD3770@noname.str.redhat.com>
Date: Tue, 10 Mar 2015 13:58:08 +0000
Message-ID: <CAJSP0QWk+KzGuR2e6m8KsCUbMqcU6cReQbp2231zf9+Nt8zF9g@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22d
Cc: Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Peter Wu <peter@lekensteyn.nl>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] block/dmg: make it modular
 if using additional library
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
X-List-Received-Date: Tue, 10 Mar 2015 13:58:18 -0000

On Tue, Mar 10, 2015 at 10:09 AM, Kevin Wolf <kwolf@redhat.com> wrote:
> Am 10.03.2015 um 10:17 hat Fam Zheng geschrieben:
>> On Tue, 03/10 09:50, Kevin Wolf wrote:
>> > Am 10.03.2015 um 08:06 hat Michael Tokarev geschrieben:
>> > Also, should we consider making some more rarely used image formats
>> > modules even if they don't pull in external dependencies?
>>
>> Sounds reasonable to me. Is the intention to reduce binary size?
>
> Yes, that and also that it allows compiling out some drivers without
> having to mess with the Makefiles. You just don't install all of them.
>
> Related to that, Peter also mentioned that you (the user, not developer
> or packager) could simply disable a single driver, for example as a
> temporary hotfix in the case of security problems in a block driver.
> That would actually be an argument for making _all_ drivers modules.

I am for making all block drivers built as modules.

Stefan

