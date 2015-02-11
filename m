Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLWtz-00067v-Ul
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 08:00:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLWtv-000629-Cp
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 08:00:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLWtu-0004FV-En
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 08:00:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:63995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YLWtn-00043F-5g; Wed, 11 Feb 2015 08:00:11 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BD06gi008669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 11 Feb 2015 08:00:06 -0500
Received: from blackfin.pond.sub.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BD04qq005897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 11 Feb 2015 08:00:05 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E3553303D504; Wed, 11 Feb 2015 14:00:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1423635971-9928-1-git-send-email-arei.gonglei@huawei.com>
Date: Wed, 11 Feb 2015 14:00:03 +0100
In-Reply-To: <1423635971-9928-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Wed, 11 Feb 2015 14:26:11 +0800")
Message-ID: <87386c8uy4.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: Fix Resource leak
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
X-List-Received-Date: Wed, 11 Feb 2015 13:00:23 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Coverity spot:
> qemu_using_spice allocates memory that is stored into err,
> but not freed before return.
>
> Cc:Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  monitor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/monitor.c b/monitor.c
> index c3cc060..137d23f 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1095,12 +1095,13 @@ static int client_migrate_info(Monitor *mon, const QDict *qdict,
>      const char *subject  = qdict_get_try_str(qdict, "cert-subject");
>      int port             = qdict_get_try_int(qdict, "port", -1);
>      int tls_port         = qdict_get_try_int(qdict, "tls-port", -1);
> -    Error *err;
> +    Error *err = NULL;
>      int ret;
>  
>      if (strcmp(protocol, "spice") == 0) {
>          if (!qemu_using_spice(&err)) {
>              qerror_report_err(err);
> +            error_free(err);
>              return -1;
>          }

Your commit message is incomplete.  The resource leak is real, but it's
the less serious bug here.  The serious one is missing initialization of
err.

If using_spice, qemu_using_spice() returns true without touching err.
All fine.

Else, if err is null by chance, qemu_using_spice()'s error_set() creates
an error object and stores it in err.  We leak it.

If err is not null, error_set() fails its assertion.

Broken in commit b25d81b by yours truly.  Thanks for cleaning up my
mess!

Let's fix up the commit message:

    monitor: Fix missing err = NULL in client_migrate_info()

    When SPICE isn't used, we either fail an assertion in error_set(),
    or leak an error object.  Broken in commit b25d81b.

With such a fixup:

Reviewed-by: Markus Armbruster <armbru@redhat.com>

