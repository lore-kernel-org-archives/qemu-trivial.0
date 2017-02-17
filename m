Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1celqV-0000Jy-5L
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 11:57:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1celqS-0000Cz-WC
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:57:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1celqS-0000Zd-9w
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:57:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41428)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1celqM-0000WD-1x; Fri, 17 Feb 2017 11:57:14 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E4237FB79;
	Fri, 17 Feb 2017 16:57:13 +0000 (UTC)
Received: from [10.36.116.208] (ovpn-116-208.ams2.redhat.com [10.36.116.208])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v1HGvA4h008579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Feb 2017 11:57:11 -0500
To: Chad Joan <chadjoan@gmail.com>, Eric Blake <eblake@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Laszlo Ersek <lersek@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f42b803f-ba9e-fe14-a085-2023ac062c1c@redhat.com>
Date: Fri, 17 Feb 2017 17:57:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 17 Feb 2017 16:57:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 16:57:22 -0000



On 17/02/2017 17:54, Chad Joan wrote:
> Regarding the signature: IIRC, setting up certificates on a machine
> using gpg can be quite time consuming and learning-intensive if you've
> never needed to do it before.  Having that example will go a long way to
> help with this.  There is still a possible pain-point: you might write
> one line of git code in the example, and it is easy for you due to your
> workflow, but it could be hours of fiddling for someone who has never
> done it before.  If I'm wrong, show me (the hypothetical reader) how
> easy it is ;)  If I'm right (and that would be unfortunate, in this
> case), then it might be helpful if you politely ask the reader to spend
> time X amount of time on it (establish accurate expectations) and then
> provide a link to the most helpful how-to article you can find on the
> subject.

GPG signing is not needed.  All you need is "git commit -s".

Adding "Signed-off-by: Chad Joan <chadjoan@gmail.com>" basically is a
way to tell us "I understand I'm contributing this under the GNU GPL or
a compatible license".  It's not a cryptographic signature.

Paolo

