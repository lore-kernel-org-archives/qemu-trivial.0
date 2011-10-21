Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RHAVo-000808-2c
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2011 04:31:32 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RHAVk-0007rd-VM
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 04:31:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RHAVj-0007Qk-Sa
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 04:31:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:17624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1RHAVg-0007Pk-5G; Fri, 21 Oct 2011 04:31:24 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9L8VLr3022081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Oct 2011 04:31:21 -0400
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9L8VK2B011668; Fri, 21 Oct 2011 04:31:21 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 04C386006D; Fri, 21 Oct 2011 10:31:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1318958255-14008-1-git-send-email-pavel.borzenkov@gmail.com>
	<20111020172301.GA14359@stefanha-thinkpad.localdomain>
	<4EA112A4.5000106@redhat.com>
Date: Fri, 21 Oct 2011 10:31:19 +0200
In-Reply-To: <4EA112A4.5000106@redhat.com> (Paolo Bonzini's message of "Fri,
	21 Oct 2011 08:35:16 +0200")
Message-ID: <m3k47ypwyw.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Pavel Borzenkov <pavel.borzenkov@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qed: don't pass NULL to
	memcpy
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
X-List-Received-Date: Fri, 21 Oct 2011 08:31:30 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 10/20/2011 07:23 PM, Stefan Hajnoczi wrote:
>> On Tue, Oct 18, 2011 at 09:17:35PM +0400, Pavel Borzenkov wrote:
>>> Spotted by Clang Analyzer
>>>
>>> Signed-off-by: Pavel Borzenkov<pavel.borzenkov@gmail.com>
>>> ---
>>>   block/qed.c |    6 ++++--
>>>   1 files changed, 4 insertions(+), 2 deletions(-)
>>
>> Thanks, applied to the trivial patches tree:
>> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches
>
> I think there are other places in the tree where we assume that
> "memcpy(dest, NULL, 0);" works.

Looks like a fair assumption to me.

