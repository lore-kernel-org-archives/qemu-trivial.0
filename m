Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dd5in-0006gV-3B
	for mharc-qemu-trivial@gnu.org; Wed, 02 Aug 2017 22:18:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1dd5ii-0006de-Qu
	for qemu-trivial@nongnu.org; Wed, 02 Aug 2017 22:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1dd5ih-0001pN-Ua
	for qemu-trivial@nongnu.org; Wed, 02 Aug 2017 22:18:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcody@redhat.com>)
	id 1dd5id-0001jX-BZ; Wed, 02 Aug 2017 22:18:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2960E37EEC;
	Thu,  3 Aug 2017 02:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2960E37EEC
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jcody@redhat.com
Received: from localhost (ovpn-116-54.phx2.redhat.com [10.3.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D21FB7E49F;
	Thu,  3 Aug 2017 02:18:31 +0000 (UTC)
Date: Wed, 2 Aug 2017 22:18:31 -0400
From: Jeff Cody <jcody@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170803021831.GF26485@localhost.localdomain>
References: <20170803010833.19647-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170803010833.19647-1-eblake@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 03 Aug 2017 02:18:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libqtest: Fix typo in
 comments
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
X-List-Received-Date: Thu, 03 Aug 2017 02:18:43 -0000

On Wed, Aug 02, 2017 at 08:08:33PM -0500, Eric Blake wrote:
> s/continuosly/continuously/
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Hardly seems like a trivial patch like this should need an R-b, but what the
heck:

Reviewed-by: Jeff Cody <jcody@redhat.com>


> ---
>  tests/libqtest.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/libqtest.h b/tests/libqtest.h
> index 38bc1e9953..3ae570927a 100644
> --- a/tests/libqtest.h
> +++ b/tests/libqtest.h
> @@ -117,7 +117,7 @@ QDict *qtest_qmp_receive(QTestState *s);
>   * @s: #QTestState instance to operate on.
>   * @s: #event event to wait for.
>   *
> - * Continuosly polls for QMP responses until it receives the desired event.
> + * Continuously polls for QMP responses until it receives the desired event.
>   */
>  void qtest_qmp_eventwait(QTestState *s, const char *event);
> 
> @@ -126,7 +126,7 @@ void qtest_qmp_eventwait(QTestState *s, const char *event);
>   * @s: #QTestState instance to operate on.
>   * @s: #event event to wait for.
>   *
> - * Continuosly polls for QMP responses until it receives the desired event.
> + * Continuously polls for QMP responses until it receives the desired event.
>   * Returns a copy of the event for further investigation.
>   */
>  QDict *qtest_qmp_eventwait_ref(QTestState *s, const char *event);
> @@ -571,7 +571,7 @@ static inline QDict *qmp_receive(void)
>   * qmp_eventwait:
>   * @s: #event event to wait for.
>   *
> - * Continuosly polls for QMP responses until it receives the desired event.
> + * Continuously polls for QMP responses until it receives the desired event.
>   */
>  static inline void qmp_eventwait(const char *event)
>  {
> @@ -582,7 +582,7 @@ static inline void qmp_eventwait(const char *event)
>   * qmp_eventwait_ref:
>   * @s: #event event to wait for.
>   *
> - * Continuosly polls for QMP responses until it receives the desired event.
> + * Continuously polls for QMP responses until it receives the desired event.
>   * Returns a copy of the event for further investigation.
>   */
>  static inline QDict *qmp_eventwait_ref(const char *event)
> -- 
> 2.13.3
> 
> 

