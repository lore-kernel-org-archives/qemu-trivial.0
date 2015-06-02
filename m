Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzrY7-0007F4-AP
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 15:08:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YzrY5-0007Al-AX
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 15:08:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YzrY4-0005TN-FQ
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 15:08:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37920)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1YzrXz-0005SL-DO; Tue, 02 Jun 2015 15:08:23 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D58963589F4;
	Tue,  2 Jun 2015 19:08:22 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-58-11.rdu2.redhat.com [10.10.58.11])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t52J8JGE007491; Tue, 2 Jun 2015 15:08:20 -0400
Message-ID: <556DFF22.70600@redhat.com>
Date: Tue, 02 Jun 2015 15:08:18 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
References: <1433258768-28946-1-git-send-email-berrange@redhat.com>
	<556DD392.3040703@redhat.com>
In-Reply-To: <556DD392.3040703@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add .dir-locals.el file to
 configure emacs coding style
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
X-List-Received-Date: Tue, 02 Jun 2015 19:08:30 -0000



On 06/02/2015 12:02 PM, Eric Blake wrote:
> On 06/02/2015 09:26 AM, Daniel P. Berrange wrote:
>> The default emacs setup indents by 2 spaces and uses tabs
>> which is counter to the QEMU coding style rules. Adding a
>> .dir-locals.el file in the top level of the GIT repo will
>> inform emacs about the QEMU coding style, and so assist
>> contributors in avoiding common style mistakes before
>> they submit patches.
>>
>> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
>> ---
>>  .dir-locals.el | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>  create mode 100644 .dir-locals.el
> 
> Since we already have .exrc to do the same for vim users, I'm all in
> favor of this.
> 

+1

> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Reviewed-by: John Snow <jsnow@redhat.com>

