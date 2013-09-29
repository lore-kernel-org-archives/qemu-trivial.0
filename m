Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQNNf-0000Q3-RQ
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 16:14:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQNNZ-0000I3-JY
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 16:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQNNV-00027F-2b
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 16:14:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VQNNM-00026O-3v; Sun, 29 Sep 2013 16:13:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 89BD1429EB;
	Mon, 30 Sep 2013 00:13:53 +0400 (MSK)
Message-ID: <52488A00.6000405@msgid.tls.msk.ru>
Date: Mon, 30 Sep 2013 00:13:52 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1380469272-19230-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] migration: Fix compiler warning ('caps'
 may be used uninitialized)
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
X-List-Received-Date: Sun, 29 Sep 2013 20:14:14 -0000

29.09.2013 19:41, Stefan Weil wrote:
> The QEMU buildbot default_i386_debian_6_0 shows this warning:
>
>    CC    migration.o
> migration.c: In function 'qmp_query_migrate_capabilities':
> migration.c:149: warning:
>   'caps' may be used uninitialized in this function

Gah, how disgusting.  The code is correct, yet gcc complains
needlessly...

> While changing this code, I also replaced g_malloc0
> by the type safe g_new0.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> Buildbot URL:
> http://buildbot.b1-systems.de/qemu/builders/default_i386_debian_6_0/builds/775/steps/compile/logs/stdio
>
>   migration.c |   12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/migration.c b/migration.c
> index 200d404..8dcb6ce 100644
> --- a/migration.c
> +++ b/migration.c
> @@ -145,17 +145,15 @@ uint64_t migrate_max_downtime(void)
>
>   MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
>   {
> -    MigrationCapabilityStatusList *head = NULL;
> -    MigrationCapabilityStatusList *caps;
> +    MigrationCapabilityStatusList *head =
> +        g_new0(MigrationCapabilityStatusList, 1);
> +    MigrationCapabilityStatusList *caps = head;
>       MigrationState *s = migrate_get_current();
>       int i;
>
>       for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
> -        if (head == NULL) {
> -            head = g_malloc0(sizeof(*caps));
> -            caps = head;
> -        } else {
> -            caps->next = g_malloc0(sizeof(*caps));
> +        if (i > 0) {
> +            caps->next = g_new0(MigrationCapabilityStatusList, i);
>               caps = caps->next;
>           }

But this assumes that MIGRATION_CAPABILITY_MAX > 0 ! ;)
Ie, that there's at least one entry (head) in the list.
Do we care?

Previous code was more natural, so to say...

I'd just initialize `caps' to the same NULL as `head'
initially...  Or maybe change for() into do..while()..
Dunno, somehow I don't like the new code much, either ;)

Thanks,

/mjt

