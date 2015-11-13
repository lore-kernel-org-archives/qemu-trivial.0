Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxJb3-0008Hf-9m
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 14:01:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZxJb0-0008Ek-Mb
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 14:01:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZxJaz-0002YX-TE
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 14:01:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZxJau-0002XT-Jn; Fri, 13 Nov 2015 14:01:08 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 678B8FB76C;
	Fri, 13 Nov 2015 19:01:04 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-58-158.rdu2.redhat.com
	[10.10.58.158])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tADJ12uK026929; Fri, 13 Nov 2015 14:01:03 -0500
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1447386423-13160-1-git-send-email-eblake@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <5646336E.5020109@redhat.com>
Date: Fri, 13 Nov 2015 14:01:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447386423-13160-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, berto@igalia.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.5 v2] tests: Ignore
 recent test binaries
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
X-List-Received-Date: Fri, 13 Nov 2015 19:01:15 -0000



On 11/12/2015 10:47 PM, Eric Blake wrote:
> Commits 6c6f312d and bd797fc1 added new tests (test-blockjob-txn
> and test-timed-average, respectively), but did not mark them for
> exclusion in .gitignore.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> v2: retitle; also ignore test-timed-average
> 
>  tests/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/.gitignore b/tests/.gitignore
> index e96f569..1e55722 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -9,6 +9,7 @@ check-qom-proplist
>  rcutorture
>  test-aio
>  test-bitops
> +test-blockjob-txn
>  test-coroutine
>  test-crypto-cipher
>  test-crypto-hash
> @@ -45,6 +46,7 @@ test-string-input-visitor
>  test-string-output-visitor
>  test-thread-pool
>  test-throttle
> +test-timed-average
>  test-visitor-serialization
>  test-vmstate
>  test-write-threshold
> 

Reviewed-by: John Snow <jsnow@redhat.com>

