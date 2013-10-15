Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VW68z-0003Rv-1J
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2013 11:02:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1VW68s-0003Hm-CE
	for qemu-trivial@nongnu.org; Tue, 15 Oct 2013 11:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1VW68n-0004Z7-B2
	for qemu-trivial@nongnu.org; Tue, 15 Oct 2013 11:02:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25920)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1VW68c-0004Vn-RO; Tue, 15 Oct 2013 11:02:23 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9FF2McK031313
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 15 Oct 2013 11:02:22 -0400
Received: from lacos-laptop.usersys.redhat.com (vpn1-6-138.ams2.redhat.com
	[10.36.6.138])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9FF2Ktx026765; Tue, 15 Oct 2013 11:02:21 -0400
Message-ID: <525D599C.5020307@redhat.com>
Date: Tue, 15 Oct 2013 17:05:00 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130912 Thunderbird/17.0.9
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1381842635-21699-1-git-send-email-lersek@redhat.com>
	<525D4D2C.9040805@redhat.com>
In-Reply-To: <525D4D2C.9040805@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] move test-* from .gitignore
	to tests/.gitignore
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
X-List-Received-Date: Tue, 15 Oct 2013 15:02:43 -0000

On 10/15/13 16:11, Eric Blake wrote:
> On 10/15/2013 07:10 AM, Laszlo Ersek wrote:
>> Also sort the test-* entries in the latter.
>>
>> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
>> ---
>>  .gitignore       |  9 ---------
>>  tests/.gitignore | 11 +++++++++--
>>  2 files changed, 9 insertions(+), 11 deletions(-)
> 
> This feels backwards to me.  I'd much rather have a single top-level
> .gitignore for everything.  We are no longer in the CVS days of having a
> per-directory ignore file.

Yes, I'm aware. I re-read your previous comment before posting:

http://thread.gmane.org/gmane.comp.emulators.qemu/228886/focus=229185

and I agree with it in theory.

However, current qemu practice (even recent patches, eg. 9dbb52e8) seem
to point in the opposite direction.

I don't feel strongly about this -- I just promised earlier to do it and
I want it off my shouler.

Thanks!
Laszlo


