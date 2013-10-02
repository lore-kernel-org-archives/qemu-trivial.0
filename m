Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRT5W-0004Kl-FI
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2013 16:32:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VRSyc-0003MX-2Q
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 16:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VRSyS-0004E8-Jz
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 16:24:52 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:36070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VRSyB-0004BC-53; Wed, 02 Oct 2013 16:24:27 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	947FE72809F4; Wed,  2 Oct 2013 22:24:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id K3wXuLoS3-o3; Wed,  2 Oct 2013 22:24:14 +0200 (CEST)
Received: from [192.168.178.35] (p54ADA326.dip0.t-ipconnect.de [84.173.163.38])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	7EC0F72809F0; Wed,  2 Oct 2013 22:24:14 +0200 (CEST)
Message-ID: <524C80ED.3020507@weilnetz.de>
Date: Wed, 02 Oct 2013 22:24:13 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>	<52488A00.6000405@msgid.tls.msk.ru>
	<52488E98.3060505@weilnetz.de>
	<871u46iq96.fsf@blackfin.pond.sub.org>
	<5249E4CD.1050605@weilnetz.de> <524C6DD0.9070605@msgid.tls.msk.ru>
In-Reply-To: <524C6DD0.9070605@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Fix compiler
 warning ('caps' may be used uninitialized)
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
X-List-Received-Date: Wed, 02 Oct 2013 20:25:01 -0000

Am 02.10.2013 21:02, schrieb Michael Tokarev:
> How about this:
>
> diff --git a/migration.c b/migration.c
> index b4f8462..6066ab4 100644
> --- a/migration.c
> +++ b/migration.c
> @@ -146,22 +146,16 @@ uint64_t migrate_max_downtime(void)
>  MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error
> **errp)
>  {
>      MigrationCapabilityStatusList *head = NULL;
> -    MigrationCapabilityStatusList *caps;
> +    MigrationCapabilityStatusList **capp = &head;
>      MigrationState *s = migrate_get_current();
>      int i;
>
>      for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
> -        if (head == NULL) {
> -            head = g_malloc0(sizeof(*caps));
> -            caps = head;
> -        } else {
> -            caps->next = g_malloc0(sizeof(*caps));
> -            caps = caps->next;
> -        }
> -        caps->value =
> -            g_malloc(sizeof(*caps->value));
> -        caps->value->capability = i;
> -        caps->value->state = s->enabled_capabilities[i];
> +        *capp = g_malloc0(sizeof(*head));
> +        (*capp)->value = g_malloc(sizeof(*head->value));
> +        (*capp)->value->capability = i;
> +        (*capp)->value->state = s->enabled_capabilities[i];
> +       capp = &(*capp)->next;
>      }
>
>      return head;
>
>
> This is what I had in mind at the very beginnig, but only now tried
> to make a patch...
>
> Thanks,
>
> /mjt
> Thanks,


That's a possible solution. Paolo also sent a sketch of a similar
solution. And here are two more:

MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
{
    MigrationCapabilityStatusList *head = NULL;
    MigrationState *s = migrate_get_current();
    MigrationCapability i = MIGRATION_CAPABILITY_MAX;

    do {
        MigrationCapabilityStatusList *caps =
            g_new(MigrationCapabilityStatusList, 1);
        i--;
        caps->next = head;
        caps->value = g_new(MigrationCapabilityStatus, 1);
        caps->value->capability = i;
        caps->value->state = s->enabled_capabilities[i];
        head = caps;
    } while (i > 0);

    return head;
}

MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
{
    MigrationCapabilityStatusList *head = NULL;
    MigrationCapabilityStatusList *prev = NULL;
    MigrationState *s = migrate_get_current();
    MigrationCapability i;

    for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
        MigrationCapabilityStatusList *caps =
            g_new(MigrationCapabilityStatusList, 1);
        if (prev == NULL) {
            head = caps;
        } else {
            prev->next = caps;
            prev = caps;
        }
        caps->value = g_new(MigrationCapabilityStatus, 1);
        caps->value->capability = i;
        caps->value->state = s->enabled_capabilities[i];
    }

    return head;
}

Which one do we take? Any correct solution which fixes the compiler
warning is fine for me (although I prefer g_new instead of g_malloc as
you might have guessed). :-)

Regards,
Stefan


