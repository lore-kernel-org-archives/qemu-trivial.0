Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTfky-0007GR-GT
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 21:13:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cTfkw-0007EY-DD
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 21:13:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cTfkv-0004EA-Hh
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 21:13:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1cTfkq-00049q-BI; Tue, 17 Jan 2017 21:13:40 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B3B061B9B;
	Wed, 18 Jan 2017 02:13:40 +0000 (UTC)
Received: from localhost (ovpn-8-17.pek2.redhat.com [10.72.8.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0I2DbI1025950; Tue, 17 Jan 2017 21:13:39 -0500
Date: Wed, 18 Jan 2017 10:13:34 +0800
From: Fam Zheng <famz@redhat.com>
To: Yang Ziyue <skiver.cloud.yzy@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Ziyue Yang <yzylivezh@hotmail.com>
Message-ID: <20170118021334.GB31883@lemon.Home>
References: <1484702052-7900-1-git-send-email-skiver.cloud.yzy@gmail.com>
	<148470234043.214.7219322137444222645@790289a7ca88>
	<CAHkcwafqx4-vMsCVJOZS04Kb1cRVbu2ea802hjdOhJp2JoPA+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHkcwafqx4-vMsCVJOZS04Kb1cRVbu2ea802hjdOhJp2JoPA+A@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 18 Jan 2017 02:13:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] gdbstub.c: fix GDB
 connection segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 02:13:47 -0000

On Wed, 01/18 09:34, Yang Ziyue wrote:
> Oops seems I forgot to check the patch before submitting. Sorry for that.
> The new patch is tagged as v3 now, but I'm not sure whether it should
> be tagged as v2 since the origin v2 failed. Is there any specification
> about this? Thanks!

Hi Ziyue, thanks for submitting the patch. When you repost, use v3 please, a
(even failed or mistaken) version shouldn't be reused, so that people looking at
the subjects will know which one is newer.

Fam

