Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBCte-0005ba-Dh
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 02:27:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hBCtb-0005ZX-W2
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 02:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hBCta-0004YD-27
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 02:27:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hBCtX-0004OZ-Ns; Tue, 02 Apr 2019 02:27:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE290C05AA51;
	Tue,  2 Apr 2019 06:27:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A3B06155F;
	Tue,  2 Apr 2019 06:27:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EE6461138648; Tue,  2 Apr 2019 08:27:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	afaerber@suse.de, qemu-trivial@nongnu.org
References: <20190311083234.20841-1-richardw.yang@linux.intel.com>
	<20190312084313.webcenp43tk3yfmm@steredhat>
Date: Tue, 02 Apr 2019 08:27:36 +0200
In-Reply-To: <20190312084313.webcenp43tk3yfmm@steredhat> (Stefano Garzarella's
	message of "Tue, 12 Mar 2019 09:43:13 +0100")
Message-ID: <87tvfghqg7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 02 Apr 2019 06:27:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom: use
 object_new_with_type in object_new_with_propv
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
X-List-Received-Date: Tue, 02 Apr 2019 06:27:45 -0000

Stefano Garzarella <sgarzare@redhat.com> writes:

> On Mon, Mar 11, 2019 at 04:32:34PM +0800, Wei Yang wrote:
>> Function object_new_with_propv already get the Type of the object, so we
>> could leverage object_new_with_type here.
>> 
>> [make check test pass]
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  qom/object.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> LGTM. Just a note for future patches:
> I think that info like "[make check test pass]" should go after the
> three dashes to avoid to store it in the commit message.

Yes.  Whoever applies  should delete this line.

> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Cc: qemu-trivial for merging.

