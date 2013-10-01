Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQyII-0002Rs-IO
	for mharc-qemu-trivial@gnu.org; Tue, 01 Oct 2013 07:39:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VQyIC-0002LT-US
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 07:39:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VQyI8-0004WW-9j
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 07:39:04 -0400
Received: from mail-qe0-x231.google.com ([2607:f8b0:400d:c02::231]:60609)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VQyHy-0004VH-PH; Tue, 01 Oct 2013 07:38:50 -0400
Received: by mail-qe0-f49.google.com with SMTP id s14so4758135qeb.8
	for <multiple recipients>; Tue, 01 Oct 2013 04:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=UvrsdDsavgarTg7peRQoTWqVTxavosyQfHD6ukKJTgQ=;
	b=gXiQUOHIXXTUDUIQSmQied2997xXYO0NTMht6R5/cymWO/pkW6XCxLVdvFL1CZbF3X
	RpzZnrBswJZHkY96G12m/z4/1q3KvsdY3QAgpGxK4P5/gjAPilkCi5Sc+MGGM1g9PGn0
	xY54jDsu9Gq3czGU0Pi0b6RZr98O7SDYDSHmaRX2fZ8wKVu+Hk9oETMVXR1+4Onnlgd5
	Sl/PekAYpNVZEs+jZtEHCm/CxgAootb9p4MliDAVnKRiZR4HWTlqghiMKCWH8boa82iU
	JPZqQFjuIZpBYL5n4D+zaHmoZ5BCzHvzdF5er0wiC1XV/2RYFaFu8mXy34fgfcDJoFLt
	cimA==
X-Received: by 10.224.137.68 with SMTP id v4mr39387548qat.31.1380627529561;
	Tue, 01 Oct 2013 04:38:49 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-2-39-10-130.cust.dsl.vodafone.it.
	[2.39.10.130])
	by mx.google.com with ESMTPSA id r5sm11774803qaj.13.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 01 Oct 2013 04:38:48 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <524AB45A.6050805@redhat.com>
Date: Tue, 01 Oct 2013 13:39:06 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1380469272-19230-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::231
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
X-List-Received-Date: Tue, 01 Oct 2013 11:39:09 -0000

Il 29/09/2013 17:41, Stefan Weil ha scritto:
> The QEMU buildbot default_i386_debian_6_0 shows this warning:
> 
>   CC    migration.o
> migration.c: In function 'qmp_query_migrate_capabilities':
> migration.c:149: warning:
>  'caps' may be used uninitialized in this function
> 
> While changing this code, I also replaced g_malloc0
> by the type safe g_new0.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Buildbot URL:
> http://buildbot.b1-systems.de/qemu/builders/default_i386_debian_6_0/builds/775/steps/compile/logs/stdio
> 
>  migration.c |   12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/migration.c b/migration.c
> index 200d404..8dcb6ce 100644
> --- a/migration.c
> +++ b/migration.c
> @@ -145,17 +145,15 @@ uint64_t migrate_max_downtime(void)
>  
>  MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
>  {
> -    MigrationCapabilityStatusList *head = NULL;
> -    MigrationCapabilityStatusList *caps;
> +    MigrationCapabilityStatusList *head =
> +        g_new0(MigrationCapabilityStatusList, 1);
> +    MigrationCapabilityStatusList *caps = head;
>      MigrationState *s = migrate_get_current();
>      int i;
>  
>      for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
> -        if (head == NULL) {
> -            head = g_malloc0(sizeof(*caps));
> -            caps = head;
> -        } else {
> -            caps->next = g_malloc0(sizeof(*caps));
> +        if (i > 0) {
> +            caps->next = g_new0(MigrationCapabilityStatusList, i);
>              caps = caps->next;
>          }
>          caps->value =
> 

What about

    MigrationCapabilityStatusList *head = NULL;
    MigrationCapabilityStatusList **p_tail = &head;
    MigrationState *s = migrate_get_current();
    int i;

    for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
        MigrationCapabilityStatusList *caps = g_malloc0(sizeof(*caps));
        caps->value =
            ...
        *p_next = caps;
        p_next = &caps->next;
    }

